select aa.*, bd.WATER_PURIFICATION_PLANT, bd.WATER_SUPPLY, be.TOWNSHIP, be.PLACE --地點,序號, 濁度,自由有效餘氯 
from ( select PLACE as 地點, 
        SERIAL_NUMBER as 序號, 
        TURBIDITY as 濁度, 
        CHLORINE as 自由有效餘氯, 
        HYDROGEN as 氫離子濃度指數,
        water_system
        from sql_taoyuan_water
        where (SERIAL_NUMBER between '521' and '529')
        union all
        select PLACE as 地點, 
        SERIAL_NUMBER as 序號, 
        TURBIDITY as 濁度, 
        CHLORINE as 自由有效餘氯, 
        HYDROGEN as 氫離子濃度指數,
        water_system
        from sql_taoyuan_water
        where CHLORINE in (0.77, 0.76, 0.66)
        and  HYDROGEN! = 7.8 and TURBIDITY = 0.6 
        ) aa
left join SQL_TAOYUAN_WATER_SYSTEM bd on aa.water_system = bd.serial
left join SQL_TAOYUAN_REGIONS be on aa.地點 = be.serial
order by 濁度 asc , 序號 desc;























































select departments.department_id, departments.department_name, employees.employee_id
from departments
left join employees 
on departments.department_id = employees.department_id
group by departments.department_id, 

select distinct ee.department_id, dd.department_name, count(ee.department_id)
from employees ee, departments dd
where ee.department_id= dd.department_id
group by ee.department_id, dd.department_name

select  last_name, salary, 12*(salary+100), 
from employees

select  place, count(place) as 地區總筆數, max(CHLORINE) as 最大自由有效餘氯 , min(CHLORINE) as 最小自由有效餘氯, sum(HYDROGEN), avg(TURBIDITY)
from SQL_TAOYUAN_WATER
where place in ('T40', 'T44', 'T16')
group by place

select aa.TOWNSHIP, count(place) as 地區總筆數, avg(TURBIDITY) as 濁度平均
from SQL_TAOYUAN_WATER bb
left join SQL_TAOYUAN_REGIONS aa on aa.place = bb.serial
group by aa.township
having avg(TURBIDITY)>7





create table SQL_EMP_HIS as select *
from SQL_EMP
where EMP_ID = '00012345'

truncate table SQL_EMP_HIS

insert into SQL_EMP_HIS
select EMP_ID, EMP_NM, ID, NULL, '資訊板塊'
from SQL_EMP
where EMP_ID = '00012345';


create table sql_emp_practice as select * 
from sql_emp
update sql_emp_practice
set dep = '資訊板塊'

select last_name, job_id, salary
from employees
where job_id = 
    (select job_id
    from employees
    where employee_id = 141)
and salary >
    (select salary
    from employees
    where employee_id =143)
    
create table practice_emp as select * 
from sql_emp
insert 











