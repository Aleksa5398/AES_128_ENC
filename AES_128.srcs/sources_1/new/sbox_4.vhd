----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 09:36:13 AM
-- Design Name: 
-- Module Name: sbox_4 - Behavioral
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

entity sbox_4 is

 Port ( sbox_4_input: in std_logic_vector(31 downto 0);
        sbox_4_output: out std_logic_vector(31 downto 0)
 );
end sbox_4;

architecture Behavioral of sbox_4 is

--Komponenta sbox
component sbox
Port( sbox_input:in std_logic_vector(7 downto 0);
      sbox_output:out std_logic_vector(7 downto 0)
    );
end component sbox;
    
begin

cetiri: for i in 3 downto 0 generate

mapiranje_Sbox_a: sbox
  Port map(
            sbox_input => sbox_4_input (8*i+7 downto 8*i), 
            sbox_output => sbox_4_output (8*i+7 downto 8*i)
            );
end generate cetiri;

end Behavioral;
