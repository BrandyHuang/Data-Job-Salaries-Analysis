-- create table if not exists JobSalaries;

-- create table --
create table if not exists Salaries(
    id int not null,
    work_year int not null,
    experience_level varchar(2) not null,
    emplyment_type varchar(2) not null,
    job_title varchar(100) not null,
    salary int not null,
    salary_currency varchar(3) not null,
    salary_in_usd int not null,
    employee_residence varchar(2) not null,
    remote_ratio int not null,
    company_location varchar(2) not null,
    company_size varchar(1) not null
    );
-- create country country--
select * from salaries;

-- ADD TABLE CALLED ISO COUNTRY CODE AND NAMES --
create table if not exists country(
    country_code varchar(2) not null,
    country_name varchar(100) not null
    );


-- import dataset country--
select * from salaries;

-- ADD TABLE CALLED CURRENCY INCLUDING CODE AND NAMES --

create table if not exists Currency(
    currency_code varchar(3) not null,
    currency_name varchar(100) not null
    );
 
-- import dataset country--
select * from currency;

-- ADD TABLE CALLED employment type INCLUDING CODE AND description --

create table if not exists Employment_type(
    Employment_type varchar(2) not null,
    Emloyment_description varchar(100) not null
    );

select *
from employment_type;

-- ADD TABLE CALLED COMPANY SIZE INCLUDING CODE AND description --

create table if not exists Company_size(
    company_size_code varchar(1) not null,
    company_size_description varchar(100) not null
    );
    

select distinct job_title
from salaries;

-- ADD TABLE CALLED job INCLUDING CODE AND description --

create table if not exists Job(
    Job_ID int not null,
    Job_title varchar(100) not null
    );

SELECT *
FROM JOB;

-- ADD TABLE CALLED experience level INCLUDING CODE AND description --

create table if not exists experience_level(
    Experience_level varchar(2) not null,
    Experience_level_description varchar(100) not null
    );


SELECT * 
from experience_level;

SELECT distinct work_year,salary_currency,(salary_in_usd/salary) as exchange_rate
FROM SALARIES;

-- ADD TABLE CALLED currency_exchange --

create table if not exists currency_exchange(
    work_year int not null,
    salary_currency varchar(3) not null,
    exchange_rate_usd decimal(5,4) not null
    );
    
ALTER TABLE currency_exchange
MODIFY work_year int not null;

-- view table --
select *
from currency_exchange;


-- executation --
select employee_residence,country_name
from salaries s
inner join country c on s.employee_residence = c.country_code;

-- see which columns are not the as the default collation name --
SELECT TABLE_NAME, COLUMN_NAME, COLLATION_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'jobsalaries'
  AND COLLATION_NAME != 'utf8mb4_0900_ai_ci';

-- change the unmatched columns to objected one --
ALTER TABLE country
MODIFY COLUMN country_code varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE country
MODIFY COLUMN country_name varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- switch job_title in main table to job_id --
START TRANSACTION;

CREATE TEMPORARY TABLE temp_table AS
SELECT job_id, job_title FROM job;
SET SQL_SAFE_UPDATES = 0;
UPDATE salaries s
JOIN job j ON s.job_title = j.job_title
SET s.job_title = j.job_id;
SET SQL_SAFE_UPDATES = 1;
COMMIT;

select *
from currency_exchange;

select * 
from company_size;

-- adjsut column name and column values --
ALTER TABLE salaries
RENAME COLUMN job_title TO job_id;

SET SQL_SAFE_UPDATES = 0; 
UPDATE salaries
SET id = id + 1; 
SET SQL_SAFE_UPDATES = 1;

ALTER TABLE salaries
DROP COLUMN salary_in_usd;

DELETE FROM currency_exchange
WHERE work_year = 2022 and salary_currency = "EUR" and exchange_rate_usd = 1.0992;

ALTER TABLE salaries
CHANGE job_title job_id int;

-- set primary key and foreign key --
ALTER TABLE company_size
ADD PRIMARY KEY (company_size_code);

ALTER TABLE country
ADD PRIMARY KEY (country_code);

ALTER TABLE currency
ADD PRIMARY KEY (currency_code);

ALTER TABLE currency_exchange
ADD PRIMARY KEY (work_year,salary_currency);

ALTER TABLE Employment_type
ADD PRIMARY KEY (employment_type);

ALTER TABLE experience_level
ADD PRIMARY KEY (experience_level);

ALTER TABLE job
ADD PRIMARY KEY (job_id);

ALTER TABLE salaries
ADD PRIMARY KEY (id);


ALTER TABLE salaries
ADD CONSTRAINT fk_company_size FOREIGN KEY (company_size)
REFERENCES company_size (company_size_code);

ALTER TABLE salaries
ADD CONSTRAINT fk_experience_level FOREIGN KEY (experience_level)
REFERENCES experience_level (experience_level);

ALTER TABLE salaries
ADD CONSTRAINT fk_salary_currency FOREIGN KEY (salary_currency)
REFERENCES currency (currency_code);

ALTER TABLE salaries
ADD CONSTRAINT fk_job_id FOREIGN KEY (job_id)
REFERENCES job (job_id);

ALTER TABLE salaries
ADD CONSTRAINT fk_employment_type FOREIGN KEY (employment_type)
REFERENCES Employment_type (Employment_type);

ALTER TABLE salaries
ADD CONSTRAINT fk_work_region
FOREIGN KEY (work_year, salary_currency)
REFERENCES currency_exchange (work_year, salary_currency);

select *
from salaries;

-- export table dictionary --
SELECT TABLE_NAME,
       COLUMN_NAME,
       COLUMN_TYPE,
       COLUMN_KEY
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'jobsalaries';
