
/*          *****************   TASK 5    ***************** */

/*Восстановить всю возможную информацию в таблица locations*/
insert into locations(street_address, postal_code, city, state_province, country_id)
select distinct street_address, postal_code, city, state_province, country_id
from report
where (street_address is not null) and (postal_code is not null) and (city is not null) and (state_province is not null) and (country_id is not null);



/*Восстановить всю возможную информацию в таблица departments*/
insert into departments(department_name)
select distinct department_name
from report
where (department_name is not null);



/*Восстановить всю возможную информацию в таблица employees*/
insert INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct)
select distinct 
FIRST_NAME,
LAST_NAME,
EMAIL is null,
PHONE_NUMBER,
HIRE_DATE,
JOB_ID,
SALARY,
COMMISSION_PCT
from report;



/*Для каждого работнака исключая менеджеров увеличить зарплату на 100$*/
UPDATE `employees`
SET `salary` = `salary` + 100
WHERE `job_id` NOT LIKE '%MGR' AND `job_id` NOT LIKE '%MAN';


/*Для каждого рабоника установить email = 5 первые буквы имени + 5 первые буквы фамилии*/
UPDATE `employees`
SET `email`=left(`first_name`,5)+left(`last_name`, 5);


/*Для каждого департамента где количество работников меньше 10 необходимо увеличить зарплату на 10%*/
insert into departments(department_name, location_id)
select distinct department_name, l.location_id
from report r
left join locations l on
r.country_id = l.country_id
where (department_name is not null);
