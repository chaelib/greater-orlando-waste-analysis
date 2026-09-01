# Central Florida Municipal Solid Waste Analysis

**SQL | MySQL | Power BI | Data Analytics**

![Central Florida Municipal Solid Waste Analysis](dashboard.png)

## Overview

How is Central Florida's waste generation changing, and is population growth enough to explain it?

This project analyzes municipal solid waste (MSW), recycling, landfill use, population, and per-capita waste generation across **Orange, Seminole, Osceola, and Lake counties** from **2017–2025**.

The goal was to move beyond simply describing waste levels and identify whether changes in waste generation were associated with population growth, as well as where the largest differences in waste and recycling performance occurred across counties.

## Key Findings

### Waste has not consistently followed population growth

Regional MSW increased **17.1%** from 2017 to 2025, while MSW per capita decreased **3.6%**.

Annual results also varied considerably. For example, in 2020, regional MSW decreased **10.71%** while population increased **2.33%**. In 2023, MSW increased **15.28%** while population grew only **1.42%**.

This suggests that **population growth alone does not explain changes in regional waste generation**.

### County performance varies substantially

Lake County experienced the largest increase in MSW, with waste generation increasing approximately **76.9% from 2017 to 2025**.

Orange County had the highest average MSW per capita at approximately **2.622 tons per person**, while Osceola had the lowest at approximately **0.736 tons per person**.

### Recycling trends have diverged across counties

Recycling performance changed differently across the four counties between 2017 and 2025:

- **Lake County:** +7.7 percentage points
- **Osceola County:** +1.9 percentage points
- **Orange County:** −1.7 percentage points
- **Seminole County:** −8.6 percentage points

These differences suggest that county-level waste management and recycling outcomes cannot be understood from regional averages alone.

## Business Questions

The analysis was designed around several questions:

1. **Is waste generation growing faster or slower than population in Greater Orlando?**
2. **How has regional waste generation changed over time?**
3. **How much MSW is generated per resident?**
4. **Which counties generate the most waste relative to their populations?**
5. **Which counties have the strongest recycling performance?**
6. **How have waste generation and recycling rates changed from 2017 to 2025?**
7. **Which counties experienced waste growth that exceeded population growth?**

## Data

The analysis uses annual county-level municipal solid waste and population data covering Orange, Seminole, Osceola, and Lake counties from 2017 through 2025.

The dataset includes:

- Population
- MSW collected
- MSW recycled
- MSW landfilled
- Recycling rate
- Landfill rate
- MSW per capita
- Recycled MSW per capita
- Year-over-year MSW growth

The cleaned dataset used for the analysis is available in:

`Data/county_waste.csv`

See [`DATA_DICTIONARY.md`](DATA_DICTIONARY.md) for variable definitions and calculation methods.

## Methodology

### 1. Regional analysis

County-level observations were aggregated by year to create regional totals for population, MSW collected, recycled waste, and landfilled waste.

### 2. Per-capita analysis

MSW per capita was calculated by dividing total MSW collected by population.

This provides a way to compare waste generation while accounting for differences in population size.

### 3. Growth analysis

Annual MSW growth was compared with annual population growth to determine whether changes in waste generation were occurring at a faster or slower rate than changes in population.

### 4. County comparison

County-level averages and overall rates were used to compare:

- MSW per capita
- Recycled waste per capita
- Recycling rates
- Landfill rates

### 5. 2017–2025 comparison

Beginning- and end-period values were compared to identify how each county changed over the nine-year period.

Recycling-rate changes are reported in **percentage points (pp)** rather than percent change.

## Key Metrics

### MSW Per Capita

`MSW Collected ÷ Population`

Measures the amount of municipal solid waste collected per resident.

### Recycling Rate

`MSW Recycled ÷ MSW Collected × 100`

Measures the share of collected MSW that was recycled.

### Landfill Rate

`MSW Landfilled ÷ MSW Collected × 100`

Measures the share of collected MSW that was landfilled.

### MSW Year-over-Year Growth

`(Current Year MSW − Previous Year MSW) ÷ Previous Year MSW × 100`

Measures the annual percentage change in MSW collected.

### MSW Growth Above Population Growth

`MSW Growth % − Population Growth %`

Measures how much faster or slower MSW grew compared with population.

A positive value means MSW grew faster than population, while a negative value means population grew faster than MSW.

## Tools

**SQL / MySQL**  
Used for data aggregation, joins, growth calculations, per-capita calculations, and county-level comparisons.

**Power BI**  
Used to build the interactive dashboard and communicate regional and county-level trends.

**Excel**  
Used for data preparation and organization.

## Analytical Workflow

```text
Raw Data
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

