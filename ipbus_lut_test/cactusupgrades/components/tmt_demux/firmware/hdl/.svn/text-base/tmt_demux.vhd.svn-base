-- tmt_demux
--
-- Multiplexes data from several MPs onto a single data stream
--
-- N_MP is the number of MPs sending data (including any inactive boards...)
-- MP_LINKS is the number of incoming links per MP
-- MP_FRAMELEN is the number of BX of valid data per link per processed BX per MP
--
-- Dave Newbold, September 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.ipbus_reg_types.all;
use work.mp7_data_types.all;

entity tmt_demux is
	generic(
		N_MP: positive;
		MP_LINKS: positive;
		FRAMELEN: positive;
		CLOCK_RATIO: positive;
		LHC_BUNCH_COUNT: positive
	);
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		mp_sel: in std_logic_vector(3 downto 0);
		bc0: in std_logic;
		clk_p: in std_logic;
		rst_p: in std_logic;
		d: in ldata(N_MP * MP_LINKS - 1 downto 0);
		q: out ldata(MP_LINKS * ((FRAMELEN - 1) / CLOCK_RATIO + 1) - 1 downto 0)
	);
	
end tmt_demux;

architecture rtl of tmt_demux is

	constant FL_BX: integer := (FRAMELEN - 1) / CLOCK_RATIO + 1;
	signal bx: std_logic_vector(11 downto 0);
	signal px: std_logic_vector(2 downto 0);
	type mp_stat_t is array(N_MP - 1 downto 0) of std_logic_vector(3 downto 0);
	signal mp_stat: mp_stat_t;
	signal valid, match: std_logic_vector(N_MP - 1 downto 0);
	signal d_flat: ldata(N_MP * MP_LINKS * FL_BX - 1 downto 0);
	signal p, resync, clr: std_logic;
	signal stat: ipb_reg_v(3 downto 0);
	signal ctrl: ipb_reg_v(0 downto 0);
	signal stb: std_logic_vector(0 downto 0);

begin
	
	bctr: entity work.bunch_ctr
		generic map(
			CLOCK_RATIO => CLOCK_RATIO,
			CLK_DIV => CLOCK_RATIO,
			LHC_BUNCH_COUNT => LHC_BUNCH_COUNT,
			LOCK_CTR => false,
			VAR_OFFSET => true
		)
		port map(
			clk => clk_p,
			rst => rst_p,
			clr => resync,
			del_bx => ctrl(0)(15 downto 8),
			del_p => ctrl(0)(6 downto 4),
			bc0 => bc0,
			bctr => bx,
			pctr => px
		);

	p <= '1' when px = "000" else '0';

	demux: for i in N_MP - 1 downto 0 generate
	
		constant il: integer := i * MP_LINKS;
		constant ih: integer := (i + 1) * MP_LINKS - 1;
		constant ilf: integer := i * MP_LINKS * FL_BX;
		constant ihf: integer := (i + 1) * MP_LINKS * FL_BX - 1;

	begin
		
		flatten: entity work.tmt_demux_flat
			generic map(
				LINKS => MP_LINKS,
				FL_BX => FL_BX,
				CLOCK_RATIO => CLOCK_RATIO
			)
			port map(
				clk_p => clk_p,
				rst_p => rst_p,
				d => d(ih downto il),
				q => d_flat(ihf downto ilf),
				bx => bx,
				p => p,
				match => match(i),
				stat => mp_stat(i),
				clr => clr
			);

	end generate;

	stat(3)(3 downto 0) <= mp_stat(to_integer(unsigned(mp_sel)));

	mux: entity work.tmt_demux_mux
		generic map(
			N_MP => N_MP,
			CHAN => MP_LINKS * FL_BX
		)
		port map(
			clk_p => clk_p,
			rst_p => rst_p,
			d => d_flat,
			q => q,
			p => p,
			resync => resync,
			match => match,
			good_ctr => stat(0),
			empty_ctr => stat(1),
			bust_ctr => stat(2)
		);
		
	reg: entity work.ipbus_syncreg_v
		generic map(
			N_CTRL => 1,
			N_STAT => 4
		)
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipb_in,
			ipb_out => ipb_out,
			slv_clk => clk_p,
			d => stat,
			q => ctrl,
			stb => stb
		);

	resync <= ctrl(0)(0) and stb(0);
	clr <= ctrl(0)(1) and stb(0);

end rtl;

