-- mp7_buffers
--
-- Data capture / playback buffers
--
-- Captures / plays back one orbit
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.ipbus_reg_types.all;
use work.mp7_data_types.all;
use work.mp7_counters_decl.all;
use work.mp7_readout_decl.all;

entity mp7_new_buffers is
	generic(
		NQUAD: positive;
		NQUAD_MAX: positive;
		CLOCK_RATIO: positive;
		ADDR_WIDTH: integer;
		DR_ADDR_WIDTH: integer;
		LHC_BUNCH_COUNT: integer
	);
	port(
		clk: in std_logic; -- ipbus control signals
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		ipb_in_buf: in ipb_wbus;
		ipb_out_buf: out ipb_rbus;
		qsel: in std_logic_vector(7 downto 0); -- quad / channel select
		ttc_cmd: in ttc_cmd_array(NQUAD - 1 downto 0); 
		cap_bus: in daq_cap_bus_array(NQUAD - 1 downto 0); -- daq cature signal
		daq_bus_in: in daq_bus; -- daq readout bus
		daq_bus_out: out daq_bus;
		clk_p: in std_logic; -- parallel data clock & reset
		rst_p: in std_logic_vector(NQUAD - 1 downto 0);
		bctr: in bctr_array(NQUAD - 1 downto 0); -- bunch counter signals
		pctr: in pctr_array(NQUAD - 1 downto 0);
		bmax: in std_logic_vector(NQUAD - 1 downto 0);
		octr: in octr_array(NQUAD - 1 downto 0);
		mgt_d: out ldata(NQUAD * 4 - 1 downto 0); -- data IO
		algo_q: in ldata(NQUAD * 4 - 1 downto 0);
		mgt_q: in ldata(NQUAD * 4 - 1 downto 0);
		algo_d: out ldata(NQUAD * 4 - 1 downto 0)
	);

end mp7_new_buffers;

architecture rtl of mp7_new_buffers is

	signal ipb_in_q, ipb_in_q_buf: ipb_wbus_array(8 * NQUAD - 1 downto 0);
	signal ipb_out_q, ipb_out_q_buf: ipb_rbus_array(8 * NQUAD - 1 downto 0);
	signal mgt_d_r, algo_d_r: ldata(NQUAD * 4 - 1 downto 0);
	signal dbus: daq_bus_array(NQUAD_MAX downto 0);
	
begin

-- ipbus address decode

	fabric_ctrl: entity work.ipbus_fabric_sel
		generic map(
			NSLV => 8 * NQUAD,
			SEL_WIDTH => 8
		)
		port map(
			sel => qsel,
			ipb_in => ipb_in,
			ipb_out => ipb_out,
			ipb_to_slaves => ipb_in_q,
			ipb_from_slaves => ipb_out_q
		);
		
-- ipbus address decode (buffers)

	fabric_buf: entity work.ipbus_fabric_sel
		generic map(
			NSLV => 8 * NQUAD,
			SEL_WIDTH => 8
		)
		port map(
			sel => qsel,
			ipb_in => ipb_in_buf,
			ipb_out => ipb_out_buf,
			ipb_to_slaves => ipb_in_q_buf,
			ipb_from_slaves => ipb_out_q_buf
		);

-- Pipelining of big data paths

	process(clk_p)
	begin
		if rising_edge(clk_p) then
			mgt_d <= mgt_d_r;
			algo_d <= algo_d_r;
		end if;
	end process;
	
-- DAQ bus

	dbus(0) <= daq_bus_in;
	daq_bus_out <= dbus(NQUAD_MAX);

-- Buffers

	qgen: for i in 0 to NQUAD_MAX - 1 generate

		signal dbus_chan: daq_bus_array(8 downto 0);

		attribute KEEP: string;
		attribute KEEP of dbus_chan: signal is "TRUE"; -- not to be optimised into shreg

	begin

		dbus_chan(0) <= dbus(i);
		dbus(i + 1) <= dbus_chan(8);

		cgen: if i < NQUAD generate
		
			chan_gen: for j in 0 to 3 generate
	
				constant iw: integer := 4 * i + j;
				constant ipb_i: integer := 8 * i + 2 * j;
				constant idbus: integer := 2 * j;
		
			begin
				
				rxbuf: entity work.mp7_chan_buffer
					generic map (
						CLOCK_RATIO => CLOCK_RATIO,
						ADDR_WIDTH => ADDR_WIDTH,
						DR_ADDR_WIDTH => DR_ADDR_WIDTH,
						LHC_BUNCH_COUNT => LHC_BUNCH_COUNT,
						INDEX => ipb_i
					)
					port map(
						clk => clk,
						rst => rst,
						ipb_in => ipb_in_q(ipb_i),
						ipb_out => ipb_out_q(ipb_i),
						ipb_in_buf => ipb_in_q_buf(ipb_i),
						ipb_out_buf => ipb_out_q_buf(ipb_i),
						clk_p => clk_p,
						rst_p => rst_p(i),
						orb => octr(i),
						bctr => bctr(i),
						pctr => pctr(i),
						bmax => bmax(i),
						ttc_cmd => ttc_cmd(i),
						cap_bus => cap_bus(i),
						daq_bus_in => dbus_chan(idbus),
						daq_bus_out => dbus_chan(idbus + 1), 
						d => mgt_q(iw),
						q => algo_d_r(iw)
					);

				txbuf: entity work.mp7_chan_buffer
					generic map (
						CLOCK_RATIO => CLOCK_RATIO,
						ADDR_WIDTH => ADDR_WIDTH,
						DR_ADDR_WIDTH => DR_ADDR_WIDTH,					
						LHC_BUNCH_COUNT => LHC_BUNCH_COUNT,
						INDEX => ipb_i + 1
					)
					port map(
						clk => clk,
						rst => rst,
						ipb_in => ipb_in_q(ipb_i + 1),
						ipb_out => ipb_out_q(ipb_i + 1),
						ipb_in_buf => ipb_in_q_buf(ipb_i + 1),
						ipb_out_buf => ipb_out_q_buf(ipb_i + 1),
						clk_p => clk_p,
						rst_p => rst_p(i),
						orb => octr(i),
						bctr => bctr(i),
						pctr => pctr(i),
						bmax => bmax(i),
						ttc_cmd => ttc_cmd(i),
						cap_bus => cap_bus(i),
						daq_bus_in => dbus_chan(idbus + 1),
						daq_bus_out => dbus_chan(idbus + 2),
						d => algo_q(iw),
						q => mgt_d_r(iw)
					);
					
			end generate;
		
		end generate;
			
		ncgen: if i >= NQUAD generate
			process(clk_p)
			begin
				if rising_edge(clk_p) then
					dbus_chan(8) <= dbus_chan(0);
				end if;
			end process;
		end generate;

	end generate;
		
end rtl;

