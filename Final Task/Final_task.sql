1. Удалить HR схему если емеется.
2. Выполнить скрип для создания HR схемы HR.sql
3. Сдеалть HR схему схемой по умолнчанию.
4. Выполнить нижеприведённые скрипты

CREATE TABLE REPORT(
    FIRST_NAME varchar(20),
    LAST_NAME varchar(25) NOT NULL,
    EMAIL varchar(25) NULL,
    PHONE_NUMBER varchar(20),
    HIRE_DATE date NOT NULL,
    JOB_ID varchar(10) NOT NULL,
    SALARY decimal(8,2) NOT NULL,
    COMMISSION_PCT decimal(2, 2),
    MANAGER_FIRST_NAME varchar(20),
    MANAGER_LAST_NAME varchar(25),
    DEPARTMENT_NAME varchar(30),
    DEPARTMENT_MANAGER_FIRST_NAME varchar(20),
    DEPARTMENT_MANAGER_LAST_NAME varchar(25),
    street_address varchar(40) ,
    postal_code varchar(12) ,
    city varchar(30),
    state_province varchar(25),
    country_id char(2));

INSERT INTO REPORT
SELECT em.FIRST_NAME,
    em.LAST_NAME,
    NULL,
    em.PHONE_NUMBER,
    em.HIRE_DATE,
    em.JOB_ID,
    em.SALARY,
    em.COMMISSION_PCT,
    mn.FIRST_NAME AS MANAGER_FIRST_NAME,
    mn.LAST_NAME AS MANAGER_LAST_NAME,
    dp.DEPARTMENT_NAME,
    mnd.FIRST_NAME AS DEPARTMENT_MANAGER_FIRST_NAME,
    mnd.LAST_NAME AS DEPARTMENT_MANAGER_LAST_NAME,
    lc.street_address,
    lc.postal_code,
    lc.city,
    lc.state_province,
    lc.country_id
FROM EMPLOYEES em
LEFT JOIN EMPLOYEES mn ON (em.MANAGER_ID = mn.EMPLOYEE_ID)
LEFT JOIN DEPARTMENTS dp ON (em.DEPARTMENT_ID = dp.DEPARTMENT_ID)
LEFT JOIN EMPLOYEES mnd ON (dp.MANAGER_ID = mnd.EMPLOYEE_ID)
LEFT JOIN LOCATIONS lc ON (lc.location_id = dp.location_id);

UPDATE DEPARTMENTS SET MANAGER_ID = NULL;
UPDATE EMPLOYEES SET MANAGER_ID = NULL;
UPDATE EMPLOYEES SET DEPARTMENT_ID = NULL;
DELETE FROM JOB_HISTORY;
DELETE FROM DEPARTMENTS;
DELETE FROM EMPLOYEES;
DELETE FROM locations;

5. Восстановить всю возможную информацию в таблица locations, departments и employees.
После востановления данных необходимо:
 - для каждого работнака исключая менеджеров увеличить зарплату на 100$
 - для каждого рабоника установить email = 5 первые буквы имени + 5 первые буквы фамилии
 - для каждого департамента где количество работников меньше 10 необходимо увеличить зарплату на 10%


