library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ugmt_constants is

  constant NUM_MU_CHANS   : integer := 36;  -- Number of channels for input muons.
  constant NUM_CALO_CHANS : integer := 28;  -- Number of channels for energy sums.
  constant NUM_IN_CHANS   : integer := NUM_MU_CHANS+NUM_CALO_CHANS;  -- Number of input channels
  constant NUM_OUT_CHANS  : integer := 4;   -- Number of channels to GT.

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
  constant OVL_POS_LOW  : integer := 6;  -- End of pos. ovl region.
  constant FWD_POS_HIGH : integer := 5;
  constant FWD_POS_LOW  : integer := 0;

  -----------------------------------------------------------------------------
  -- Bit boundaries for input and output muons.
  -----------------------------------------------------------------------------
  constant WORD_SIZE : natural := 32;
  
  --
  -- in
  --

  constant ETA_IN_HIGH : natural := 63;
  constant ETA_IN_LOW  : natural := 55;

  constant QUAL_IN_HIGH : natural := 54;
  constant QUAL_IN_LOW  : natural := 51;

  constant PT_IN_HIGH : natural := 50;
  constant PT_IN_LOW  : natural := 42;

  constant PHI_IN_HIGH : natural := 41;
  constant PHI_IN_LOW  : natural := 32;

  constant SYSIGN_IN_HIGH : natural := 31; --63;
  constant SYSIGN_IN_LOW  : natural := 30; --62;

  constant ADDRESS_IN_HIGH : natural := 29;
  constant ADDRESS_IN_LOW  : natural := 0;

  --
  -- out
  --
  constant SYSIGN_OUT_HIGH : natural := 63;
  constant SYSIGN_OUT_LOW  : natural := 62;

  constant ETA_OUT_HIGH : natural := 61;
  constant ETA_OUT_LOW  : natural := 53;

  constant QUAL_OUT_HIGH : natural := 52;
  constant QUAL_OUT_LOW  : natural := 49;

  constant PT_OUT_HIGH : natural := 48;
  constant PT_OUT_LOW  : natural := 40;

  constant PHI_OUT_HIGH : natural := 39;
  constant PHI_OUT_LOW  : natural := 30;

  constant ISO_OUT_HIGH : natural := 29;
  constant ISO_OUT_LOW  : natural := 28;
  constant MU_QUAD_ASSIGNMENT : QuadAssignment_vector(8 downto 0) := (17, 16, 15, 14, 13, 12, 11, 10, 9);
end ugmt_constants;

package body ugmt_constants is


end ugmt_constants;
