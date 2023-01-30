-- Average person by establishment (population / establishments)
WITH combined_salpop AS (
	SELECT 
		pop.County, pop.population, Quarterly_Establishments, 
		January_Employment, February_Employment, March_Employment, 
		Total_Quarterly_Wages, Average_Weekly_Wage
	FROM Portfolio_salaryAnalysis.dbo.population pop
	JOIN Portfolio_salaryAnalysis.dbo.salary sal ON pop.County = sal.County
)
SELECT *, CAST(Round((1.0 * population / Quarterly_Establishments), 4) AS DECIMAL(9, 2)) AS avg_persons_per_establishment
FROM combined_salpop

-- Create Table for Pop combined
Create Table #popCombinedSal 
(
County nvarchar(255),
population numeric,
Quarterly_establishments numeric,
Average_Weekly_Wage numeric,
avg_persons_per_establishment numeric
)

DROP TABLE if exists #popCombinedSal