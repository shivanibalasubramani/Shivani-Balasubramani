CREATE OR REPLACE PROCEDURE AddNewCustomer (
    p_customer_id IN NUMBER,
    p_name IN VARCHAR2,
    p_dob IN DATE,
    p_balance IN NUMBER
) IS
BEGIN
    -- Attempt to insert a new customer
    INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
    VALUES (p_customer_id, p_name, p_dob, p_balance, SYSDATE);

    -- Commit the transaction
    COMMIT;

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        -- Handle duplicate CustomerID error
        DBMS_OUTPUT.PUT_LINE('Customer with ID ' || p_customer_id || ' already exists.');
    WHEN OTHERS THEN
        -- Log any other error
        DBMS_OUTPUT.PUT_LINE('Error adding new customer: ' || SQLERRM);
END AddNewCustomer;
/
