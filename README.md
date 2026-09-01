# Central Florida Municipal Solid Waste Analysis

**SQL | Power BI | Data Analysis**

![Central Florida Municipal Solid Waste Analysis](dashboard.png)

## Business Question

**How has municipal solid waste generation changed across Central Florida, and to what extent can changes be explained by population growth?**

## Key Findings

- **Regional MSW increased 17.1%** from 2017 to 2025, while **MSW per capita decreased 3.6%**.
- **Lake County's MSW increased 76.9%**, substantially outpacing its population growth.
- Recycling performance diverged across counties. **Lake County improved 7.7 percentage points**, while **Seminole County declined 8.6 percentage points**.
- Annual changes in waste generation did not consistently follow population growth, suggesting that population alone does not explain changes in regional waste generation.

## Project Overview

This project analyzes municipal solid waste (MSW) generation, recycling, landfill use, population, and waste per capita across four Central Florida counties from 2017 through 2025.

The analysis examines both regional and county-level patterns to understand how waste generation has changed over time and whether changes in waste generation correspond with population growth.

**Counties analyzed:** Orange, Seminole, Osceola, and Lake  
**Analysis period:** 2017–2025

## Data

The analysis uses annual county-level municipal solid waste and population data from the **Florida Economic and Demographic Research (EDR)**.

Key variables include:

- Population
- MSW collected
- MSW recycled
- MSW landfilled
- Recycling rate
- Landfill rate
- MSW per capita
- Recycled MSW per capita
- Year-over-year MSW growth

## Tools

- **SQL / MySQL** — Data aggregation, calculations, comparisons, and analysis
- **Power BI** — Interactive dashboard and data visualization
- **Excel** — Data preparation and organization

## Analytical Approach

1. Aggregated county-level data into annual regional totals.
2. Calculated regional MSW per capita and recycling rates.
3. Compared annual MSW growth with population growth.
4. Compared county-level waste generation and recycling performance.
5. Analyzed changes between 2017 and 2025.
6. Identified counties where MSW growth outpaced population growth.
7. Built a Power BI dashboard to communicate the findings.

## Business Implications

The analysis suggests that population growth alone does not explain changes in municipal solid waste generation across Central Florida.

The substantial differences between counties indicate that additional factors such as economic activity, tourism, consumption patterns, and waste-management practices may contribute to differences in waste generation and recycling performance.

## Repository Contents

- `dashboard.png` — Final Power BI dashboard
- `Central Florida Municipal Solid Waste Analysis.pdf` — PDF version of the dashboard
- `SQL/analysis.sql` — SQL queries used for the analysis
- `DATA_DICTIONARY.md` — Dataset variables and metric definitions

## Future Analysis

A potential next step would be to examine whether tourism activity and economic activity help explain county-level differences in waste generation.

This could involve comparing municipal solid waste trends with tourism indicators, taxable sales, and other measures of regional economic activity.

