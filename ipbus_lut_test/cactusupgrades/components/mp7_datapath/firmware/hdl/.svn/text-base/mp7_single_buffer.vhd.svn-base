-- mp7_single_buffer
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
use work.mp7_data_types.all;

entity mp7_single_buffer is
	generic(
		ADDR_WIDTH: integer;
		IPB_INDEX: integer
	);
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in_rxbuf: in ipb_wbus;
		ipb_out_rxbuf: out ipb_rbus;
		ipb_in_txbuf: in ipb_wbus;
		ipb_out_txbuf: out ipb_rbus;
    ctrl: in std_logic_vector(5 downto 0);
		clk_p: in std_logic; -- Parallel data clock
		lorb: std_logic_vector(11 downto 0);
		bx: std_logic_vector(11 downto 0);
		r_en: in std_logic;
		mgt_d: out lword;
		algo_q: in lword;
		mgt_q: in lword;
		algo_d: out lword;
		rxwe: in std_logic;
		txwe: in std_logic;
		rxaddr: in std_logic_vector(ADDR_WIDTH - 1 downto 0);
		txaddr: in std_logic_vector(ADDR_WIDTH - 1 downto 0)
	);

end mp7_single_buffer;

architecture rtl of mp7_single_buffer is

	signal rxq, txq, mgt_d_i, mgt_d_r, mgt_q_r, d_rx, q_rx, q_tx, algo_d_i: lword;
	signal rxdr, rxqr, txdr, txqr: std_logic_vector(35 downto 0);
	 
begin

-- Data routing and input registers

	reg_a: process(clk_p) -- Pipelining necessary to meet timing
	begin
		if rising_edge(clk_p) then
			mgt_q_r <= mgt_q;
			algo_d <= algo_d_i;
			mgt_d <= mgt_d_r;
		end if;
	end process;
	
	d_rx <= mgt_q_r when ctrl(5) = '0' else q_tx; -- Receive mgt input or pattern output
	algo_d_i <= d_rx when ctrl(1) = '0' else q_rx; -- Send received or generated data to algo
	mgt_d_i <= algo_q when ctrl(3) = '0' else q_tx; -- Send algo or generated data to mgt
	mgt_d_r <= mgt_d_i when ctrl(4) = '0' else mgt_q_r; -- Loopback from mgt rx to tx

-- rx-side buffer			

	rxdr <= '0' & d_rx.valid & d_rx.data(31 downto 16) & "00" & d_rx.data(15 downto 0);

	rxbuf: entity work.ipbus_ported_dpram36
		generic map(
			ADDR_WIDTH => ADDR_WIDTH
		)
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipb_in_rxbuf,
			ipb_out => ipb_out_rxbuf,
			rclk => clk_p,
			we => rxwe,
			d => rxdr,
			q => rxqr,
			addr => rxaddr
		);
		
	reg_b: process(clk_p)
	begin
		if rising_edge(clk_p) then
			rxq.data <= rxqr(33 downto 18) & rxqr(15 downto 0);
			rxq.valid <= rxqr(34);
		end if;
	end process;

	q_rx.data <= rxq.data when ctrl(0) = '0' else lorb & bx & std_logic_vector(to_unsigned(IPB_INDEX, 8));
	q_rx.valid <= rxq.valid and r_en when ctrl(0) = '0' else r_en;

-- tx-side buffer
	
	txdr <= '0' & algo_q.valid & algo_q.data(31 downto 16) & "00" & algo_q.data(15 downto 0);

	txbuf: entity work.ipbus_ported_dpram36
		generic map(
			ADDR_WIDTH => ADDR_WIDTH
		)
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipb_in_txbuf,
			ipb_out => ipb_out_txbuf,
			rclk => clk_p,
			we => txwe,
			d => txdr,
			q => txqr,
			addr => txaddr
		);
		
	reg_c: process(clk_p)
	begin
		if rising_edge(clk_p) then
			txq.data <= txqr(33 downto 18) & txqr(15 downto 0);
			txq.valid <= txqr(34);
		end if;
	end process;
	
	q_tx.data <= txq.data when ctrl(2) = '0' else lorb & bx & std_logic_vector(to_unsigned(IPB_INDEX + 1, 8));
	q_tx.valid <= txq.valid and r_en when ctrl(2) ='0' else r_en;
		
end rtl;

