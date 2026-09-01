-- CENTRAL FLORIDA MUNICIPAL SOLID WASTE ANALYSIS
-- SQL Analysis | Counties: Orange, Seminole, Osceola, Lake
-- Analysis Period: 2017-2025
-- Dataset: county_waste
-- Tools: MySQL, Power BI


-- 1. ANNUAL REGIONAL WASTE AND POPULATION
-- Is waste generation growing faster or slower than population
-- in Greater Orlando?

SELECT
    Year,
    SUM(MSW_Collected_Tons) AS Total_Waste_Tons,
    SUM(Population) AS Total_Population
FROM county_waste
GROUP BY Year
ORDER BY Year;


-- 2. REGIONAL WASTE, RECYCLING, AND PER CAPITA
-- Creates one regional row per year and calculates population,
-- MSW collected, MSW landfilled, MSW recycled, recycling rate,
-- and MSW per capita.

SELECT
    Year,
    SUM(Population) AS Regional_Population,
    SUM(MSW_Collected_Tons) AS Regional_MSW_Collected_Tons,
    SUM(MSW_Landfilled_Tons) AS Regional_MSW_Landfilled_Tons,
    SUM(MSW_Recycled_Tons) AS Regional_MSW_Recycled_Tons,
    ROUND(SUM(MSW_Recycled_Tons) / SUM(MSW_Collected_Tons) * 100, 2) AS Regional_Recycling_Rate,
    ROUND(SUM(MSW_Collected_Tons) / SUM(Population), 3) AS Regional_MSW_Per_Capita
FROM county_waste
GROUP BY Year
ORDER BY Year;


-- 3. REGIONAL YEAR-OVER-YEAR WASTE VS. POPULATION GROWTH
-- Is regional waste growing faster or slower than the
-- regional population?

SELECT
    y1.Year,
    y1.Population,
    y1.MSW,
    ROUND((y1.Population - y0.Population) / y0.Population * 100, 2) AS Population_YoY,
    ROUND((y1.MSW - y0.MSW) / y0.MSW * 100, 2) AS Waste_YoY
FROM (
    SELECT
        Year,
        SUM(Population) AS Population,
        SUM(MSW_Collected_Tons) AS MSW
    FROM county_waste
    GROUP BY Year
) y1
JOIN (
    SELECT
        Year,
        SUM(Population) AS Population,
        SUM(MSW_Collected_Tons) AS MSW
    FROM county_waste
    GROUP BY Year
) y0
ON y1.Year = y0.Year + 1
ORDER BY y1.Year;

-- Key observations:
-- 2018-2019: Waste grew faster than population.
-- 2020: Waste fell 10.71% while population grew 2.33%.
-- 2021: Waste recovered faster than population growth.
-- 2023: Waste increased 15.28% while population grew 1.42%.
-- 2025: Waste decreased 2.60% while population increased 2.51%.
--
-- Conclusion: Waste generation does not consistently move with
-- population growth, with substantial year-to-year variability.


-- 4. REGIONAL MSW PER CAPITA
-- How much MSW is being collected per resident?

SELECT
    Year,
    SUM(Population) AS Regional_Population,
    SUM(MSW_Collected_Tons) AS Regional_MSW,
    ROUND(SUM(MSW_Collected_Tons) / SUM(Population), 3) AS MSW_Per_Capita
FROM county_waste
GROUP BY Year
ORDER BY Year;

-- Regional MSW per capita peaked at approximately 2.069 tons/person
-- in 2019, fell sharply in 2020, reached approximately 2.062 in 2023,
-- and declined to approximately 1.941 in 2025.


-- 5. COUNTY COMPARISON
-- Which counties generate the most waste relative to their population,
-- and which have the strongest recycling performance?

SELECT
    County,
    ROUND(AVG(MSW_Collected_Tons / Population), 3) AS Avg_MSW_Per_Capita,
    ROUND(AVG(MSW_Recycled_Tons / Population), 3) AS Avg_Recycled_Per_Capita,
    ROUND(SUM(MSW_Recycled_Tons) / SUM(MSW_Collected_Tons) * 100, 2) AS Overall_Recycling_Rate,
    ROUND(SUM(MSW_Landfilled_Tons) / SUM(MSW_Collected_Tons) * 100, 2) AS Overall_Landfill_Rate
FROM county_waste
GROUP BY County
ORDER BY Avg_MSW_Per_Capita DESC;

-- Key observations:
-- Orange County has the highest average MSW per capita.
-- Seminole County has the highest overall recycling rate.
-- Osceola County has the lowest MSW per capita but the highest
-- landfill rate.


-- 6. COUNTY-LEVEL CHANGE: 2017 VS. 2025
-- How has each county changed from 2017 to 2025?

SELECT
    a.County,
    a.MSW_Collected_Tons AS MSW_2017,
    b.MSW_Collected_Tons AS MSW_2025,
    ROUND((b.MSW_Collected_Tons - a.MSW_Collected_Tons) / a.MSW_Collected_Tons * 100, 2) AS MSW_Change_Percent,
    a.Recycling_Rate AS Recycling_Rate_2017,
    b.Recycling_Rate AS Recycling_Rate_2025,
    ROUND(b.Recycling_Rate - a.Recycling_Rate, 2) AS Recycling_Rate_Change_Points
FROM county_waste a
JOIN county_waste b
    ON a.County = b.County
WHERE a.Year = 2017
  AND b.Year = 2025
ORDER BY MSW_Change_Percent DESC;


-- 7. REGIONAL CHANGE: 2017 VS. 2025
-- How much did regional MSW and population change between
-- the beginning and end of the analysis period?

SELECT
    a.Year AS Start_Year,
    b.Year AS End_Year,
    a.Regional_Population AS Population_2017,
    b.Regional_Population AS Population_2025,
    a.Regional_MSW AS MSW_2017,
    b.Regional_MSW AS MSW_2025,
    ROUND((b.Regional_MSW - a.Regional_MSW) / a.Regional_MSW * 100, 2) AS MSW_Change_Percent,
    ROUND((b.Regional_Population - a.Regional_Population) / a.Regional_Population * 100, 2) AS Population_Change_Percent
FROM (
    SELECT
        Year,
        SUM(Population) AS Regional_Population,
        SUM(MSW_Collected_Tons) AS Regional_MSW
    FROM county_waste
    GROUP BY Year
) a
JOIN (
    SELECT
        Year,
        SUM(Population) AS Regional_Population,
        SUM(MSW_Collected_Tons) AS Regional_MSW
    FROM county_waste
    GROUP BY Year
) b
ON a.Year = 2017
AND b.Year = 2025;


-- 8. RECYCLING RATE CHANGE BY COUNTY
-- Which counties improved or declined in recycling performance
-- between 2017 and 2025?

SELECT
    a.County,
    a.Recycling_Rate AS Recycling_Rate_2017,
    b.Recycling_Rate AS Recycling_Rate_2025,
    ROUND(b.Recycling_Rate - a.Recycling_Rate, 2) AS Recycling_Rate_Change_Points
FROM county_waste a
JOIN county_waste b
    ON a.County = b.County
WHERE a.Year = 2017
  AND b.Year = 2025
ORDER BY Recycling_Rate_Change_Points DESC;


-- 9. COUNTY MSW GROWTH VS. POPULATION GROWTH
-- Which counties experienced waste growth that exceeded or lagged
-- behind population growth from 2017 to 2025?

SELECT
    a.County,
    ROUND((b.MSW_Collected_Tons - a.MSW_Collected_Tons) / a.MSW_Collected_Tons * 100, 2) AS MSW_Growth_Percent,
    ROUND((b.Population - a.Population) / a.Population * 100, 2) AS Population_Growth_Percent,
    ROUND((
        (b.MSW_Collected_Tons - a.MSW_Collected_Tons) / a.MSW_Collected_Tons
        - (b.Population - a.Population) / a.Population
    ) * 100, 2) AS MSW_Growth_Above_Population_Points
FROM county_waste a
JOIN county_waste b
    ON a.County = b.County
WHERE a.Year = 2017
  AND b.Year = 2025
ORDER BY MSW_Growth_Above_Population_Points DESC;
