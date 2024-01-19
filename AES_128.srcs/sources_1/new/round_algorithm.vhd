----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 10:44:31 AM
-- Design Name: 
-- Module Name: round_algorithm - Behavioral
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

entity round_algorithm is
  Port (
        clk: in std_logic;
        reset: in std_logic;
        start: in std_logic;
        
        key_in: in std_logic_vector(127 downto 0);
        text_in: in std_logic_vector(127 downto 0);
        text_out: out std_logic_vector(127 downto 0);
        ready: out std_logic
        );
end round_algorithm;

architecture Behavioral of round_algorithm is

signal count: integer:=0;
signal address_s:std_logic_vector(3 downto 0):=x"0";
signal key_addr_s:std_logic_vector(3 downto 0):=x"0";
signal sub_addr_s:std_logic_vector(3 downto 0):=x"0";
signal add_addr_s:std_logic_vector(3 downto 0):=x"0";
signal state_matrix,to_shift_s,shift_row_s,mixed_matrix,key_in_s,new_key_s,key_s: std_logic_vector(127 downto 0);
signal shift_wr,add_wr,byte_wr_s,sub_wr,mix_wr,key_gen_wr,key_wr_s: std_logic;
signal start_sub,start_mix,start_add,start_key: std_logic;
signal ready_sub,ready_mix,ready_add,ready_key: std_logic;
signal wbyte_sub,wbyte_add,rbyte_sub,rbyte_add,subbed_byt_s,add_byt_s,key_byt_s,mem_key_byte_s:std_logic_vector(7 downto 0);
signal rcolumn0_s,rcolumn1_s,rcolumn2_s,rcolumn3_s: std_logic_vector(31 downto 0);
signal shifted_s,mixed_s:std_logic_vector(127 downto 0);
signal start_wr:std_logic:='0';

type state_type is (idle,write,sub_start,sub_wait,shift,mix_start,mix_wait,add_start,add_wait);
    signal state_reg, state_next: state_type; 
    signal count_next,count_reg:integer;
component sub_bytes
Port( 
      clk: in std_logic;
      reset: in std_logic;
      
      byte: in std_logic_vector(7 downto 0);
      start: in std_logic;
      
      subbed_byt: out std_logic_vector(7 downto 0);
      byte_addr: out std_logic_vector(3 downto 0);
      byte_wr: out std_logic;
      ready: out std_logic
    );
end component sub_bytes;

component add_key is
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
end component add_key;

component mixcolumn is
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
end component mixcolumn;

component shiftrows is
    port (
        input : in std_logic_vector(127 downto 0);
        output : out std_logic_vector(127 downto 0)
    );
end component shiftrows;

component key_gen is
 Port ( 
      clk: in std_logic;
      reset: in std_logic;
      round_count: in integer;
      
      key_in: in std_logic_vector(127 downto 0);
      start: in std_logic;
      
      key_out: out std_logic_vector(127 downto 0);
      key_wr: out std_logic;
      ready: out std_logic
 );
end component key_gen;

component mem_key is
  Port (
         clk: in std_logic;
         --adresa sa koje se cita/upisuje
         address: in std_logic_vector(3 downto 0);
         --izlazni podaci
         rdata: out std_logic_vector(7 downto 0);
         key_out:out std_logic_vector(127 downto 0);
         key_start: in std_logic_vector(127 downto 0);
         start_wr: in std_logic;
         --podaci koje upisjemo u memoriju 
         key_in:in std_logic_vector(127 downto 0);
          --dozvola upisa
         write: in std_logic 
         );
end component mem_key;

component mem_text is
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
         
         state_start: in std_logic_vector(127 downto 0);
         start_wr: in std_logic;
         
         --podaci koje upisjemo u memoriju
         wbyte_add: in std_logic_vector(7 downto 0);
         wbyte_sub: in std_logic_vector(7 downto 0);
         --podaci
         shift_in:in std_logic_vector(127 downto 0);
         mix_in:in std_logic_vector(127 downto 0);
         state_out:out std_logic_vector(127 downto 0);
         
         --dozvola upisa
         w_add_en: in std_logic;
         w_sub_en: in std_logic;
         w_shift_en: in std_logic;
         w_mix_en: in std_logic
       );
end component mem_text;

begin

sub_bytes_mapping: sub_bytes
   port map( clk=>clk,
             reset=>reset,
             byte=>rbyte_sub,
             start=>start_sub,
             subbed_byt=>wbyte_sub,
             byte_addr=>sub_addr_s,
             byte_wr=>sub_wr,
             ready=>ready_sub
            );

add_key_mapping: add_key
   port map( clk=>clk,
             reset=>reset,
      
             state_data=>rbyte_add,
             key_data=>key_byt_s,
             start=>start_add,
      
             byte_out=>wbyte_add,
             text_wr=>add_wr,
             state_addr=>add_addr_s,
             key_addr=>key_addr_s,
             ready=>ready_add
            );

mixcolumn_mapping: mixcolumn
 Port map (
           clk=>clk,
           reset=>reset,
      
           start=>start_mix,
           col0=>rcolumn0_s,
           col1=>rcolumn1_s,
           col2=>rcolumn2_s,
           col3=>rcolumn3_s,
      
           mixed=>mixed_s,
           column_wr=>mix_wr,
           ready=>ready_mix
  );

shiftrow_mapping: shiftrows
    port map (
        input=>to_shift_s,
        output=>shifted_s
    );


key_gen_mapping: key_gen
 Port map ( 
      clk=>clk,
      reset=>reset,
      round_count=>count,
      
      key_in=>key_in_s,
      start=>start_key,
      
      key_out=>new_key_s,
      key_wr=>key_gen_wr,
      ready=>ready_key
 );


mem_key_mapping: mem_key
  Port map (
         clk=>clk,
         address=>key_addr_s,
         rdata=>key_byt_s,
         key_out=>key_in_s,
         key_start=>key_in,
         start_wr=>start_wr,
         --podaci koje upisjemo u memoriju 
         key_in=>new_key_s,
          --dozvola upisa
         write=>key_gen_wr
         );

mem_text_mapping:mem_text
  Port map (
        clk=>clk,
         --adresa sa koje se cita/upisuje
         address_sub=>sub_addr_s,
         address_add=>add_addr_s,
         --izlazni podaci
         rbyte_sub=>rbyte_sub,
         rbyte_add=>rbyte_add,
         rcolumn0=>rcolumn0_s,
         rcolumn1=>rcolumn1_s,
         rcolumn2=>rcolumn2_s,
         rcolumn3=>rcolumn3_s,
         
         state_start=>text_in,
         start_wr=>start_wr,
         --podaci koje upisjemo u memoriju
         wbyte_sub=>wbyte_sub,
         wbyte_add=>wbyte_add,      
         --podaci
         shift_in=>shifted_s,
         mix_in=>mixed_s,
         state_out=>to_shift_s,
         
         --dozvola upisa
           w_add_en=>add_wr,
         w_sub_en=>sub_wr,
         w_shift_en=>shift_wr,
         w_mix_en=>mix_wr
       );


-- registar stanja
  process (clk, reset) is
    begin
        if (reset = '1') then
            state_reg <= idle;
        elsif (clk'event and clk = '1') then
            state_reg <= state_next;
            count_reg <= count_next;
        end if;
   end process;

process (state_reg,start,ready_add,ready_sub,ready_mix,ready_key)
    begin
              start_wr<='0';
              start_add<='0';
              start_sub<='0';
              start_key<='0';
              start_mix<='0';
              shift_wr<='0';
              ready<='0';
        case state_reg is
            when idle =>
              ready<='1';
              count_next<=0;         
           if (start = '0') then 
               state_next<=idle;
             else state_next<=write;
           end if;
             
            when write =>
            start_wr<='1';
            count_next<=count_reg;
            state_next<=add_start;
           
           
            when add_start =>
             start_wr<='0';
            start_add<='1';
            count_next<=count_reg;
            state_next<=add_wait;
            
            when add_wait =>
            count_next<=count_reg;
            if(ready_add='1' and count<10) then
            state_next<=sub_start;
            elsif (ready_add='1') then
              state_next<=idle;               
             else state_next<=add_wait;
            end if;
              
             when sub_start =>
            start_sub<='1';
            start_key<='1';
            count_next<=count_reg + 1;
            state_next<=sub_wait;
            
            when sub_wait =>
            count_next<=count_reg;
            if(ready_sub='1') then
            state_next<=shift;
            else state_next<=sub_wait;
           end if;
           
             when shift =>
            shift_wr<='1';
            count_next<=count_reg;
            if(count<10) then
            state_next<=mix_start;
           else state_next<=add_start;
           end if;
           
             when mix_start =>
            start_mix<='1';
            count_next<=count_reg;
            state_next<=mix_wait;
            
             when mix_wait =>
             count_next<=count_reg;
            if(ready_mix='1' and ready_key='1') then
            state_next<=add_start;
            else state_next<=mix_wait;
           end if;
              
        end case;
     end process;
text_out<=to_shift_s;
count<=count_reg;
end Behavioral;
