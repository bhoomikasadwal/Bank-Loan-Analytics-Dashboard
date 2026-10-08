QUERY1. KEY PERFORMANCE INDICATOR
      SELECT 
   
             COUNT(id) AS Total_Loan_Applications,
   
             SUM(loan_amount) AS Total_Funded_Amount,
    
             SUM(total_payment) AS Total_Amount_Received,
    
             AVG(int_rate) * 100 AS Avg_Interest_Rate

             FROM cleaned_Financial_loan_data;

QUERY2. GOOD LOAN vs BAD LOAN vs ACTIVE LOAN
      SELECT
           CASE 
                WHEN loan_status = 'Fully Paid' THEN 'Good Loan'
                WHEN loan_status = 'Charged Off' THEN 'Bad Loan'
                WHEN loan_status = 'Current' THEN 'Active Loan'
            END AS Loan_Status_Category,
            COUNT(id) AS Total_Applications,
            SUM(loan_amount) AS Total_Funded_Amount,
            SUM(total_payment) AS Total_Amount_Received,
            ROUND(AVG(int_rate * 100), 2) AS Avg_Interest_Rate,
            ROUND(AVG(dti * 100), 2) AS Avg_DTI
            FROM financial_loan_data
            GROUP BY 
                    CASE 
                    WHEN loan_status = 'Fully Paid' THEN 'Good Loan'
                    WHEN loan_status = 'Charged Off' THEN 'Bad Loan'
                    WHEN loan_status = 'Current' THEN 'Active Loan'
        END;

QUERY3. STATE - WISE DISTRIBUTION

       
SELECT 
    
            address_state,
    
            COUNT(id) AS Total_Applications,

            SUM(loan_amount) AS Total_Funded_Amount

            FROM cleaned_Financial_loan_data

            GROUP BY address_state

            ORDER BY Total_Applications DESC;

QUERY4. DETAILED BREAKDOWN BY SPECIFIC LOAN STATUS
        SELECT
        
    loan_status,

            COUNT(id) AS Total_Loan_Applications,

            SUM(loan_amount) AS Total_Funded_Amount,

            SUM(total_payment) AS Total_Amount_Received,

            ROUND(AVG(int_rate) * 100, 2) AS Avg_Interest_Rate_Pct,

            ROUND(AVG(dti) * 100, 2) AS Avg_DTI_Pct

            FROM cleaned_Financial_loan_data

            GROUP BY loan_status
            
ORDER BY Total_Loan_Applications DESC;

QUERY5. PERFORMANCE BY CREDIT GRADE
         SELECT 
   
             grade,
   
             COUNT(id) AS Total_Loan_Applications,
  
             SUM(loan_amount) AS Total_Funded_Amount,

             SUM(total_payment) AS Total_Amount_Received,
   
             ROUND(AVG(int_rate) * 100, 2) AS Avg_Interest_Rate_Pct

             FROM cleaned_Financial_loan_data

             GROUP BY grade
             
ORDER BY grade ASC;


 QUERY6. PERFORMANCE BY SUB GRADE
         SELECT 
    sub_grade,
  
             COUNT(id) AS Total_Loan_Applications,
 
             SUM(loan_amount) AS Total_Funded_Amount,
  
             ROUND(AVG(int_rate) * 100, 2) AS Avg_Interest_Rate_Pct

             FROM cleaned_Financial_loan_data

             GROUP BY sub_grade

             ORDER BY sub_grade ASC;

QUERY7.STATE vs HOME ANALYTICS OWNERSHIP        
       


SELECT 
    
          address_state,
   
          home_ownership,
 
          COUNT(id) AS Total_Applications,
  
          SUM(loan_amount) AS Total_Funded_Amount

          FROM cleaned_Financial_loan_data

          GROUP BY address_state, home_ownership

          ORDER BY address_state ASC;




QUERY 8. TERM- WISE BREAKDOWN (36 MONTHS vs 60 MONTHS)


       


SELECT 
    term,
 
           COUNT(id) AS Total_Applications,
   
           SUM(loan_amount) AS Total_Funded_Amount,
  
           SUM(total_payment) AS Total_Amount_Received,
   
           ROUND(AVG(int_rate) * 100, 2) AS Avg_Interest_Rate_Pct

           FROM cleaned_Financial_loan_data

           GROUP BY term;


QUERY 9: LOAN PURPOSE DISTRIBUTION

     


SELECT 
  
           purpose,
   
           COUNT(id) AS Total_Applications,
           SUM(loan_amount) AS Total_Funded_Amount,
 
           ROUND(AVG(int_rate) * 100, 2) AS Avg_Interest_Rate_Pct

           FROM cleaned_Financial_loan_data

           GROUP BY purpose

           ORDER BY Total_Applications DESC;


QUERY10: ANALYSIS BY EMPLOYEMENT LENGTH

     


SELECT 
   
           emp_length,
 
           COUNT(id) AS Total_Applications,

           SUM(loan_amount) AS Total_Funded_Amount,
  
           ROUND(AVG(annual_income), 2) AS Avg_Annual_Income

           FROM cleaned_Financial_loan_data

           GROUP BY emp_length

           ORDER BY Total_Applications DESC;


























