entity displaySevenSegments is
	port
	(
		number : in bit_vector(3 downto 0);
		display : out bit_vector(0 to 6) := "1111111"
	);
end displaySevenSegments;

Architecture behaviour of displaySevenSegments is
begin
	process(number) -- define local variable
	begin
		case number is
			when "0000" => display <= "0000001";
			when "0001" => display <= "1001111";
			when "0010" => display <= "0010010";
			when "0011" => display <= "0000110";
			when "0100" => display <= "1001100";
			when "0101" => display <= "0100100";
			when "0110" => display <= "0100000";
			when "0111" => display <= "0001111";
			when "1000" => display <= "0000000";
			when "1001" => display <= "0001100";
			when "1010" => display <= "0001000";
			when "1011" => display <= "1100000";
			when "1100" => display <= "0110001";
			when "1101" => display <= "1000010";
			when "1110" => display <= "0110000";
			when others => display <= "0111000";
		end case;
	end process;
end behaviour;
	