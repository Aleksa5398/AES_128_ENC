----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2023 11:33:07 AM
-- Design Name: 
-- Module Name: AES_TB - Behavioral
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

entity AES_TB is
--  Port ( );
end AES_TB;

architecture Behavioral of AES_TB is

signal clk_s:std_logic:='0';
signal reset_s:std_logic:='0';
signal start_s:std_logic:='0';
signal key_in_s:std_logic_vector(127 downto 0):=x"000102030405060708090A0B0C0D0E0F";
signal text_in_s:std_logic_vector(127 downto 0):=x"00112233445566778899AABBCCDDEEFF";
signal text_out_s:std_logic_vector(127 downto 0);
signal ready_s:std_logic;
component round_algorithm is
 port(
        clk: in std_logic;
        reset: in std_logic;
        start: in std_logic;
        
        key_in: in std_logic_vector(127 downto 0);
        text_in: in std_logic_vector(127 downto 0);
        text_out: out std_logic_vector(127 downto 0);
        ready: out std_logic
      );
 end component round_algorithm;

begin

round_algorithm_mapping: round_algorithm
port map(
        clk=>clk_s,
        reset=>reset_s,
        start=>start_s,
        text_in=>text_in_s,
        key_in=>key_in_s,
        text_out=>text_out_s,
        ready=>ready_s
        );

clocking: block
 begin
  clk_s<= not clk_s after 5 ns;
  end block;
start_s<= '1' after 10 ns, '0' after 50 ns;




end Behavioral;
