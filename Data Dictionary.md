# Data Dictionary

## Dataset Overview

The `county_waste` dataset contains annual municipal solid waste and population data for four Central Florida counties from 2017 through 2025.

- **Counties:** Orange, Seminole, Osceola, and Lake
- **Time Period:** 2017–2025
- **Geographic Level:** County-year
- **Primary Source:** Florida Economic and Demographic Research (EDR)

## Variables

| Field | Description | Unit |
|---|---|---|
| `County` | County represented by the observation | County |
| `Year` | Year of the observation | Year |
| `Population` | Population of the county | Residents |
| `MSW_Collected_Tons` | Municipal solid waste collected | Tons |
| `MSW_Landfilled_Tons` | Municipal solid waste sent to landfill | Tons |
| `MSW_Recycled_Tons` | Municipal solid waste recycled | Tons |
| `MSW_YoY_Growth` | Year-over-year change in MSW collected | Percent |
| `MSW_Per_Capita` | MSW collected relative to population | Tons per person |
| `Recycled_Per_Capita` | Recycled MSW relative to population | Tons per person |
| `Recycling_Rate` | Share of collected MSW that was recycled | Percent |
| `Landfill_Rate` | Share of collected MSW that was landfilled | Percent |

## Calculated Metrics

### MSW Per Capita

Measures the amount of municipal solid waste collected per resident.

**Calculation:**

`MSW Collected ÷ Population`

### Recycled Per Capita

Measures the amount of MSW recycled per resident.

**Calculation:**

`MSW Recycled ÷ Population`

### Recycling Rate

Measures the percentage of collected MSW that was recycled.

**Calculation:**

`MSW Recycled ÷ MSW Collected × 100`

### Landfill Rate

Measures the percentage of collected MSW that was landfilled.

**Calculation:**

`MSW Landfilled ÷ MSW Collected × 100`

### MSW Year-over-Year Growth

Measures the annual percentage change in MSW collected.

**Calculation:**

`(Current Year MSW − Previous Year MSW) ÷ Previous Year MSW × 100`

### Recycling Rate Change

Measures the change in recycling rate between 2017 and 2025.

**Calculation:**

`Recycling Rate in 2025 − Recycling Rate in 2017`

This is reported in **percentage points (pp)** rather than percent change.

### MSW Growth Above Population Growth

Measures how much faster or slower MSW grew compared with population between 2017 and 2025.

**Calculation:**

`MSW Growth % − Population Growth %`

A positive value indicates that MSW grew faster than population, while a negative value indicates that population grew faster than MSW.
