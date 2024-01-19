----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 09:38:09 AM
-- Design Name: 
-- Module Name: key_gen_DP - Behavioral
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

entity key_gen_DP is
  Port (key_input: in std_logic_vector(127 downto 0);
        round_count: in integer;
        key_output: out std_logic_vector(127 downto 0);
        clk: in std_logic;
        reset: in std_logic;
        sel: in std_logic_vector(2 downto 0)
);
end key_gen_DP;

architecture Behavioral of key_gen_DP is

signal key_reg, key_next : std_logic_vector(127 downto 0);
signal sbox_s : std_logic_vector(31 downto 0);
signal round_constant : std_logic_vector(7 downto 0):=x"01";--menja se za svaku iteraciju kljuca
signal g_func: std_logic_vector (31 downto 0);
signal left_shifted: std_logic_vector (31 downto 0);

component sbox_4
Port( sbox_4_input: in std_logic_vector(31 downto 0);
      sbox_4_output: out std_logic_vector(31 downto 0)
    );
end component;
    

begin

--maprianje sbox_4 
 sboxsub: sbox_4
    port map(
            sbox_4_input => left_shifted,
            sbox_4_output => sbox_s
            );
            
key_output<=key_reg;

process(clk)
    begin
      if (clk'event and clk='1') then
           key_reg <= key_next;
        end if;
 end process;
 
 process(clk)
    begin
      if(reset='1') then
        round_constant <= x"01";
      elsif(reset = '0') then 
         if(clk'event and clk='1') then
            --if(count>0) then
            if(round_count = 1) then
              round_constant <= x"01";
            elsif (round_count = 2) then
              round_constant <= x"02";
            elsif (round_count = 3) then
              round_constant <= x"04";
            elsif (round_count = 4) then
              round_constant <= x"08";
            elsif (round_count = 5) then
              round_constant <= x"10";
            elsif (round_count = 6) then
              round_constant <= x"20";
            elsif (round_count = 7) then
              round_constant <= x"40";
            elsif (round_count = 8) then
              round_constant <= x"80";
            elsif (round_count = 9) then
              round_constant <= x"1B";
            elsif (round_count = 10) then
              round_constant <= x"36";
            else round_constant <= x"01";
        end if;
     end if;
   end if;
end process;

process(sel,key_input,key_reg)
 begin
 
   case sel is
     when "000" =>
     key_next <= key_input;
     
     
     when "001" =>
     key_next<=key_reg;
     
     when "010" =>
     left_shifted <= key_reg(23 downto 0) & key_reg(31 downto 24);
     key_next<=key_reg;
     
     when "011" =>
     g_func <= (Sbox_s(31 downto 24) xor round_constant) & sbox_s(23 downto 0);
     key_next<=key_reg;

     when "100" =>
      key_next(31 downto 0) <= key_reg(31 downto 0) xor key_reg(63 downto 32) xor key_reg(95 downto 64) xor key_reg(127 downto 96) xor g_func;
      key_next(63 downto 32) <= key_reg(63 downto 32) xor key_reg(95 downto 64) xor key_reg(127 downto 96) xor g_func;
      key_next(95 downto 64) <= key_reg(95 downto 64) xor key_reg(127 downto 96) xor g_func;
      key_next(127 downto 96) <= key_reg(127 downto 96) xor g_func;

     when others =>
     key_next<=key_reg;
      
    end case;
 end process;

end Behavioral;
