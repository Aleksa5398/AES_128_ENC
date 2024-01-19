----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 09:20:26 AM
-- Design Name: 
-- Module Name: mull - Behavioral
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

entity mull is
  Port (a: in std_logic_vector(7 downto 0);
        b: in std_logic_vector(7 downto 0);
        clk: in std_logic;
        p: out std_logic_vector(7 downto 0);
        start: in std_logic;
        ready:out std_logic
        );
end mull;

architecture Behavioral of mull is
signal a_reg,a_next,b_reg,b_next,p_next:std_logic_vector(7 downto 0);
signal p_reg:std_logic_vector(7 downto 0):=x"00";
    signal sel_next:std_logic_vector(2 downto 0) ;
     signal sel_reg:std_logic_vector(2 downto 0):="000"; 
begin

process(clk)
 begin
   if(clk'event and clk='1') then
        a_reg<=a_next;
        b_reg<=b_next;
        p_reg<=p_next;
        sel_reg <= sel_next;
      end if;
   end process;

 process(sel_reg,start)
begin
    ready<='0';
   case sel_reg is
        when "000" =>--idle
               ready<='1';
           if (start = '0') then 
               sel_next<="000";
             else sel_next<="111";
           end if;
     
        when "001" =>--zadnji bit b
                --ready<='0';
                 if(b_reg(0) = '1') then 
                sel_next <="010";
                 elsif (a_reg(7) = '1') then
                sel_next<="011";
                 else 
                sel_next<="100";
                end if;
         
         when "010" =>      
              if (a_reg(7) = '1') then
               sel_next<="011";
                else 
               sel_next<="100";
               end if;
     
         when "011" => 
             sel_next<="101";
     
     
         when "100" => 
                sel_next<="101";

         when "101" =>
                sel_next<="110";
                
         when "110" =>
            if(b_reg=x"00") then
               sel_next<="000";
             else 
                sel_next<="001";
             end if;
             
          when "111" =>
               -- ready<='0';
                sel_next <="001";
           when others =>
             sel_next<="000";
             
       end case;
   end process;
 
 process(sel_reg)
begin
   case sel_reg is
   
      when "000" =>
      
             p_next<=p_reg;
             a_next<=a_reg;
             b_next<=b_reg;
             
      when "001" =>
             p_next<=p_reg;
             a_next<=a_reg;
             b_next<=b_reg;
      when "010" =>
            p_next<=p_reg xor a_reg;
             a_next<=a_reg;
             b_next<=b_reg;
             
      when "011" =>
            a_next <= (a_reg(6 downto 0) & '0') xor x"1b";
             p_next<=p_reg;
             b_next<=b_reg;
             
      when "100" =>
            a_next <= (a_reg(6 downto 0) & '0') xor x"00";
            p_next<=p_reg;
             b_next<=b_reg;
             
      when "101" =>
            b_next<= '0'  &  b_reg(7 downto 1) ;
            p_next<=p_reg;
            a_next<=a_reg;
            
      when "110" =>
             p_next<=p_reg;
             a_next<=a_reg;
             b_next<=b_reg;
       
       when "111"  =>
             a_next<=a;
             b_next<=b;
             p_next<=x"00";
             
      when others =>
            p_next<=p_reg;
      end case;
       end process;
     p<=p_reg;
end Behavioral;
