Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From CovidDeath
Where continent is not null
Group by continent 
order by TotalDeathCount desc