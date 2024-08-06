-- Using CTE, find vaccination ratio
With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, Total_Vaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CAST(vac.new_vaccinations as numeric(15, 0)))
	Over (Partition By dea.Location Order By dea.location, dea.date) as total_vaccinated
From CovidDeath dea
Join CovidVac vac
On dea.location = vac.location
and dea.date = vac.date
Where dea.continent is not null 
	and vac.new_vaccinations is not null 
--Order By 2,3
)
Select *
, (total_vaccinated/population)*100 as vaccination_ratio 
From PopvsVac
Order By 2,3