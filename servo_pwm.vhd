library IEEE;
use IEEE.STD_LOGIC_1164.All;

entity servo_pwm is
	Port(clk					:in STD_LOGIC;				-- 50 Mhz Clock
		  reset				:in STD_LOGIC;				-- Dip SW0
		  clockwise			:in STD_LOGIC;				-- SW0 
		  midpoint			:in std_LOGIC;				-- SW1  
		  counterclockwise:in STD_LOGIC;				-- SW2
		  pwm					:out STD_LOGIC);			-- GPIO_033 Pin B12
	end servo_pwm;
	
	architecture Behavioral of servo_pwm is
		constant period:integer:=1000000;
		signal counter,counter_next:integer:=0;
		signal pwm_reg,pwm_next:STD_LOGIC;
		signal duty_cycle,duty_cycle_next:integer:=0;
		signal tick:std_logic;
	begin
	--register
	   process(clk,reset)
		   begin
			   if reset='1' then
				   pwm_reg<='0';
					counter<=0;
					duty_cycle<=0;
					elsif clk='1' and clk'event then
				   pwm_reg<=pwm_next;
					counter<=counter_next;
				   duty_cycle<=duty_cycle_next;
				end if;
		end process;
		
		counter_next<=0 when counter=period else
		                counter+1;
		tick<='1' when counter=0 else
		      '0';
				
	--Changing Duty Cycle
	  process(clockwise, midpoint, counterclockwise,tick,duty_cycle)
	     begin
		     -- duty_cycle<=75000;
			  if tick='1' then
			     if clockwise='1' then
				     duty_cycle_next<=50000;
				  elsif midpoint='1' then
				     duty_cycle_next<=75000;
				  elsif counterclockwise='1' then
						duty_cycle_next<=100000;
				end if;
			end if;
		end process;
	--Buffer
	   pwm<=pwm_reg;
		pwm_next<='1' when counter<duty_cycle else
		          '0';
end Behavioral;
					