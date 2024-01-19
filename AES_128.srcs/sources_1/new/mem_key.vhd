----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 09:47:01 AM
-- Design Name: 
-- Module Name: mem_key - Behavioral
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

entity mem_key is
  Port (
         clk: in std_logic;
         --adresa sa koje se cita/upisuje
         address: in std_logic_vector(3 downto 0);
          key_start: in std_logic_vector(127 downto 0);
          start_wr: in std_logic;
         --izlazni podaci
         rdata: out std_logic_vector(7 downto 0);
         key_out:out std_logic_vector(127 downto 0);
         --podaci koje upisjemo u memoriju
         key_in:in std_logic_vector(127 downto 0);
          --dozvola upisa
         write: in std_logic 
         );
end mem_key;

architecture Behavioral of mem_key is

type ram_t is array ( 0 to 15) 
                    of std_logic_vector(7 downto 0);
    signal ram_s:ram_t:=(
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00"
   );
signal a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p:std_logic_vector(7 downto 0);
begin
  write_ram: process(clk,write,key_in,key_start) is 
    begin
       if(clk'event and clk='1') then
          if(start_wr='1')then
          ram_s(0)<=key_start(127 downto 120);
          ram_s(1)<=key_start(119 downto 112);
          ram_s(2)<=key_start(111 downto 104);
          ram_s(3)<=key_start(103 downto 96);
          ram_s(4)<=key_start(95 downto 88);
          ram_s(5)<=key_start(87 downto 80);
          ram_s(6)<=key_start(79 downto 72);
          ram_s(7)<=key_start(71 downto 64);
          ram_s(8)<=key_start(63 downto 56);
          ram_s(9)<=key_start(55 downto 48);
          ram_s(10)<=key_start(47 downto 40);
          ram_s(11)<=key_start(39 downto 32);
          ram_s(12)<=key_start(31 downto 24);
          ram_s(13)<=key_start(23 downto 16);
          ram_s(14)<=key_start(15 downto 8);
          ram_s(15)<=key_start(7 downto 0);
        end if;
          if(write='1')then
          ram_s(0)<=key_in(127 downto 120);
          ram_s(1)<=key_in(119 downto 112);
          ram_s(2)<=key_in(111 downto 104);
          ram_s(3)<=key_in(103 downto 96);
          ram_s(4)<=key_in(95 downto 88);
          ram_s(5)<=key_in(87 downto 80);
          ram_s(6)<=key_in(79 downto 72);
          ram_s(7)<=key_in(71 downto 64);
          ram_s(8)<=key_in(63 downto 56);
          ram_s(9)<=key_in(55 downto 48);
          ram_s(10)<=key_in(47 downto 40);
          ram_s(11)<=key_in(39 downto 32);
          ram_s(12)<=key_in(31 downto 24);
          ram_s(13)<=key_in(23 downto 16);
          ram_s(14)<=key_in(15 downto 8);
          ram_s(15)<=key_in(7 downto 0);
        end if;
      end if;
  end process;
  
      rdata<=ram_s(to_integer(unsigned(address)));
      a<=ram_s(0);
      b<= ram_s(1);
      c<= ram_s(2);
      d<= ram_s(3);
      e<= ram_s(4);
      f<= ram_s(5);
      g<= ram_s(6);
      h<= ram_s(7);
      i<= ram_s(8);
      j<= ram_s(9);
      k<= ram_s(10);
      l<= ram_s(11);
      m<= ram_s(12);
      n<= ram_s(13);
      o<= ram_s(14);
      p<= ram_s(15);
     key_out<= a & b & c & d & e & f & g & h & i & j & k & l & m & n & o & p;
     
end Behavioral;