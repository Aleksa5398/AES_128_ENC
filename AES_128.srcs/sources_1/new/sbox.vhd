----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2023 09:16:09 PM
-- Design Name: 
-- Module Name: sbox - Behavioral
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

entity sbox is

Port (    
        Sbox_input:in std_logic_vector(7 downto 0);
        Sbox_output:out std_logic_vector(7 downto 0)
      );
end sbox;

architecture Behavioral of sbox is

    signal output:std_logic_vector(7 downto 0);

begin

    Sbox_output<=output;

--sbox lookup tabela
 Sbox_P:process(sbox_input)
  begin
    case sbox_input is
      when "00000000" =>
            output <= x"63";
            
	  when "00000001" =>
	        output <= x"7c";
	        
	  when "00000010" =>
	        output <= x"77";
	        
	  when "00000011" =>
	        output<=x"7b";
	        
      when "00000100" =>
            output<=x"f2";
            
      when "00000101" =>
            output<=x"6b";
            
	  when "00000110" =>
	        output<=x"6f";
	        
	  when "00000111" =>
	        output<=x"c5";
	        
	  when "00001000" =>
	        output<=x"30";
	        
      when "00001001" =>
            output<=x"01";
            
      when "00001010" =>
            output<=x"67";
            
	  when "00001011" =>
	        output<=x"2b";
	  
	  when "00001100" =>
	        output<=x"fe";
	  
      when "00001101" =>
            output<=x"d7";
      
	  when "00001110" =>
	        output<=x"ab";
	  
	  when "00001111" =>
	        output<=x"76";
	  
	  when "00010000" =>
	        output<=x"ca";
	  
      when "00010001" =>
            output<=x"82";
      
	  when "00010010" =>
	        output<=x"c9";
	  
	  when "00010011" =>
	        output<=x"7d";
	        
	  when "00010100" =>
	        output<=x"fa";
	  
	  when "00010101" =>
	        output<=x"59";
	  
	  when "00010110" =>
	        output<=x"47";
	  
	  when "00010111" =>
	        output<=x"f0";
	  
	  when "00011000" =>
	        output<=x"ad";
	  
	  when "00011001" =>
	        output<=x"d4";
	  
	  when "00011010" =>
	        output<=x"a2";
	  
	  when "00011011" =>
	        output<=x"af";
	  
	  when "00011100" =>
	        output<=x"9c";
	  
	  when "00011101" =>
	        output<=x"a4";
	  
	  when "00011110" =>
	        output<=x"72";
	  
	  when "00011111" =>
	        output<=x"c0";
	  
	  when "00100000" =>
	        output<=x"b7";
	  
	  when "00100001" =>
	        output<=x"fd";
	  
	  when "00100010" =>
	        output<=x"93";
	  
	  when "00100011" =>
	        output<=x"26";
	  
	  when "00100100" =>
	        output<=x"36";
	  
	  when "00100101" =>
	        output<=x"3f";
	  
      when "00100110" =>
            output<=x"f7";
      
	  when "00100111" =>
	        output<=x"cc";
	  
	  when "00101000" =>
	        output<=x"34";
	  
	  when "00101001" =>
	        output<=x"a5";
	  
	  when "00101010" =>
	        output<=x"e5";
	  
	  when "00101011" =>
	        output<=x"f1";
	  
	  when "00101100" =>
	        output<=x"71";
	  
	  when "00101101" =>
	        output<=x"d8";
	  
	  when "00101110" =>
	        output<=x"31";
	  
	  when "00101111" =>
	        output<=x"15";
	        
	  when "00110000" =>
	        output<=x"04";
	        
	  when "00110001" =>
	        output<=x"c7";
	  
	  when "00110010" =>
	        output<=x"23";
	  
	  when "00110011" =>
	        output<=x"c3";
	  
	  when "00110100" =>
	        output<=x"18";
	  
	  when "00110101" =>
	        output<=x"96";
	  			
	  when "00110110" =>
	        output<=x"05";
	  
	  when "00110111" =>
	        output<=x"9a";
	  
	  when "00111000" =>
	        output<=x"07";
	  
	  when "00111001" =>
	        output<=x"12";
	  
	  when "00111010" =>
	        output<=x"80";
	  
	  when "00111011" =>
	        output<=x"e2";
	  
	  when "00111100" =>
	        output<=x"eb";
	  
	  when "00111101" =>
	        output<=x"27";
	  
	  when "00111110" =>
			output<=x"b2";
			
	  when "00111111" =>
			output<=x"75";
			
	  when "01000000" =>
			output<=x"09";
			
	  when "01000001" =>
			output<=x"83";
			
	  when "01000010" =>
			output<=x"2c";
			
	  when "01000011" =>
			output<=x"1a";
			
	  when "01000100" =>
		    output<=x"1b";
			
	  when "01000101" =>
			output<=x"6e";
			
      when "01000110" =>
			output<=x"5a";
			
      when "01000111" =>
            output<=x"a0";
            
	  when "01001000" =>
			output<=x"52";
			
	  when "01001001" =>
			output<=x"3b";
			
	  when "01001010" =>
			output<=x"d6";
			
	  when "01001011" =>
			output<=x"b3";
			
	  when "01001100" =>
			output<=x"29";
			
	  when "01001101" =>
			output<=x"e3";
			
	  when "01001110" =>
			output<=x"2f";
			
      when "01001111" =>
		    output<=x"84";
		    
	  when "01010000" =>
			output<=x"53";
			
	  when "01010001" =>
			output<=x"d1";
			
      when "01010010" =>
			output<=x"00";
			
	  when "01010011" =>
			output<=x"ed";
			
	  when "01010100" =>
			output<=x"20";
			
	  when "01010101" =>
			output<=x"fc";
			
	  when "01010110" =>
			output<=x"b1";
			
	  when "01010111" =>
			output<=x"5b";
			
	  when "01011000" =>
			output<=x"6a";
			
	  when "01011001" =>
			output<=x"cb";
			
	  when "01011010" =>
			output<=x"be";
			
	  when "01011011" =>
			output<=x"39";
			
	  when "01011100" =>
			output<=x"4a";
			
	  when "01011101" =>
	        output<=x"4c";
	  
	  when "01011110" =>
			output<=x"58";
			
	  when "01011111" =>
			output<=x"cf";
			
      when "01100000" =>
	       	output<=x"d0";
			
	  when "01100001" =>
			output<=x"ef";
			
	  when "01100010" =>
			output<=x"aa";
			
	  when "01100011" =>
			output<=x"fb";
			
	  when "01100100" =>
			output<=x"43";
			
	  when "01100101" =>
			output<=x"4d";
			
	  when "01100110" =>
			output<=x"33";
			
	  when "01100111" =>
			output<=x"85";
			
   	  when "01101000" =>
			output<=x"45";
			
	  when "01101001" =>
			output<=x"f9";
			
      when "01101010" =>
		    output<=x"02";
		    
	  when "01101011" =>
			output<=x"7f";
			
	  when "01101100" =>
			output<=x"50";
			
	  when "01101101" =>
			output<=x"3c";
			
	  when "01101110" =>
	        output<=x"9f";
			
	  when "01101111" =>
			output<=x"a8";
			
	  when "01110000" =>
			output<=x"51";
			
	  when "01110001" =>
			output<=x"a3";
			
	  when "01110010" =>
			output<=x"40";
			
	  when "01110011" =>
			output<=x"8f";
			
	  when "01110100" =>
			output<=x"92";
			
	  when "01110101" =>
			output<=x"9d";
			
	  when "01110110" =>
			output<=x"38";
			
	  when "01110111" =>
		    output<=x"f5";
		    
	  when "01111000" =>
			output<=x"bc";
			
	  when "01111001" =>
			output<=x"b6";
			
	  when "01111010" =>
			output<=x"da";
			
	  when "01111011" =>
			output<=x"21";
			
	  when "01111100" =>
			output<=x"10";
			
	  when "01111101" =>
			output<=x"ff";
			
	  when "01111110" =>
			output<=x"f3";
			
	  when "01111111" =>
			output<=x"d2";
			
	  when "10000000" =>
			output<=x"cd";
			
	  when "10000001" =>
			output<=x"0c";
			
	  when "10000010" =>
			output<=x"13";
			
	  when "10000011" =>
			output<=x"ec";
			
	  when "10000100" =>
			output<=x"5f";
			
	  when "10000101" =>
			output<=x"97";
			
	  when "10000110" =>
			output<=x"44";
			
	  when "10000111" =>
			output<=x"17";
			
	  when "10001000" =>
			output<=x"c4";
			
	  when "10001001" =>
			output<=x"a7";
			
	  when "10001010" =>
			output<=x"7e";
			
	  when "10001011" =>
	        output<=x"3d";
			
	  when "10001100" =>
			output<=x"64";
			
	  when "10001101" =>
			output<=x"5d";
			
	  when "10001110" =>
			output<=x"19";
			
	  when "10001111" =>
			output<=x"73";
			
	  when "10010000"=>
			output<=x"60";
			
	  when "10010001" =>
			output<=x"81";
			
	  when "10010010" =>
			output<=x"4f";
			
	  when "10010011"=>
			output<=x"dc";
			
	  when "10010100"=>
			output<=x"22";
			
	  when "10010101"=>
			output<=x"2a";
			
	  when "10010110"=>
			output<=x"90";
			
	  when "10010111"=>
			output<=x"88";
			
	  when "10011000"=>
			output<=x"46";
			
	  when "10011001"=>
			output<=x"ee";
			
      when "10011010" =>
			output<=x"b8";
			
	  when "10011011" =>
			output<=x"14";
			
	  when "10011100" =>
			output<=x"de";
			
	  when "10011101" =>
			output<=x"5e";
			
	  when "10011110" =>
			output<=x"0b";
			
	  when "10011111" =>
			output<=x"db";
			
	  when "10100000" =>
			output<=x"e0";
			
	  when "10100001" =>
			output<=x"32";
			
	  when "10100010" =>
			output<=x"3a";
			
	  when "10100011" =>
			output<=x"0a";
			
	  when "10100100" =>
			output<=x"49";
			
      when "10100101" =>
			output<=x"06";
			
	  when "10100110" =>
			output<=x"24";
			
      when "10100111" =>
			output<=x"5c";
			
	  when "10101000" =>
			output<=x"c2";
			
	  when "10101001" =>
			output<=x"d3";
			
	  when "10101010" =>
	        output<=x"ac";
	        
	  when "10101011" =>
			output<=x"62";
			
	  when "10101100" =>
			output<=x"91";
			
	  when "10101101" =>
			output<=x"95";
			
	  when "10101110" =>
			output<=x"e4";
			
	  when "10101111" =>
			output<=x"79";
			
	  when "10110000" =>
			output<=x"e7";
			
	  when "10110001" =>
			output<=x"c8";
			
	  when "10110010" =>
			output<=x"37";
			
	  when "10110011" =>
			output<=x"6d";
			
	  when "10110100" =>
			output<=x"8d";
			
	  when "10110101" =>
			output<=x"d5";
			
	  when "10110110" =>
			output<=x"4e";
			
	  when "10110111" =>
			output<=x"a9";
			
	  when "10111000" =>
			output<=x"6c";
			
	  when "10111001" =>
			output<=x"56";
			
	  when "10111010" =>
			output<=x"f4";
			
	  when "10111011" =>
			output<=x"ea";
			
	  when "10111100" =>
			output<=x"65";
			
	  when "10111101" =>
			output<=x"7a";
			
	  when "10111110" =>
			output<=x"ae";
			
	  when "10111111" =>
			output<=x"08";
			
	  when "11000000" =>
			output<=x"ba";
			
	  when "11000001" =>
			output<=x"78";
			
	  when "11000010" =>
			output<=x"25";
			
	  when "11000011" =>
			output<=x"2e";
			
	  when "11000100" =>
			output<=x"1c";
			
	  when "11000101" =>
			output<=x"a6";
			
	  when "11000110" =>
			output<=x"b4";
			
	  when "11000111" =>
			output<=x"c6";
			
	  when "11001000" =>
			output<=x"e8";
			
	  when "11001001" =>
			output<=x"dd";
			
	  when "11001010" =>
			output<=x"74";
			
	  when "11001011" =>
			output<=x"1f";
			
	  when "11001100" =>
			output<=x"4b";
			
	  when "11001101" =>
	        output<=x"bd";
			
	  when "11001110" =>
			output<=x"8b";
			
	  when "11001111" =>
			output<=x"8a";
			
	  when "11010000" =>
			output<=x"70";
			
	  when "11010001" =>
			output<=x"3e";
			
	  when "11010010" =>
			output<=x"b5";
			
	  when "11010011" =>
			output<=x"66";
			
	  when "11010100" =>
			output<=x"48";
			
	  when "11010101" =>
			output<=x"03";
			
	  when "11010110" =>
			output<=x"f6";
			
	  when "11010111" =>
		    output<=x"0e";
		    
	  when "11011000" =>
			output<=x"61";
			
	  when "11011001" =>
	        output<=x"35";
			
	  when "11011010" =>
	        output<=x"57";
			
	  when "11011011" =>
			output<=x"b9";
			
	  when "11011100" =>
			output<=x"86";
			
	  when "11011101" =>
			output<=x"c1";
			
	  when "11011110" =>
			output<=x"1d";
			
	  when "11011111" =>
			output<=x"9e";
			
	  when "11100000" =>
			output<=x"e1";
			
	  when "11100001" =>
			output<=x"f8";
			
	  when "11100010" =>
			output<=x"98";
			
	  when "11100011" =>
			output<=x"11";
			
	  when "11100100" =>
			output<=x"69";
			
	  when "11100101" =>
			output<=x"d9";
			
	  when "11100110" =>
			output<=x"8e";
			
	  when "11100111" =>
			output<=x"94";
			
	  when "11101000" =>
			output<=x"9b";
			
	  when "11101001" =>
			output<=x"1e";
			
	  when "11101010" =>
			output<=x"87";
			
	  when "11101011" =>
			output<=x"e9";
			
	  when "11101100" =>
			output<=x"ce";
			
	  when "11101101" =>
			output<=x"55";
			
	  when "11101110" =>
			output<=x"28";
			
	  when "11101111" =>
	       	output<=x"df";
			
	  when "11110000" =>
			output<=x"8c";
			
	  when "11110001" =>
			output<=x"a1";
			
	  when "11110010" =>
			output<=x"89";
			
	  when "11110011" =>
			output<=x"0d";
			
	  when "11110100" =>
			output<=x"bf";
			
	  when "11110101" =>
			output<=x"e6";
			
	  when "11110110" =>
			output<=x"42";
			
	  when "11110111" =>
			output<=x"68";
			
	  when "11111000" =>
			output<=x"41";
			
	  when "11111001" =>
			output<=x"99";
			
	  when "11111010" =>
			output<=x"2d";
			
	  when "11111011" =>
			output<=x"0f";
			
	  when "11111100" =>
			output<=x"b0";
			
	  when "11111101" =>
			output<=x"54";
			
	  when "11111110" =>
			output<=x"bb";
			
	  when "11111111" =>
			output<=x"16";
			
	  when others => 
			output<= x"00";
			
      end case;
    end process;         
end Behavioral;
