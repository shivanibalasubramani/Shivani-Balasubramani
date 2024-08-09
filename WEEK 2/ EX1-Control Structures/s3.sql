DECLARE
BEGIN
    -- Fetch all loans due in the next 30 days
    FOR loan_record IN (SELECT LoanID, CustomerID, EndDate FROM Loans
                        WHERE EndDate BETWEEN SYSDATE AND SYSDATE + 30) LOOP
        -- Print reminder message for each customer
        DBMS_OUTPUT.PUT_LINE('Reminder: Loan ID ' || loan_record.LoanID ||
                             ' for Customer ID ' || loan_record.CustomerID ||
                             ' is due on ' || loan_record.EndDate);
    END LOOP;
END;
/
