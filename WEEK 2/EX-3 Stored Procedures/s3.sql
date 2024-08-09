CREATE OR REPLACE PROCEDURE TransferFunds (
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
) IS
    v_from_balance NUMBER;
BEGIN
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
    UPDATE Accounts
    SET Balance = Balance + p_amount
    WHERE AccountID = p_to_account;

    -- Commit the transaction
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Transferred ' || p_amount || ' from account ' || p_from_account || ' to account ' || p_to_account || '.');
END TransferFunds;
/
