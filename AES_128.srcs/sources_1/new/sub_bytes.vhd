----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2023 09:16:09 PM
-- Design Name: 
-- Module Name: sub_bytes - Behavioral
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

entity sub_bytes is
Port (
      clk: in std_logic;
      reset: in std_logic;
      
      byte: in std_logic_vector(7 downto 0);
      start: in std_logic;
      
      subbed_byt: out std_logic_vector(7 downto 0);
      byte_addr: out std_logic_vector(3 downto 0);
      byte_wr: out std_logic;
      ready: out std_logic
 );
end sub_bytes;

architecture Behavioral of sub_bytes is

signal sel_s:std_logic_vector(1 downto 0);
signal i_s:integer;

--komponenta sub_bytes_DP
component sub_bytes_DP
Port( 
      clk: in std_logic;
      state_data:in std_logic_vector(7 downto 0);
      sel:in std_logic_vector(1 downto 0);
      i:out integer;
      temp:out std_logic_vector(7 downto 0)
    );
end component sub_bytes_DP;

--komponenta sub_bytes_CP
component sub_bytes_CP
Port(
         clk: in std_logic;
         reset: in std_logic;
         start: in std_logic;
        i:in integer ;
        state_addr: out std_logic_vector(3 downto 0);
        sel: out std_logic_vector(1 downto 0);
        temp_wr:out std_logic;
        ready: out std_logic  
    ); 
end component sub_bytes_CP;

begin

--mapiranje sub_bytes_DP
sub_bytes_DP_mapping: sub_bytes_DP
   port map(clk=>clk,
            state_data=>byte,
            sel=>sel_s,
            i=>i_s,
            temp=>subbed_byt
            );

--mapiranje sub_bytes_CP
sub_bytes_CP_mapping: sub_bytes_CP
   port map(clk=>clk,
            reset=>reset,
            start=>start,
            sel=>sel_s,
            i=>i_s,
            temp_wr=>byte_wr,
            state_addr=>byte_addr,
            ready=>ready
            );

end Behavioral;