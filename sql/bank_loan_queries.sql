--Overall Conversion & Income Impact
SELECT 
    personal_loan AS loan_accepted,
    COUNT(*) AS customer_count,
    ROUND(AVG(income), 2) AS avg_annual_income_k,
    ROUND(AVG(cc_avg), 2) AS avg_monthly_cc_spend_k,
    ROUND(AVG(mortgage), 2) AS avg_mortgage
FROM bank_customers
GROUP BY personal_loan
ORDER BY personal_loan DESC;

--Education & Family Size Drivers
SELECT 
    education,
    family_size,
    COUNT(*) AS total_customers,
    SUM(personal_loan) AS loans_accepted,
    ROUND((SUM(personal_loan) * 100.0) / COUNT(*), 2) AS conversion_rate_pct
FROM bank_customers
GROUP BY education, family_size
ORDER BY education, family_size;

--Cross-Sell Product Influence (CD & Securities Accounts)
SELECT 
    cd_account,
    securities_account,
    COUNT(*) AS total_customers,
    SUM(personal_loan) AS loans_accepted,
    ROUND((SUM(personal_loan) * 100.0) / COUNT(*), 2) AS conversion_rate_pct
FROM bank_customers
GROUP BY cd_account, securities_account
ORDER BY cd_account DESC, securities_account DESC;