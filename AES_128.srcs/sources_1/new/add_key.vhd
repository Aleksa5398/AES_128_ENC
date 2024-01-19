----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 09:05:29 AM
-- Design Name: 
-- Module Name: add_key - Behavioral
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

entity add_key is
 Port ( 
      clk: in std_logic;
      reset: in std_logic;
      
      state_data: in std_logic_vector(7 downto 0);
      key_data: in std_logic_vector(7 downto 0);
      start: in std_logic;
      
      byte_out: out std_logic_vector(7 downto 0);
      text_wr: out std_logic;
      state_addr: out std_logic_vector(3 downto 0);
      key_addr: out std_logic_vector(3 downto 0);
      ready: out std_logic
      );
end add_key;

architecture Behavioral of add_key is

--SIGNALI
signal sel_s:std_logic_vector(1 downto 0);
signal i_s:integer;

--komponenta add_key_DP
component add_key_DP
Port( 
      clk: in std_logic;
      state_data:in std_logic_vector(7 downto 0);
      key_data:in std_logic_vector(7 downto 0);
      sel:in std_logic_vector(1 downto 0);
      i:out integer;
      temp:out std_logic_vector(7 downto 0)
    );
end component add_key_DP;

--komponenta add_key_CP
component add_key_CP
Port(
        clk: in std_logic;
        reset: in std_logic;
        start: in std_logic;
        i:in integer ;
        state_addr: out std_logic_vector(3 downto 0);
        key_addr: out std_logic_vector(3 downto 0);
        sel: out std_logic_vector(1 downto 0);
        temp_wr:out std_logic;
        ready: out std_logic  
    ); 
end component add_key_CP;

begin

--mapiranje add_key_DP
add_key_DP_mapping: add_key_DP
   port map(clk=>clk,
            state_data=>state_data,
            key_data=>key_data,
            sel=>sel_s,
            i=>i_s,
            temp=>byte_out
            );

--mapiranje add_key_CP
add_key_CP_mapping: add_key_CP
   port map(clk=>clk,
            reset=>reset,
            start=>start,
            sel=>sel_s,
            i=>i_s,
            temp_wr=>text_wr,
            state_addr=>state_addr,
            key_addr=>key_addr,
            ready=>ready
            );

end Behavioral;