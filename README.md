# Data Job Salaries Analysis!
#### This project aims utilize SQL-based skills to uncover more insights of Data position salaries around the world! 
#### It contains the following steps:
* Data set inspection: feature and potential correlation
* Preprocessing the data: missing values handling and Data normalization(3NF)
* Extra Data collection: explore more data from different sources to fill the gap of analysis needed  
* Data modeling: Entity Relationship Diagram(ERD) building 
* SQL data base building: split the whole data set into seperate csv files and import data sets as tables to data base (refer to .sql file)
* Data analysis using SQL query

## Entity Relationship Diagram(ERD)

## Key insights
### 1: The total salaries paid by each company size (small, medium, large) across different countries
### 2: Job titles that have the highest average salaries for employees working fully remotely (remote_ratio = 100)

* For better comparison, filter remote rate = 100, which means totally work from home
* Use average to generalize each job position group
* Related to job level and exact position 

### 3: The distribution of employment types (full-time, part-time, etc.) in different experience levels across various countries

| Country                  | Job Level          | Job Type  | Count |
|--------------------------|--------------------|-----------|-------|
| United States Of America | Entry_level        | CONTRACT  | 1     |
| United States Of America | Entry_level        | FULL TIME | 28    |
| United States Of America | Executive_level    | CONTRACT  | 1     |
| United States Of America | Executive_level    | FULL TIME | 14    |
| United States Of America | Mid_level          | CONTRACT  | 1     |
| United States Of America | Mid_level          | FULL TIME | 76    |
| United States Of America | Senior_level       | CONTRACT  | 1     |
| United States Of America | Senior_level       | FULL TIME | 210   |

* Basically full-time or contract workers
* Each experience level is represented 
* Country representative: US


### 4: The average exchange rate of salary currencies to USD for each year in the currency_exchange table, and its variation across time

| Work Year | Avg Exchange Rate (USD) |
|-----------|-------------------------|
| 2020      | 0.45395000              |
| 2021      | 0.42078571              |
| 2022      | 0.70976667              |

* The exchange rate increased by around 0.3 generally from 2020-2022
* Trend: Devaluation of US dollar
* * Covid-19 period
* * Inflation accelerated in 2021 and 2022
* * Increased Government Spending and Fiscal Stimulus


### 5: For each country, the employment type that has the highest percentage of senior-level employees (experience_level = 'SE')

| Country Name               | Employment Type | Senior Level Percentage |
|----------------------------|----------------|-------------------------|
| New Zealand               | FT             | 1.00                    |
| Russia                    | FL             | 1.00                    |
| Croatia                   | FT             | 1.00                    |
| Bulgaria                  | FT             | 1.00                    |
| Puerto Rico               | FT             | 1.00                    |
| Argentina                 | FT             | 1.00                    |
| Malaysia                  | FT             | 1.00                    |
| Ireland                   | FT             | 1.00                    |
| Brazil                    | FT             | 0.80                    |
| United Arab Emirates      | FT             | 0.67                    |
| United States Of America  | FT             | 0.64                    |
| Mexico                    | FT             | 0.50                    |
| Canada                    | FT             | 0.50                    |
| Belgium                   | FT             | 0.50                    |
| Romania                   | FT             | 0.50                    |
| Slovenia                  | FT             | 0.50                    |

* Full-time jobs
* Some achieve 100%


### 6: Top 5 job titles with the highest salaries in companies 

* Related to job levels(Lead/principle/director)
* Data scientist/analyst/engineer


### 7: The country that has the most diverse company sizes (small, medium, large) and what are the average salaries for each size within that country

| Country Name                | Avg Small Salary  | Avg Medium Salary  | Avg Large Salary  |
|-----------------------------|-------------------|--------------------|-------------------|
| United States Of America    | 104570.06        | 141446.84          | 160966.81         |
| United Kingdom              | 87404.50         | 81196.51           | 80032.91          |
| Canada                      | 93640.33         | 87931.70           | 118804.40         |
| Germany                     | 53518.59         | 104269.59          | 81643.72          |
| India                       | 13100.00         | 18824.36           | 38563.61          |
| France                      | 50085.67         | 59522.12           | 75359.46          |
| Spain                       | 58509.00         | 50349.56           | 57553.00          |
| Greece                      | 20000.00         | 56367.28           | 47901.00          |
| Austria                     | 91240.00         | 61464.00           | 69489.70          |
| Australia                   | 150000.00        | 86700.00           | 87422.50          |
| Luxembourg                  | 62727.50         | 10000.00           | 59100.00          |

* The data is ordered by number of distinct company sizes and number of each sizes
* US is the country that most diverse
* Most are western developed countries
* 7 out of 10 consistently appear


### 8: The job titles that consistently appear in the top 10 highest-paying jobs based on work_year

| Job Title                     |
|--------------------------------|
| Director of Data Science      |
| Data Science Manager          |
| Principal Data Scientist      |
| Machine Learning Scientist    |
| Machine Learning Engineer     |
| Research Scientist            |
| Business Data Analyst         |

* 7 out of 10 consistently appear
* Machine learning related job opportunities  




