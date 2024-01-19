----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 09:41:56 AM
-- Design Name: 
-- Module Name: key_gen - Behavioral
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

entity key_gen is
 Port ( 
      clk: in std_logic;
      reset: in std_logic;
      round_count:in integer;
      
      key_in: in std_logic_vector(127 downto 0);
      start: in std_logic;
      
      key_out: out std_logic_vector(127 downto 0);
      key_wr: out std_logic;
      ready: out std_logic
 );
end key_gen;

architecture Behavioral of key_gen is
--SIGNALI
signal sel_s:std_logic_vector(2 downto 0);
signal key_wr_s:std_logic;
component key_gen_DP
Port( 
        key_input: in std_logic_vector(127 downto 0);
        round_count: in integer;
        key_output: out std_logic_vector(127 downto 0);
        clk: in std_logic;
        reset: in std_logic;
        sel: in std_logic_vector(2 downto 0)
    );
end component key_gen_DP;

component key_gen_CP
Port(
          clk: in std_logic;
         reset: in std_logic;
         start: in std_logic;
        --Izlazni portovi
        sel: out std_logic_vector(2 downto 0);
        write_en:out std_logic;
        ready: out std_logic 
    ); 
end component key_gen_CP;

begin

--mapiranje key_gen_DP
key_gen_DP_mapping: key_gen_DP
   port map(clk=>clk,
            key_input=>key_in,
            round_count=>round_count,
            key_output=>key_out,
            sel=>sel_s,
            reset=>reset
            );

--mapiranje key_gen_CP
key_gen_CP_mapping: key_gen_CP
   port map(clk=>clk,
            reset=>reset,
            start=>start,
            sel=>sel_s,
            write_en=>key_wr_s,
            ready=>ready
            );
key_wr<=key_wr_s;

end Behavioral;