SELECT location, date, total_cases, new_cases, total_deaths, population
From CovidDataExploration..CovidDeaths
WHERE continent is not null
ORDER BY location, date 

--Total Cases and Total Deaths and the percentage of death
--Also shows the likelihood of dying if you had an infection 

SELECT location, date, total_cases, total_deaths,ROUND(total_deaths/total_cases*100, 2) as 'Death Percentage'
From CovidDataExploration..CovidDeaths
WHERE location = 'United States' and continent is not null
ORDER BY location, date		

--Total cases and the Population 
--Portrays percentage of the population who had been infected with covid-19 

SELECT location, date, total_cases, population,ROUND(total_cases/population*100, 2) as 'Percentage of Infection in a Population'
From CovidDataExploration..CovidDeaths
WHERE location = 'United States' and continent is not null 
ORDER BY location, date		

--Countries with high infection rate Compared to the population 

SELECT location, population, MAX(total_cases) as 'Highest Infection Count' ,MAX(ROUND(total_cases/population*100, 2)) as 'Percentage of Infection in a Population'
From CovidDataExploration..CovidDeaths
WHERE continent is not null
GROUP BY location, population
ORDER BY 'Percentage of Infection in a Population' DESC

--Countries that had the highest death count when contracting the virus 

SELECT location, MAX(cast(Total_deaths as int)) as 'Total Death Count'
From CovidDataExploration..CovidDeaths
WHERE continent is not null 
GROUP BY location
ORDER BY 'Total Death Count' DESC

--Lets visualize this by continent 

--Continents with highest death count per population
SELECT continent, MAX(cast(Total_deaths as int)) as 'Total Death Count'
From CovidDataExploration..CovidDeaths
WHERE continent is not null 
GROUP BY continent
ORDER BY 'Total Death Count' DESC

--Lets deal with Global Numbers 

SELECT date, SUM(new_cases)' Total Cases', SUM(cast(new_deaths as int)) as 'Total Deaths', ROUND(SUM(cast(new_deaths as int))/SUM(new_cases)*100, 2) as 'Death Percentage'
From CovidDataExploration..CovidDeaths
WHERE continent is not null
GROUP BY date
ORDER BY date		

--Total Population and Vaccination 

Select death.continent, death.location, death.date, death.population, vax.new_vaccinations,
		SUM(CONVERT( int, vax.new_vaccinations)) OVER (Partition by death.location order by death.location, death.date) 
		as 'Rolling Count of Vaccination'
From CovidDataExploration..CovidDeaths death
	JOIN CovidDataExploration..CovidVaccinations Vax
		on death.location = vax.location and
		death.date = vax.date
WHERE death.continent is not null
ORDER BY location, Date

--Utilization of CTE

WITH PopVax (Continent, location, date, population, new_vaccinations, RollingCountofVaccination)
AS 
(
Select death.continent, death.location, death.date, death.population, vax.new_vaccinations,
		SUM(CONVERT(int, vax.new_vaccinations)) OVER (Partition by death.location order by death.location, death.date) 
		as RollingCountofVaccination
From CovidDataExploration..CovidDeaths death
	JOIN CovidDataExploration..CovidVaccinations Vax
		on death.location = vax.location and
		death.date = vax.date
WHERE death.continent is not null
)
SELECT *, ROUND((RollingCountofVaccination/population)*100, 2)
From PopVax

--Temp Table 
DROP TABLE IF EXISTS Percent_Population_Vaccinated
CREATE TABLE Percent_Population_Vaccinated
(
Continent nvarchar (255),
Location nvarchar (255),
Date datetime, 
Population int,
New_vaccination int,
RollingCountofVaccination int
)

INSERT INTO Percent_Population_Vaccinated
Select death.continent, death.location, death.date, death.population, vax.new_vaccinations,
		SUM(CONVERT(int, vax.new_vaccinations)) OVER (Partition by death.location order by death.location, death.date) 
		as RollingCountofVaccination
From CovidDataExploration..CovidDeaths death
	JOIN CovidDataExploration..CovidVaccinations Vax
		on death.location = vax.location and
		death.date = vax.date
WHERE death.continent is not null

Select *
From PercentPopulationVaccinated

--Creating Views For Tableau
DROP VIEW IF EXISTS PercentPopulationVaccinated
Create View PercentPopulationVaccinated as 
Select death.continent, death.location, death.date, death.population, vax.new_vaccinations,
		SUM(CONVERT(int, vax.new_vaccinations)) OVER (Partition by death.location order by death.location, death.date) 
		as RollingCountofVaccination
From CovidDataExploration..CovidDeaths death
	JOIN CovidDataExploration..CovidVaccinations Vax
		on death.location = vax.location and
		death.date = vax.date
WHERE death.continent is not null

Select *
From PercentPopulationVaccinated