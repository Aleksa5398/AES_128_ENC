----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2023 09:13:54 PM
-- Design Name: 
-- Module Name: sub_bytes_CP - Behavioral
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

entity sub_bytes_CP is
 Port (
         --ulazi control_patha
         clk: in std_logic;
         reset: in std_logic;
         start: in std_logic;

        --ulaz iz datapatha
        i:in integer ;
        
        --Izlazni portovi
        --temp: out std_logic_vector(7 downto 0);
        state_addr: out std_logic_vector(3 downto 0);
        sel: out std_logic_vector(1 downto 0);
        temp_wr:out std_logic;
        ready: out std_logic    
  );
end sub_bytes_CP;

architecture Behavioral of sub_bytes_CP is

    type state_type is (idle,mem,reg,wd);
    signal state_reg, state_next: state_type;
    signal state_addr_reg, state_addr_next:std_logic_vector (3 downto 0);
    
begin
-- registar stanja
state_addr<=state_addr_reg;
  process (clk, reset) is
    begin
        if (reset = '1') then
            state_reg <= idle;
        elsif (clk'event and clk = '1') then
            state_reg <= state_next;
            state_addr_reg<=state_addr_next;
        end if;
   end process;

-- logika za generisanje narednog stanja
process (state_reg,start,i)
    begin
        case state_reg is
            when idle =>
               sel <= "00";
               temp_wr<='0';
               ready<='1';
               state_addr_next<=state_addr_reg;
           if (start = '0') then 
               state_next<=idle;
             else state_next<=mem;
           end if;
             
            when mem =>
            sel <= "01";
            ready<='0';
            temp_wr<='0';--jer iz wd stanja moze preci u mem
            state_addr_next<=std_logic_vector(to_unsigned(i,4));
            state_next <= reg;

            when reg =>
            sel <= "10";
            ready<='0';
            temp_wr<='0';
            state_addr_next<=state_addr_reg;
            state_next <= wd;
            
            when wd =>
            sel <= "11";
            ready<='0';
            temp_wr<='1';
            state_addr_next<=state_addr_reg;
            if(i=16)then
            state_next <= idle;
            else state_next <= mem;
          end if;
        end case;
     end process;
            
            
end Behavioral;