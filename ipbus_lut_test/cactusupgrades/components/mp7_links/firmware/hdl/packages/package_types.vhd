 
library ieee;		   
use ieee.std_logic_1164.all;		   
use ieee.numeric_std.all;

library work;		   
package package_types is		   

-- type type_stdlogicvec_array is array(natural range <>) of std_logic_vector(natural range <>);
type type_vector_of_stdlogicvec_x64 is array(natural range <>) of std_logic_vector(63 downto 0);
type type_vector_of_stdlogicvec_x36 is array(natural range <>) of std_logic_vector(35 downto 0);
type type_vector_of_stdlogicvec_x34 is array(natural range <>) of std_logic_vector(33 downto 0);
type type_vector_of_stdlogicvec_x32 is array(natural range <>) of std_logic_vector(31 downto 0);
type type_vector_of_stdlogicvec_x26 is array(natural range <>) of std_logic_vector(25 downto 0);
type type_vector_of_stdlogicvec_x20 is array(natural range <>) of std_logic_vector(19 downto 0);
type type_vector_of_stdlogicvec_x17 is array(natural range <>) of std_logic_vector(16 downto 0);
type type_vector_of_stdlogicvec_x16 is array(natural range <>) of std_logic_vector(15 downto 0);
type type_vector_of_stdlogicvec_x15 is array(natural range <>) of std_logic_vector(14 downto 0);
type type_vector_of_stdlogicvec_x14 is array(natural range <>) of std_logic_vector(13 downto 0);
type type_vector_of_stdlogicvec_x13 is array(natural range <>) of std_logic_vector(12 downto 0);
type type_vector_of_stdlogicvec_x12 is array(natural range <>) of std_logic_vector(11 downto 0);
type type_vector_of_stdlogicvec_x9 is array(natural range <>) of std_logic_vector(8 downto 0);
type type_vector_of_stdlogicvec_x8 is array(natural range <>) of std_logic_vector(7 downto 0);
type type_vector_of_stdlogicvec_x6 is array(natural range <>) of std_logic_vector(5 downto 0);
type type_vector_of_stdlogicvec_x5 is array(natural range <>) of std_logic_vector(4 downto 0);
type type_vector_of_stdlogicvec_x4 is array(natural range <>) of std_logic_vector(3 downto 0);
type type_vector_of_stdlogicvec_x3 is array(natural range <>) of std_logic_vector(2 downto 0);
type type_vector_of_stdlogicvec_x2 is array(natural range <>) of std_logic_vector(1 downto 0);

--constant lhc_bunch_count: integer := 512;
   
end package_types;		 
