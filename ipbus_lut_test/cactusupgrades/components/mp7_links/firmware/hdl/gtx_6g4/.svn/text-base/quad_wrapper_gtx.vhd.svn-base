-- quad_wrapper_gtx
--
-- Wrapper for MGT quad
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.all;
use work.ipbus.all;
use work.mp7_data_types.all;
use work.ipbus_reg_types.all;
use work.mgt_decl.all;
use work.package_types.all;
use work.package_links.all;

entity quad_wrapper_gtx is
	generic(
		X_LOC: integer := 0;
		Y_LOC: integer := 0;
		LHC_BUNCH_COUNT: integer
	);
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		sysclk: in std_logic;
		clk_p: in std_logic;
		rst_p: in std_logic;
		bctr: in std_logic_vector(15 downto 0);
		d: in ldata(3 downto 0);
		q: out ldata(3 downto 0);
		refclk: in std_logic;
		rxp: in std_logic_vector(3 downto 0);
		rxn: in std_logic_vector(3 downto 0);
		txp: out std_logic_vector(3 downto 0);
		txn: out std_logic_vector(3 downto 0);
		qplllock: out std_logic;
		refclk_mon: out std_logic;
    txclk_mon: out std_logic;
    rxclk_mon: out std_logic_vector(3 downto 0)
	);

end quad_wrapper_gtx;

architecture rtl of quad_wrapper_gtx is

	signal ctrl: ipb_reg_v(4 * NUMBER_OF_CHAN_RW_REGS + NUMBER_OF_COMMON_RW_REGS - 1 downto 0);
	signal stat: ipb_reg_v(4 * NUMBER_OF_CHAN_RO_REGS + NUMBER_OF_COMMON_RO_REGS - 1 downto 0);
	signal chan_ro_reg: type_chan_ro_reg_array(3 downto 0);
	signal chan_rw_reg: type_chan_rw_reg_array(3 downto 0);
	signal common_ro_reg: type_common_ro_reg;
	signal common_rw_reg: type_common_rw_reg;
	
begin

	reg: entity work.ipbus_syncreg_v
		generic map(
			N_CTRL => 4 * NUMBER_OF_CHAN_RW_REGS + NUMBER_OF_COMMON_RW_REGS,
			N_STAT => 4 * NUMBER_OF_CHAN_RO_REGS + NUMBER_OF_COMMON_RO_REGS
		)
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipb_in,
			ipb_out => ipb_out,
			slv_clk => clk_p,
			d => stat,
			q => ctrl
		);
		
	quad: entity work.int_align_gtx_debug
		generic map(
			LOCAL_LHC_BUNCH_COUNT => LHC_BUNCH_COUNT,
			X_LOC => X_LOC,
			Y_LOC => Y_LOC
		)
		port map(
			ttc_clk_in => clk_p,
			ttc_rst_in => rst_p,
			ttc_orbit_location_in => bctr,
			refclk_in => refclk,
			drpclk_in => clk,
			sysclk_in => sysclk,
			rxn_in => rxn,
			rxp_in => rxp,
			txn_out => txn,
			txp_out => txp,
			txdata_in(0) => d(0).data,
			txdata_in(1) => d(1).data,
			txdata_in(2) => d(2).data,
			txdata_in(3) => d(3).data,
			txdatavalid_in(0) => d(0).valid,
			txdatavalid_in(1) => d(1).valid,
			txdatavalid_in(2) => d(2).valid,
			txdatavalid_in(3) => d(3).valid,
			rxdata_out(0) => q(0).data,
			rxdata_out(1) => q(1).data,
			rxdata_out(2) => q(2).data,
			rxdata_out(3) => q(3).data,
			rxdatavalid_out(0) => q(0).valid,
			rxdatavalid_out(1) => q(1).valid,
			rxdatavalid_out(2) => q(2).valid,
			rxdatavalid_out(3) => q(3).valid,
			chan_ro_regs_out => chan_ro_reg,
			chan_rw_regs_in => chan_rw_reg,
			common_ro_regs_out => common_ro_reg,
			common_rw_regs_in => common_rw_reg,
			qplllock => qplllock,
			-- Clocks for monitoring
			txclk_mon => txclk_mon,
			rxclk_mon => rxclk_mon
		);
		
	chan_reg_gen: for i in 3 downto 0 generate
		chan_ro_gen: for j in NUMBER_OF_CHAN_RO_REGS - 1 downto 0 generate
			stat(NUMBER_OF_CHAN_RO_REGS * i + j) <= chan_ro_reg(i)(j);
		end generate;
		chan_rw_gen: for j in NUMBER_OF_CHAN_RW_REGS - 1 downto 0 generate
			chan_rw_reg(i)(j) <= ctrl(NUMBER_OF_CHAN_RW_REGS * i + j);
		end generate;
	end generate;
	
	common_ro_gen: for j in NUMBER_OF_COMMON_RO_REGS - 1 downto 0 generate
		stat(4 * NUMBER_OF_CHAN_RO_REGS + j) <= common_ro_reg(j);
	end generate;
	common_rw_gen: for j in NUMBER_OF_COMMON_RW_REGS - 1 downto 0 generate
		common_rw_reg(j) <= ctrl(4 * NUMBER_OF_CHAN_RW_REGS + j);
	end generate;
		
end rtl;

