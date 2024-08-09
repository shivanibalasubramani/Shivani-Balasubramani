CREATE OR REPLACE PROCEDURE SafeTransferFunds (
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
) IS
    v_from_balance NUMBER;
    v_to_balance NUMBER;
BEGIN
    -- Start a transaction
    SAVEPOINT transfer_savepoint;
    
    -- Check if the source account has sufficient funds
    SELECT Balance INTO v_from_balance
    FROM Accounts
    WHERE AccountID = p_from_account FOR UPDATE;
    
    IF v_from_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in source account.');
    END IF;

    -- Deduct funds from the source account
    UPDATE Accounts
    SET Balance = Balance - p_amount
    WHERE AccountID = p_from_account;

    -- Add funds to the destination account
    SELECT Balance INTO v_to_balance
    FROM Accounts
    WHERE AccountID = p_to_account FOR UPDATE;
    
    UPDATE Accounts
    SET Balance = Balance + p_amount
    WHERE AccountID = p_to_account;

    -- Commit the transaction
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        -- Rollback the transaction in case of any error
        ROLLBACK TO transfer_savepoint;
        -- Log the error message
        DBMS_OUTPUT.PUT_LINE('Error during fund transfer: ' || SQLERRM);
END SafeTransferFunds;
/
