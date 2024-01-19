----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 09:06:26 AM
-- Design Name: 
-- Module Name: add_key_DP - Behavioral
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

entity add_key_DP is
  Port (   
      --ulazi
      clk: in std_logic;
      state_data:in std_logic_vector(7 downto 0);
      key_data:in std_logic_vector(7 downto 0);
      sel:in std_logic_vector(1 downto 0);
      
        --izlazi
        i:out integer;
        temp:out std_logic_vector(7 downto 0) );
end add_key_DP;

architecture Behavioral of add_key_DP is

signal temp_next:std_logic_vector(7 downto 0);
signal i_next,i_reg:integer;
signal temp_reg:std_logic_vector(7 downto 0);

begin

process(clk)
 begin
   if(clk'event and clk='1') then
        temp_reg<=temp_next;
        i_reg<=i_next;
     end if;
   end process;

process(sel,i_reg,temp_reg,state_data,key_data)
 begin
   case sel is
      when "00" =>
     temp_next<="00000000";
     i_next<=0;
      
      when "10" =>
     temp_next<=state_data xor key_data;
     i_next<=i_reg+1;
     
      when others =>
      temp_next<=temp_reg;
      i_next<=i_reg;
    end case;
 end process;
temp<=temp_reg;
i<=i_reg;

end Behavioral;

