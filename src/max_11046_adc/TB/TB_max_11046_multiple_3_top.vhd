--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:29:21 07/06/2016
-- Design Name:   
-- Module Name:   C:/Users/srusso/Desktop/test_max_11046/src/TB/TB_max_11046_multiple_3_top.vhd
-- Project Name:  test_max_11046
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: max_11046_multiple_3_top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

use work.max_11046_top_package.all;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_max_11046_multiple_3_top IS
END TB_max_11046_multiple_3_top;
 
ARCHITECTURE behavior OF TB_max_11046_multiple_3_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT max_11046_multiple_3_top
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start_write : IN  std_logic;
         start_read : IN  std_logic;
         EOC_ck : IN  std_logic;
         EOC_ccd1 : IN  std_logic;
         EOC_ccd2 : IN  std_logic;
         data_to_adc : IN  std_logic_vector(5 downto 0);
         data_from_adc : IN  std_logic_vector(15 downto 0);
         link_busy : OUT  std_logic;
         CS_ck : OUT  std_logic;
         CS_ccd1 : OUT  std_logic;
         CS_ccd2 : OUT  std_logic;
         RD : OUT  std_logic;
         WR : OUT  std_logic;
         CONVST_ck : OUT  std_logic;
         CONVST_ccd1 : OUT  std_logic;
         CONVST_ccd2 : OUT  std_logic;
         SHDN_ck : OUT  std_logic;
         SHDN_ccd1 : OUT  std_logic;
         SHDN_ccd2 : OUT  std_logic;
         write_en : OUT  std_logic;
         data_to_adc_out : OUT  std_logic_vector(3 downto 0);
         cnv_results_ck : OUT  array816;
			cnv_results_ccd1 : OUT  array816;
			cnv_results_ccd2 : OUT  array816
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal start_write : std_logic := '0';
   signal start_read : std_logic := '0';
   signal EOC_ck : std_logic := '0';
   signal EOC_ccd1 : std_logic := '0';
   signal EOC_ccd2 : std_logic := '0';
   signal data_to_adc : std_logic_vector(5 downto 0) := (others => '0');
   signal data_from_adc : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal link_busy : std_logic;
   signal CS_ck : std_logic;
   signal CS_ccd1 : std_logic;
   signal CS_ccd2 : std_logic;
   signal RD : std_logic;
   signal WR : std_logic;
   signal CONVST_ck : std_logic;
   signal CONVST_ccd1 : std_logic;
   signal CONVST_ccd2 : std_logic;
   signal SHDN_ck : std_logic;
   signal SHDN_ccd1 : std_logic;
   signal SHDN_ccd2 : std_logic;
   signal write_en : std_logic;
   signal data_to_adc_out : std_logic_vector(3 downto 0);
   signal cnv_results_ck : array816;
   signal cnv_results_ccd1 : array816;
   signal cnv_results_ccd2 : array816;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: max_11046_multiple_3_top PORT MAP (
          clk => clk,
          reset => reset,
          start_write => start_write,
          start_read => start_read,
          EOC_ck => EOC_ck,
          EOC_ccd1 => EOC_ccd1,
          EOC_ccd2 => EOC_ccd2,
          data_to_adc => data_to_adc,
          data_from_adc => data_from_adc,
          link_busy => link_busy,
          CS_ck => CS_ck,
          CS_ccd1 => CS_ccd1,
          CS_ccd2 => CS_ccd2,
          RD => RD,
          WR => WR,
          CONVST_ck => CONVST_ck,
          CONVST_ccd1 => CONVST_ccd1,
          CONVST_ccd2 => CONVST_ccd2,
          SHDN_ck => SHDN_ck,
          SHDN_ccd1 => SHDN_ccd1,
          SHDN_ccd2 => SHDN_ccd2,
          write_en => write_en,
          data_to_adc_out => data_to_adc_out,
          cnv_results_ck => cnv_results_ck,
          cnv_results_ccd1 => cnv_results_ccd1,
          cnv_results_ccd2 => cnv_results_ccd2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
		reset <= '0';

wait for 250 ns; 


data_to_adc <= "011101";
start_write <= '1';
wait for clk_period;
start_write <= '0';

wait for 3 us;

data_from_adc <= x"faca";
start_read <= '1';
wait for clk_period;
start_read <= '0';

wait until rising_edge (CONVST_ck);
wait for 100 ns;
EOC_ck <= '1';

wait for 1 us;
EOC_ck <= '0';

wait until falling_edge (RD);
wait until rising_edge (RD);
data_from_adc <= x"fac0";
wait until rising_edge (RD);
data_from_adc <= x"fac1";
wait until rising_edge (RD);
data_from_adc <= x"face";
wait until rising_edge (RD);
data_from_adc <= x"faff";
wait until rising_edge (RD);
data_from_adc <= x"faf0";

wait until rising_edge (CONVST_ccd1);
wait for 100 ns;
EOC_ccd1 <= '1';

wait for 1 us;
EOC_ccd1 <= '0';

wait until falling_edge (RD);
wait until rising_edge (RD);
data_from_adc <= x"dac0";
wait until rising_edge (RD);
data_from_adc <= x"dac1";
wait until rising_edge (RD);
data_from_adc <= x"dace";
wait until rising_edge (RD);
data_from_adc <= x"daff";
wait until rising_edge (RD);
data_from_adc <= x"daf0";


wait until rising_edge (CONVST_ccd2);
wait for 100 ns;
EOC_ccd2 <= '1';

wait for 1 us;
EOC_ccd2 <= '0';

wait until falling_edge (RD);
wait until rising_edge (RD);
data_from_adc <= x"bac0";
wait until rising_edge (RD);
data_from_adc <= x"bac1";
wait until rising_edge (RD);
data_from_adc <= x"bace";
wait until rising_edge (RD);
data_from_adc <= x"baff";
wait until rising_edge (RD);
data_from_adc <= x"baf0";

      wait;
   end process;


END;
