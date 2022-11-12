library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--EN ESTE BKLOQUE SE DESPLAZA Y SE MULTIPLICA X1000 PARA OBTENER LA FRECUENCIA

entity DESPLAZAMIENTO_IZQ_V3 is
port
(	CLK : in std_logic;
	RST : in std_logic;
	count_frezze : in std_logic_vector(14 downto 0);
	SALIDA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
	--frecuencia: out std_logic_vector(19 downto 0));--14
end DESPLAZAMIENTO_IZQ_V3;

architecture Behavioral of DESPLAZAMIENTO_IZQ_V3 is
	signal s_shift_count : std_logic_vector(9 downto 0);
	signal cte_1000 : std_logic_vector(9 downto 0);
	signal s_frecuencia : std_logic_vector(19 downto 0);
BEGIN

U2: process(clk, rst, count_frezze)
begin

if rst = '1' then 
	s_shift_count <= (others => '0');
elsif rising_edge(clk)then 
	s_shift_count <= count_frezze(14 downto 5);
end if;
end process;
--cte_1000 <= "1111101000";
--s_frecuencia <= std_logic_vector(unsigned(cte_1000)*unsigned(s_shift_count));




process(clk, rst, S_SHIFT_COUNT)
begin
	if rising_edge(clk)then 
		--frecuencia <= s_frecuencia;
		SALIDA <= S_SHIFT_COUNT;
	end if;
end process;

end Behavioral;

