----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 09:20:26 AM
-- Design Name: 
-- Module Name: mixcolumn - Behavioral
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

entity mixcolumn is
 Port (
      clk: in std_logic;
      reset: in std_logic;
      
      start: in std_logic;
      col0: in std_logic_vector(31 downto 0);
      col1: in std_logic_vector(31 downto 0);
      col2: in std_logic_vector(31 downto 0);
      col3: in std_logic_vector(31 downto 0);
      
      mixed: out std_logic_vector(127 downto 0);
      column_wr: out std_logic;
      ready: out std_logic
  );
end mixcolumn;

architecture Behavioral of mixcolumn is
--SIGNALI
signal sel_s:std_logic_vector(2 downto 0);
signal s1:std_logic_vector(7 downto 0);
signal ready_mull_s:std_logic;
signal start_mull_s:std_logic:='0';

--komponenta mixcolumn_DP
component mixcolumn_DP
Port( 
            clk: in std_logic;
            col0:in std_logic_vector(31 downto 0);
            col1:in std_logic_vector(31 downto 0);
            col2:in std_logic_vector(31 downto 0);
            col3:in std_logic_vector(31 downto 0);
            sel:in std_logic_vector(2 downto 0);
            matrica:out std_logic_vector(127 downto 0);
            start_mull:in std_logic;
            ready_mull:out std_logic
    );
end component mixcolumn_DP;

--komponenta mixcolumn_CP
component mixcolumn_CP
Port (
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
end component mixcolumn_CP;

begin
--mapiranje mixcolumn_DP
mixcolumn_DP_mapping: mixcolumn_DP
   port map(clk=>clk,
            col0=>col0,
            col1=>col1,
            col2=>col2,
            col3=>col3,
            matrica=>mixed,
            sel=>sel_s,
            start_mull=>start_mull_s,
            ready_mull=>ready_mull_s
            );
            
--mapiranje mixcolumn_CP
mixcolumn_CP_mapping: mixcolumn_CP
   port map(clk=>clk,
            reset=>reset,
            start=>start,
            ready_mull=>ready_mull_s,
            start_mull=>start_mull_s,
            sel=>sel_s,
            column_wr=>column_wr,
            ready=>ready
            );

end Behavioral;

