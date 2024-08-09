CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
    v_balance NUMBER;
BEGIN
    -- Check if the transaction is a withdrawal
    IF :NEW.TransactionType = 'Withdrawal' THEN
        -- Fetch the current balance of the account
        SELECT Balance INTO v_balance
        FROM Accounts
        WHERE AccountID = :NEW.AccountID;
        
        -- Ensure the withdrawal amount does not exceed the balance
        IF :NEW.Amount > v_balance THEN
            RAISE_APPLICATION_ERROR(-20002, 'Insufficient funds for withdrawal.');
        END IF;
    ELSIF :NEW.TransactionType = 'Deposit' THEN
        -- Ensure the deposit amount is positive
        IF :NEW.Amount <= 0 THEN
            RAISE_APPLICATION_ERROR(-20003, 'Deposit amount must be positive.');
        END IF;
    END IF;
END CheckTransactionRules;
/
