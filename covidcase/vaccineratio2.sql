-- Use TEMP Table
DROP Table if exists #VaccinationRatio
Create Table #VaccinationRatio
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric(15),
total_vaccinated numeric
)

Insert into #VaccinationRatio
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CAST(vac.new_vaccinations as numeric(15, 0)))
	Over (Partition By dea.Location Order By dea.location, dea.date) as total_vaccinated
From CovidDeath dea
Join CovidVac vac
On dea.location = vac.location
and dea.date = vac.date
Where dea.continent is not null
 and vac.new_vaccinations is not null

Select *, (total_vaccinated/population)*100 as VaccineRatio
From #VaccinationRatio
Order By 2,3
