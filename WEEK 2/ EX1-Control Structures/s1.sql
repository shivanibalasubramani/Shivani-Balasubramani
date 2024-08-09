DECLARE
    v_age NUMBER;
BEGIN
    -- Loop through all customers
    FOR customer_record IN (SELECT CustomerID, DOB FROM Customers) LOOP
        -- Calculate age
        v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, customer_record.DOB) / 12);
        
        -- Check if age is above 60
        IF v_age > 60 THEN
            -- Apply a 1% discount to current loan interest rates
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = customer_record.CustomerID;
        END IF;
    END LOOP;
    COMMIT;
END;
/
