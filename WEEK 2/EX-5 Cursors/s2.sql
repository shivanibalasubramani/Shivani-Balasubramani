DECLARE
    CURSOR c_accounts IS
        SELECT AccountID, Balance
        FROM Accounts;
    
    v_account_id Accounts.AccountID%TYPE;
    v_balance Accounts.Balance%TYPE;
    v_annual_fee NUMBER := 50; -- Example annual fee amount

BEGIN
    FOR r_account IN c_accounts LOOP
        v_account_id := r_account.AccountID;
        v_balance := r_account.Balance;

        -- Deduct the annual fee from the account balance
        UPDATE Accounts
        SET Balance = Balance - v_annual_fee
        WHERE AccountID = v_account_id;
    END LOOP;

    -- Commit the transaction
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Annual fee applied to all accounts.');
END;
/
