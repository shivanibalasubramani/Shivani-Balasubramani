CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment (
    p_loan_amount IN NUMBER,
    p_annual_interest_rate IN NUMBER,
    p_loan_duration_years IN NUMBER
) RETURN NUMBER IS
    v_monthly_interest_rate NUMBER;
    v_total_payments NUMBER;
    v_monthly_installment NUMBER;
BEGIN
    -- Convert annual interest rate to a monthly interest rate
    v_monthly_interest_rate := p_annual_interest_rate / 12 / 100;

    -- Total number of monthly payments
    v_total_payments := p_loan_duration_years * 12;

    -- Calculate monthly installment using the formula for annuity
    v_monthly_installment := p_loan_amount * (v_monthly_interest_rate * POWER(1 + v_monthly_interest_rate, v_total_payments)) /
                             (POWER(1 + v_monthly_interest_rate, v_total_payments) - 1);

    RETURN v_monthly_installment;
END CalculateMonthlyInstallment;
/
