-- mp7_counters
--
-- Distributes the sync signals around the device in a daisy-chain fashion
--
-- Dave Newbold, September 2013

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mp7_counters_decl.all;
use work.mp7_readout_decl.all;
use work.ipbus.all;
use work.ipbus_reg_types.all;

entity mp7_counters is
	generic(
		NQUAD: positive;
		NQUAD_MAX: positive;
		CLOCK_RATIO: positive;
		LHC_BUNCH_COUNT: integer
	);
	port(
		clk: in std_logic; -- ipbus clock, rst, bus
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		qsel: in std_logic_vector(4 downto 0);
		clk_p: in std_logic;
		rst_p: in std_logic;
		lock: out std_logic;
		ttc_cmd: in std_logic_vector(3 downto 0);
		cap_bus: in daq_cap_bus;
		rst_out: out std_logic_vector(NQUAD - 1 downto 0);
		bctr: out bctr_array(NQUAD - 1 downto 0);
		pctr: out pctr_array(NQUAD - 1 downto 0);
		bmax: out std_logic_vector(NQUAD - 1 downto 0);
		octr: out octr_array(NQUAD - 1 downto 0);
		bc0: out std_logic_vector(NQUAD - 1 downto 0);
		ttc_cmd_out: out ttc_cmd_array(NQUAD - 1 downto 0);
		cap_bus_out: out daq_cap_bus_array(NQUAD - 1 downto 0)
	);

end mp7_counters;

architecture rtl of mp7_counters is
	
	constant DEL_MAX: integer := (TTC_DEL * CLOCK_RATIO) - 2;

	signal ttc_chain: ttc_cmd_array(NQUAD_MAX downto 0);
	signal rst_chain, lock_chain: std_logic_vector(NQUAD_MAX downto 0);
	signal cap_chain: daq_cap_bus_array(NQUAD_MAX downto 0);
	
	signal ipb_in_q: ipb_wbus_array(NQUAD - 1 downto 0);
	signal ipb_out_q: ipb_rbus_array(NQUAD - 1 downto 0);
	
begin

-- Debug stuff

	fabric_ctrl: entity work.ipbus_fabric_sel
		generic map(
			NSLV => NQUAD,
			SEL_WIDTH => 5
		)
		port map(
			sel => qsel,
			ipb_in => ipb_in,
			ipb_out => ipb_out,
			ipb_to_slaves => ipb_in_q,
			ipb_from_slaves => ipb_out_q
		);

	process(clk_p)
	begin
		if rising_edge(clk_p) then
			ttc_chain(0) <= ttc_cmd; -- CDC (related clocks)
			rst_chain(0) <= rst_p;
			cap_chain(0) <= cap_bus; -- CDC (related clocks)
			lock_chain(0) <= '1';
		end if;
	end process;

	qgen: for i in 0 to NQUAD - 1 generate

		signal ttc_loc: std_logic_vector(3 downto 0);
		signal rst_loc, lock_loc, bctr_lock: std_logic;
		signal cap_loc: daq_cap_bus;
		signal ttc_loc_del: std_logic_vector(3 downto 0);
		signal ctrl, stat: ipb_reg_v(0 downto 0);
		signal stb: std_logic_vector(0 downto 0);
		signal bctr_err, bc0_i: std_logic;
		signal bctr_i, octr_i: std_logic_vector(11 downto 0);

	begin

		process(clk_p)
		begin
			if rising_edge(clk_p) then
				ttc_loc <= ttc_chain(i);
				rst_loc <= rst_chain(i);
				cap_loc <= cap_chain(i);
				lock_loc <= lock_chain(i) and bctr_lock;
			end if;
		end process;
		
		ttc_chain(i + 1) <= ttc_loc;
		rst_chain(i + 1) <= rst_loc;
		cap_chain(i + 1) <= cap_loc;
		lock_chain(i + 1) <= lock_loc;
		
-- Debug stuff

		dreg: entity work.ipbus_syncreg_v
			generic map(
				N_CTRL => 1,
				N_STAT => 1
			)
			port map(
				clk => clk,
				rst => rst,
				ipb_in => ipb_in_q(i),
				ipb_out => ipb_out_q(i),
				slv_clk => clk_p,
				d => stat,
				q => ctrl,
				stb => stb
			);
		
--			stat(0) <= octr_i & bctr_i & bctr_lock & bctr_err & "00";
		stat(0) <= (others => '0');

		delay: entity work.del_array
			generic map(
				DWIDTH => 5 + daq_cap_bus'length,
				DELAY => DEL_MAX - i
			)
			port map(
				clk => clk_p,
				d(3 downto 0) => ttc_loc,
				d(4) => rst_loc,
				d(daq_cap_bus'length + 4 downto 5) => cap_loc,
				q(3 downto 0) => ttc_loc_del,
				q(4) => rst_out(i),
				q(daq_cap_bus'length + 4 downto 5) => cap_bus_out(i)
			);

		ttc_cmd_out(i) <= ttc_loc_del;
		bc0_i <= '1' when ttc_loc_del = X"1" else '0';
		
		bunch: entity work.bunch_ctr
			generic map(
				CLOCK_RATIO => CLOCK_RATIO,
				CLK_DIV => CLOCK_RATIO,
				LHC_BUNCH_COUNT => LHC_BUNCH_COUNT,
				OFFSET => 0
			)
			port map(
				clk => clk_p,
				rst => rst_loc,
				clr => '0',
				bc0 => bc0_i,
				bc0_out => bc0(i),
				bctr => bctr_i,
				pctr => pctr(i),
				bmax => bmax(i),
				lock => bctr_lock,
				err => bctr_err
			);
			
		bctr(i) <= bctr_i;
		
		process(clk_p)
		begin
			if rising_edge(clk_p) then
				if rst_loc = '1' then
					octr_i <= (others => '0'); -- FIXME need to stick oc0 in here also
				elsif bc0_i = '1' then
					octr_i <= std_logic_vector(unsigned(octr_i) + 1);
				end if;
			end if;
		end process;
		
		octr(i) <= octr_i;

	end generate;
	
	lock <= lock_chain(NQUAD);

end rtl;

