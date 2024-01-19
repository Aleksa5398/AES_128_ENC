----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 09:40:31 AM
-- Design Name: 
-- Module Name: key_gen_CP - Behavioral
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


entity key_gen_CP is
  Port (
         --ulazi control_patha
         clk: in std_logic;
         reset: in std_logic;
         start: in std_logic;

        --Izlazni portovi
        sel: out std_logic_vector(2 downto 0);
        write_en:out std_logic;
        ready: out std_logic   
   );
end key_gen_CP;

architecture Behavioral of key_gen_CP is

type state_type is (idle,read,shift,sboxs,rotword,newkey,write,write_1);
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
process (state_reg,start)
    begin
               write_en<='0';
               ready<='0';
        case state_reg is
            when idle =>
               sel <= "000";
               ready<='1';
           if (start = '0') then 
               state_next<=idle;
             else state_next<=read;
           end if;
             
            when read =>
            sel <= "001";
            state_next <= shift;

            when shift =>
            sel <= "010";
            state_next <= sboxs;
            
            when sboxs =>
            sel <= "011";
            state_next <= rotword;
            
            when rotword =>
            sel <= "100";
            state_next <= newkey;
            
            when newkey =>
            sel <= "101";
            state_next <= write;
            
              when write =>
            sel <= "110";
            write_en<='1';
            state_next <= idle;
            
              when write_1 =>
            sel <= "111";
            write_en<='1';
            state_next <= idle;
             
        end case;
     end process;

end Behavioral;