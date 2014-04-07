-- ttc_del
--
-- Fine delay element for incoming TTC data
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library unisim;
use unisim.VComponents.all;

entity ttc_del is
	port(
		i: in std_logic;
		o: out std_logic;
		refclk: in std_logic;
		rst: in std_logic;
		rdy: out std_logic;
		clk: in std_logic;
		inc: in std_logic
	);

end ttc_del;

architecture rtl of ttc_del is

	attribute IODELAY_GROUP: string;
	attribute IODELAY_GROUP of ctrl: label is "ttc_del";
	attribute IODELAY_GROUP of idel: label is "ttc_del";

	begin

	ctrl: IDELAYCTRL
		port map(
			refclk => refclk,
			rst => rst,
			rdy => rdy
		);
		
	idel: IODELAYE1
		generic map(IDELAY_TYPE => "VARIABLE")
		port map(
			c => clk,
			t => '0',
			rst => rst,
			ce => inc,
			inc => '1',
			cinvctrl => '0',
			cntvaluein => "00000",
			clkin => '0',
			idatain => i,
			datain => '0',
			odatain => '0',
			dataout => o,
			cntvalueout => open
		);

end rtl;
