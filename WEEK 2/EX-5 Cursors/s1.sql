DECLARE
    CURSOR c_monthly_transactions IS
        SELECT c.CustomerID, c.Name, t.TransactionID, t.TransactionDate, t.Amount, t.TransactionType
        FROM Customers c
        JOIN Accounts a ON c.CustomerID = a.CustomerID
        JOIN Transactions t ON a.AccountID = t.AccountID
        WHERE EXTRACT(MONTH FROM t.TransactionDate) = EXTRACT(MONTH FROM SYSDATE)
        AND EXTRACT(YEAR FROM t.TransactionDate) = EXTRACT(YEAR FROM SYSDATE);
    
    v_customer_id Customers.CustomerID%TYPE;
    v_customer_name Customers.Name%TYPE;
    v_transaction_id Transactions.TransactionID%TYPE;
    v_transaction_date Transactions.TransactionDate%TYPE;
    v_amount Transactions.Amount%TYPE;
    v_transaction_type Transactions.TransactionType%TYPE;
    
BEGIN
    FOR r_transaction IN c_monthly_transactions LOOP
        v_customer_id := r_transaction.CustomerID;
        v_customer_name := r_transaction.Name;
        v_transaction_id := r_transaction.TransactionID;
        v_transaction_date := r_transaction.TransactionDate;
        v_amount := r_transaction.Amount;
        v_transaction_type := r_transaction.TransactionType;

        -- Print the statement
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id);
        DBMS_OUTPUT.PUT_LINE('Customer Name: ' || v_customer_name);
        DBMS_OUTPUT.PUT_LINE('Transaction ID: ' || v_transaction_id);
        DBMS_OUTPUT.PUT_LINE('Date: ' || v_transaction_date);
        DBMS_OUTPUT.PUT_LINE('Amount: ' || v_amount);
        DBMS_OUTPUT.PUT_LINE('Type: ' || v_transaction_type);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    END LOOP;
END;
/
