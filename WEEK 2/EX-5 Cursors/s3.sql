DECLARE
    CURSOR c_loans IS
        SELECT LoanID, LoanAmount, InterestRate
        FROM Loans;
    
    v_loan_id Loans.LoanID%TYPE;
    v_loan_amount Loans.LoanAmount%TYPE;
    v_old_interest_rate Loans.InterestRate%TYPE;
    v_new_interest_rate NUMBER := 6; -- Example new interest rate

BEGIN
    FOR r_loan IN c_loans LOOP
        v_loan_id := r_loan.LoanID;
        v_loan_amount := r_loan.LoanAmount;
        v_old_interest_rate := r_loan.InterestRate;

        -- Update the interest rate based on the new policy
        UPDATE Loans
        SET InterestRate = v_new_interest_rate
        WHERE LoanID = v_loan_id;
    END LOOP;

    -- Commit the transaction
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Interest rates updated for all loans.');
END;
/
