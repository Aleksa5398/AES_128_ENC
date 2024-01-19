----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 09:20:26 AM
-- Design Name: 
-- Module Name: mixcolumn_DP - Behavioral
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

entity mixcolumn_DP is 
      Port ( 
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
end mixcolumn_DP;

architecture Behavioral of mixcolumn_DP is
signal col0_reg,col1_reg,col2_reg,col3_reg:std_logic_vector(31 downto 0);
signal col0_next,col1_next,col2_next,col3_next:std_logic_vector(31 downto 0);
signal matrica_next,matrica_reg:std_logic_vector(127 downto 0);

signal mull_s1,mull_s2,mull_s3,mull_s4,mull_s5,mull_s6,mull_s7,mull_s8:std_logic_vector(7 downto 0);
signal mull_s9,mull_s10,mull_s11,mull_s12,mull_s13,mull_s14,mull_s15,mull_s16:std_logic_vector(7 downto 0);
signal mull_s17,mull_s18,mull_s19,mull_s20,mull_s21,mull_s22,mull_s23,mull_s24:std_logic_vector(7 downto 0);
signal mull_s25,mull_s26,mull_s27,mull_s28,mull_s29,mull_s30,mull_s31,mull_s32:std_logic_vector(7 downto 0);

signal ready_mull_1,ready_mull_2,ready_mull_3,ready_mull_4,ready_mull_5,ready_mull_6,ready_mull_7,ready_mull_8:std_logic;
signal ready_mull_9,ready_mull_10,ready_mull_11,ready_mull_12,ready_mull_13,ready_mull_14,ready_mull_15,ready_mull_16:std_logic;
signal ready_mull_17,ready_mull_18,ready_mull_19,ready_mull_20,ready_mull_21,ready_mull_22,ready_mull_23,ready_mull_24:std_logic;
signal ready_mull_25,ready_mull_26,ready_mull_27,ready_mull_28,ready_mull_29,ready_mull_30,ready_mull_31,ready_mull_32:std_logic;

component mull is 
   port(
        a: in std_logic_vector(7 downto 0);
        b: in std_logic_vector(7 downto 0);
        clk: in std_logic;
        p: out std_logic_vector(7 downto 0);
        start: in std_logic;
        ready:out std_logic
       );
end component mull;

begin

mul1_mapiranje:mull
port map(
        a=>col0_reg(31 downto 24),
        b=>x"02",
        clk=>clk,
        p=>mull_s1,
        start=>start_mull,
        ready=>ready_mull_1
        );

mul2_mapiranje:mull
port map(
        a=>col0_reg(23 downto 16),
        b=>x"03",
        clk=>clk,
        p=>mull_s2,
        start=>start_mull,
        ready=>ready_mull_2
        );
       
 mul3_mapiranje:mull        
port map(
        a=>col0_reg(23 downto 16),
        b=>x"02",
        clk=>clk,
        p=>mull_s3,
        start=>start_mull,
        ready=>ready_mull_3
        );

mul4_mapiranje:mull
port map(
        a=>col0_reg(15 downto 8),
        b=>x"03",
        clk=>clk,
        p=>mull_s4,
        start=>start_mull,
        ready=>ready_mull_4
        );
        
mul5_mapiranje:mull
port map(
        a=>col0_reg(15 downto 8),
        b=>x"02",
        clk=>clk,
        p=>mull_s5,
        start=>start_mull,
        ready=>ready_mull_5
        );

mul6_mapiranje:mull
port map(
        a=>col0_reg(7 downto 0),
        b=>x"03",
        clk=>clk,
        p=>mull_s6,
        start=>start_mull,
        ready=>ready_mull_6
        );

mul7_mapiranje:mull
port map(
        a=>col0_reg(31 downto 24),
        b=>x"03",
        clk=>clk,
        p=>mull_s7,
        start=>start_mull,
        ready=>ready_mull_7
        );

mul8_mapiranje:mull
port map(
        a=>col0_reg(7 downto 0),
        b=>x"02",
        clk=>clk,
        p=>mull_s8,
        start=>start_mull,
        ready=>ready_mull_8
        );
        
mul9_mapiranje:mull
port map(
        a=>col1_reg(31 downto 24),
        b=>x"02",
        clk=>clk,
        p=>mull_s9,
        start=>start_mull,
        ready=>ready_mull_9
        );

mul10_mapiranje:mull
port map(
        a=>col1_reg(23 downto 16),
        b=>x"03",
        clk=>clk,
        p=>mull_s10,
        start=>start_mull,
        ready=>ready_mull_10
        );
       
 mul11_mapiranje:mull        
port map(
        a=>col1_reg(23 downto 16),
        b=>x"02",
        clk=>clk,
        p=>mull_s11,
        start=>start_mull,
        ready=>ready_mull_11
        );

mul12_mapiranje:mull
port map(
        a=>col1_reg(15 downto 8),
        b=>x"03",
        clk=>clk,
        p=>mull_s12,
        start=>start_mull,
        ready=>ready_mull_12
        );
        
mul13_mapiranje:mull
port map(
        a=>col1_reg(15 downto 8),
        b=>x"02",
        clk=>clk,
        p=>mull_s13,
        start=>start_mull,
        ready=>ready_mull_13
        );

mul14_mapiranje:mull
port map(
        a=>col1_reg(7 downto 0),
        b=>x"03",
        clk=>clk,
        p=>mull_s14,
        start=>start_mull,
        ready=>ready_mull_14
        );

mul15_mapiranje:mull
port map(
        a=>col1_reg(31 downto 24),
        b=>x"03",
        clk=>clk,
        p=>mull_s15,
        start=>start_mull,
        ready=>ready_mull_15
        );

mul16_mapiranje:mull
port map(
        a=>col1_reg(7 downto 0),
        b=>x"02",
        clk=>clk,
        p=>mull_s16,
        start=>start_mull,
        ready=>ready_mull_16
        );        

mul17_mapiranje:mull
port map(
        a=>col2_reg(31 downto 24),
        b=>x"02",
        clk=>clk,
        p=>mull_s17,
        start=>start_mull,
        ready=>ready_mull_17
        );

mul18_mapiranje:mull
port map(
        a=>col2_reg(23 downto 16),
        b=>x"03",
        clk=>clk,
        p=>mull_s18,
        start=>start_mull,
        ready=>ready_mull_18
        );
       
 mul19_mapiranje:mull        
port map(
        a=>col2_reg(23 downto 16),
        b=>x"02",
        clk=>clk,
        p=>mull_s19,
        start=>start_mull,
        ready=>ready_mull_19
        );

mul20_mapiranje:mull
port map(
        a=>col2_reg(15 downto 8),
        b=>x"03",
        clk=>clk,
        p=>mull_s20,
        start=>start_mull,
        ready=>ready_mull_20
        );
        
mul21_mapiranje:mull
port map(
        a=>col2_reg(15 downto 8),
        b=>x"02",
        clk=>clk,
        p=>mull_s21,
        start=>start_mull,
        ready=>ready_mull_21
        );

mul22_mapiranje:mull
port map(
        a=>col2_reg(7 downto 0),
        b=>x"03",
        clk=>clk,
        p=>mull_s22,
        start=>start_mull,
        ready=>ready_mull_22
        );

mul23_mapiranje:mull
port map(
        a=>col2_reg(31 downto 24),
        b=>x"03",
        clk=>clk,
        p=>mull_s23,
        start=>start_mull,
        ready=>ready_mull_23
        );

mul24_mapiranje:mull
port map(
        a=>col2_reg(7 downto 0),
        b=>x"02",
        clk=>clk,
        p=>mull_s24,
        start=>start_mull,
        ready=>ready_mull_24
        );
        
mul25_mapiranje:mull
port map(
        a=>col3_reg(31 downto 24),
        b=>x"02",
        clk=>clk,
        p=>mull_s25,
        start=>start_mull,
        ready=>ready_mull_25
        );

mul26_mapiranje:mull
port map(
        a=>col3_reg(23 downto 16),
        b=>x"03",
        clk=>clk,
        p=>mull_s26,
        start=>start_mull,
        ready=>ready_mull_26
        );
       
 mul27_mapiranje:mull        
port map(
        a=>col3_reg(23 downto 16),
        b=>x"02",
        clk=>clk,
        p=>mull_s27,
        start=>start_mull,
        ready=>ready_mull_27
        );

mul28_mapiranje:mull
port map(
        a=>col3_reg(15 downto 8),
        b=>x"03",
        clk=>clk,
        p=>mull_s28,
        start=>start_mull,
        ready=>ready_mull_28
        );
        
mul29_mapiranje:mull
port map(
        a=>col3_reg(15 downto 8),
        b=>x"02",
        clk=>clk,
        p=>mull_s29,
        start=>start_mull,
        ready=>ready_mull_29
        );

mul30_mapiranje:mull
port map(
        a=>col3_reg(7 downto 0),
        b=>x"03",
        clk=>clk,
        p=>mull_s30,
        start=>start_mull,
        ready=>ready_mull_30
        );

mul31_mapiranje:mull
port map(
        a=>col3_reg(31 downto 24),
        b=>x"03",
        clk=>clk,
        p=>mull_s31,
        start=>start_mull,
        ready=>ready_mull_31
        );

mul32_mapiranje:mull
port map(
        a=>col3_reg(7 downto 0),
        b=>x"02",
        clk=>clk,
        p=>mull_s32,
        start=>start_mull,
        ready=>ready_mull_32
        ); 

process(clk)
 begin
   if(clk'event and clk='1') then
        col0_reg<=col0_next;
        col1_reg<=col1_next;
        col2_reg<=col2_next;
        col3_reg<=col3_next;
        matrica_reg<=matrica_next;                         
      end if;
   end process;

ready_mull<=(ready_mull_1 and ready_mull_2 and ready_mull_3 and ready_mull_4 and ready_mull_5 and ready_mull_6 and ready_mull_7 and ready_mull_8) 
            and 
           (ready_mull_9 and ready_mull_10 and ready_mull_11 and ready_mull_12 and ready_mull_13 and ready_mull_14 and ready_mull_15 and ready_mull_16)
           and 
         (ready_mull_17 and ready_mull_18 and ready_mull_19 and ready_mull_20 and ready_mull_21 and ready_mull_22 and ready_mull_23 and ready_mull_24) 
          and
           (ready_mull_25 and ready_mull_26 and ready_mull_27 and ready_mull_28 and ready_mull_29 and ready_mull_30 and ready_mull_31 and ready_mull_32);
     
      

process(sel,mull_s1)
 begin
   case sel is
      when "000" =>
      matrica_next<=x"00000000000000000000000000000000";
      col0_next<="00000000000000000000000000000000";
      col1_next<="00000000000000000000000000000000";
      col2_next<="00000000000000000000000000000000";
      col3_next<="00000000000000000000000000000000";
      
      when "001" =>
      col0_next<=col0;
      col1_next<=col1;
      col2_next<=col2;
      col3_next<=col3;
      matrica_next<=matrica_reg;
      
      when "010" =>
     col0_next<=col0_reg;
     col1_next<=col1_reg;
     col2_next<=col2_reg;
     col3_next<=col3_reg;
      matrica_next<=matrica_reg;

      when "011" =>
      col0_next<=col0_reg;
      col1_next<=col1_reg;
      col2_next<=col2_reg;
      col3_next<=col3_reg;
      matrica_next<=matrica_reg;
      
      when "100" =>
      matrica_next<=matrica_reg;
      col0_next<= (mull_s1 xor mull_s2 xor col0_reg(15 downto 8) xor col0_reg(7 downto 0))
                 &
                  (col0_reg(31 downto 24) xor mull_s3 xor mull_s4  xor col0_reg(7 downto 0))
                 &
                 (col0_reg(31 downto 24) xor  col0_reg(23 downto 16) xor mull_s5 xor mull_s6)
                 &
                 (mull_s7 xor col0_reg(23 downto 16) xor col0_reg(15 downto 8) xor mull_s8);
                 
      col1_next<= (mull_s9 xor mull_s10 xor col1_reg(15 downto 8) xor col1_reg(7 downto 0))
                 &
                  (col1_reg(31 downto 24) xor mull_s11 xor mull_s12  xor col1_reg(7 downto 0))
                 &
                 (col1_reg(31 downto 24) xor  col1_reg(23 downto 16) xor mull_s13 xor mull_s14)
                 &
                 (mull_s15 xor col1_reg(23 downto 16) xor col1_reg(15 downto 8) xor mull_s16);
                 
                 
      col2_next<= (mull_s17 xor mull_s18 xor col2_reg(15 downto 8) xor col2_reg(7 downto 0))
                 &
                  (col2_reg(31 downto 24) xor mull_s19 xor mull_s20  xor col2_reg(7 downto 0))
                 &
                 (col2_reg(31 downto 24) xor  col2_reg(23 downto 16) xor mull_s21 xor mull_s22)
                 &
                 (mull_s23 xor col2_reg(23 downto 16) xor col2_reg(15 downto 8) xor mull_s24);
                
      col3_next<= (mull_s25 xor mull_s26 xor col3_reg(15 downto 8) xor col3_reg(7 downto 0))
                 &
                  (col3_reg(31 downto 24) xor mull_s27 xor mull_s28  xor col3_reg(7 downto 0))
                 &
                 (col3_reg(31 downto 24) xor  col3_reg(23 downto 16) xor mull_s29 xor mull_s30)
                 &
                 (mull_s31 xor col3_reg(23 downto 16) xor col3_reg(15 downto 8) xor mull_s32);
      
      when "101" =>
      matrica_next<=col0_reg & col1_reg & col2_reg & col3_reg; 
      
       col0_next<=col0_reg;
       col1_next<=col1_reg;
       col2_next<=col2_reg;
       col3_next<=col3_reg;
     
       when "110" =>
        matrica_next<=matrica_reg;
        col0_next<=col0_reg;
      col1_next<=col1_reg;
      col2_next<=col2_reg;
      col3_next<=col3_reg;
       
  when others =>
      matrica_next<=matrica_reg;
       col0_next<=col0_reg;
       col1_next<=col1_reg;
       col2_next<=col2_reg;
       col3_next<=col3_reg;
    end case;
  
 end process;
 matrica<=matrica_reg;

end Behavioral;

