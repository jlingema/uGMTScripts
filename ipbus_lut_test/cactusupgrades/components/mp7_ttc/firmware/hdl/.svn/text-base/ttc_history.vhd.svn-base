-- ttc_history
--
-- Stores the history of TTC A/B commands for debugging
--
-- FIFO is filled with information after 'go' is asserted
-- 
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;

entity ttc_history is
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		ttc_clk: in std_logic; -- TTC clk40
		go: in std_logic; -- Start signal (ttc_clk domain)
		mask_bc0: in std_logic;
		ttc_l1a: in std_logic;
		ttc_cmd: in std_logic_vector(3 downto 0);
		ttc_bx: in std_logic_vector(11 downto 0);
		ttc_orb: in std_logic_vector(23 downto 0)
	);

end ttc_history;

architecture rtl of ttc_history is
	COMPONENT ttc_history_fifo
		PORT (
			rst : IN STD_LOGIC;
			wr_clk : IN STD_LOGIC;
			rd_clk : IN STD_LOGIC;
			din : IN STD_LOGIC_VECTOR(44 DOWNTO 0);
			wr_en : IN STD_LOGIC;
			rd_en : IN STD_LOGIC;
			dout : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
			full : OUT STD_LOGIC;
			empty : OUT STD_LOGIC;
			valid : OUT STD_LOGIC
		);
	END COMPONENT;

	signal run, full, valid, wen, ph, ren, ipb_ren: std_logic;
	signal d, q: std_logic_vector(44 downto 0);

begin

	process(ttc_clk)
	begin
		if rising_edge(ttc_clk) then
			run <= (run or go) and not full;
		end if;
	end process;

	d <= ttc_l1a & ttc_orb & ttc_bx & "0000" & ttc_cmd;
	wen <= '1' when (ttc_l1a = '1' or (ttc_cmd /= X"0" and not (ttc_cmd = X"1" and mask_bc0 = '1')))
		and run = '1' else '0';
	
	fifo: ttc_history_fifo
		port map(
			rst => rst,
			wr_clk => ttc_clk,
			rd_clk => clk,
			din => d,
			wr_en => wen,
			rd_en => ren,
			dout => q,
			full => full,
			empty => open,
			valid => valid
		);

	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				ph <= '0';
			elsif ipb_ren = '1' then
				ph <= not ph;
			end if;
		end if;
	end process;
	
	ipb_ren <= ipb_in.ipb_strobe and not ipb_in.ipb_write;
	ren <= ipb_ren and ph;

	ipb_out.ipb_rdata(31 downto 24) <= valid & "000000" & q(44);
	ipb_out.ipb_rdata(23 downto 0) <= q(43 downto 20) when ph = '1' else X"0" & q(19 downto 0);
	ipb_out.ipb_ack <= ipb_ren;
	ipb_out.ipb_err <= '0';

end rtl;
