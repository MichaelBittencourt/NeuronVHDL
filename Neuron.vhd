library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity Neuron is
	generic ( n : integer := 16);
	port(
		clock: in bit;
		D0, D1, D2,-- D3,
		W0, W1, W2,-- W3,
		Bias: in Integer; 
		res: out Integer
	);
end Neuron;

architecture Behavioral of Neuron is
	
	--variable acc: std_logic_vector;
begin
	process(clock)
		variable acc, temp_output: Integer;
		constant limit: Integer := 5000;
	begin
		if clock'event and clock = '1' then
			--acc := D0*W0+D1*W1+D2*W2+D3*W3+Bias;
			acc := D0*W0+D1*W1+D2*W2+Bias;--+D3*W3+Bias;
			if acc > limit then
				temp_output := acc;
			else
				temp_output := 0;
			end if;
			res <= temp_output after 5 ns;
		end if;
	end process;
end Behavioral;

--library ieee ;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;

--Entity Neuron is
--	generic( n: integer := 32 );
--	Port(
--		clock: in bit;
--		D0, D1, D2, D3, D4, D5, D6, D7,
--		W0, W1, W2, W3, W4, W5, W6, W7,
--		Bias: in std_logic_vector ( n-1 downto 0);
--		Output: out std_logic_vector (2*n-1 downto 0)
		-- Bias : in real;
		-- Output: out real
--	);
--End Neuron;

--Architecture behaviour1 of Neuron is
--	signal acc, temp_output: real;
--	constant limit : real := 0.0;
--begin
--	process(clock)
--	begin
--		if clock'event and clock = '1' then 
--			acc <= signed(D0)*signed(W0);-- +
					 --signed(D1)*signed(W1) +
					 --signed(D2)*signed(W2) +
					 --signed(D3)*signed(W3) +
					 --signed(D4)*signed(W4) +
					 --signed(D5)*signed(W5) +
					 --signed(D6)*signed(W6) +
					 --signed(D7)*signed(W7) + 
					 --signed(Bias);
--			if acc > limit then
--				temp_output <= acc;
--			else 
--				temp_output <= limit;
--			end if;
--		end if;
--	end process;
--	Output <= temp_output;
	-- Output <= activa
	--process(clock,
	--		  D0, D1, D2, D3, D4, D5, D6, D7,
	--		  W0, W1, W2, W3, W4, W5, W6, W7,
	--		  Bias)
	--begin
--end behaviour1;
		
		
	