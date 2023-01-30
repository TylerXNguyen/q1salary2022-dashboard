-- Table 1
-- Average person by establishment (population / establishments) without Totals
WITH combined_salpop AS (
	SELECT 
		pop.County, pop.population, Quarterly_Establishments, 
		January_Employment, February_Employment, March_Employment, 
		Total_Quarterly_Wages, Average_Weekly_Wage
	FROM Portfolio_salaryAnalysis.dbo.population pop
	JOIN Portfolio_salaryAnalysis.dbo.salary sal ON pop.County = sal.County
)
SELECT *, CAST(Round((1.0 * population / Quarterly_Establishments), 4) AS DECIMAL(9, 2)) AS avg_persons_per_establishment
INTO #popCombinedSal
FROM combined_salpop
WHERE County NOT IN ('U.S. TOTAL', 'California')

-- Table 2
-- Average person by establishment (population / establishments) with Totals
WITH combined_salpop AS (
	SELECT 
		pop.County, pop.population, Quarterly_Establishments, 
		January_Employment, February_Employment, March_Employment, 
		Total_Quarterly_Wages, Average_Weekly_Wage
	FROM Portfolio_salaryAnalysis.dbo.population pop
	JOIN Portfolio_salaryAnalysis.dbo.salary sal ON pop.County = sal.County
)
SELECT *, CAST(Round((1.0 * population / Quarterly_Establishments), 4) AS DECIMAL(9, 2)) AS avg_persons_per_establishment
INTO #popCombinedSalTotals
FROM combined_salpop
WHERE County IN ('U.S. TOTAL', 'California')

-- Delete Table for Pop combined
DROP TABLE if exists #popCombinedSal;
-- Selecting alls
SELECT * FROM #popCombinedSal;
SELECT * FROM #popCombinedSalTotals;

