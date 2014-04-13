----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Daniel Eichman
-- 
-- Create Date:    14:00:33 04/09/2014 
-- Design Name: 
-- Module Name:    Registar - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: This simulates a registar. It will pass the data to the output when there is a rising edge of the clock and Load is high and reset is high.
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Registar is
    Port ( Data : in  STD_LOGIC_VECTOR (3 downto 0);
           Reset : in  STD_LOGIC;
           Load : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end Registar;

architecture Behavioral of Registar is

begin
process(Clock,Reset)
  	begin	
	  if(Reset = '0') then
			Output<= "0000";
	  elsif(rising_edge(Clock) and Load = '1') then
			--if(Load = '1') then
				Output <= Data;
			--else
			--end if;
	  else
	  
	  end if;
end process;
end Behavioral;

