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
begin
	process(clock)
		variable acc, temp_output: Integer;
		constant limit: Integer := 10;
	begin
		--if clock'event and clock = '1' then
			--acc := D0*W0+D1*W1+D2*W2+D3*W3+Bias;
			acc := D0*W0+D1*W1+D2*W2+Bias;--+D3*W3+Bias;
			if acc > limit then
				temp_output := acc-limit;
			else
				temp_output := 0;
			end if;
			res <= temp_output; --after 5 ns;
		--end if;
	end process;
end Behavioral;