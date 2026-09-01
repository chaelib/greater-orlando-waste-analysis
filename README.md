# Central Florida Municipal Solid Waste Analysis

**SQL | MySQL | Power BI | Data Analytics**

![Central Florida Municipal Solid Waste Analysis](dashboard.png)

[View the full Power BI dashboard (PDF)](Central%20Florida%20Municipal%20Solid%20Waste%20Analysis.pdf)

---

## Executive Summary

**How has municipal solid waste generation changed across Central Florida, and is population growth enough to explain those changes?**

This project analyzes municipal solid waste (MSW), recycling, landfill use, population, and per-capita waste generation across **Orange, Seminole, Osceola, and Lake counties** from **2017–2025**.

Rather than simply comparing total waste between counties, the analysis examines waste generation relative to population, year-over-year changes, and differences in recycling performance to identify where the most meaningful trends occur.

## Key Findings

### Waste growth has not consistently followed population growth

Regional MSW increased **17.1%** from 2017 to 2025, while regional MSW per capita decreased **3.6%**.

Annual changes also varied substantially. In 2020, MSW decreased **10.71%** while population increased **2.33%**. In 2023, MSW increased **15.28%** while population grew only **1.42%**.

**Takeaway:** Population growth alone does not explain changes in regional waste generation.

### Waste generation differs significantly by county

Orange County had the highest average MSW per capita at approximately **2.622 tons per resident**, while Osceola County had the lowest at approximately **0.736 tons per resident**.

Lake County experienced the largest increase in MSW from 2017 to 2025, with waste generation increasing approximately **76.9%**.

**Takeaway:** County-level waste patterns differ substantially even within the same region.

### Recycling performance has diverged across counties

Change in recycling rate from 2017 to 2025:

| County | Change in Recycling Rate |
|---|---:|
| Lake | +7.7 pp |
| Osceola | +1.9 pp |
| Orange | −1.7 pp |
| Seminole | −8.6 pp |

**Takeaway:** Regional averages can hide substantial differences in county-level recycling performance.

---

## Business Questions

The analysis was designed around the following questions:

1. Is waste generation growing faster or slower than population?
2. How has regional MSW generation changed from 2017–2025?
3. How much MSW is collected per resident?
4. Which counties generate the most waste relative to their populations?
5. Which counties have the strongest recycling performance?
6. How have waste generation and recycling rates changed between 2017 and 2025?
7. Which counties experienced waste growth that exceeded population growth?

---

## Data

The analysis uses annual county-level municipal solid waste and population data for **Orange, Seminole, Osceola, and Lake counties** from **2017–2025**.

The cleaned dataset used in the analysis is available here:

**[county_waste.csv](Data/county_waste.csv)**

The dataset contains:

- Population
- MSW collected
- MSW recycled
- MSW landfilled
- Recycling rate
- Landfill rate
- MSW per capita
- Recycled MSW per capita
- Year-over-year MSW growth

See the **[Data Dictionary](DATA_DICTIONARY.md)** for variable definitions and calculation methods.

---

## Methodology

### Regional Analysis

County-level observations were aggregated by year to calculate regional totals for population, MSW collected, recycled waste, and landfilled waste.

### Per-Capita Analysis

MSW per capita was calculated as:

`MSW Collected ÷ Population`

This allows waste generation to be compared while accounting for differences in population size.

### Growth Analysis

Annual MSW growth was compared with annual population growth to determine whether waste generation was increasing or decreasing faster than the population.

### County Comparison

County-level analysis compared:

- Average MSW per capita
- Average recycled waste per capita
- Overall recycling rate
- Overall landfill rate

### 2017–2025 Comparison

County-level MSW and recycling rates were compared between 2017 and 2025 to identify changes over the full analysis period.

Recycling-rate changes are reported in **percentage points (pp)** rather than percent change.

---

## Key Metrics

**MSW Per Capita**

`MSW Collected ÷ Population`

Measures the amount of municipal solid waste collected per resident.

**Recycling Rate**

`MSW Recycled ÷ MSW Collected × 100`

Measures the percentage of collected MSW that was recycled.

**Landfill Rate**

`MSW Landfilled ÷ MSW Collected × 100`

Measures the percentage of collected MSW that was landfilled.

**MSW Year-over-Year Growth**

`(Current Year MSW − Previous Year MSW) ÷ Previous Year MSW × 100`

Measures the annual percentage change in MSW collected.

**MSW Growth Above Population Growth**

`MSW Growth % − Population Growth %`

Measures whether MSW grew faster or slower than population over the same period.

A positive value indicates that MSW grew faster than population.

---

## Tools

**SQL / MySQL**  
Used for aggregation, joins, growth calculations, per-capita analysis, and county-level comparisons.

**Power BI**  
Used to build the dashboard and visualize regional and county-level trends.

**Excel**  
Used for data preparation and organization.

---

## Analytical Workflow

```text
County-Level Data
       ↓
Data Preparation
       ↓
SQL Analysis
       ↓
Regional & County-Level Metrics
       ↓
Power BI Dashboard
       ↓
Business Findings
