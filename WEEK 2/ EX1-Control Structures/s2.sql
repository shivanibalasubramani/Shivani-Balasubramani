ALTER TABLE Customers ADD (IsVIP BOOLEAN);

BEGIN
    -- Loop through all customers
    FOR customer_record IN (SELECT CustomerID, Balance FROM Customers) LOOP
        -- Check if balance is over $10,000
        IF customer_record.Balance > 10000 THEN
            -- Set IsVIP to TRUE
            UPDATE Customers
            SET IsVIP = TRUE
            WHERE CustomerID = customer_record.CustomerID;
        ELSE
            -- Set IsVIP to FALSE for those who do not qualify
            UPDATE Customers
            SET IsVIP = FALSE
            WHERE CustomerID = customer_record.CustomerID;
        END IF;
    END LOOP;
    COMMIT;
END;
/
