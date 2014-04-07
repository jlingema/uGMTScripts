
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library work;
use work.package_types.all;
use work.package_comm.all;
use work.package_modules.all;


entity xpoint_top is
generic(
    module:  type_mod_define);
port ( 
		clk_i : in  std_logic;
		rst_i : in  std_logic;
		comm_cntrl:        in type_comm_cntrl;
		comm_reply:        out type_comm_reply;	  
		load_o : out  std_logic;
		config_o : out  std_logic;
		sin_o : out  std_logic_vector (1 downto 0);
		sout_o : out  std_logic_vector (1 downto 0));
end xpoint_top;

architecture behavioral of xpoint_top is

	constant module_add_width_req: std_logic_vector(31 DOWNTO 0) := x"00000010";
	signal module_en, active: std_logic;

	signal xpoint_output_sel: natural range 0 to 7;

   type type_sel is array(natural range <>) of std_logic_vector(1 downto 0);

	type type_xpoint_state is (xpoint_init,xpoint_data,xpoint_load_step0,xpoint_load_step1,
                             xpoint_config_step0, xpoint_config_step1, xpoint_idle);
	signal xpoint_state: type_xpoint_state;
	
	signal rst_clked, prog, done: std_logic;
	signal reg_config: std_logic_vector(7 downto 0);

begin

  -- RefClk Selection
  -- 00 selects osc2
  -- 01 selects osc1
  -- 10 selects clk2
  -- 11 selects clk1
  
	xpoint_inst: entity work.xpoint
	port map ( 
		clk_i => clk_i,
		rst_i => rst_i,
		prog_i => prog,
		done_o => done,
		sel_for_out0_i => reg_config(1 downto 0),
		sel_for_out1_i => reg_config(3 downto 2),
		sel_for_out2_i => reg_config(5 downto 4),
		sel_for_out3_i => reg_config(7 downto 6),
		load_o => load_o,
		config_o => config_o,
		sin_o => sin_o,
		sout_o => sout_o
		);


   assert (module_add_width_req < module.addr_mask)
      report "Insufficient address width."
      severity failure;

  -- Does module base address match incoming address?
  module_en <= '1' when (comm_cntrl.add and (not module.addr_mask)) = module.addr_base else '0';

  wishbone: process(clk_i)
  begin

	if (clk_i'event and clk_i = '1') then
		rst_clked <= rst_i;
		-- Prog is pulsed signal.  Zero by default.
		prog <= '0';
		if (rst_clked = '1') then
			-- Clear comm bus
			active <= '0';
			comm_reply.rdata <= (others => '0');
			comm_reply.ack <= '0';
			reg_config <= (others => '0');
			prog <= '0';
		else
			if (comm_cntrl.stb = '1') and (module_en = '1') then
				-- Bus active and module selected
				if (active ='0') then
					active <= '1'; 
					comm_reply.ack <= '1';
					if comm_cntrl.wen = '1' then          
						case comm_cntrl.add(7 downto 0) is
						when x"00" => 
							reg_config <= comm_cntrl.wdata(7 downto 0);
						when x"01" => 
							prog <= comm_cntrl.wdata(0);
						when others =>
							null;
						end case;
					else  
						-- Read active
						case comm_cntrl.add(7 downto 0) is
						when x"00" =>
							comm_reply.rdata <= x"000000" & reg_config;
						when x"02" => 
							comm_reply.rdata <= x"0000000" &  "000" & done;
						when others =>
							comm_reply.rdata <= (others => '0');  -- spare registers
						end case;
					end if;
				end if;
			else
				-- No bus access
				active <= '0'; 
				comm_reply.ack <= '0';
				comm_reply.rdata <= (others => '0');
			end if;

		end if;
	end if;
	
  comm_reply.err <= '0';
	
  end process wishbone;

end behavioral;