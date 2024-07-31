select * from sql_emp where emp_id= '00012345';   /*字串都使用單引號*/

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

SELECT ww.serial_number as "序號",
hydrogen as "氫離子濃度指數",
TURBIDITY as "濁度",
chlorine as "自由有效氫氣" from water ww;


SELECT * FROM sql_emp
where dep = '系統開發部' and  emp_nm like '王%'

select * from sql_emp
where emp_nm like '%拉'

select EMP_ID as "身分", EMP_NM, ID, TEL as "電話", DEP from sql_emp
where
    (dep='系統開發部' and emp_nm like'王%')
or
    (dep='開發系統部' and emp_nm like'孫%');
    
    
    
SELECT * FROM cars
    where  min_price between '300' and '600'

select *from cars
   where  min_price in ('300','600')
   or price ='700'
   
SELECT * FROM cars
    where manufacturer like '__W%' /*要記得大小寫的區別*/
    and price in '800'

select * from sql_emp1 where tel is not null
 
練習五

select  SERIAL_NUMBER as "序號", CREATE_DATE, PLACE, WATER_SYSTEM, TURBIDITY as "濁度", CHLORINE as "自由有效餘氯", HYDROGEN as "氫離子濃度指數" from sql_taoyuan_water
    where HYDROGEN in('7.5','8')
    and CHLORINE > '0.6'
    and place = 'T22';

select  SERIAL_NUMBER as "序號", TURBIDITY as "濁度", CHLORINE as "自由有效餘氯", HYDROGEN as "氫離子濃度指數" from sql_taoyuan_water
    where 
    SERIAL_NUMBER between '521' and '529'   /*也可以打成(serial_mummer>520 and serial_nummer<530)*/
     or CHLORINE in('0.76', '0.77', '0.66')
     and TURBIDITY in ('0.6')
     and HYDROGEN not in ('7.8')
   
select distinct manufacturer from cars

select distinct manufacturer, count(*) from cars group by manufacturer

/*練習六*/
select distinct PLACE as "地點", SERIAL_NUMBER as "序號", TURBIDITY as "濁度", CHLORINE as "自由有效餘氯", HYDROGEN as "氫離子濃度指數" from sql_taoyuan_water
     where 
     SERIAL_NUMBER between '521' and '529'   /*也可以打成(serial_mummer>520 and serial_nummer<530)*/
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

/*練習七*/

select PLACE as "地點", SERIAL_NUMBER as "序號", TURBIDITY as "濁度", CHLORINE as "自由有效餘氯", HYDROGEN as "氫離子濃度指數" from sql_taoyuan_water
    where HYDROGEN in('7.5','8') 
    union all
    place =('T22") 
    union all
    CHLORINE > '0.6';
    
    /* select PLACE as "地點", SERIAL_NUMBER as "序號", TURBIDITY as "濁度", CHLORINE as "自由有效餘氯", HYDROGEN as "氫離子濃度指數" from sql_taoyuan_water
    where HYDROGEN in('7.5','8') 
    union 
    select PLACE as "地點", SERIAL_NUMBER as "序號", TURBIDITY as "濁度", CHLORINE as "自由有效餘氯", HYDROGEN as "氫離子濃度指數" from sql_taoyuan_water 
    where place = 'T22' 
    union 
    select PLACE as "地點", SERIAL_NUMBER as "序號", TURBIDITY as "濁度", CHLORINE as "自由有效餘氯", HYDROGEN as "氫離子濃度指數" from sql_taoyuan_water
    where  CHLORINE > '0.6'; */
   
   
   /* 
    select 地點, 序號, 氫離子濃度指數, 濁度, 自由有效餘氯
    from( select PLACE as "地點", 
        SERIAL_NUMBER as "序號", 
        TURBIDITY as "濁度", 
        CHLORINE as "自由有效餘氯", 
        HYDROGEN as "氫離子濃度指數" from sql_taoyuan_water
        where (SERIAL_NUMBER between '521', '529')
        
        union all
        select PLACE as "地點", 
        SERIAL_NUMBER as "序號", 
        TURBIDITY as "濁度", 
        CHLORINE as "自由有效餘氯", 
        HYDROGEN as "氫離子濃度指數" from sql_taoyuan_water
        where CHLORINE in (0.77, 0.76, 0.66)
        and  HYDROGEN!=7.8 and TURBIDITY=0.6
        )
        order by 濁度asc, 序號 desc;
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






select aa.* from ( select PLACE as 地點, 
        SERIAL_NUMBER as 序號, 
        TURBIDITY as 濁度, 
        CHLORINE as 自由有效餘氯, 
        HYDROGEN as 氫離子濃度指數 from sql_taoyuan_water
        where (SERIAL_NUMBER between '521' and '529')
        
        union all
        
        select PLACE as 地點, 
        SERIAL_NUMBER as 序號, 
        TURBIDITY as 濁度, 
        CHLORINE as 自由有效餘氯, 
        HYDROGEN as 氫離子濃度指數 from sql_taoyuan_water
        where CHLORINE in (0.77, 0.76, 0.66)
        and  HYDROGEN!=7.8 and TURBIDITY=0.6 
        ) aa
left join SQL_TAOYUAN_WATER_SYSTEM bd on aa.序號=SQL_TAOYUAN_WATER_SYSTEM.WATER_SYSTEM

        
        select aa.序號, aa.氫離子濃度指數, aa.濁度, aa.自由有效餘氯, bd.WATER_PURIFICATION_PLANT, bd.WATER_SUPPLY, be.TOWNSHIP, be.PLACE
        
        
        from (select 地點, 序號, 氫離子濃度指數, 濁度, 自由有效餘氯
        from( select PLACE as 地點, 
        SERIAL_NUMBER as 序號, 
        TURBIDITY as 濁度, 
        CHLORINE as 自由有效餘氯, 
        HYDROGEN as 氫離子濃度指數 from sql_taoyuan_water
        where (SERIAL_NUMBER between '521' and '529')
        
        union all
        
        select PLACE as 地點, 
        SERIAL_NUMBER as 序號, 
        TURBIDITY as 濁度, 
        CHLORINE as 自由有效餘氯, 
        HYDROGEN as 氫離子濃度指數 from sql_taoyuan_water
        where CHLORINE in (0.77, 0.76, 0.66)
        and  HYDROGEN!=7.8 and TURBIDITY=0.6
        ) aa
        left join SQL_TAOYUAN_WATER_SYSTEM bd on aa.serial=bd.water_system) 
        
        
        
        

  




