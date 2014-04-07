
library ieee;
use ieee.std_logic_1164.all;


entity period_check is 
  port(
    -- Fabric clk_in/fabric_reset_in
		clk_in: in std_logic;
		rst_in: in std_logic;
		marker_in: in std_logic;
		stable_out: out std_logic
	);
end entity period_check;

architecture behave of period_check is
  
  type type_monitor_state is (
    INIT,
    WAIT_FOR_FIRST_ALIGN,
    WAIT_FOR_SECOND_ALIGN,
    CHECK,
    ERROR);
    
  signal monitor_state: type_monitor_state;  
	signal period_measured, period_check: integer;
	signal marker_check, marker_d0, marker_edge: std_logic;
	
begin

  

  monitor_proc: process(clk_in)
  
  begin
    if rising_edge(clk_in) then
      
      marker_d0 <= marker_in;
      
      if (marker_in = '1' and marker_d0 = '0') then
        marker_edge <= '1';
      else
        marker_edge <= '0';
      end if;
      
      if (rst_in = '1') then
        monitor_state <= INIT;
				marker_check <= '0';
        stable_out <= '0';
      else
        case monitor_state is

        when INIT =>

					-- Skip first edge to avoid st glitches in TTC
          if marker_edge = '1' then
						monitor_state <= WAIT_FOR_FIRST_ALIGN;
          end if;
					        
        when WAIT_FOR_FIRST_ALIGN =>
				
          if marker_edge = '1' then
            monitor_state <= WAIT_FOR_SECOND_ALIGN;
            period_measured <= 0;
          end if;

        when WAIT_FOR_SECOND_ALIGN =>
				
          if marker_edge = '1' then
            monitor_state <= CHECK;
						stable_out <= '0';
            period_check <= 0;
          else
            period_measured <= period_measured + 1;
          end if;
          
        when CHECK =>
        
          -- Local marker_in
          if period_check = period_measured -1 then
            marker_check <= '1';
          else
            marker_check <= '0';
          end if;
          -- Local counter for marker_in
          if marker_check = '1' then
            period_check <= 0;
          else
            period_check <= period_check + 1;
          end if;
          -- Check for both extra and mising align marker_ins
          if (marker_edge xor marker_check) = '1' then
            -- stable_out
						stable_out <= '0';
            monitor_state <= ERROR;
          else
            stable_out <= '1';
          end if;
          
        when ERROR =>
					-- Stays in stable_out until statmachine reset.
          null;
          
        end case;
      end if;
    end if;
    
  end process;

 
end architecture behave;



