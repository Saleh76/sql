-- Looking at total cases vs Total Deaths

SELECT date, Location, population, total_cases, 
(CONVERT(float, total_cases) / CONVERT(float, population))*100 as AffectedPercentage
FROM CovidDeath 
where location like '%ger%'
	and total_cases is not NULL
Order by 1,2

