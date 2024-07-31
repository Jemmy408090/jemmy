select aa.*, bd.WATER_PURIFICATION_PLANT, bd.WATER_SUPPLY, be.TOWNSHIP, be.PLACE --�a�I,�Ǹ�, �B��,�ۥѦ��ľl�� 
from ( select PLACE as �a�I, 
        SERIAL_NUMBER as �Ǹ�, 
        TURBIDITY as �B��, 
        CHLORINE as �ۥѦ��ľl��, 
        HYDROGEN as �B���l�@�׫���,
        water_system
        from sql_taoyuan_water
        where (SERIAL_NUMBER between '521' and '529')
        union all
        select PLACE as �a�I, 
        SERIAL_NUMBER as �Ǹ�, 
        TURBIDITY as �B��, 
        CHLORINE as �ۥѦ��ľl��, 
        HYDROGEN as �B���l�@�׫���,
        water_system
        from sql_taoyuan_water
        where CHLORINE in (0.77, 0.76, 0.66)
        and  HYDROGEN! = 7.8 and TURBIDITY = 0.6 
        ) aa
left join SQL_TAOYUAN_WATER_SYSTEM bd on aa.water_system = bd.serial
left join SQL_TAOYUAN_REGIONS be on aa.�a�I = be.serial
order by �B�� asc , �Ǹ� desc;























































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

select  place, count(place) as �a���`����, max(CHLORINE) as �̤j�ۥѦ��ľl�� , min(CHLORINE) as �̤p�ۥѦ��ľl��, sum(HYDROGEN), avg(TURBIDITY)
from SQL_TAOYUAN_WATER
where place in ('T40', 'T44', 'T16')
group by place

select aa.TOWNSHIP, count(place) as �a���`����, avg(TURBIDITY) as �B�ץ���
from SQL_TAOYUAN_WATER bb
left join SQL_TAOYUAN_REGIONS aa on aa.place = bb.serial
group by aa.township
having avg(TURBIDITY)>7





create table SQL_EMP_HIS as select *
from SQL_EMP
where EMP_ID = '00012345'

truncate table SQL_EMP_HIS

insert into SQL_EMP_HIS
select EMP_ID, EMP_NM, ID, NULL, '��T�O��'
from SQL_EMP
where EMP_ID = '00012345';


create table sql_emp_practice as select * 
from sql_emp
update sql_emp_practice
set dep = '��T�O��'

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











