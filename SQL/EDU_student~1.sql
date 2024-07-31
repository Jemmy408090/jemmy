select aa.*--�a�I,�Ǹ�, �B��,�ۥѦ��ľl�� 
from ( select PLACE as �a�I, 
        SERIAL_NUMBER as �Ǹ�, 
        TURBIDITY as �B��, 
        CHLORINE as �ۥѦ��ľl��, 
        HYDROGEN as �B���l�@�׫���
        from sql_taoyuan_water
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
left join SQL_TAOYUAN_WATER_SYSTEM bd on aa.�Ǹ� = bd.serial