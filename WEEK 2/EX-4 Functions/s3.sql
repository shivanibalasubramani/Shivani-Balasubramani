CREATE OR REPLACE FUNCTION HasSufficientBalance (
    p_account_id IN NUMBER,
    p_amount IN NUMBER
) RETURN BOOLEAN IS
    v_balance NUMBER;
BEGIN
    -- Fetch the current balance of the account
    SELECT Balance INTO v_balance
    FROM Accounts
    WHERE AccountID = p_account_id;

    -- Return TRUE if the balance is sufficient, FALSE otherwise
    RETURN v_balance >= p_amount;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- If no account found, return FALSE
        RETURN FALSE;
END HasSufficientBalance;
/
