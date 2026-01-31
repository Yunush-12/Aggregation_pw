use world;
-- 1 Count how many cities are there in each country?
select co.name as country_name,
count(ci.id) as city_count
from country as co left join city as ci on co.code = ci.countrycode
group by co.code, co.name
order by city_count desc, country_name asc;

-- 2 Display all continents having more than 30 countries

SELECT Continent
FROM country
GROUP BY Continent
HAVING COUNT(name) > 30;

-- 3 List region whose total population exceeds 200 million

select region, count(name)
from country
group by region
having sum(population) > 200000000;

-- 4 Find the top 5 continents by average GNP per country
select continent, avg(GNP) as avg_gnp
from country
group by continent
order by avg(GNP) desc
limit 5;

-- 5 Find the total number of official languages spoken in each continent
select c.Continent, COUNT(distinct cl.Language) as Total_Official_Languages
from country as c
join countrylanguage as cl on c.Code = cl.CountryCode
where cl.IsOfficial = 'T'
group by c.Continent
order by Total_Official_Languages  desc;

-- 6 Find the maximum and minimum GNP for each continent
select continent, max(GNP), min(GNP)
from country
group by continent
order by continent asc;

-- 7 Find the country with highest average city population
select C.Name as CountryName,
avg(Ci.Population) as AvgCityPopulation
from Country as C
join City as ci on C.Code = Ci.CountryCode
group by C.Code, C.Name
order by AvgCityPopulation desc
limit 1;

-- 8 List continents where the average city population is greater than 200000
select co.Continent
from country as co
join city ci on co.Code = ci.CountryCode
group by co.Continent
having avg(ci.Population) > 200000;

-- 9 Find the total population and average life expectancy for each continent, ordered by average life expectancy descending
select Continent, SUM(Population) as Total_Population, 
avg(LifeExpectancy) as Avg_Life_Expectancy
from country
group by Continent
order by Avg_Life_Expectancy desc;

-- 10 Find the top three continents with the highest average life expectancy, but only include those where the total population is over 200 million
select Continent, avg(LifeExpectancy) as AverageLifeExpectancy
from country
group by Continent
having SUM(Population) > 200000000
order by AverageLifeExpectancy desc
limit 3;