library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity frecuencimetro is
    Port ( CLK : in  STD_LOGIC;
           I_SEÑAL : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           SALIDA : out  STD_LOGIC_VECTOR (6 downto 0));
end frecuencimetro;

architecture Behavioral of frecuencimetro is
--signal s_i_sal_cont2 :std_logic_vector(25 downto 0);
--signal s_aux1 : STD_LOGIC_vector(14 downto 0); 
--Signal s_aux2 : STD_LOGIC_vector(25 downto 0);
--signal s_aux3 : STD_LOGIC_vector(14 downto 0); 
--signal frecuencia : std_logic_vector(29 downto 0);

singal s_U1_to_U2: std_logic_vector(14 downto 0);
signal s_shifted_signal : std_logic_vector(9 downto 0);
signal s_frecuencia_SM : std_logic_vector(9 downto 0);

 
--FALTARIA REVISAR QUE TIENE DE MAL EL BLOQUE 2 

begin

U1: entity work.contador_version3
port map
(	i_sign_square  => I_SEÑAL,
	CLK => CLK,
	RST => RST, 
	SALIDA  => s_U1_to_U2);

U2: process(CLK, RST, s_U1_to_U2) -- se hace la division, despreciando los bits que son 0, dejando 10 bits para la posterior multiplicacion
begin
	if rst = '1' then 
		s_shifted_signal <= (others => '0');
	elsif rising_edge(clk)then 
		s_shifted_signal <= s_U1_to_U2(14 downto 5);
	end if;
end process;

U3: process(clk, rst, s_U1_to_U2,s_frecuencia_SM)
begin
	if rising_edge(clk)then 
		s_frecuencia_SM <= s_shifted_signal;
	end if;
end process;


	




end Behavioral;

