-- Looking at countries with highest infection rate
SELECT location, population, MAX(CAST(total_cases AS DECIMAL(15,0))) as HighestInfectionCount,
MAX(total_cases / population)*100 as InfectionPercentage
FROM CovidDeath
GROUP BY location, population
order by InfectionPercentage desc
