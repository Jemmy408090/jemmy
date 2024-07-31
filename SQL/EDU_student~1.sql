select aa.*--地點,序號, 濁度,自由有效餘氯 
from ( select PLACE as 地點, 
        SERIAL_NUMBER as 序號, 
        TURBIDITY as 濁度, 
        CHLORINE as 自由有效餘氯, 
        HYDROGEN as 氫離子濃度指數
        from sql_taoyuan_water
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
left join SQL_TAOYUAN_WATER_SYSTEM bd on aa.序號 = bd.serial