library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ugmt_constants is

  constant NUM_MU_CHANS             : integer := 36;  -- Number of channels for input muons.
  constant NUM_CALO_CHANS           : integer := 28;  -- Number of channels for energy sums.
  constant NUM_IN_CHANS             : integer := NUM_MU_CHANS+NUM_CALO_CHANS;  -- Number of input channels
  constant NUM_OUT_CHANS            : integer := 4;  -- Number of channels to GT.
  constant NUM_INTERM_MU_OUT_CHANS  : integer := 8;  -- Number of channels
                                                      -- used for intermediate
                                                      -- muons.
  constant NUM_INTERM_SRT_OUT_CHANS : integer := 2;  -- Number of channels used
                                                     -- for interm. sort ranks.

  constant NUM_FRAMES_LINK : integer := 6;  -- Number of frames in a bunch crossing.
  constant NUM_MUONS_LINK : integer := 3;  -- Number of muons possible per link.
  constant NUM_MUONS_IN   : integer := 3;  -- Number of muons per input link
  constant NUM_MUONS_OUT  : integer := 2;  -- Number of muons per output link

  constant FWD_NEG_HIGH : integer := 35;
  constant FWD_NEG_LOW  : integer := 30;
  constant OVL_NEG_HIGH : integer := 29;
  constant OVL_NEG_LOW  : integer := 24;
  constant BARREL_HIGH  : integer := 23;  -- Begin of barrel region.
  constant BARREL_LOW   : integer := 12;  -- End of barrel region.
  constant OVL_POS_HIGH : integer := 11;  -- Begin of positiv ovl region.
  constant OVL_POS_LOW  : integer := 6;   -- End of pos. ovl region.
  constant FWD_POS_HIGH : integer := 5;
  constant FWD_POS_LOW  : integer := 0;

  -----------------------------------------------------------------------------
  -- Quad assignments
  -- IMPORTANT: THESE HAVE TO BE SYNCHRONIZED WITH AREA CONSTRAINTS IN .ucf
  -- file!
  -- Use the script ucf_serdes_constraints_generator.py for this. (Available in
  -- github repo for now.)
  -----------------------------------------------------------------------------
  type QuadAssignment_vector is array (integer range <>) of natural;

  -- Muons
  constant MU_QUAD_ASSIGNMENT : QuadAssignment_vector(8 downto 0) := (17, 16, 15, 14, 13, 12, 11, 10, 9);

  -- Calo
  constant ENERGY_QUAD_ASSIGNMENT : QuadAssignment_vector(6 downto 0) := (2, 3, 4, 5, 6, 7, 8);

  -----------------------------------------------------------------------------
  -- Bit boundaries for input and output muons.
  -----------------------------------------------------------------------------
  constant WORD_SIZE : natural := 32;

  --
  -- in
  --

  constant PT_IN_LOW  : natural := 0;
  constant PT_IN_HIGH : natural := 8;

  constant QUAL_IN_LOW  : natural := 9;
  constant QUAL_IN_HIGH : natural := 12;

  constant ETA_IN_LOW  : natural := 13;
  constant ETA_IN_HIGH : natural := 21;

  constant SYSIGN_IN_LOW  : natural := 23;
  constant SYSIGN_IN_HIGH : natural := 24;

  -- This crosses the word boundary in the incoming frames. As the MSB is a
  -- control bit we "lose" one bit here, so the bit numbering for the 31 MSBs
  -- is of by one. (i.e. out muon has 62 bits, not 64)
  constant PHI_IN_LOW  : natural := 25;
  constant PHI_IN_HIGH : natural := 34;

  constant ADDRESS_IN_LOW  : natural := 35;
  constant ADDRESS_IN_HIGH : natural := 62;

  --
  -- out
  --
  constant SYSIGN_OUT_HIGH : natural := 35;
  constant SYSIGN_OUT_LOW  : natural := 34;

  constant ISO_OUT_HIGH : natural := 33;
  constant ISO_OUT_LOW  : natural := 32;

  constant ETA_OUT_HIGH : natural := 31;
  constant ETA_OUT_LOW  : natural := 23;

  constant QUAL_OUT_HIGH : natural := 22;
  constant QUAL_OUT_LOW  : natural := 19;

  constant PT_OUT_HIGH : natural := 18;
  constant PT_OUT_LOW  : natural := 10;

  constant PHI_OUT_HIGH : natural := 9;
  constant PHI_OUT_LOW  : natural := 0;
  
end ugmt_constants;

package body ugmt_constants is


end ugmt_constants;
