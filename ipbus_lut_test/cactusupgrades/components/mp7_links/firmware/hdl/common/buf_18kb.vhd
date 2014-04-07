-- buf_18kb
--
-- Generic LOCable 18kb SDP block ram with output register
-- All performance-oriented attributes are used...
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity buf_18kb is
	generic(
		X_LOC: integer;
		Y_LOC: integer
	);
	port(
		wclk: in std_logic;
		we: in std_logic;
		waddr: in std_logic_vector(13 downto 0);
		d: in std_logic_vector(35 downto 0);
		rclk: in std_logic;
		raddr: in std_logic_vector(13 downto 0);
		q: out std_logic_vector(35 downto 0)
	);

end buf_18kb;

architecture rtl of buf_18kb is

	attribute LOC: string;
	attribute LOC of ram: label is "RAMB18_X" & integer'image(X_LOC) & "Y" & integer'image(Y_LOC);
	
begin

	ram: RAMB18E1
		generic map(
			DOA_REG => 1,
			DOB_REG => 1,
			RAM_MODE => "SDP",
			READ_WIDTH_A => 36,
			WRITE_WIDTH_B => 36,
			WRITE_MODE_A => "READ_FIRST",
			WRITE_MODE_B => "READ_FIRST"
		)
		port map(
			ADDRARDADDR => raddr,
			ADDRBWRADDR => waddr,
			CLKARDCLK => rclk,
			CLKBWRCLK => wclk,
			DIADI => d(15 downto 0),
			DIBDI => d(31 downto 16),
			DIPADIP => d(33 downto 32),
			DIPBDIP => d(35 downto 34),
			DOADO => q(15 downto 0),
			DOBDO => q(31 downto 16),
			DOPADOP => q(33 downto 32),
			DOPBDOP => q(35 downto 34),
			ENARDEN => '1',
			ENBWREN => we,
			REGCEAREGCE => '1',
			REGCEB => '0',
			RSTRAMARSTRAM => '0',
			RSTRAMB => '0',
			RSTREGARSTREG => '0',
			RSTREGB => '0',
			WEA => "11",
			WEBWE => "1111"
		);
		
end rtl;

