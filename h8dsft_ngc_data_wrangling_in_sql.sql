SELECT EXTRACT(YEAR FROM date_patents) AS year,
       EXTRACT(MONTH FROM date_patents) AS month,
       COUNT(Patent_or_Publication_ID) AS total_patent
FROM(
SELECT 
    DATE(CONCAT(SUBSTR(Grant_or_Publication_Date,1,4),'-',
    SUBSTR(Grant_or_Publication_Date,5,2),'-',
    SUBSTR(Grant_or_Publication_Date,7,2))) AS date_patents,
    Patent_or_Publication_ID,
    Patent_Title
FROM `patents-public-data.uspto_oce_cancer.publications`)
WHERE UPPER(Patent_Title) like '%DATA MINING%'
GROUP BY  1,2
HAVING year BETWEEN 2012 AND 2023
ORDER BY 1 DESC,2 ASC
