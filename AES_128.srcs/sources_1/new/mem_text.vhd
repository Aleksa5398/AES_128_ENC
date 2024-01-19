----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 09:47:01 AM
-- Design Name: 
-- Module Name: mem_text - Behavioral
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

entity mem_text is
  Port (
        clk: in std_logic;
         --adresa sa koje se cita/upisuje
         address_add: in std_logic_vector(3 downto 0);
         address_sub: in std_logic_vector(3 downto 0);
         --izlazni podaci
         rbyte_add: out std_logic_vector(7 downto 0);
         rbyte_sub: out std_logic_vector(7 downto 0);
         rcolumn0: out std_logic_vector(31 downto 0);
         rcolumn1: out std_logic_vector(31 downto 0);
         rcolumn2: out std_logic_vector(31 downto 0);
         rcolumn3: out std_logic_vector(31 downto 0);
         
         --podaci koje upisjemo u memoriju
         wbyte_add: in std_logic_vector(7 downto 0);
         wbyte_sub: in std_logic_vector(7 downto 0);
      --   wcolumn0: in std_logic_vector(31 downto 0);
      --   wcolumn1: in std_logic_vector(31 downto 0);
     --    wcolumn2: in std_logic_vector(31 downto 0);
      --   wcolumn3: in std_logic_vector(31 downto 0);
         
         --podaci
         mix_in:in std_logic_vector(127 downto 0);
         shift_in:in std_logic_vector(127 downto 0);
         state_out:out std_logic_vector(127 downto 0);
         
         state_start: in std_logic_vector(127 downto 0);
          start_wr: in std_logic;
         --dozvola upisa
        -- w_state_en: in std_logic;
         w_add_en: in std_logic;
         w_sub_en: in std_logic;
         w_shift_en: in std_logic;
         w_mix_en: in std_logic
       --  w_column_en: in std_logic
       );
end mem_text;

architecture Behavioral of mem_text is
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
  write_ram: process(clk) is 
    begin
      if(clk'event and clk='1') then
        if(w_add_en='1' )then
         ram_s(to_integer(unsigned(address_add)))<=wbyte_add;
             end if;
        if(w_sub_en='1') then 
         ram_s(to_integer(unsigned(address_sub)))<=wbyte_sub;
          end if;
          if(start_wr='1') then
          ram_s(0)<=state_start(127 downto 120);
          ram_s(1)<=state_start(119 downto 112);
          ram_s(2)<=state_start(111 downto 104);
          ram_s(3)<=state_start(103 downto 96);
          ram_s(4)<=state_start(95 downto 88);
          ram_s(5)<=state_start(87 downto 80);
          ram_s(6)<=state_start(79 downto 72);
          ram_s(7)<=state_start(71 downto 64);
          ram_s(8)<=state_start(63 downto 56);
          ram_s(9)<=state_start(55 downto 48);
          ram_s(10)<=state_start(47 downto 40);
          ram_s(11)<=state_start(39 downto 32);
          ram_s(12)<=state_start(31 downto 24);
          ram_s(13)<=state_start(23 downto 16);
          ram_s(14)<=state_start(15 downto 8);
          ram_s(15)<=state_start(7 downto 0);
          end if;
        if(w_mix_en='1') then
          ram_s(0)<=mix_in(127 downto 120);
          ram_s(1)<=mix_in(119 downto 112);
          ram_s(2)<=mix_in(111 downto 104);
          ram_s(3)<=mix_in(103 downto 96);
          ram_s(4)<=mix_in(95 downto 88);
          ram_s(5)<=mix_in(87 downto 80);
          ram_s(6)<=mix_in(79 downto 72);
          ram_s(7)<=mix_in(71 downto 64);
          ram_s(8)<=mix_in(63 downto 56);
          ram_s(9)<=mix_in(55 downto 48);
          ram_s(10)<=mix_in(47 downto 40);
          ram_s(11)<=mix_in(39 downto 32);
          ram_s(12)<=mix_in(31 downto 24);
          ram_s(13)<=mix_in(23 downto 16);
          ram_s(14)<=mix_in(15 downto 8);
          ram_s(15)<=mix_in(7 downto 0);
          end if;
          if(w_shift_en='1') then
          ram_s(0)<=shift_in(127 downto 120);
          ram_s(1)<=shift_in(119 downto 112);
          ram_s(2)<=shift_in(111 downto 104);
          ram_s(3)<=shift_in(103 downto 96);
          ram_s(4)<=shift_in(95 downto 88);
          ram_s(5)<=shift_in(87 downto 80);
          ram_s(6)<=shift_in(79 downto 72);
          ram_s(7)<=shift_in(71 downto 64);
          ram_s(8)<=shift_in(63 downto 56);
          ram_s(9)<=shift_in(55 downto 48);
          ram_s(10)<=shift_in(47 downto 40);
          ram_s(11)<=shift_in(39 downto 32);
          ram_s(12)<=shift_in(31 downto 24);
          ram_s(13)<=shift_in(23 downto 16);
          ram_s(14)<=shift_in(15 downto 8);
          ram_s(15)<=shift_in(7 downto 0);
          end if;
      end if;

  end process;
  
      rbyte_add<=ram_s(to_integer(unsigned(address_add)));
      rbyte_sub<=ram_s(to_integer(unsigned(address_sub)));
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
      
      state_out<= a & b & c & d & e & f & g & h & i & j & k & l & m & n & o & p;
      
     rcolumn0<=a & b & c & d;
     rcolumn1<=e & f & g & h;
     rcolumn2<=i & j & k & l;
     rcolumn3<=m & n & o & p;
end Behavioral;
