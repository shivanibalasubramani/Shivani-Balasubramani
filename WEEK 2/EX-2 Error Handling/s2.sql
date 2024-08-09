CREATE OR REPLACE PROCEDURE UpdateSalary (
    p_employee_id IN NUMBER,
    p_percentage IN NUMBER
) IS
    v_current_salary NUMBER;
BEGIN
    -- Fetch the current salary of the employee
    SELECT Salary INTO v_current_salary
    FROM Employees
    WHERE EmployeeID = p_employee_id FOR UPDATE;

    -- Update the salary by the given percentage
    UPDATE Employees
    SET Salary = Salary + (Salary * p_percentage / 100)
    WHERE EmployeeID = p_employee_id;

    -- Commit the transaction
    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Log an error message if the employee ID does not exist
        DBMS_OUTPUT.PUT_LINE('Employee ID ' || p_employee_id || ' does not exist.');
    WHEN OTHERS THEN
        -- Log any other error
        DBMS_OUTPUT.PUT_LINE('Error updating salary: ' || SQLERRM);
END UpdateSalary;
/
