-- 1. What are the total salaries paid by each company size (small, medium, large) across different countries? --
SELECT country_name,
  sum(CASE WHEN s.company_size = 'S' THEN s.salary * exchange_rate_usd END) AS sum_small_salary,
  sum(CASE WHEN s.company_size = 'M' THEN s.salary * exchange_rate_usd END) AS sum_medium_salary,
  sum(CASE WHEN s.company_size = 'L' THEN s.salary * exchange_rate_usd END) AS sum_large_salary
FROM salaries s
INNER JOIN country c ON s.company_location = c.country_code
INNER JOIN currency_exchange USING (work_year, salary_currency)
GROUP BY country_name
ORDER BY COUNT(DISTINCT company_size) DESC,count(company_size) desc;

-- 2. Which job titles have the highest average salaries for employees working fully remotely (remote_ratio = 100)? --
select job_title, avg(salary * exchange_rate_usd) AS salary_usd_avg
FROM salaries s
INNER JOIN currency_exchange USING (work_year, salary_currency)
inner join job using (job_id)
where remote_ratio = 100
group by 1
order by salary_usd_avg desc
limit 5;

-- 3. What is the distribution of employment types (full-time, part-time, etc.) in different experience levels across various countries? --
select country_name,
	experience_level_description,
    emloyment_description,
    count(employment_type) as total_employee
from salaries s
inner join Employment_type using (employment_type)
inner join experience_level using (experience_level)
inner join country c on s.employee_residence = c.country_code
group by 1,2,3
order by 1,2,3, 4 desc;

-- 4. What is the average exchange rate of salary currencies to USD for each year in the currency_exchange table, and how does it vary across time? --
select work_year, avg(exchange_rate_usd)
from currency_exchange
group by work_year;

-- 5. For each country, which employment type has the highest percentage of senior-level employees (experience_level = 'SE')? --
select
	country_name,
    employment_type,
    ROUND(SUM(CASE WHEN experience_level = 'SE' THEN 1 ELSE 0 END) * 1.0 / COUNT(*), 2) AS senior_level_percentage
from salaries s
inner join country c on  s.employee_residence = c.country_code
group by 1,2
having senior_level_percentage <> 0
ORDER BY senior_level_percentage DESC;

-- 6. What are the top 5 job titles with the highest salaries in companies located in countries with a specific ISO currency code? --
select 
	job_title,
    avg(salary * exchange_rate_usd) AS avg_salary_usd
from salaries
inner join currency_exchange using (salary_currency,work_year)
inner join job using (job_id)
group by 1
order by avg_salary_usd desc
limit 5;

-- 7. Which country has the most diverse company sizes (small, medium, large) and what are the average salaries for each size within that country? --

SELECT 
  country_name,
  AVG(CASE WHEN s.company_size = 'S' THEN s.salary * exchange_rate_usd END) AS avg_small_salary,
  AVG(CASE WHEN s.company_size = 'M' THEN s.salary * exchange_rate_usd END) AS avg_medium_salary,
  AVG(CASE WHEN s.company_size = 'L' THEN s.salary * exchange_rate_usd END) AS avg_large_salary
FROM salaries s
JOIN country c ON s.company_location = c.country_code
join currency_exchange using (salary_currency,work_year)
GROUP BY country_name
having avg_small_salary is not null 
	and avg_medium_salary is not null
	and avg_large_salary is not null
ORDER BY COUNT(DISTINCT company_size) DESC,count(company_size) desc
;

-- 8. Identify the job titles that consistently appear in the top 10 highest-paying jobs based on work_year.--

with cte2 as (
with cte as (select
	job_title
from salaries s
inner join currency_exchange ce using (work_year,salary_currency)
inner join job using (job_id)
where s.work_year = 2020 
group by job_title   
order by avg(salary * exchange_rate_usd) desc
limit 10)

select
	job_title
from salaries s
inner join currency_exchange ce using (work_year,salary_currency)
inner join job using (job_id)
join cte using (job_title)
where s.work_year = 2021 
group by job_title   
order by avg(salary * exchange_rate_usd) desc
limit 10)

select
	job_title
from salaries s
inner join currency_exchange ce using (work_year,salary_currency)
inner join job using (job_id)
join cte2 using (job_title)
where s.work_year = 2022 
group by job_title   
order by avg(salary * exchange_rate_usd) desc
limit 10;

