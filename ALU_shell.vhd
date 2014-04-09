-------------------------------------------------------------------------------
--
-- Title       : ALU
-- Design      : ALU
-- Author      : Daniel Eichman 
-- Company     : usafa
--
-------------------------------------------------------------------------------
--
-- File        : ALU.vhd
-- Generated   : Fri Mar 30 11:16:54 2007
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : This is a project that simulates a PRISM ALU. There are a 
-- total of 8 commands which is selected by OpSel. Other than that there are two inputs
-- Data and the Accumulator these will be used by operations the ALU can do.
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {ALU} architecture {ALU}}

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
	 port(
		 OpSel : in STD_LOGIC_VECTOR(2 downto 0);
		 Data : in STD_LOGIC_VECTOR(3 downto 0);
		 Accumulator : in STD_LOGIC_VECTOR(3 downto 0);
		 Result : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end ALU;

--}} End of automatically maintained section

architecture ALU of ALU is	   

signal temp : std_logic_vector(3 downto 0);
begin
	
-- fill in details to create result as a function of Data and Accumulator, based on OpSel.
 -- e.g : Build a multiplexer choosing between the eight ALU operations.  Either use a case statement (and thus a process)
 --       or a conditional signal assignment statement ( x <= Y when <condition> else . . .)
 -- ALU Operations are defined as:
 -- OpSel : Function
--  0     : AND
--  1     : NEG (2s complement)
--  2     : NOT (invert)
--  3     : ROR
--  4     : OR
--  5     : IN
--  6     : ADD
--  7     : LD
--	aluswitch: process (Accumulator, Data, OpSel)
--	begin
--		temp		<= Accumulator AND Data 							when (OpSel = "000") else 
--						std_logic_vector(unsigned(not Data) + 1)  when (OpSel = "001") else
--						not Data												when (OpSel = "010") else
--						std_logic_vector(unsigned(Data) ror 1)		when (OpSel = "011") else
--						Accumulator OR Data								when (OpSel = "100") else
--						Data													when (OpSel = "101") else
--						Accumulator + Data 								when (OpSel = "110") else
--						Data													when (OpSel = "111") else
--						Accumulator;					
--	end process;
	Result		<= Accumulator AND Data 							when (OpSel = "000") else 
						std_logic_vector(unsigned(not Accumulator) + 1)  when (OpSel = "001") else
						not Data												when (OpSel = "010") else
						std_logic_vector(unsigned(Accumulator) ror 1)		when (OpSel = "011") else
						Accumulator OR Data								when (OpSel = "100") else
						Data													when (OpSel = "101") else
						Accumulator + Data 								when (OpSel = "110") else
						Data													when (OpSel = "111") else
						Accumulator;	
-- OR, enter your conditional signal statement here

end ALU;

--		if(OpSel = "00")then--AND
--			temp <= Accumulator AND Data;
--			--Accumulator <= temp;
--		elsif(OpSel = "001")then--NEG
--			temp <= std_logic_vector(unsigned(not Data) + 1);
--		elsif(OpSel = "010")then--NOT
--			temp <= not Data;
--		elsif(OpSel = "011")then--ROR
--			--(Data ror 1)
--			--temp <= Data;
--			temp<= std_logic_vector(unsigned(Data) ror 1);
--		elsif(OpSel = "100")then--OR
--			temp <= Accumulator OR Data;
--		elsif(OpSel = "101")then--IN
--			temp<=Data;
--		elsif(OpSel = "110")then--ADD
--			temp <= Accumulator + Data;
--		elsif(OpSel = "111")then--LD
--			temp <= Data;
--		else
--			temp<=Accumulator;
--		end if; 
--		Accumulator <= temp;