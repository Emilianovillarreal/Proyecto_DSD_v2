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

 
--FALTARIA REVISAR QUE TIENE DE MAL EL BLOQUE 2 

begin

U1: entity work.contador_version3
port map
(	i_sign_square  => I_SEÑAL,
	CLK => CLK,
	RST => RST, 
	SALIDA  => s_U1_to_U2);


	




end Behavioral;

