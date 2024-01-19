----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 09:20:26 AM
-- Design Name: 
-- Module Name: mixcolumn_CP - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mixcolumn_CP is
 Port (
        --ulazi control_patha
        clk: in std_logic;
        reset: in std_logic;
        start: in std_logic;
        ready_mull:in std_logic;
               
        --Izlazni portovi
        sel: out std_logic_vector(2 downto 0);
        column_wr:out std_logic;
        start_mull:out std_logic; 
        ready: out std_logic   
  );
end mixcolumn_CP;

architecture Behavioral of mixcolumn_CP is
type state_type is (idle,read,mul,write,start_mul,wait_mul,write_prep);
    signal state_reg, state_next: state_type;

begin

-- registar stanja
  process (clk, reset) is
    begin
        if (reset = '1') then
            state_reg <= idle;
        elsif (clk'event and clk = '1') then
            state_reg <= state_next;
        end if;
   end process;

-- logika za generisanje narednog stanja
process (state_reg,start,ready_mull)
    begin
               column_wr<='0';
               start_mull<='0';   
               ready<='0';
        case state_reg is
            when idle =>
               sel <= "000";
               column_wr<='0';
               start_mull<='0';   
               ready<='1';
           if (start = '0') then 
               state_next<=idle;
             else state_next<=read;
           end if;
             
            when read =>
            sel <= "001";
            state_next <= start_mul;
            
            when start_mul =>         
            sel <= "010";
            start_mull<='1';       
            state_next <= wait_mul;
            
            when wait_mul =>         
            sel <= "011";
           if(ready_mull='1') then    
            state_next <=mul;
            else state_next<=wait_mul;
            end if;
            
            when mul =>
            sel <= "100";
            state_next <= write_prep;
       
            
            when write_prep =>
            sel <= "101";
            state_next <= write;
            
              when write =>
            sel <= "110";
            column_wr<='1';
            state_next <= idle;
                
        end case;
     end process;


end Behavioral;