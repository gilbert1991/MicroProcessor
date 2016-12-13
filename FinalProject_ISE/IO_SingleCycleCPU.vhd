----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:50:00 12/12/2016 
-- Design Name: 
-- Module Name:    IO_SingleCycleCPU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IO_SingleCycleCPU is
    Port ( sw : in  STD_LOGIC_VECTOR (15 downto 0);
			  clkin : in STD_LOGIC;
			  btnd_clr : in std_logic;
			  btnl : in std_logic;
--			  btnr_din : in std_logic;
--			  btnu_osel : in std_logic;
			  led : out std_logic_vector(1 downto 0);
			  sseg : out std_logic_vector(6 downto 0);
           an : inout  STD_LOGIC_VECTOR (7 downto 0));
end IO_SingleCycleCPU;

architecture Behavioral of IO_SingleCycleCPU is

component SingleCycleCPU is
    Port ( Clock : in  STD_LOGIC;
           Clear : in  STD_LOGIC;
			  sel_Addr : in STD_LOGIC_VECTOR (7 downto 0);
			  DMem_out : out STD_LOGIC_VECTOR (31 downto 0);
			  IMem_out  : out STD_LOGIC_VECTOR (31 downto 0);
			  GPR_out : out STD_LOGIC_VECTOR (31 downto 0);
			  PC_current: out STD_LOGIC_VECTOR (31 downto 0)
			 );
end component;

signal s_clock : std_logic := '0';
signal fake_clock : STD_LOGIC;
signal sel_Addr : STD_LOGIC_VECTOR (7 downto 0);
signal DMem_out : STD_LOGIC_VECTOR (31 downto 0);
signal IMem_out : STD_LOGIC_VECTOR (31 downto 0);
signal GPR_out : STD_LOGIC_VECTOR (31 downto 0);
signal PC_current : STD_LOGIC_VECTOR (31 downto 0);

--signal new_Instruction : STD_LOGIC_VECTOR (15 downto 0);	-- just for input

component SSeg_Display is
    Port ( clkin : in std_logic;
			  btnd_clr : in std_logic;
			  Disp_bits : in std_logic_vector(31 downto 0);	-- 32 bits to be displayed on 8 7-segments.
           an : inout  STD_LOGIC_VECTOR (7 downto 0);
			  sseg : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal Disp_bits : std_logic_vector(31 downto 0);


--Type input_phase is ();

begin

SSeg_Disp: SSeg_Display port map(clkin, btnd_clr,Disp_bits,an,sseg);
SingleCycleProcessor: SingleCycleCPU port map(fake_clock, btnd_Clr, sel_Addr, DMem_out, IMem_out, GPR_out, PC_current);

	slow_clock: process(btnd_clr,clkin) 
	begin
		if (rising_edge(clkin)) then		-- The s_clock period is 2 times clkin
			s_clock <= not s_clock;
		end if;
--		if (btnd_clr = '1') then
--			clock_counter <= "00";
--		elsif (rising_edge(clkin)) then
--			if (clock_counter = "00") then
--				s_clock <= not s_clock;
--			end if;
--			
--			if (clock_counter = "01") then		-- clock period is 2 times clkin.
--				clock_counter <= "00";
--			else
--				clock_counter <= clock_counter + 1;
--			end if;
--		end if;
	end process;


	with sw(15) select
		fake_clock <= btnl when '0',
						s_clock when others;
	
	sel_Addr <= sw(7 downto 0);
	
	with sw(14 downto 12) select
		Disp_bits <= GPR_out when "000",
							DMem_out when "100",
							Pc_current when "110",
							IMem_out when "010",
							x"0000" & sw when others;
	
	led <= sw(14 downto 13);
					
							
--	new_Instruction <= sw;

end Behavioral;

