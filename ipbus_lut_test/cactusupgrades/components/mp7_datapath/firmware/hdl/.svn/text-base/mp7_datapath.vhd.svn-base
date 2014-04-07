-- mp7_datapath
--
-- Wrapper for MGTs, buffers, TTC signals distribution
--
-- Dave Newbold, February 2014

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.ipbus.all;
use work.mp7_data_types.all;
use work.mp7_counters_decl.all;
use work.mp7_readout_decl.all;
use work.ipbus_decode_mp7_datapath.all;

entity mp7_datapath is
	generic(
		NQUAD: positive;
		NQUAD_MAX: positive;
		CLOCK_RATIO: positive;
		LHC_BUNCH_COUNT: integer;
		NREFCLK: integer
	);
	port(
		clk: in std_logic; -- ipbus clock, rst, bus
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		qsel: in std_logic_vector(7 downto 0); -- quad / channel select
		clk40: in std_logic;
		clk_p: in std_logic; -- parallel data clock & rst
		rst_p: in std_logic;
		ttc_cmd: in std_logic_vector(3 downto 0);
		lock: out std_logic;
		cap_bus: in daq_cap_bus;
		daq_bus_in: in daq_bus;
		daq_bus_out: out daq_bus;
		refclkp: in std_logic_vector(NREFCLK - 1 downto 0); -- MGT refclks & IO
		refclkn: in std_logic_vector(NREFCLK - 1 downto 0);
		rxp: in std_logic_vector(NQUAD * 4 - 1 downto 0);
		rxn: in std_logic_vector(NQUAD * 4 - 1 downto 0);
		txp: out std_logic_vector(NQUAD * 4 - 1 downto 0);
		txn: out std_logic_vector(NQUAD * 4 - 1 downto 0);
		clkmon: out std_logic_vector(2 downto 0);  -- clock frequency monitoring outputs
		payload_q: in ldata(NQUAD * 4 - 1 downto 0); -- parallel data from payload
		payload_d: out ldata(NQUAD * 4 - 1 downto 0) -- parallel data to payload
	);

end mp7_datapath;

architecture rtl of mp7_datapath is
	
	signal mgt_d, mgt_q: ldata(NQUAD * 4 - 1 downto 0);
	signal bctrs: bctr_array(NQUAD - 1 downto 0);
	signal pctrs: pctr_array(NQUAD - 1 downto 0);
	signal octrs: octr_array(NQUAD - 1 downto 0);	
	signal rsts_p, bmaxs, bc0s: std_logic_vector(NQUAD - 1 downto 0);
	signal ttc_cmds: ttc_cmd_array(NQUAD - 1 downto 0);
	signal caps: daq_cap_bus_array(NQUAD - 1 downto 0);
	signal ipbw: ipb_wbus_array(N_SLAVES - 1 downto 0);
	signal ipbr: ipb_rbus_array(N_SLAVES - 1 downto 0);
	signal lock_i: std_logic;

begin

-- ipbus address decode
		
	fabric: entity work.ipbus_fabric_sel
    generic map(
    	NSLV => N_SLAVES,
    	SEL_WIDTH => IPBUS_SEL_WIDTH)
    port map(
      ipb_in => ipb_in,
      ipb_out => ipb_out,
      sel => ipbus_sel_mp7_datapath(ipb_in.ipb_addr),
      ipb_to_slaves => ipbw,
      ipb_from_slaves => ipbr
    );
    
-- Distribution of TTC signal and counter copies per quad

	cnt: entity work.mp7_counters
		generic map(
			NQUAD => NQUAD,
			NQUAD_MAX => NQUAD_MAX,
			CLOCK_RATIO => CLOCK_RATIO,
			LHC_BUNCH_COUNT => LHC_BUNCH_COUNT
		)
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipbw(N_SLV_DEBUG),
			ipb_out => ipbr(N_SLV_DEBUG),
			qsel => qsel(7 downto 3),
			clk_p => clk_p,
			rst_p => rst_p,
			ttc_cmd => ttc_cmd,
			lock => lock_i,
			cap_bus => cap_bus,
			rst_out => rsts_p,
			bctr => bctrs,
			pctr => pctrs,
			bmax => bmaxs,
			octr => octrs,
			bc0 => bc0s,
			ttc_cmd_out => ttc_cmds,
			cap_bus_out => caps
		);
		
	process(clk40) -- pipelining to let lock signal get back to top of chip in case of few quads
	begin
		if rising_edge(clk40) then
			lock <= lock_i;
		end if;
	end process;

-- MGT wrapper and control functions

	mgt: entity work.mp7_mgt
		generic map(
			NQUAD => NQUAD,
			CLOCK_RATIO => CLOCK_RATIO,
			LHC_BUNCH_COUNT => LHC_BUNCH_COUNT,
			NREFCLK => NREFCLK
		)
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipbw(N_SLV_MGT),
			ipb_out => ipbr(N_SLV_MGT),
			ipb_in_align => ipbw(N_SLV_ALIGN),
			ipb_out_align => ipbr(N_SLV_ALIGN),
			ipb_in_drp => ipbw(N_SLV_DRP), -- Replace by DRP bus later
			ipb_out_drp => ipbr(N_SLV_DRP),
			ipb_in_drp_com => ipbw(N_SLV_DRP_COM), -- Replace by DRP bus later
			ipb_out_drp_com => ipbr(N_SLV_DRP_COM),
			qsel => qsel(7 downto 1),
			clk_p => clk_p,
			rst_p => rsts_p,
			rst_ctrl => rst_p,
			bc0 => bc0s,
			d => mgt_d,
			q => mgt_q,
			refclkp => refclkp,
			refclkn => refclkn,
			rxp => rxp,
			rxn => rxn,
			txp => txp,
			txn => txn,
			refclk_mon => clkmon(0),
			txclk_mon => clkmon(1),
			rxclk_mon => clkmon(2)			
		);

-- Capture / playback / DAQ buffers
		
	buffers: entity work.mp7_new_buffers
		generic map(
			NQUAD => NQUAD,
			NQUAD_MAX => NQUAD_MAX,
			CLOCK_RATIO => CLOCK_RATIO,
			ADDR_WIDTH => 10,
			DR_ADDR_WIDTH => 9,
			LHC_BUNCH_COUNT => LHC_BUNCH_COUNT
		)
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipbw(N_SLV_CSR),
			ipb_out => ipbr(N_SLV_CSR),
			ipb_in_buf => ipbw(N_SLV_BUFFERS),
			ipb_out_buf => ipbr(N_SLV_BUFFERS),
			qsel => qsel,
			ttc_cmd => ttc_cmds,
			cap_bus => caps,
			daq_bus_in => daq_bus_in,
			daq_bus_out => daq_bus_out,
			clk_p => clk_p,
			rst_p => rsts_p,
			bctr => bctrs,
			pctr => pctrs,
			bmax => bmaxs,
			octr => octrs,
			mgt_d => mgt_d,
			mgt_q => mgt_q,
			algo_d => payload_d,
			algo_q => payload_q
		);
		
end rtl;

