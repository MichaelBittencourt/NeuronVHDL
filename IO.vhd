entity IO is
	port
	(
		BTN_KEYS : in bit_vector(3 downto 0);
		SW_KEYS : in bit_vector(9 downto 0);
		LED_GENERAL : out bit_vector (7 downto 0);
		LED_SW : out bit_vector (9 downto 0);
		DISPLAY0 : out bit_vector (0 to 6);
		DISPLAY1 : out bit_vector (0 to 6);
		DISPLAY2 : out bit_vector (0 to 6);
		DISPLAY3 : out bit_vector (0 to 6)
	);
end IO;

Architecture behaviour of IO is
	signal number0, number1, number2, number3 : bit_vector(3 downto 0);
	signal dendrite0, dendrite1, dendrite2,
			 weidth0, weidth1, weidth2,
			 bias,
			 res : Integer;
	component displaySevenSegments
		port(
			number : in bit_vector(3 downto 0);
			display : out bit_vector(0 to 6)
		);
	end component;
	
	component Neuron
		port(
			clock: in bit;
			D0, D1, D2,
			W0, W1, W2,
			Bias: in Integer; 
			res: out Integer
		);
	end component;
begin
	DISP0: displaySevenSegments port map (number0, DISPLAY0);
	DISP1: displaySevenSegments port map (number1, DISPLAY1);
	DISP2: displaySevenSegments port map (number2, DISPLAY2);
	DISP3: displaySevenSegments port map (number3, DISPLAY3);
	NEURON0: Neuron port map(BTN_KEYS(2), dendrite0, dendrite1, dendrite2, weidth0, weidth1, weidth2, bias, res);
	
	process(BTN_KEYS, SW_KEYS) -- define local variable
		variable contDendrite: integer := 0;
		variable d, w: bit_vector(3 downto 0);
		variable dTemp, wTemp: integer;
	begin
		LED_SW <= SW_KEYS;
		number0 <= SW_KEYS(3 downto 0);
		number1 <= SW_KEYS(9 downto 6);
		bias <= 0;
		if BTN_KEYS(1)'event and BTN_KEYS(1) = '1' then
			d := SW_KEYS(3 downto 0);
			case d is
				when "0000" => dTemp := 0;
				when "0001" => dTemp := 1;
				when "0010" => dTemp := 2;
				when "0011" => dTemp := 3;
				when "0100" => dTemp := 4;
				when "0101" => dTemp := 5;
				when "0110" => dTemp := 6;
				when "0111" => dTemp := 7;
				when "1000" => dTemp := 8;
				when "1001" => dTemp := 9;
				when "1010" => dTemp := 10;
				when "1011" => dTemp := 11;
				when "1100" => dTemp := 12;
				when "1101" => dTemp := 13;
				when "1110" => dTemp := 14;
				when others => dTemp := 15;
			end case;
			w := SW_KEYS(9 downto 6);
			case w is
				when "0000" => wTemp := 0;
				when "0001" => wTemp := 1;
				when "0010" => wTemp := 2;
				when "0011" => wTemp := 3;
				when "0100" => wTemp := 4;
				when "0101" => wTemp := 5;
				when "0110" => wTemp := 6;
				when "0111" => wTemp := 7;
				when "1000" => wTemp := 8;
				when "1001" => wTemp := 9;
				when "1010" => wTemp := 10;
				when "1011" => wTemp := 11;
				when "1100" => wTemp := 12;
				when "1101" => wTemp := 13;
				when "1110" => wTemp := 14;
				when others => wTemp := 15;
			end case;
			case contDendrite is
				when 0 => dendrite0 <= dTemp;
							 weidth0 <= wTemp;
							 number3 <= "0001";
				when 1 => dendrite1 <= dTemp;
							 weidth1 <= wTemp;
							 number3 <= "0010";
				when 2 => dendrite2 <= dTemp;
							 weidth2 <= wTemp;
							 number3 <= "0011";
				when others => contDendrite := 3;
			 end case;
			 if contDendrite < 3 then
				contDendrite := contDendrite + 1;
			 else
				contDendrite := 0;
				number3 <= "0000";
			 end if;
			 
			 case res is
				when 0 => number2 <= "0000";
				when 1 => number2 <= "0001";
				when 2 => number2 <= "0010";
				when 3 => number2 <= "0011";
				when 4 => number2 <= "0100";
				when 5 => number2 <= "0101";
				when 6 => number2 <= "0110";
				when 7 => number2 <= "0111";
				when 8 => number2 <= "1000";
				when 9 => number2 <= "1001";
				when 10 => number2 <= "1010";
				when 11 => number2 <= "1011";
				when 12 => number2 <= "1100";
				when 13 => number2 <= "1101";
				when 14 => number2 <= "1110";
				when others => number2 <= "1111";
			end case;
		end if;
	
	end process;
	
end behaviour;