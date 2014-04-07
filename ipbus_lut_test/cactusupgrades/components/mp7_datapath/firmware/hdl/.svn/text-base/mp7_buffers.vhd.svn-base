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

entity mp7_buffers is
	generic(
		NQUAD: positive;
		CLOCK_RATIO: positive;
		ADDR_WIDTH: integer;
		LHC_BUNCH_COUNT: integer
	);
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		ipb_in_ctrl: in ipb_wbus;
		ipb_out_ctrl: out ipb_rbus;
		qsel: in std_logic_vector(6 downto 0); -- Quad / channel select
		go: in std_logic_vector(NQUAD - 1 downto 0); -- Capture buffer fill signal (clk40 domain)
		clk_p: in std_logic; -- Parallel data clock
		rst_p: in std_logic_vector(NQUAD - 1 downto 0); -- Parallel data clock domain reset
		bctr: in bctr_array(NQUAD - 1 downto 0);
		pctr: in pctr_array(NQUAD - 1 downto 0);
		bmax: in std_logic_vector(NQUAD - 1 downto 0);
		lock: in std_logic_vector(NQUAD - 1 downto 0);
		mgt_d: out ldata(NQUAD * 4 - 1 downto 0);
		algo_q: in ldata(NQUAD * 4 - 1 downto 0);
		mgt_q: in ldata(NQUAD * 4 - 1 downto 0);
		algo_d: out ldata(NQUAD * 4 - 1 downto 0)
	);

end mp7_buffers;

architecture rtl of mp7_buffers is

	signal ctrl: ipb_reg_v(2 downto 0);
	signal stat: ipb_reg_v(0 downto 0);
	signal stb: std_logic_vector(2 downto 0);
	signal ipb_in_q: ipb_wbus_array(8 * NQUAD - 1 downto 0);
	signal ipb_out_q: ipb_rbus_array(8 * NQUAD - 1 downto 0);
	signal stb_s, stb_s2, stb_sd: std_logic;
	signal qlock, cap_done: std_logic_vector(NQUAD - 1 downto 0) := (others => '0');
	
	attribute KEEP: string;
	attribute KEEP of stb_s: signal is "TRUE"; -- Synchroniser not to be optimised into shreg
	
begin

-- Control logic

	ctrlreg: entity work.ipbus_ctrlreg_v
		generic map(
			N_CTRL => 3,
			N_STAT => 1
		)
		port map(
			clk => clk,
			reset => rst,
			ipbus_in => ipb_in_ctrl,
			ipbus_out => ipb_out_ctrl,
			d => stat,
			q => ctrl,
			stb => stb
		);
		
	reg_stb: process(clk_p)
	begin
		if rising_edge(clk_p) then
			stb_s <= stb(1) or stb(2);
			stb_s2 <= stb_s; -- Sync reg
			stb_sd <= stb_s2;
		end if;
	end process;
	
	stat(0)(0) <= qlock(0);
	stat(0)(1) <= cap_done(0);
	stat(0)(31 downto 2) <= (others => '0');
				
	fabric: entity work.ipbus_fabric_sel
		generic map(
			NSLV => 8 * NQUAD,
			SEL_WIDTH => 8
		)
		port map(
			sel(7 downto 1) => qsel,
			sel(0) => ipb_in.ipb_addr(1),
			ipb_in => ipb_in,
			ipb_out => ipb_out,
			ipb_to_slaves => ipb_in_q,
			ipb_from_slaves => ipb_out_q
		);
		
-- Buffers

	quad_gen: for i in NQUAD - 1 downto 0 generate
	
		signal orb: std_logic_vector(11 downto 0);
		signal r_go, w_go, r_stop, w_stop, go_d: std_logic;
		signal we, r_en, w_en, r_en_r, w_en_r: std_logic := '0';

		signal rctr, wctr: std_logic_vector(14 downto 0);
		signal rxaddr, txaddr: std_logic_vector(ADDR_WIDTH - 1 downto 0);
		signal rxwe, txwe: std_logic;

	begin

		orb_proc: process(clk_p)
		begin
			if rising_edge(clk_p) then
				if rst_p(i) = '1' then -- Replace by orbit reset signal at some point
					orb <= (others => '0');
				elsif bmax(i) = '1' then
					orb <= std_logic_vector(unsigned(orb) + 1);
				end if;
			end if;
		end process;
		
		r_go <= '1' when bctr(i) = ctrl(2)(11 downto 0) else '0';
		w_go <= '1' when bctr(i) = ctrl(1)(11 downto 0) else '0';
		r_stop <= '1' when bctr(i) = ctrl(2)(27 downto 16) else '0';
		w_stop <= '1' when bctr(i) = ctrl(1)(27 downto 16) else '0';
		
		process(clk_p)
		begin
			if rising_edge(clk_p) then
				if unsigned(pctr(i)) = to_unsigned(CLOCK_RATIO - 1, 3) then
					r_en_r <= (r_en_r or r_go) and not r_stop;
					w_en_r <= (w_en_r or w_go) and not w_stop;
				end if;
				if bmax(i) = '1' then
					go_d <= go(i); 
					we <= (we or go(i)) and not go_d;
				end if;
				qlock(i) <= (qlock(i) or (lock(i) and bmax(i))) and not ((stb_s2 and not stb_sd) or rst_p(i));
				cap_done(i) <= ((cap_done(i) and not (go(i) and not go_d)) or (bmax(i) and we));
			end if;
		end process;
		
		r_en <= (r_en_r or r_go) and not r_stop;
		w_en <= (w_en_r or w_go) and not w_stop;

		rcount: entity work.bunch_ctr
			generic map(
				CLOCK_RATIO => CLOCK_RATIO,
				CLK_DIV => 1,
				CTR_WIDTH => rctr'length,
				LHC_BUNCH_COUNT => LHC_BUNCH_COUNT,
				OFFSET => 2,
				LOCK_CTR => false
			)
			port map(	
				clk => clk_p,
				rst => '0',
				clr => '0',
				bc0 => r_en,
				bctr => rctr
			);
		
		wcount: entity work.bunch_ctr
			generic map(
				CLOCK_RATIO => CLOCK_RATIO,
				CLK_DIV => 1,
				CTR_WIDTH => wctr'length,
				LHC_BUNCH_COUNT => LHC_BUNCH_COUNT,
				OFFSET => 0,
				LOCK_CTR => false
			)
			port map(	
				clk => clk_p,
				rst => '0',
				clr => '0',
				bc0 => w_en,
				bctr => wctr
			);
			
		rxwe <= we and w_en when ctrl(0)(1 downto 0) = "01" else '0';
		rxaddr <= wctr(ADDR_WIDTH - 1 downto 0) when ctrl(0)(1 downto 0) = "01" else rctr(ADDR_WIDTH - 1 downto 0);
		
		txwe <= we and w_en when ctrl(0)(3 downto 2) = "01" else '0';
		txaddr <= wctr(ADDR_WIDTH - 1 downto 0) when ctrl(0)(3 downto 2) = "01" else rctr(ADDR_WIDTH - 1 downto 0);
				
		chan_gen: for j in 3 downto 0 generate

			constant iw: integer := 4 * i + j;
			constant ipb_i: integer := 8 * i + 2 * j;

		begin

			sbuf: entity work.mp7_single_buffer
				generic map (
					ADDR_WIDTH => ADDR_WIDTH,
					IPB_INDEX => ipb_i
				)
				port map(
					clk => clk,
					rst => rst,
					ipb_in_rxbuf => ipb_in_q(ipb_i),
					ipb_out_rxbuf => ipb_out_q(ipb_i),
					ipb_in_txbuf => ipb_in_q(ipb_i + 1),
					ipb_out_txbuf => ipb_out_q(ipb_i + 1),
					ctrl => ctrl(0)(5 downto 0),
					clk_p => clk_p,
					lorb => orb,
					bx => bctr(i),
					r_en => r_en,
					mgt_d => mgt_d(iw),
					algo_q => algo_q(iw),
					mgt_q => mgt_q(iw),
					algo_d => algo_d(iw),
					rxwe => rxwe,
					txwe => txwe,
					rxaddr => rxaddr,
					txaddr => txaddr
				);
			
		end generate;
	end generate;
		
end rtl;

