create database manufacturing;
Use manufacturing;
Select * from manufacturing;

#KPI-1  Manufactured Qty
SELECT round(Sum(`manufactured Qty`),0) AS `Manufacturing QTY` FROM `manufacturing`;

#KPI-2 Rejected Qty
SELECT round(SUM(`Rejected Qty`),0) AS `Rejected QTY` FROM `manufacturing`;


#KPI-3  Processed Qty
SELECT round(SUM(`Processed Qty`),0) AS `Processed Qty` FROM `manufacturing`;

#KPI-4  Wastage Qty
SELECT CONCAT(ROUND(SUM(`Rejected Qty`) / SUM(`Processed Qty`) * 100, 2), "%") AS `Wastage Qty`  
FROM `manufacturing`;


#KPI-5 Employee Wise Rejected Qty

SELECT `Machine / Employee`, 
       round(Sum(`Rejected Qty`),1) AS Rejected_Qty
FROM `manufacturing`
GROUP BY `Machine / Employee`;

#KPI-6  Machine Wise Rejected Qty

SELECT `Machine Code`,
SUM(`Rejected Qty`) as Rejected_Quantity
FROM `manufacturing`
GROUP By `Machine Code`;

#KPI-7 Production Comparison trend

Select `Doc Date`,SUM(`Produced Qty`) as Produced_Quantity 
FROM `manufacturing`
GROUP BY `Doc Date`;

#KPI-8 Manufacture Vs Rejected

SELECT 
    CASE 
        WHEN (SELECT AVG(`Rejected Qty`) FROM `manufacturing`) > (SELECT AVG(`Manufactured Qty`) FROM `manufacturing`) THEN 'More Rejected'
        WHEN (SELECT AVG(`Rejected Qty`) FROM `manufacturing`) < (SELECT AVG(`Manufactured Qty`) FROM `manufacturing`) THEN 'Less Rejected'
        ELSE 'Equal'
    END AS `Comparison`;
    
#KPI-9 Department Wise Manufacture Vs Rejected

SELECT 
    `Department Name`,
    round(Avg(`Manufactured Qty`),0) AS `Total Manufactured Qty`,
    round(Avg(`Rejected Qty`),0) AS `Total Rejected Qty`,
    CASE 
        WHEN round(Avg(`Rejected Qty`),0) > round(Avg(`Manufactured Qty`),0) THEN 'More Rejected'
        WHEN Avg(`Rejected Qty`) < Avg(`Manufactured Qty`) THEN 'Less Rejected'
        ELSE 'Equal'
    END AS `Comparison`
FROM 
    `manufacturing`
GROUP BY 
    `Department Name`;
    
    #KPI-10 Operation Wise Rejected Qty
    
    SELECT `Emp Name`,round(SUM(`Rejected Qty`),2) as Rejected_Quantity from `manufacturing`
    group by `Emp Name`;
    


