library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_version3 is
    Port ( i_sign_square : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
		SAlIDA : out std_logic_vector(14 downto 0));
end contador_version3;

architecture Behavioral of contador_version3 is
signal aux1 : STD_LOGIC_vector(25 downto 0);
signal aux2 : STD_LOGIC_vector(14 downto 0);
signal count_reach : std_logic;

begin

u1: process(CLK, RST)
constant Limite_tiempo: std_logic_vector(25 downto 0):= "11000011010100000000000000";-- 512 [ms]
begin

	if CLK'event and clk = '1' then 
		if  (rst = '1') then 
			aux1 <= (others => '0');
			
		elsif  (aux1 > Limite_tiempo) then
			count_reach <= '1';
			aux1 <= (others => '0');
		else 
			aux1 <= Std_logic_vector(unsigned(aux1)+ 1);
			count_reach <= '0';
		end if;
	end if;
end process;

u2: process(i_sign_square, RST, count_reach)
begin
	if rising_edge(i_sign_square) then
		if RST = '1' then 
			aux2 <= (others => '0');
		elsif count_reach = '1' then 
			aux2 <= (others => '0');
			
		else 
			aux2 <= Std_logic_vector(unsigned(aux2)+ 1);
			
		end if;
	end if;
end process;
U3: process(clk, aux2,count_reach )
begin
if rising_edge(clk) then 
	if count_reach = '1' then 
		SAlida <= aux2;
	end if;
	
end if;
end process;

end Behavioral;

