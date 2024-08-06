-- Total deaths by continent
Select continent, location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From CovidDeath
Where continent is not null
Group by continent, location
order by TotalDeathCount desc
