select * from sql_emp where emp_id= '00012345';   /*�r�곣�ϥγ�޸�*/

select EMP_ID, EMP_NM from sql_emp; 

select * from aaa;

select * from sql_item;

select price from sql_item;

select item_name from sql_item;


create TABLE sql_emp1(
emp_id char(8 byte) primary key,
emp_nm nvarchar2(20),
id varchar2(10 byte),
tel varchar2(10 byte),
dep nvarchar2(20));

create table sql_customer1(
id varchar2(10 byte) primary key,
name nvarchar2(20),
emp char(8 byte) references sql_emp1 (emp_id));


alter table sql_customer1
add foreign key (emp) references sql_emp(emp_id);


create index sql_emp1_index1 on sql_emp(dep);


create table water as select * from sql_taoyuan_water

SELECT ww.serial_number as "�Ǹ�",
hydrogen as "�B���l�@�׫���",
TURBIDITY as "�B��",
chlorine as "�ۥѦ��ĲB��" from water ww;


SELECT * FROM sql_emp
where dep = '�t�ζ}�o��' and  emp_nm like '��%'

select * from sql_emp
where emp_nm like '%��'

select EMP_ID as "����", EMP_NM, ID, TEL as "�q��", DEP from sql_emp
where
    (dep='�t�ζ}�o��' and emp_nm like'��%')
or
    (dep='�}�o�t�γ�' and emp_nm like'�]%');
    
    
    
SELECT * FROM cars
    where  min_price between '300' and '600'

select *from cars
   where  min_price in ('300','600')
   or price ='700'
   
SELECT * FROM cars
    where manufacturer like '__W%' /*�n�O�o�j�p�g���ϧO*/
    and price in '800'

select * from sql_emp1 where tel is not null
 
�m�ߤ�

select  SERIAL_NUMBER as "�Ǹ�", CREATE_DATE, PLACE, WATER_SYSTEM, TURBIDITY as "�B��", CHLORINE as "�ۥѦ��ľl��", HYDROGEN as "�B���l�@�׫���" from sql_taoyuan_water
    where HYDROGEN in('7.5','8')
    and CHLORINE > '0.6'
    and place = 'T22';

select  SERIAL_NUMBER as "�Ǹ�", TURBIDITY as "�B��", CHLORINE as "�ۥѦ��ľl��", HYDROGEN as "�B���l�@�׫���" from sql_taoyuan_water
    where 
    SERIAL_NUMBER between '521' and '529'   /*�]�i�H����(serial_mummer>520 and serial_nummer<530)*/
     or CHLORINE in('0.76', '0.77', '0.66')
     and TURBIDITY in ('0.6')
     and HYDROGEN not in ('7.8')
   
select distinct manufacturer from cars

select distinct manufacturer, count(*) from cars group by manufacturer

/*�m�ߤ�*/
select distinct PLACE as "�a�I", SERIAL_NUMBER as "�Ǹ�", TURBIDITY as "�B��", CHLORINE as "�ۥѦ��ľl��", HYDROGEN as "�B���l�@�׫���" from sql_taoyuan_water
     where 
     SERIAL_NUMBER between '521' and '529'   /*�]�i�H����(serial_mummer>520 and serial_nummer<530)*/
     or CHLORINE in('0.76', '0.77', '0.66')
     and TURBIDITY in ('0.6')
     and HYDROGEN not in ('7.8')
    order by TURBIDITY asc, SERIAL_NUMBER desc;

/*distinct*/
SELECT
    * FROM sql_emp
    where emp_id in (select distinct emp from sql_customer);


select emp_nm, id from sql_emp
union all
select name, id from sql_customer;

select emp_nm, id from sql_emp
union
select name, id from sql_customer;

/*�m�ߤC*/

select PLACE as "�a�I", SERIAL_NUMBER as "�Ǹ�", TURBIDITY as "�B��", CHLORINE as "�ۥѦ��ľl��", HYDROGEN as "�B���l�@�׫���" from sql_taoyuan_water
    where HYDROGEN in('7.5','8') 
    union all
    place =('T22") 
    union all
    CHLORINE > '0.6';
    
    /* select PLACE as "�a�I", SERIAL_NUMBER as "�Ǹ�", TURBIDITY as "�B��", CHLORINE as "�ۥѦ��ľl��", HYDROGEN as "�B���l�@�׫���" from sql_taoyuan_water
    where HYDROGEN in('7.5','8') 
    union 
    select PLACE as "�a�I", SERIAL_NUMBER as "�Ǹ�", TURBIDITY as "�B��", CHLORINE as "�ۥѦ��ľl��", HYDROGEN as "�B���l�@�׫���" from sql_taoyuan_water 
    where place = 'T22' 
    union 
    select PLACE as "�a�I", SERIAL_NUMBER as "�Ǹ�", TURBIDITY as "�B��", CHLORINE as "�ۥѦ��ľl��", HYDROGEN as "�B���l�@�׫���" from sql_taoyuan_water
    where  CHLORINE > '0.6'; */
   
   
   /* 
    select �a�I, �Ǹ�, �B���l�@�׫���, �B��, �ۥѦ��ľl��
    from( select PLACE as "�a�I", 
        SERIAL_NUMBER as "�Ǹ�", 
        TURBIDITY as "�B��", 
        CHLORINE as "�ۥѦ��ľl��", 
        HYDROGEN as "�B���l�@�׫���" from sql_taoyuan_water
        where (SERIAL_NUMBER between '521', '529')
        
        union all
        select PLACE as "�a�I", 
        SERIAL_NUMBER as "�Ǹ�", 
        TURBIDITY as "�B��", 
        CHLORINE as "�ۥѦ��ľl��", 
        HYDROGEN as "�B���l�@�׫���" from sql_taoyuan_water
        where CHLORINE in (0.77, 0.76, 0.66)
        and  HYDROGEN!=7.8 and TURBIDITY=0.6
        )
        order by �B��asc, �Ǹ� desc;
        */
        
select cut.id, cut.name, emp.emp_nm
from sql_customer cut
inner join sql_emp emp on cut.emp=emp.emp_id
--where cut.emp=emp.emp_id

select cut.id, cut.name, emp.emp_nm
from sql_customer cut
left join sql_emp emp on cut.emp=emp.emp_id

select cut.id, cut.name, emp.emp_nm
from sql_customer cut
right join sql_emp emp 
on cut.emp=emp.emp_id

select cut.id, cut.name, emp.emp_nm
from sql_customer cut
full join sql_emp emp on cut.emp=emp.emp_id






select aa.* from ( select PLACE as �a�I, 
        SERIAL_NUMBER as �Ǹ�, 
        TURBIDITY as �B��, 
        CHLORINE as �ۥѦ��ľl��, 
        HYDROGEN as �B���l�@�׫��� from sql_taoyuan_water
        where (SERIAL_NUMBER between '521' and '529')
        
        union all
        
        select PLACE as �a�I, 
        SERIAL_NUMBER as �Ǹ�, 
        TURBIDITY as �B��, 
        CHLORINE as �ۥѦ��ľl��, 
        HYDROGEN as �B���l�@�׫��� from sql_taoyuan_water
        where CHLORINE in (0.77, 0.76, 0.66)
        and  HYDROGEN!=7.8 and TURBIDITY=0.6 
        ) aa
left join SQL_TAOYUAN_WATER_SYSTEM bd on aa.�Ǹ�=SQL_TAOYUAN_WATER_SYSTEM.WATER_SYSTEM

        
        select aa.�Ǹ�, aa.�B���l�@�׫���, aa.�B��, aa.�ۥѦ��ľl��, bd.WATER_PURIFICATION_PLANT, bd.WATER_SUPPLY, be.TOWNSHIP, be.PLACE
        
        
        from (select �a�I, �Ǹ�, �B���l�@�׫���, �B��, �ۥѦ��ľl��
        from( select PLACE as �a�I, 
        SERIAL_NUMBER as �Ǹ�, 
        TURBIDITY as �B��, 
        CHLORINE as �ۥѦ��ľl��, 
        HYDROGEN as �B���l�@�׫��� from sql_taoyuan_water
        where (SERIAL_NUMBER between '521' and '529')
        
        union all
        
        select PLACE as �a�I, 
        SERIAL_NUMBER as �Ǹ�, 
        TURBIDITY as �B��, 
        CHLORINE as �ۥѦ��ľl��, 
        HYDROGEN as �B���l�@�׫��� from sql_taoyuan_water
        where CHLORINE in (0.77, 0.76, 0.66)
        and  HYDROGEN!=7.8 and TURBIDITY=0.6
        ) aa
        left join SQL_TAOYUAN_WATER_SYSTEM bd on aa.serial=bd.water_system) 
        
        
        
        

  




