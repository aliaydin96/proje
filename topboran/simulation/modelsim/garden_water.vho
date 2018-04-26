-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.1.0 Build 186 12/03/2014 SJ Web Edition"

-- DATE "04/26/2018 15:35:27"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	garden_water IS
    PORT (
	clk : IN std_logic;
	start_button : IN std_logic;
	switch : IN std_logic_vector(1 DOWNTO 0);
	led_out : BUFFER std_logic_vector(9 DOWNTO 0);
	seven_display : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END garden_water;

-- Design Ports Information
-- led_out[0]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_out[1]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_out[2]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_out[3]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_out[4]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_out[5]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_out[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_out[7]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_out[8]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_out[9]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seven_display[0]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seven_display[1]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seven_display[2]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seven_display[3]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seven_display[4]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seven_display[5]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seven_display[6]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start_button	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF garden_water IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_start_button : std_logic;
SIGNAL ww_switch : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_led_out : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_seven_display : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \switch[0]~input_o\ : std_logic;
SIGNAL \switch[1]~input_o\ : std_logic;
SIGNAL \comb_3|Add1~101_sumout\ : std_logic;
SIGNAL \start_button~input_o\ : std_logic;
SIGNAL \comb_3|LessThan0~0_combout\ : std_logic;
SIGNAL \comb_3|always1~5_combout\ : std_logic;
SIGNAL \comb_3|start_counter[6]~0_combout\ : std_logic;
SIGNAL \comb_3|Add1~102\ : std_logic;
SIGNAL \comb_3|Add1~105_sumout\ : std_logic;
SIGNAL \comb_3|Add1~106\ : std_logic;
SIGNAL \comb_3|Add1~117_sumout\ : std_logic;
SIGNAL \comb_3|Add1~118\ : std_logic;
SIGNAL \comb_3|Add1~121_sumout\ : std_logic;
SIGNAL \comb_3|Add1~122\ : std_logic;
SIGNAL \comb_3|Add1~125_sumout\ : std_logic;
SIGNAL \comb_3|Add1~126\ : std_logic;
SIGNAL \comb_3|Add1~113_sumout\ : std_logic;
SIGNAL \comb_3|Add1~114\ : std_logic;
SIGNAL \comb_3|Add1~109_sumout\ : std_logic;
SIGNAL \comb_3|Add1~110\ : std_logic;
SIGNAL \comb_3|Add1~49_sumout\ : std_logic;
SIGNAL \comb_3|Add1~50\ : std_logic;
SIGNAL \comb_3|Add1~53_sumout\ : std_logic;
SIGNAL \comb_3|Add1~54\ : std_logic;
SIGNAL \comb_3|Add1~9_sumout\ : std_logic;
SIGNAL \comb_3|Add1~10\ : std_logic;
SIGNAL \comb_3|Add1~13_sumout\ : std_logic;
SIGNAL \comb_3|Add1~14\ : std_logic;
SIGNAL \comb_3|Add1~17_sumout\ : std_logic;
SIGNAL \comb_3|Add1~18\ : std_logic;
SIGNAL \comb_3|Add1~21_sumout\ : std_logic;
SIGNAL \comb_3|Add1~22\ : std_logic;
SIGNAL \comb_3|Add1~25_sumout\ : std_logic;
SIGNAL \comb_3|Add1~26\ : std_logic;
SIGNAL \comb_3|Add1~29_sumout\ : std_logic;
SIGNAL \comb_3|Add1~30\ : std_logic;
SIGNAL \comb_3|Add1~5_sumout\ : std_logic;
SIGNAL \comb_3|Add1~6\ : std_logic;
SIGNAL \comb_3|Add1~57_sumout\ : std_logic;
SIGNAL \comb_3|Add1~58\ : std_logic;
SIGNAL \comb_3|Add1~61_sumout\ : std_logic;
SIGNAL \comb_3|Add1~62\ : std_logic;
SIGNAL \comb_3|Add1~65_sumout\ : std_logic;
SIGNAL \comb_3|Add1~66\ : std_logic;
SIGNAL \comb_3|Add1~69_sumout\ : std_logic;
SIGNAL \comb_3|Add1~70\ : std_logic;
SIGNAL \comb_3|Add1~73_sumout\ : std_logic;
SIGNAL \comb_3|Add1~74\ : std_logic;
SIGNAL \comb_3|Add1~77_sumout\ : std_logic;
SIGNAL \comb_3|Add1~78\ : std_logic;
SIGNAL \comb_3|Add1~81_sumout\ : std_logic;
SIGNAL \comb_3|Add1~82\ : std_logic;
SIGNAL \comb_3|Add1~85_sumout\ : std_logic;
SIGNAL \comb_3|Add1~86\ : std_logic;
SIGNAL \comb_3|Add1~89_sumout\ : std_logic;
SIGNAL \comb_3|Add1~90\ : std_logic;
SIGNAL \comb_3|Add1~93_sumout\ : std_logic;
SIGNAL \comb_3|Add1~94\ : std_logic;
SIGNAL \comb_3|Add1~97_sumout\ : std_logic;
SIGNAL \comb_3|Add1~98\ : std_logic;
SIGNAL \comb_3|Add1~1_sumout\ : std_logic;
SIGNAL \comb_3|Add1~2\ : std_logic;
SIGNAL \comb_3|Add1~33_sumout\ : std_logic;
SIGNAL \comb_3|Add1~34\ : std_logic;
SIGNAL \comb_3|Add1~37_sumout\ : std_logic;
SIGNAL \comb_3|Add1~38\ : std_logic;
SIGNAL \comb_3|Add1~41_sumout\ : std_logic;
SIGNAL \comb_3|Add1~42\ : std_logic;
SIGNAL \comb_3|Add1~45_sumout\ : std_logic;
SIGNAL \comb_3|always1~1_combout\ : std_logic;
SIGNAL \comb_3|always1~3_combout\ : std_logic;
SIGNAL \comb_3|always1~2_combout\ : std_logic;
SIGNAL \comb_3|always1~0_combout\ : std_logic;
SIGNAL \comb_3|always1~4_combout\ : std_logic;
SIGNAL \comb_3|Equal5~0_combout\ : std_logic;
SIGNAL \comb_3|ta~0_combout\ : std_logic;
SIGNAL \comb_3|Add0~33_sumout\ : std_logic;
SIGNAL \comb_3|clock_en~1_combout\ : std_logic;
SIGNAL \comb_3|Add0~118\ : std_logic;
SIGNAL \comb_3|Add0~113_sumout\ : std_logic;
SIGNAL \comb_3|Equal4~5_combout\ : std_logic;
SIGNAL \comb_3|Equal4~6_combout\ : std_logic;
SIGNAL \comb_3|Add0~114\ : std_logic;
SIGNAL \comb_3|Add0~1_sumout\ : std_logic;
SIGNAL \comb_3|Add0~2\ : std_logic;
SIGNAL \comb_3|Add0~53_sumout\ : std_logic;
SIGNAL \comb_3|Add0~54\ : std_logic;
SIGNAL \comb_3|Add0~73_sumout\ : std_logic;
SIGNAL \comb_3|Add0~74\ : std_logic;
SIGNAL \comb_3|Add0~29_sumout\ : std_logic;
SIGNAL \comb_3|Add0~30\ : std_logic;
SIGNAL \comb_3|Add0~5_sumout\ : std_logic;
SIGNAL \comb_3|Equal4~0_combout\ : std_logic;
SIGNAL \comb_3|Equal4~2_combout\ : std_logic;
SIGNAL \comb_3|Add0~6\ : std_logic;
SIGNAL \comb_3|Add0~89_sumout\ : std_logic;
SIGNAL \comb_3|Equal4~3_combout\ : std_logic;
SIGNAL \comb_3|Equal4~1_combout\ : std_logic;
SIGNAL \comb_3|Equal4~4_combout\ : std_logic;
SIGNAL \comb_3|counter[27]~0_combout\ : std_logic;
SIGNAL \comb_3|Add0~34\ : std_logic;
SIGNAL \comb_3|Add0~77_sumout\ : std_logic;
SIGNAL \comb_3|Add0~78\ : std_logic;
SIGNAL \comb_3|Add0~81_sumout\ : std_logic;
SIGNAL \comb_3|Add0~82\ : std_logic;
SIGNAL \comb_3|Add0~85_sumout\ : std_logic;
SIGNAL \comb_3|Add0~86\ : std_logic;
SIGNAL \comb_3|Add0~69_sumout\ : std_logic;
SIGNAL \comb_3|Add0~70\ : std_logic;
SIGNAL \comb_3|Add0~65_sumout\ : std_logic;
SIGNAL \comb_3|Add0~66\ : std_logic;
SIGNAL \comb_3|Add0~109_sumout\ : std_logic;
SIGNAL \comb_3|Add0~110\ : std_logic;
SIGNAL \comb_3|Add0~61_sumout\ : std_logic;
SIGNAL \comb_3|Add0~62\ : std_logic;
SIGNAL \comb_3|Add0~57_sumout\ : std_logic;
SIGNAL \comb_3|Add0~58\ : std_logic;
SIGNAL \comb_3|Add0~25_sumout\ : std_logic;
SIGNAL \comb_3|Add0~26\ : std_logic;
SIGNAL \comb_3|Add0~21_sumout\ : std_logic;
SIGNAL \comb_3|Add0~22\ : std_logic;
SIGNAL \comb_3|Add0~105_sumout\ : std_logic;
SIGNAL \comb_3|Add0~106\ : std_logic;
SIGNAL \comb_3|Add0~17_sumout\ : std_logic;
SIGNAL \comb_3|Add0~18\ : std_logic;
SIGNAL \comb_3|Add0~13_sumout\ : std_logic;
SIGNAL \comb_3|Add0~14\ : std_logic;
SIGNAL \comb_3|Add0~9_sumout\ : std_logic;
SIGNAL \comb_3|Add0~10\ : std_logic;
SIGNAL \comb_3|Add0~101_sumout\ : std_logic;
SIGNAL \comb_3|Add0~102\ : std_logic;
SIGNAL \comb_3|Add0~97_sumout\ : std_logic;
SIGNAL \comb_3|Add0~98\ : std_logic;
SIGNAL \comb_3|Add0~93_sumout\ : std_logic;
SIGNAL \comb_3|Add0~94\ : std_logic;
SIGNAL \comb_3|Add0~125_sumout\ : std_logic;
SIGNAL \comb_3|Add0~126\ : std_logic;
SIGNAL \comb_3|Add0~49_sumout\ : std_logic;
SIGNAL \comb_3|Add0~50\ : std_logic;
SIGNAL \comb_3|Add0~45_sumout\ : std_logic;
SIGNAL \comb_3|Add0~46\ : std_logic;
SIGNAL \comb_3|Add0~41_sumout\ : std_logic;
SIGNAL \comb_3|Add0~42\ : std_logic;
SIGNAL \comb_3|Add0~37_sumout\ : std_logic;
SIGNAL \comb_3|Add0~38\ : std_logic;
SIGNAL \comb_3|Add0~121_sumout\ : std_logic;
SIGNAL \comb_3|Add0~122\ : std_logic;
SIGNAL \comb_3|Add0~117_sumout\ : std_logic;
SIGNAL \comb_3|clock_en~0_combout\ : std_logic;
SIGNAL \comb_3|clock_en~2_combout\ : std_logic;
SIGNAL \comb_3|clock_en~q\ : std_logic;
SIGNAL \comb_3|always2~1_combout\ : std_logic;
SIGNAL \comb_3|LessThan2~0_combout\ : std_logic;
SIGNAL \comb_3|led_out[9]~5_combout\ : std_logic;
SIGNAL \comb_3|always2~2_combout\ : std_logic;
SIGNAL \comb_3|led_out[9]~1_combout\ : std_logic;
SIGNAL \comb_3|Equal5~1_combout\ : std_logic;
SIGNAL \comb_3|led_out[9]~6_combout\ : std_logic;
SIGNAL \comb_3|led_out[9]~2_combout\ : std_logic;
SIGNAL \comb_3|led_out[8]~3_combout\ : std_logic;
SIGNAL \comb_3|led_out[8]~4_combout\ : std_logic;
SIGNAL \comb_3|tb[10]~0_combout\ : std_logic;
SIGNAL \comb_3|tb[0]~1_combout\ : std_logic;
SIGNAL \comb_3|always2~0_combout\ : std_logic;
SIGNAL \comb_3|Mux8~0_combout\ : std_logic;
SIGNAL \comb_3|led_out[2]~0_combout\ : std_logic;
SIGNAL \comb_3|Mux7~0_combout\ : std_logic;
SIGNAL \comb_3|Mux6~0_combout\ : std_logic;
SIGNAL \comb_3|Mux5~0_combout\ : std_logic;
SIGNAL \comb_3|Mux4~0_combout\ : std_logic;
SIGNAL \comb_3|Mux3~0_combout\ : std_logic;
SIGNAL \comb_3|Mux2~0_combout\ : std_logic;
SIGNAL \comb_3|always2~3_combout\ : std_logic;
SIGNAL \comb_3|Mux9~0_combout\ : std_logic;
SIGNAL \comb_3|Mux9~1_combout\ : std_logic;
SIGNAL \comb_3|Add5~105_sumout\ : std_logic;
SIGNAL \comb_3|ssm_counter[21]~0_combout\ : std_logic;
SIGNAL \comb_3|Add5~106\ : std_logic;
SIGNAL \comb_3|Add5~109_sumout\ : std_logic;
SIGNAL \comb_3|Add5~110\ : std_logic;
SIGNAL \comb_3|Add5~113_sumout\ : std_logic;
SIGNAL \comb_3|Add5~114\ : std_logic;
SIGNAL \comb_3|Add5~117_sumout\ : std_logic;
SIGNAL \comb_3|Add5~118\ : std_logic;
SIGNAL \comb_3|Add5~121_sumout\ : std_logic;
SIGNAL \comb_3|Add5~122\ : std_logic;
SIGNAL \comb_3|Add5~125_sumout\ : std_logic;
SIGNAL \comb_3|Equal8~5_combout\ : std_logic;
SIGNAL \comb_3|Add5~126\ : std_logic;
SIGNAL \comb_3|Add5~57_sumout\ : std_logic;
SIGNAL \comb_3|Add5~58\ : std_logic;
SIGNAL \comb_3|Add5~61_sumout\ : std_logic;
SIGNAL \comb_3|Add5~62\ : std_logic;
SIGNAL \comb_3|Add5~65_sumout\ : std_logic;
SIGNAL \comb_3|Add5~66\ : std_logic;
SIGNAL \comb_3|Add5~69_sumout\ : std_logic;
SIGNAL \comb_3|Add5~70\ : std_logic;
SIGNAL \comb_3|Add5~73_sumout\ : std_logic;
SIGNAL \comb_3|Add5~74\ : std_logic;
SIGNAL \comb_3|Add5~77_sumout\ : std_logic;
SIGNAL \comb_3|Add5~78\ : std_logic;
SIGNAL \comb_3|Add5~33_sumout\ : std_logic;
SIGNAL \comb_3|Add5~34\ : std_logic;
SIGNAL \comb_3|Add5~37_sumout\ : std_logic;
SIGNAL \comb_3|Add5~38\ : std_logic;
SIGNAL \comb_3|Add5~41_sumout\ : std_logic;
SIGNAL \comb_3|Add5~42\ : std_logic;
SIGNAL \comb_3|Add5~45_sumout\ : std_logic;
SIGNAL \comb_3|Add5~46\ : std_logic;
SIGNAL \comb_3|Add5~53_sumout\ : std_logic;
SIGNAL \comb_3|Add5~54\ : std_logic;
SIGNAL \comb_3|Add5~9_sumout\ : std_logic;
SIGNAL \comb_3|Add5~10\ : std_logic;
SIGNAL \comb_3|Add5~13_sumout\ : std_logic;
SIGNAL \comb_3|Add5~14\ : std_logic;
SIGNAL \comb_3|Add5~17_sumout\ : std_logic;
SIGNAL \comb_3|Add5~18\ : std_logic;
SIGNAL \comb_3|Add5~21_sumout\ : std_logic;
SIGNAL \comb_3|Add5~22\ : std_logic;
SIGNAL \comb_3|Add5~97_sumout\ : std_logic;
SIGNAL \comb_3|Add5~98\ : std_logic;
SIGNAL \comb_3|Add5~101_sumout\ : std_logic;
SIGNAL \comb_3|Add5~102\ : std_logic;
SIGNAL \comb_3|Add5~49_sumout\ : std_logic;
SIGNAL \comb_3|Add5~50\ : std_logic;
SIGNAL \comb_3|Add5~93_sumout\ : std_logic;
SIGNAL \comb_3|Add5~94\ : std_logic;
SIGNAL \comb_3|Add5~89_sumout\ : std_logic;
SIGNAL \comb_3|Add5~90\ : std_logic;
SIGNAL \comb_3|Add5~85_sumout\ : std_logic;
SIGNAL \comb_3|Add5~86\ : std_logic;
SIGNAL \comb_3|Add5~81_sumout\ : std_logic;
SIGNAL \comb_3|Equal8~4_combout\ : std_logic;
SIGNAL \comb_3|Equal8~2_combout\ : std_logic;
SIGNAL \comb_3|Add5~82\ : std_logic;
SIGNAL \comb_3|Add5~5_sumout\ : std_logic;
SIGNAL \comb_3|Add5~6\ : std_logic;
SIGNAL \comb_3|Add5~1_sumout\ : std_logic;
SIGNAL \comb_3|Equal8~0_combout\ : std_logic;
SIGNAL \comb_3|Add5~2\ : std_logic;
SIGNAL \comb_3|Add5~29_sumout\ : std_logic;
SIGNAL \comb_3|Add5~30\ : std_logic;
SIGNAL \comb_3|Add5~25_sumout\ : std_logic;
SIGNAL \comb_3|Equal8~1_combout\ : std_logic;
SIGNAL \comb_3|Equal8~3_combout\ : std_logic;
SIGNAL \comb_3|Equal8~6_combout\ : std_logic;
SIGNAL \comb_3|ssm~3_combout\ : std_logic;
SIGNAL \comb_3|Add4~1_sumout\ : std_logic;
SIGNAL \comb_3|Mux45~0_combout\ : std_logic;
SIGNAL \comb_3|Mux45~1_combout\ : std_logic;
SIGNAL \comb_3|led_out1[30]~0_combout\ : std_logic;
SIGNAL \comb_3|ssm~1_combout\ : std_logic;
SIGNAL \comb_3|ssm~0_combout\ : std_logic;
SIGNAL \comb_3|Mux13~0_combout\ : std_logic;
SIGNAL \comb_3|led_out1~2_combout\ : std_logic;
SIGNAL \comb_3|Add4~2\ : std_logic;
SIGNAL \comb_3|Add4~5_sumout\ : std_logic;
SIGNAL \comb_3|led_out1~1_combout\ : std_logic;
SIGNAL \comb_3|Mux44~0_combout\ : std_logic;
SIGNAL \comb_3|Add4~6\ : std_logic;
SIGNAL \comb_3|Add4~9_sumout\ : std_logic;
SIGNAL \comb_3|Mux43~0_combout\ : std_logic;
SIGNAL \comb_3|Mux11~0_combout\ : std_logic;
SIGNAL \comb_3|ssm[1]~2_combout\ : std_logic;
SIGNAL \comb_3|led_out1~3_combout\ : std_logic;
SIGNAL \comb_3|Add4~10\ : std_logic;
SIGNAL \comb_3|Add4~13_sumout\ : std_logic;
SIGNAL \comb_3|Mux42~0_combout\ : std_logic;
SIGNAL \comb_3|Mux10~0_combout\ : std_logic;
SIGNAL \comb_3|Mux12~0_combout\ : std_logic;
SIGNAL \comb_4|Mux0~0_combout\ : std_logic;
SIGNAL \comb_4|Mux7~0_combout\ : std_logic;
SIGNAL \comb_4|Mux1~0_combout\ : std_logic;
SIGNAL \comb_4|Mux2~0_combout\ : std_logic;
SIGNAL \comb_4|Mux3~0_combout\ : std_logic;
SIGNAL \comb_4|Mux4~0_combout\ : std_logic;
SIGNAL \comb_4|Mux5~0_combout\ : std_logic;
SIGNAL \comb_4|Mux6~0_combout\ : std_logic;
SIGNAL \comb_3|start_counter\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \comb_4|seven_display\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \comb_3|counter\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \comb_3|ssm_counter\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \comb_3|led_out1\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \comb_3|led_out\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \comb_3|tb\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \comb_3|ta\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \comb_3|ssm\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \comb_3|ALT_INV_led_out1\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \comb_3|ALT_INV_ssm_counter\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \comb_3|ALT_INV_counter\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \comb_3|ALT_INV_start_counter\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_start_button~input_o\ : std_logic;
SIGNAL \ALT_INV_switch[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_switch[0]~input_o\ : std_logic;
SIGNAL \comb_4|ALT_INV_seven_display\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \comb_3|ALT_INV_led_out1~3_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_led_out1~2_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_led_out1~1_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Mux45~0_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_ssm~3_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_ssm~1_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_ssm~0_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal8~6_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal8~5_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal8~4_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal8~3_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal8~2_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal8~1_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal8~0_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_tb[10]~0_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_clock_en~1_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_clock_en~0_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal4~6_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal4~5_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal4~4_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal4~3_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal4~2_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal4~1_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal4~0_combout\ : std_logic;
SIGNAL \comb_4|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \comb_4|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \comb_4|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \comb_4|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \comb_4|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \comb_4|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \comb_4|ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \comb_4|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_ssm\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \comb_3|ALT_INV_led_out[9]~5_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_led_out[8]~3_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_led_out[9]~2_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_led_out[9]~1_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_always2~3_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_always2~2_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_LessThan2~0_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_always2~1_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_ta\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \comb_3|ALT_INV_always2~0_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_tb\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \comb_3|ALT_INV_clock_en~q\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal5~1_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Equal5~0_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_always1~4_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_always1~3_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_always1~2_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_always1~1_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_always1~0_combout\ : std_logic;
SIGNAL \comb_3|ALT_INV_led_out\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \comb_3|ALT_INV_Add4~13_sumout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Add4~9_sumout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Add4~5_sumout\ : std_logic;
SIGNAL \comb_3|ALT_INV_Add4~1_sumout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_start_button <= start_button;
ww_switch <= switch;
led_out <= ww_led_out;
seven_display <= ww_seven_display;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\comb_3|ALT_INV_led_out1\(3) <= NOT \comb_3|led_out1\(3);
\comb_3|ALT_INV_led_out1\(2) <= NOT \comb_3|led_out1\(2);
\comb_3|ALT_INV_led_out1\(1) <= NOT \comb_3|led_out1\(1);
\comb_3|ALT_INV_led_out1\(0) <= NOT \comb_3|led_out1\(0);
\comb_3|ALT_INV_ssm_counter\(5) <= NOT \comb_3|ssm_counter\(5);
\comb_3|ALT_INV_ssm_counter\(4) <= NOT \comb_3|ssm_counter\(4);
\comb_3|ALT_INV_ssm_counter\(3) <= NOT \comb_3|ssm_counter\(3);
\comb_3|ALT_INV_ssm_counter\(2) <= NOT \comb_3|ssm_counter\(2);
\comb_3|ALT_INV_ssm_counter\(1) <= NOT \comb_3|ssm_counter\(1);
\comb_3|ALT_INV_ssm_counter\(0) <= NOT \comb_3|ssm_counter\(0);
\comb_3|ALT_INV_ssm_counter\(22) <= NOT \comb_3|ssm_counter\(22);
\comb_3|ALT_INV_ssm_counter\(21) <= NOT \comb_3|ssm_counter\(21);
\comb_3|ALT_INV_ssm_counter\(24) <= NOT \comb_3|ssm_counter\(24);
\comb_3|ALT_INV_ssm_counter\(25) <= NOT \comb_3|ssm_counter\(25);
\comb_3|ALT_INV_ssm_counter\(26) <= NOT \comb_3|ssm_counter\(26);
\comb_3|ALT_INV_ssm_counter\(27) <= NOT \comb_3|ssm_counter\(27);
\comb_3|ALT_INV_ssm_counter\(11) <= NOT \comb_3|ssm_counter\(11);
\comb_3|ALT_INV_ssm_counter\(10) <= NOT \comb_3|ssm_counter\(10);
\comb_3|ALT_INV_ssm_counter\(9) <= NOT \comb_3|ssm_counter\(9);
\comb_3|ALT_INV_ssm_counter\(8) <= NOT \comb_3|ssm_counter\(8);
\comb_3|ALT_INV_ssm_counter\(7) <= NOT \comb_3|ssm_counter\(7);
\comb_3|ALT_INV_ssm_counter\(6) <= NOT \comb_3|ssm_counter\(6);
\comb_3|ALT_INV_ssm_counter\(16) <= NOT \comb_3|ssm_counter\(16);
\comb_3|ALT_INV_ssm_counter\(23) <= NOT \comb_3|ssm_counter\(23);
\comb_3|ALT_INV_ssm_counter\(15) <= NOT \comb_3|ssm_counter\(15);
\comb_3|ALT_INV_ssm_counter\(14) <= NOT \comb_3|ssm_counter\(14);
\comb_3|ALT_INV_ssm_counter\(13) <= NOT \comb_3|ssm_counter\(13);
\comb_3|ALT_INV_ssm_counter\(12) <= NOT \comb_3|ssm_counter\(12);
\comb_3|ALT_INV_ssm_counter\(30) <= NOT \comb_3|ssm_counter\(30);
\comb_3|ALT_INV_ssm_counter\(31) <= NOT \comb_3|ssm_counter\(31);
\comb_3|ALT_INV_ssm_counter\(20) <= NOT \comb_3|ssm_counter\(20);
\comb_3|ALT_INV_ssm_counter\(19) <= NOT \comb_3|ssm_counter\(19);
\comb_3|ALT_INV_ssm_counter\(18) <= NOT \comb_3|ssm_counter\(18);
\comb_3|ALT_INV_ssm_counter\(17) <= NOT \comb_3|ssm_counter\(17);
\comb_3|ALT_INV_ssm_counter\(28) <= NOT \comb_3|ssm_counter\(28);
\comb_3|ALT_INV_ssm_counter\(29) <= NOT \comb_3|ssm_counter\(29);
\comb_3|ALT_INV_counter\(18) <= NOT \comb_3|counter\(18);
\comb_3|ALT_INV_counter\(23) <= NOT \comb_3|counter\(23);
\comb_3|ALT_INV_counter\(24) <= NOT \comb_3|counter\(24);
\comb_3|ALT_INV_counter\(25) <= NOT \comb_3|counter\(25);
\comb_3|ALT_INV_counter\(6) <= NOT \comb_3|counter\(6);
\comb_3|ALT_INV_counter\(11) <= NOT \comb_3|counter\(11);
\comb_3|ALT_INV_counter\(15) <= NOT \comb_3|counter\(15);
\comb_3|ALT_INV_counter\(16) <= NOT \comb_3|counter\(16);
\comb_3|ALT_INV_counter\(17) <= NOT \comb_3|counter\(17);
\comb_3|ALT_INV_counter\(31) <= NOT \comb_3|counter\(31);
\comb_3|ALT_INV_counter\(3) <= NOT \comb_3|counter\(3);
\comb_3|ALT_INV_counter\(2) <= NOT \comb_3|counter\(2);
\comb_3|ALT_INV_counter\(1) <= NOT \comb_3|counter\(1);
\comb_3|ALT_INV_counter\(28) <= NOT \comb_3|counter\(28);
\comb_3|ALT_INV_counter\(4) <= NOT \comb_3|counter\(4);
\comb_3|ALT_INV_counter\(5) <= NOT \comb_3|counter\(5);
\comb_3|ALT_INV_counter\(7) <= NOT \comb_3|counter\(7);
\comb_3|ALT_INV_counter\(8) <= NOT \comb_3|counter\(8);
\comb_3|ALT_INV_counter\(27) <= NOT \comb_3|counter\(27);
\comb_3|ALT_INV_counter\(19) <= NOT \comb_3|counter\(19);
\comb_3|ALT_INV_counter\(20) <= NOT \comb_3|counter\(20);
\comb_3|ALT_INV_counter\(21) <= NOT \comb_3|counter\(21);
\comb_3|ALT_INV_counter\(22) <= NOT \comb_3|counter\(22);
\comb_3|ALT_INV_counter\(0) <= NOT \comb_3|counter\(0);
\comb_3|ALT_INV_counter\(29) <= NOT \comb_3|counter\(29);
\comb_3|ALT_INV_counter\(9) <= NOT \comb_3|counter\(9);
\comb_3|ALT_INV_counter\(10) <= NOT \comb_3|counter\(10);
\comb_3|ALT_INV_counter\(12) <= NOT \comb_3|counter\(12);
\comb_3|ALT_INV_counter\(13) <= NOT \comb_3|counter\(13);
\comb_3|ALT_INV_counter\(14) <= NOT \comb_3|counter\(14);
\comb_3|ALT_INV_counter\(30) <= NOT \comb_3|counter\(30);
\comb_3|ALT_INV_counter\(26) <= NOT \comb_3|counter\(26);
\comb_3|ALT_INV_start_counter\(4) <= NOT \comb_3|start_counter\(4);
\comb_3|ALT_INV_start_counter\(3) <= NOT \comb_3|start_counter\(3);
\comb_3|ALT_INV_start_counter\(2) <= NOT \comb_3|start_counter\(2);
\comb_3|ALT_INV_start_counter\(5) <= NOT \comb_3|start_counter\(5);
\comb_3|ALT_INV_start_counter\(6) <= NOT \comb_3|start_counter\(6);
\comb_3|ALT_INV_start_counter\(1) <= NOT \comb_3|start_counter\(1);
\comb_3|ALT_INV_start_counter\(0) <= NOT \comb_3|start_counter\(0);
\comb_3|ALT_INV_start_counter\(26) <= NOT \comb_3|start_counter\(26);
\comb_3|ALT_INV_start_counter\(25) <= NOT \comb_3|start_counter\(25);
\comb_3|ALT_INV_start_counter\(24) <= NOT \comb_3|start_counter\(24);
\comb_3|ALT_INV_start_counter\(23) <= NOT \comb_3|start_counter\(23);
\comb_3|ALT_INV_start_counter\(22) <= NOT \comb_3|start_counter\(22);
\comb_3|ALT_INV_start_counter\(21) <= NOT \comb_3|start_counter\(21);
\comb_3|ALT_INV_start_counter\(20) <= NOT \comb_3|start_counter\(20);
\comb_3|ALT_INV_start_counter\(19) <= NOT \comb_3|start_counter\(19);
\comb_3|ALT_INV_start_counter\(18) <= NOT \comb_3|start_counter\(18);
\comb_3|ALT_INV_start_counter\(17) <= NOT \comb_3|start_counter\(17);
\comb_3|ALT_INV_start_counter\(16) <= NOT \comb_3|start_counter\(16);
\comb_3|ALT_INV_start_counter\(8) <= NOT \comb_3|start_counter\(8);
\comb_3|ALT_INV_start_counter\(7) <= NOT \comb_3|start_counter\(7);
\comb_3|ALT_INV_start_counter\(31) <= NOT \comb_3|start_counter\(31);
\comb_3|ALT_INV_start_counter\(30) <= NOT \comb_3|start_counter\(30);
\comb_3|ALT_INV_start_counter\(29) <= NOT \comb_3|start_counter\(29);
\comb_3|ALT_INV_start_counter\(28) <= NOT \comb_3|start_counter\(28);
\comb_3|ALT_INV_start_counter\(14) <= NOT \comb_3|start_counter\(14);
\comb_3|ALT_INV_start_counter\(13) <= NOT \comb_3|start_counter\(13);
\comb_3|ALT_INV_start_counter\(12) <= NOT \comb_3|start_counter\(12);
\comb_3|ALT_INV_start_counter\(11) <= NOT \comb_3|start_counter\(11);
\comb_3|ALT_INV_start_counter\(10) <= NOT \comb_3|start_counter\(10);
\comb_3|ALT_INV_start_counter\(9) <= NOT \comb_3|start_counter\(9);
\comb_3|ALT_INV_start_counter\(15) <= NOT \comb_3|start_counter\(15);
\comb_3|ALT_INV_start_counter\(27) <= NOT \comb_3|start_counter\(27);
\ALT_INV_start_button~input_o\ <= NOT \start_button~input_o\;
\ALT_INV_switch[1]~input_o\ <= NOT \switch[1]~input_o\;
\ALT_INV_switch[0]~input_o\ <= NOT \switch[0]~input_o\;
\comb_4|ALT_INV_seven_display\(6) <= NOT \comb_4|seven_display\(6);
\comb_4|ALT_INV_seven_display\(5) <= NOT \comb_4|seven_display\(5);
\comb_4|ALT_INV_seven_display\(4) <= NOT \comb_4|seven_display\(4);
\comb_4|ALT_INV_seven_display\(3) <= NOT \comb_4|seven_display\(3);
\comb_4|ALT_INV_seven_display\(2) <= NOT \comb_4|seven_display\(2);
\comb_4|ALT_INV_seven_display\(1) <= NOT \comb_4|seven_display\(1);
\comb_4|ALT_INV_seven_display\(0) <= NOT \comb_4|seven_display\(0);
\comb_3|ALT_INV_led_out1~3_combout\ <= NOT \comb_3|led_out1~3_combout\;
\comb_3|ALT_INV_led_out1~2_combout\ <= NOT \comb_3|led_out1~2_combout\;
\comb_3|ALT_INV_led_out1~1_combout\ <= NOT \comb_3|led_out1~1_combout\;
\comb_3|ALT_INV_Mux45~0_combout\ <= NOT \comb_3|Mux45~0_combout\;
\comb_3|ALT_INV_ssm~3_combout\ <= NOT \comb_3|ssm~3_combout\;
\comb_3|ALT_INV_ssm~1_combout\ <= NOT \comb_3|ssm~1_combout\;
\comb_3|ALT_INV_ssm~0_combout\ <= NOT \comb_3|ssm~0_combout\;
\comb_3|ALT_INV_Equal8~6_combout\ <= NOT \comb_3|Equal8~6_combout\;
\comb_3|ALT_INV_Equal8~5_combout\ <= NOT \comb_3|Equal8~5_combout\;
\comb_3|ALT_INV_Equal8~4_combout\ <= NOT \comb_3|Equal8~4_combout\;
\comb_3|ALT_INV_Equal8~3_combout\ <= NOT \comb_3|Equal8~3_combout\;
\comb_3|ALT_INV_Equal8~2_combout\ <= NOT \comb_3|Equal8~2_combout\;
\comb_3|ALT_INV_Equal8~1_combout\ <= NOT \comb_3|Equal8~1_combout\;
\comb_3|ALT_INV_Equal8~0_combout\ <= NOT \comb_3|Equal8~0_combout\;
\comb_3|ALT_INV_tb[10]~0_combout\ <= NOT \comb_3|tb[10]~0_combout\;
\comb_3|ALT_INV_clock_en~1_combout\ <= NOT \comb_3|clock_en~1_combout\;
\comb_3|ALT_INV_clock_en~0_combout\ <= NOT \comb_3|clock_en~0_combout\;
\comb_3|ALT_INV_Equal4~6_combout\ <= NOT \comb_3|Equal4~6_combout\;
\comb_3|ALT_INV_Equal4~5_combout\ <= NOT \comb_3|Equal4~5_combout\;
\comb_3|ALT_INV_Equal4~4_combout\ <= NOT \comb_3|Equal4~4_combout\;
\comb_3|ALT_INV_Equal4~3_combout\ <= NOT \comb_3|Equal4~3_combout\;
\comb_3|ALT_INV_Equal4~2_combout\ <= NOT \comb_3|Equal4~2_combout\;
\comb_3|ALT_INV_Equal4~1_combout\ <= NOT \comb_3|Equal4~1_combout\;
\comb_3|ALT_INV_Equal4~0_combout\ <= NOT \comb_3|Equal4~0_combout\;
\comb_4|ALT_INV_Mux6~0_combout\ <= NOT \comb_4|Mux6~0_combout\;
\comb_4|ALT_INV_Mux5~0_combout\ <= NOT \comb_4|Mux5~0_combout\;
\comb_4|ALT_INV_Mux4~0_combout\ <= NOT \comb_4|Mux4~0_combout\;
\comb_4|ALT_INV_Mux3~0_combout\ <= NOT \comb_4|Mux3~0_combout\;
\comb_4|ALT_INV_Mux2~0_combout\ <= NOT \comb_4|Mux2~0_combout\;
\comb_4|ALT_INV_Mux1~0_combout\ <= NOT \comb_4|Mux1~0_combout\;
\comb_4|ALT_INV_Mux7~0_combout\ <= NOT \comb_4|Mux7~0_combout\;
\comb_4|ALT_INV_Mux0~0_combout\ <= NOT \comb_4|Mux0~0_combout\;
\comb_3|ALT_INV_ssm\(3) <= NOT \comb_3|ssm\(3);
\comb_3|ALT_INV_ssm\(2) <= NOT \comb_3|ssm\(2);
\comb_3|ALT_INV_ssm\(1) <= NOT \comb_3|ssm\(1);
\comb_3|ALT_INV_ssm\(0) <= NOT \comb_3|ssm\(0);
\comb_3|ALT_INV_led_out[9]~5_combout\ <= NOT \comb_3|led_out[9]~5_combout\;
\comb_3|ALT_INV_led_out[8]~3_combout\ <= NOT \comb_3|led_out[8]~3_combout\;
\comb_3|ALT_INV_led_out[9]~2_combout\ <= NOT \comb_3|led_out[9]~2_combout\;
\comb_3|ALT_INV_led_out[9]~1_combout\ <= NOT \comb_3|led_out[9]~1_combout\;
\comb_3|ALT_INV_always2~3_combout\ <= NOT \comb_3|always2~3_combout\;
\comb_3|ALT_INV_always2~2_combout\ <= NOT \comb_3|always2~2_combout\;
\comb_3|ALT_INV_LessThan2~0_combout\ <= NOT \comb_3|LessThan2~0_combout\;
\comb_3|ALT_INV_Mux9~0_combout\ <= NOT \comb_3|Mux9~0_combout\;
\comb_3|ALT_INV_always2~1_combout\ <= NOT \comb_3|always2~1_combout\;
\comb_3|ALT_INV_ta\(0) <= NOT \comb_3|ta\(0);
\comb_3|ALT_INV_always2~0_combout\ <= NOT \comb_3|always2~0_combout\;
\comb_3|ALT_INV_tb\(0) <= NOT \comb_3|tb\(0);
\comb_3|ALT_INV_clock_en~q\ <= NOT \comb_3|clock_en~q\;
\comb_3|ALT_INV_Equal5~1_combout\ <= NOT \comb_3|Equal5~1_combout\;
\comb_3|ALT_INV_Equal5~0_combout\ <= NOT \comb_3|Equal5~0_combout\;
\comb_3|ALT_INV_LessThan0~0_combout\ <= NOT \comb_3|LessThan0~0_combout\;
\comb_3|ALT_INV_always1~4_combout\ <= NOT \comb_3|always1~4_combout\;
\comb_3|ALT_INV_always1~3_combout\ <= NOT \comb_3|always1~3_combout\;
\comb_3|ALT_INV_always1~2_combout\ <= NOT \comb_3|always1~2_combout\;
\comb_3|ALT_INV_always1~1_combout\ <= NOT \comb_3|always1~1_combout\;
\comb_3|ALT_INV_always1~0_combout\ <= NOT \comb_3|always1~0_combout\;
\comb_3|ALT_INV_led_out\(9) <= NOT \comb_3|led_out\(9);
\comb_3|ALT_INV_led_out\(8) <= NOT \comb_3|led_out\(8);
\comb_3|ALT_INV_led_out\(7) <= NOT \comb_3|led_out\(7);
\comb_3|ALT_INV_led_out\(6) <= NOT \comb_3|led_out\(6);
\comb_3|ALT_INV_led_out\(5) <= NOT \comb_3|led_out\(5);
\comb_3|ALT_INV_led_out\(4) <= NOT \comb_3|led_out\(4);
\comb_3|ALT_INV_led_out\(3) <= NOT \comb_3|led_out\(3);
\comb_3|ALT_INV_led_out\(2) <= NOT \comb_3|led_out\(2);
\comb_3|ALT_INV_led_out\(1) <= NOT \comb_3|led_out\(1);
\comb_3|ALT_INV_led_out\(0) <= NOT \comb_3|led_out\(0);
\comb_3|ALT_INV_Add4~13_sumout\ <= NOT \comb_3|Add4~13_sumout\;
\comb_3|ALT_INV_Add4~9_sumout\ <= NOT \comb_3|Add4~9_sumout\;
\comb_3|ALT_INV_Add4~5_sumout\ <= NOT \comb_3|Add4~5_sumout\;
\comb_3|ALT_INV_Add4~1_sumout\ <= NOT \comb_3|Add4~1_sumout\;

-- Location: IOOBUF_X52_Y0_N2
\led_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_3|led_out\(0),
	devoe => ww_devoe,
	o => ww_led_out(0));

-- Location: IOOBUF_X52_Y0_N19
\led_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_3|led_out\(1),
	devoe => ww_devoe,
	o => ww_led_out(1));

-- Location: IOOBUF_X60_Y0_N2
\led_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_3|led_out\(2),
	devoe => ww_devoe,
	o => ww_led_out(2));

-- Location: IOOBUF_X80_Y0_N2
\led_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_3|led_out\(3),
	devoe => ww_devoe,
	o => ww_led_out(3));

-- Location: IOOBUF_X60_Y0_N19
\led_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_3|led_out\(4),
	devoe => ww_devoe,
	o => ww_led_out(4));

-- Location: IOOBUF_X80_Y0_N19
\led_out[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_3|led_out\(5),
	devoe => ww_devoe,
	o => ww_led_out(5));

-- Location: IOOBUF_X84_Y0_N2
\led_out[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_3|led_out\(6),
	devoe => ww_devoe,
	o => ww_led_out(6));

-- Location: IOOBUF_X89_Y6_N5
\led_out[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_3|led_out\(7),
	devoe => ww_devoe,
	o => ww_led_out(7));

-- Location: IOOBUF_X89_Y8_N5
\led_out[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_3|led_out\(8),
	devoe => ww_devoe,
	o => ww_led_out(8));

-- Location: IOOBUF_X89_Y6_N22
\led_out[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_3|led_out\(9),
	devoe => ww_devoe,
	o => ww_led_out(9));

-- Location: IOOBUF_X89_Y8_N39
\seven_display[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_4|seven_display\(0),
	devoe => ww_devoe,
	o => ww_seven_display(0));

-- Location: IOOBUF_X89_Y11_N79
\seven_display[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_4|seven_display\(1),
	devoe => ww_devoe,
	o => ww_seven_display(1));

-- Location: IOOBUF_X89_Y11_N96
\seven_display[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_4|seven_display\(2),
	devoe => ww_devoe,
	o => ww_seven_display(2));

-- Location: IOOBUF_X89_Y4_N79
\seven_display[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_4|seven_display\(3),
	devoe => ww_devoe,
	o => ww_seven_display(3));

-- Location: IOOBUF_X89_Y13_N56
\seven_display[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_4|seven_display\(4),
	devoe => ww_devoe,
	o => ww_seven_display(4));

-- Location: IOOBUF_X89_Y13_N39
\seven_display[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_4|seven_display\(5),
	devoe => ww_devoe,
	o => ww_seven_display(5));

-- Location: IOOBUF_X89_Y4_N96
\seven_display[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \comb_4|seven_display\(6),
	devoe => ww_devoe,
	o => ww_seven_display(6));

-- Location: IOIBUF_X32_Y0_N1
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G6
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X12_Y0_N18
\switch[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch(0),
	o => \switch[0]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\switch[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch(1),
	o => \switch[1]~input_o\);

-- Location: LABCELL_X81_Y2_N0
\comb_3|Add1~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~101_sumout\ = SUM(( \comb_3|start_counter\(0) ) + ( VCC ) + ( !VCC ))
-- \comb_3|Add1~102\ = CARRY(( \comb_3|start_counter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(0),
	cin => GND,
	sumout => \comb_3|Add1~101_sumout\,
	cout => \comb_3|Add1~102\);

-- Location: IOIBUF_X36_Y0_N1
\start_button~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start_button,
	o => \start_button~input_o\);

-- Location: LABCELL_X80_Y1_N39
\comb_3|LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|LessThan0~0_combout\ = ( !\comb_3|start_counter\(3) & ( (!\comb_3|start_counter\(4) & !\comb_3|start_counter\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \comb_3|ALT_INV_start_counter\(4),
	datad => \comb_3|ALT_INV_start_counter\(2),
	dataf => \comb_3|ALT_INV_start_counter\(3),
	combout => \comb_3|LessThan0~0_combout\);

-- Location: LABCELL_X80_Y1_N36
\comb_3|always1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|always1~5_combout\ = ( \comb_3|start_counter\(5) & ( ((!\comb_3|always1~4_combout\) # ((!\comb_3|LessThan0~0_combout\ & \comb_3|start_counter\(6)))) # (\start_button~input_o\) ) ) # ( !\comb_3|start_counter\(5) & ( (!\comb_3|always1~4_combout\) # 
-- (\start_button~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111101010101111111110101010111111111010111011111111101011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_start_button~input_o\,
	datab => \comb_3|ALT_INV_LessThan0~0_combout\,
	datac => \comb_3|ALT_INV_start_counter\(6),
	datad => \comb_3|ALT_INV_always1~4_combout\,
	dataf => \comb_3|ALT_INV_start_counter\(5),
	combout => \comb_3|always1~5_combout\);

-- Location: LABCELL_X80_Y1_N51
\comb_3|start_counter[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|start_counter[6]~0_combout\ = ( \comb_3|always1~4_combout\ & ( \comb_3|start_counter\(5) & ( (!\comb_3|start_counter\(6)) # ((\start_button~input_o\) # (\comb_3|LessThan0~0_combout\)) ) ) ) # ( !\comb_3|always1~4_combout\ & ( 
-- \comb_3|start_counter\(5) & ( \start_button~input_o\ ) ) ) # ( \comb_3|always1~4_combout\ & ( !\comb_3|start_counter\(5) ) ) # ( !\comb_3|always1~4_combout\ & ( !\comb_3|start_counter\(5) & ( \start_button~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111111111111111111100000000111111111011101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_start_counter\(6),
	datab => \comb_3|ALT_INV_LessThan0~0_combout\,
	datad => \ALT_INV_start_button~input_o\,
	datae => \comb_3|ALT_INV_always1~4_combout\,
	dataf => \comb_3|ALT_INV_start_counter\(5),
	combout => \comb_3|start_counter[6]~0_combout\);

-- Location: FF_X81_Y2_N1
\comb_3|start_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~101_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(0));

-- Location: LABCELL_X81_Y2_N3
\comb_3|Add1~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~105_sumout\ = SUM(( \comb_3|start_counter\(1) ) + ( GND ) + ( \comb_3|Add1~102\ ))
-- \comb_3|Add1~106\ = CARRY(( \comb_3|start_counter\(1) ) + ( GND ) + ( \comb_3|Add1~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(1),
	cin => \comb_3|Add1~102\,
	sumout => \comb_3|Add1~105_sumout\,
	cout => \comb_3|Add1~106\);

-- Location: FF_X81_Y2_N4
\comb_3|start_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~105_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(1));

-- Location: LABCELL_X81_Y2_N6
\comb_3|Add1~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~117_sumout\ = SUM(( \comb_3|start_counter\(2) ) + ( GND ) + ( \comb_3|Add1~106\ ))
-- \comb_3|Add1~118\ = CARRY(( \comb_3|start_counter\(2) ) + ( GND ) + ( \comb_3|Add1~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(2),
	cin => \comb_3|Add1~106\,
	sumout => \comb_3|Add1~117_sumout\,
	cout => \comb_3|Add1~118\);

-- Location: FF_X81_Y2_N8
\comb_3|start_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~117_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(2));

-- Location: LABCELL_X81_Y2_N9
\comb_3|Add1~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~121_sumout\ = SUM(( \comb_3|start_counter\(3) ) + ( GND ) + ( \comb_3|Add1~118\ ))
-- \comb_3|Add1~122\ = CARRY(( \comb_3|start_counter\(3) ) + ( GND ) + ( \comb_3|Add1~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(3),
	cin => \comb_3|Add1~118\,
	sumout => \comb_3|Add1~121_sumout\,
	cout => \comb_3|Add1~122\);

-- Location: FF_X81_Y2_N10
\comb_3|start_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~121_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(3));

-- Location: LABCELL_X81_Y2_N12
\comb_3|Add1~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~125_sumout\ = SUM(( \comb_3|start_counter\(4) ) + ( GND ) + ( \comb_3|Add1~122\ ))
-- \comb_3|Add1~126\ = CARRY(( \comb_3|start_counter\(4) ) + ( GND ) + ( \comb_3|Add1~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(4),
	cin => \comb_3|Add1~122\,
	sumout => \comb_3|Add1~125_sumout\,
	cout => \comb_3|Add1~126\);

-- Location: FF_X81_Y1_N56
\comb_3|start_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \comb_3|Add1~125_sumout\,
	sclr => \comb_3|always1~5_combout\,
	sload => VCC,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(4));

-- Location: LABCELL_X81_Y2_N15
\comb_3|Add1~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~113_sumout\ = SUM(( \comb_3|start_counter\(5) ) + ( GND ) + ( \comb_3|Add1~126\ ))
-- \comb_3|Add1~114\ = CARRY(( \comb_3|start_counter\(5) ) + ( GND ) + ( \comb_3|Add1~126\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(5),
	cin => \comb_3|Add1~126\,
	sumout => \comb_3|Add1~113_sumout\,
	cout => \comb_3|Add1~114\);

-- Location: FF_X81_Y2_N17
\comb_3|start_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~113_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(5));

-- Location: LABCELL_X81_Y2_N18
\comb_3|Add1~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~109_sumout\ = SUM(( \comb_3|start_counter\(6) ) + ( GND ) + ( \comb_3|Add1~114\ ))
-- \comb_3|Add1~110\ = CARRY(( \comb_3|start_counter\(6) ) + ( GND ) + ( \comb_3|Add1~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(6),
	cin => \comb_3|Add1~114\,
	sumout => \comb_3|Add1~109_sumout\,
	cout => \comb_3|Add1~110\);

-- Location: FF_X81_Y2_N20
\comb_3|start_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~109_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(6));

-- Location: LABCELL_X81_Y2_N21
\comb_3|Add1~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~49_sumout\ = SUM(( \comb_3|start_counter\(7) ) + ( GND ) + ( \comb_3|Add1~110\ ))
-- \comb_3|Add1~50\ = CARRY(( \comb_3|start_counter\(7) ) + ( GND ) + ( \comb_3|Add1~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(7),
	cin => \comb_3|Add1~110\,
	sumout => \comb_3|Add1~49_sumout\,
	cout => \comb_3|Add1~50\);

-- Location: FF_X81_Y2_N22
\comb_3|start_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~49_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(7));

-- Location: LABCELL_X81_Y2_N24
\comb_3|Add1~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~53_sumout\ = SUM(( \comb_3|start_counter\(8) ) + ( GND ) + ( \comb_3|Add1~50\ ))
-- \comb_3|Add1~54\ = CARRY(( \comb_3|start_counter\(8) ) + ( GND ) + ( \comb_3|Add1~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(8),
	cin => \comb_3|Add1~50\,
	sumout => \comb_3|Add1~53_sumout\,
	cout => \comb_3|Add1~54\);

-- Location: FF_X81_Y2_N25
\comb_3|start_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~53_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(8));

-- Location: LABCELL_X81_Y2_N27
\comb_3|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~9_sumout\ = SUM(( \comb_3|start_counter\(9) ) + ( GND ) + ( \comb_3|Add1~54\ ))
-- \comb_3|Add1~10\ = CARRY(( \comb_3|start_counter\(9) ) + ( GND ) + ( \comb_3|Add1~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(9),
	cin => \comb_3|Add1~54\,
	sumout => \comb_3|Add1~9_sumout\,
	cout => \comb_3|Add1~10\);

-- Location: FF_X81_Y2_N28
\comb_3|start_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~9_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(9));

-- Location: LABCELL_X81_Y2_N30
\comb_3|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~13_sumout\ = SUM(( \comb_3|start_counter\(10) ) + ( GND ) + ( \comb_3|Add1~10\ ))
-- \comb_3|Add1~14\ = CARRY(( \comb_3|start_counter\(10) ) + ( GND ) + ( \comb_3|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(10),
	cin => \comb_3|Add1~10\,
	sumout => \comb_3|Add1~13_sumout\,
	cout => \comb_3|Add1~14\);

-- Location: FF_X81_Y2_N31
\comb_3|start_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~13_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(10));

-- Location: LABCELL_X81_Y2_N33
\comb_3|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~17_sumout\ = SUM(( \comb_3|start_counter\(11) ) + ( GND ) + ( \comb_3|Add1~14\ ))
-- \comb_3|Add1~18\ = CARRY(( \comb_3|start_counter\(11) ) + ( GND ) + ( \comb_3|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(11),
	cin => \comb_3|Add1~14\,
	sumout => \comb_3|Add1~17_sumout\,
	cout => \comb_3|Add1~18\);

-- Location: FF_X81_Y2_N34
\comb_3|start_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~17_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(11));

-- Location: LABCELL_X81_Y2_N36
\comb_3|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~21_sumout\ = SUM(( \comb_3|start_counter\(12) ) + ( GND ) + ( \comb_3|Add1~18\ ))
-- \comb_3|Add1~22\ = CARRY(( \comb_3|start_counter\(12) ) + ( GND ) + ( \comb_3|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(12),
	cin => \comb_3|Add1~18\,
	sumout => \comb_3|Add1~21_sumout\,
	cout => \comb_3|Add1~22\);

-- Location: FF_X81_Y2_N37
\comb_3|start_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~21_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(12));

-- Location: LABCELL_X81_Y2_N39
\comb_3|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~25_sumout\ = SUM(( \comb_3|start_counter\(13) ) + ( GND ) + ( \comb_3|Add1~22\ ))
-- \comb_3|Add1~26\ = CARRY(( \comb_3|start_counter\(13) ) + ( GND ) + ( \comb_3|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(13),
	cin => \comb_3|Add1~22\,
	sumout => \comb_3|Add1~25_sumout\,
	cout => \comb_3|Add1~26\);

-- Location: FF_X81_Y2_N40
\comb_3|start_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~25_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(13));

-- Location: LABCELL_X81_Y2_N42
\comb_3|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~29_sumout\ = SUM(( \comb_3|start_counter\(14) ) + ( GND ) + ( \comb_3|Add1~26\ ))
-- \comb_3|Add1~30\ = CARRY(( \comb_3|start_counter\(14) ) + ( GND ) + ( \comb_3|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(14),
	cin => \comb_3|Add1~26\,
	sumout => \comb_3|Add1~29_sumout\,
	cout => \comb_3|Add1~30\);

-- Location: FF_X81_Y2_N43
\comb_3|start_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~29_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(14));

-- Location: LABCELL_X81_Y2_N45
\comb_3|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~5_sumout\ = SUM(( \comb_3|start_counter\(15) ) + ( GND ) + ( \comb_3|Add1~30\ ))
-- \comb_3|Add1~6\ = CARRY(( \comb_3|start_counter\(15) ) + ( GND ) + ( \comb_3|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(15),
	cin => \comb_3|Add1~30\,
	sumout => \comb_3|Add1~5_sumout\,
	cout => \comb_3|Add1~6\);

-- Location: FF_X81_Y2_N46
\comb_3|start_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~5_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(15));

-- Location: LABCELL_X81_Y2_N48
\comb_3|Add1~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~57_sumout\ = SUM(( \comb_3|start_counter\(16) ) + ( GND ) + ( \comb_3|Add1~6\ ))
-- \comb_3|Add1~58\ = CARRY(( \comb_3|start_counter\(16) ) + ( GND ) + ( \comb_3|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(16),
	cin => \comb_3|Add1~6\,
	sumout => \comb_3|Add1~57_sumout\,
	cout => \comb_3|Add1~58\);

-- Location: FF_X81_Y2_N49
\comb_3|start_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~57_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(16));

-- Location: LABCELL_X81_Y2_N51
\comb_3|Add1~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~61_sumout\ = SUM(( \comb_3|start_counter\(17) ) + ( GND ) + ( \comb_3|Add1~58\ ))
-- \comb_3|Add1~62\ = CARRY(( \comb_3|start_counter\(17) ) + ( GND ) + ( \comb_3|Add1~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(17),
	cin => \comb_3|Add1~58\,
	sumout => \comb_3|Add1~61_sumout\,
	cout => \comb_3|Add1~62\);

-- Location: FF_X81_Y2_N53
\comb_3|start_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~61_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(17));

-- Location: LABCELL_X81_Y2_N54
\comb_3|Add1~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~65_sumout\ = SUM(( \comb_3|start_counter\(18) ) + ( GND ) + ( \comb_3|Add1~62\ ))
-- \comb_3|Add1~66\ = CARRY(( \comb_3|start_counter\(18) ) + ( GND ) + ( \comb_3|Add1~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(18),
	cin => \comb_3|Add1~62\,
	sumout => \comb_3|Add1~65_sumout\,
	cout => \comb_3|Add1~66\);

-- Location: FF_X81_Y2_N55
\comb_3|start_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~65_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(18));

-- Location: LABCELL_X81_Y2_N57
\comb_3|Add1~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~69_sumout\ = SUM(( \comb_3|start_counter\(19) ) + ( GND ) + ( \comb_3|Add1~66\ ))
-- \comb_3|Add1~70\ = CARRY(( \comb_3|start_counter\(19) ) + ( GND ) + ( \comb_3|Add1~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(19),
	cin => \comb_3|Add1~66\,
	sumout => \comb_3|Add1~69_sumout\,
	cout => \comb_3|Add1~70\);

-- Location: FF_X81_Y2_N59
\comb_3|start_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~69_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(19));

-- Location: LABCELL_X81_Y1_N0
\comb_3|Add1~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~73_sumout\ = SUM(( \comb_3|start_counter\(20) ) + ( GND ) + ( \comb_3|Add1~70\ ))
-- \comb_3|Add1~74\ = CARRY(( \comb_3|start_counter\(20) ) + ( GND ) + ( \comb_3|Add1~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(20),
	cin => \comb_3|Add1~70\,
	sumout => \comb_3|Add1~73_sumout\,
	cout => \comb_3|Add1~74\);

-- Location: FF_X81_Y1_N2
\comb_3|start_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~73_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(20));

-- Location: LABCELL_X81_Y1_N3
\comb_3|Add1~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~77_sumout\ = SUM(( \comb_3|start_counter\(21) ) + ( GND ) + ( \comb_3|Add1~74\ ))
-- \comb_3|Add1~78\ = CARRY(( \comb_3|start_counter\(21) ) + ( GND ) + ( \comb_3|Add1~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(21),
	cin => \comb_3|Add1~74\,
	sumout => \comb_3|Add1~77_sumout\,
	cout => \comb_3|Add1~78\);

-- Location: FF_X81_Y1_N4
\comb_3|start_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~77_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(21));

-- Location: LABCELL_X81_Y1_N6
\comb_3|Add1~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~81_sumout\ = SUM(( \comb_3|start_counter\(22) ) + ( GND ) + ( \comb_3|Add1~78\ ))
-- \comb_3|Add1~82\ = CARRY(( \comb_3|start_counter\(22) ) + ( GND ) + ( \comb_3|Add1~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(22),
	cin => \comb_3|Add1~78\,
	sumout => \comb_3|Add1~81_sumout\,
	cout => \comb_3|Add1~82\);

-- Location: FF_X81_Y1_N8
\comb_3|start_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~81_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(22));

-- Location: LABCELL_X81_Y1_N9
\comb_3|Add1~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~85_sumout\ = SUM(( \comb_3|start_counter\(23) ) + ( GND ) + ( \comb_3|Add1~82\ ))
-- \comb_3|Add1~86\ = CARRY(( \comb_3|start_counter\(23) ) + ( GND ) + ( \comb_3|Add1~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(23),
	cin => \comb_3|Add1~82\,
	sumout => \comb_3|Add1~85_sumout\,
	cout => \comb_3|Add1~86\);

-- Location: FF_X81_Y1_N10
\comb_3|start_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~85_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(23));

-- Location: LABCELL_X81_Y1_N12
\comb_3|Add1~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~89_sumout\ = SUM(( \comb_3|start_counter\(24) ) + ( GND ) + ( \comb_3|Add1~86\ ))
-- \comb_3|Add1~90\ = CARRY(( \comb_3|start_counter\(24) ) + ( GND ) + ( \comb_3|Add1~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(24),
	cin => \comb_3|Add1~86\,
	sumout => \comb_3|Add1~89_sumout\,
	cout => \comb_3|Add1~90\);

-- Location: FF_X81_Y1_N14
\comb_3|start_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~89_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(24));

-- Location: LABCELL_X81_Y1_N15
\comb_3|Add1~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~93_sumout\ = SUM(( \comb_3|start_counter\(25) ) + ( GND ) + ( \comb_3|Add1~90\ ))
-- \comb_3|Add1~94\ = CARRY(( \comb_3|start_counter\(25) ) + ( GND ) + ( \comb_3|Add1~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(25),
	cin => \comb_3|Add1~90\,
	sumout => \comb_3|Add1~93_sumout\,
	cout => \comb_3|Add1~94\);

-- Location: FF_X81_Y1_N17
\comb_3|start_counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~93_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(25));

-- Location: LABCELL_X81_Y1_N18
\comb_3|Add1~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~97_sumout\ = SUM(( \comb_3|start_counter\(26) ) + ( GND ) + ( \comb_3|Add1~94\ ))
-- \comb_3|Add1~98\ = CARRY(( \comb_3|start_counter\(26) ) + ( GND ) + ( \comb_3|Add1~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(26),
	cin => \comb_3|Add1~94\,
	sumout => \comb_3|Add1~97_sumout\,
	cout => \comb_3|Add1~98\);

-- Location: FF_X81_Y1_N20
\comb_3|start_counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~97_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(26));

-- Location: LABCELL_X81_Y1_N21
\comb_3|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~1_sumout\ = SUM(( \comb_3|start_counter\(27) ) + ( GND ) + ( \comb_3|Add1~98\ ))
-- \comb_3|Add1~2\ = CARRY(( \comb_3|start_counter\(27) ) + ( GND ) + ( \comb_3|Add1~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(27),
	cin => \comb_3|Add1~98\,
	sumout => \comb_3|Add1~1_sumout\,
	cout => \comb_3|Add1~2\);

-- Location: FF_X81_Y1_N22
\comb_3|start_counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~1_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(27));

-- Location: LABCELL_X81_Y1_N24
\comb_3|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~33_sumout\ = SUM(( \comb_3|start_counter\(28) ) + ( GND ) + ( \comb_3|Add1~2\ ))
-- \comb_3|Add1~34\ = CARRY(( \comb_3|start_counter\(28) ) + ( GND ) + ( \comb_3|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(28),
	cin => \comb_3|Add1~2\,
	sumout => \comb_3|Add1~33_sumout\,
	cout => \comb_3|Add1~34\);

-- Location: FF_X81_Y1_N26
\comb_3|start_counter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~33_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(28));

-- Location: LABCELL_X81_Y1_N27
\comb_3|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~37_sumout\ = SUM(( \comb_3|start_counter\(29) ) + ( GND ) + ( \comb_3|Add1~34\ ))
-- \comb_3|Add1~38\ = CARRY(( \comb_3|start_counter\(29) ) + ( GND ) + ( \comb_3|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(29),
	cin => \comb_3|Add1~34\,
	sumout => \comb_3|Add1~37_sumout\,
	cout => \comb_3|Add1~38\);

-- Location: FF_X81_Y1_N28
\comb_3|start_counter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~37_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(29));

-- Location: LABCELL_X81_Y1_N30
\comb_3|Add1~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~41_sumout\ = SUM(( \comb_3|start_counter\(30) ) + ( GND ) + ( \comb_3|Add1~38\ ))
-- \comb_3|Add1~42\ = CARRY(( \comb_3|start_counter\(30) ) + ( GND ) + ( \comb_3|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(30),
	cin => \comb_3|Add1~38\,
	sumout => \comb_3|Add1~41_sumout\,
	cout => \comb_3|Add1~42\);

-- Location: FF_X81_Y1_N32
\comb_3|start_counter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~41_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(30));

-- Location: LABCELL_X81_Y1_N33
\comb_3|Add1~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add1~45_sumout\ = SUM(( \comb_3|start_counter\(31) ) + ( GND ) + ( \comb_3|Add1~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_start_counter\(31),
	cin => \comb_3|Add1~42\,
	sumout => \comb_3|Add1~45_sumout\);

-- Location: FF_X81_Y1_N35
\comb_3|start_counter[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add1~45_sumout\,
	sclr => \comb_3|always1~5_combout\,
	ena => \comb_3|start_counter[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|start_counter\(31));

-- Location: LABCELL_X81_Y1_N36
\comb_3|always1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|always1~1_combout\ = ( !\comb_3|start_counter\(8) & ( !\comb_3|start_counter\(7) & ( (!\comb_3|start_counter\(28) & (!\comb_3|start_counter\(30) & (!\comb_3|start_counter\(31) & !\comb_3|start_counter\(29)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_start_counter\(28),
	datab => \comb_3|ALT_INV_start_counter\(30),
	datac => \comb_3|ALT_INV_start_counter\(31),
	datad => \comb_3|ALT_INV_start_counter\(29),
	datae => \comb_3|ALT_INV_start_counter\(8),
	dataf => \comb_3|ALT_INV_start_counter\(7),
	combout => \comb_3|always1~1_combout\);

-- Location: LABCELL_X81_Y1_N51
\comb_3|always1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|always1~3_combout\ = ( !\comb_3|start_counter\(24) & ( (!\comb_3|start_counter\(26) & (!\comb_3|start_counter\(25) & (!\comb_3|start_counter\(22) & !\comb_3|start_counter\(23)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_start_counter\(26),
	datab => \comb_3|ALT_INV_start_counter\(25),
	datac => \comb_3|ALT_INV_start_counter\(22),
	datad => \comb_3|ALT_INV_start_counter\(23),
	dataf => \comb_3|ALT_INV_start_counter\(24),
	combout => \comb_3|always1~3_combout\);

-- Location: LABCELL_X81_Y1_N57
\comb_3|always1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|always1~2_combout\ = ( !\comb_3|start_counter\(17) & ( !\comb_3|start_counter\(19) & ( (!\comb_3|start_counter\(20) & (!\comb_3|start_counter\(16) & (!\comb_3|start_counter\(21) & !\comb_3|start_counter\(18)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_start_counter\(20),
	datab => \comb_3|ALT_INV_start_counter\(16),
	datac => \comb_3|ALT_INV_start_counter\(21),
	datad => \comb_3|ALT_INV_start_counter\(18),
	datae => \comb_3|ALT_INV_start_counter\(17),
	dataf => \comb_3|ALT_INV_start_counter\(19),
	combout => \comb_3|always1~2_combout\);

-- Location: MLABCELL_X82_Y2_N24
\comb_3|always1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|always1~0_combout\ = ( !\comb_3|start_counter\(14) & ( !\comb_3|start_counter\(12) & ( (!\comb_3|start_counter\(13) & (!\comb_3|start_counter\(9) & (!\comb_3|start_counter\(10) & !\comb_3|start_counter\(11)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_start_counter\(13),
	datab => \comb_3|ALT_INV_start_counter\(9),
	datac => \comb_3|ALT_INV_start_counter\(10),
	datad => \comb_3|ALT_INV_start_counter\(11),
	datae => \comb_3|ALT_INV_start_counter\(14),
	dataf => \comb_3|ALT_INV_start_counter\(12),
	combout => \comb_3|always1~0_combout\);

-- Location: LABCELL_X81_Y1_N42
\comb_3|always1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|always1~4_combout\ = ( \comb_3|always1~2_combout\ & ( \comb_3|always1~0_combout\ & ( (\comb_3|always1~1_combout\ & (!\comb_3|start_counter\(15) & (\comb_3|always1~3_combout\ & !\comb_3|start_counter\(27)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_always1~1_combout\,
	datab => \comb_3|ALT_INV_start_counter\(15),
	datac => \comb_3|ALT_INV_always1~3_combout\,
	datad => \comb_3|ALT_INV_start_counter\(27),
	datae => \comb_3|ALT_INV_always1~2_combout\,
	dataf => \comb_3|ALT_INV_always1~0_combout\,
	combout => \comb_3|always1~4_combout\);

-- Location: LABCELL_X80_Y1_N54
\comb_3|Equal5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal5~0_combout\ = ( \comb_3|start_counter\(6) & ( \comb_3|LessThan0~0_combout\ & ( (!\comb_3|start_counter\(0) & (\comb_3|start_counter\(1) & \comb_3|start_counter\(5))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_start_counter\(0),
	datac => \comb_3|ALT_INV_start_counter\(1),
	datad => \comb_3|ALT_INV_start_counter\(5),
	datae => \comb_3|ALT_INV_start_counter\(6),
	dataf => \comb_3|ALT_INV_LessThan0~0_combout\,
	combout => \comb_3|Equal5~0_combout\);

-- Location: MLABCELL_X82_Y3_N45
\comb_3|ta~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|ta~0_combout\ = ( \comb_3|ta\(0) & ( \comb_3|Equal5~0_combout\ & ( (\switch[0]~input_o\) # (\switch[1]~input_o\) ) ) ) # ( !\comb_3|ta\(0) & ( \comb_3|Equal5~0_combout\ & ( (\comb_3|always1~4_combout\ & ((\switch[0]~input_o\) # 
-- (\switch[1]~input_o\))) ) ) ) # ( \comb_3|ta\(0) & ( !\comb_3|Equal5~0_combout\ & ( (\switch[0]~input_o\) # (\switch[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010111110101111100010011000100110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switch[1]~input_o\,
	datab => \comb_3|ALT_INV_always1~4_combout\,
	datac => \ALT_INV_switch[0]~input_o\,
	datae => \comb_3|ALT_INV_ta\(0),
	dataf => \comb_3|ALT_INV_Equal5~0_combout\,
	combout => \comb_3|ta~0_combout\);

-- Location: FF_X82_Y3_N47
\comb_3|ta[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|ta~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ta\(0));

-- Location: LABCELL_X80_Y2_N0
\comb_3|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~33_sumout\ = SUM(( \comb_3|counter\(0) ) + ( VCC ) + ( !VCC ))
-- \comb_3|Add0~34\ = CARRY(( \comb_3|counter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(0),
	cin => GND,
	sumout => \comb_3|Add0~33_sumout\,
	cout => \comb_3|Add0~34\);

-- Location: LABCELL_X79_Y2_N36
\comb_3|clock_en~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|clock_en~1_combout\ = ( !\comb_3|counter\(16) & ( \comb_3|counter\(15) & ( (!\comb_3|counter\(11) & \comb_3|counter\(17)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001010000010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_counter\(11),
	datac => \comb_3|ALT_INV_counter\(17),
	datae => \comb_3|ALT_INV_counter\(16),
	dataf => \comb_3|ALT_INV_counter\(15),
	combout => \comb_3|clock_en~1_combout\);

-- Location: LABCELL_X80_Y1_N12
\comb_3|Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~117_sumout\ = SUM(( \comb_3|counter\(24) ) + ( GND ) + ( \comb_3|Add0~122\ ))
-- \comb_3|Add0~118\ = CARRY(( \comb_3|counter\(24) ) + ( GND ) + ( \comb_3|Add0~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(24),
	cin => \comb_3|Add0~122\,
	sumout => \comb_3|Add0~117_sumout\,
	cout => \comb_3|Add0~118\);

-- Location: LABCELL_X80_Y1_N15
\comb_3|Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~113_sumout\ = SUM(( \comb_3|counter\(25) ) + ( GND ) + ( \comb_3|Add0~118\ ))
-- \comb_3|Add0~114\ = CARRY(( \comb_3|counter\(25) ) + ( GND ) + ( \comb_3|Add0~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(25),
	cin => \comb_3|Add0~118\,
	sumout => \comb_3|Add0~113_sumout\,
	cout => \comb_3|Add0~114\);

-- Location: FF_X80_Y1_N17
\comb_3|counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~113_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(25));

-- Location: LABCELL_X79_Y2_N48
\comb_3|Equal4~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal4~5_combout\ = ( !\comb_3|counter\(23) & ( !\comb_3|counter\(25) & ( (!\comb_3|counter\(6) & (\comb_3|counter\(24) & \comb_3|counter\(18))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001100000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_3|ALT_INV_counter\(6),
	datac => \comb_3|ALT_INV_counter\(24),
	datad => \comb_3|ALT_INV_counter\(18),
	datae => \comb_3|ALT_INV_counter\(23),
	dataf => \comb_3|ALT_INV_counter\(25),
	combout => \comb_3|Equal4~5_combout\);

-- Location: LABCELL_X79_Y2_N54
\comb_3|Equal4~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal4~6_combout\ = ( \comb_3|counter\(16) & ( \comb_3|Equal4~5_combout\ & ( (!\comb_3|counter\(17) & (\comb_3|counter\(11) & !\comb_3|counter\(15))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000010000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_counter\(17),
	datab => \comb_3|ALT_INV_counter\(11),
	datac => \comb_3|ALT_INV_counter\(15),
	datae => \comb_3|ALT_INV_counter\(16),
	dataf => \comb_3|ALT_INV_Equal4~5_combout\,
	combout => \comb_3|Equal4~6_combout\);

-- Location: LABCELL_X80_Y1_N18
\comb_3|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~1_sumout\ = SUM(( \comb_3|counter\(26) ) + ( GND ) + ( \comb_3|Add0~114\ ))
-- \comb_3|Add0~2\ = CARRY(( \comb_3|counter\(26) ) + ( GND ) + ( \comb_3|Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(26),
	cin => \comb_3|Add0~114\,
	sumout => \comb_3|Add0~1_sumout\,
	cout => \comb_3|Add0~2\);

-- Location: FF_X80_Y1_N19
\comb_3|counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~1_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(26));

-- Location: LABCELL_X80_Y1_N21
\comb_3|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~53_sumout\ = SUM(( \comb_3|counter\(27) ) + ( GND ) + ( \comb_3|Add0~2\ ))
-- \comb_3|Add0~54\ = CARRY(( \comb_3|counter\(27) ) + ( GND ) + ( \comb_3|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(27),
	cin => \comb_3|Add0~2\,
	sumout => \comb_3|Add0~53_sumout\,
	cout => \comb_3|Add0~54\);

-- Location: FF_X80_Y1_N23
\comb_3|counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~53_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(27));

-- Location: LABCELL_X80_Y1_N24
\comb_3|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~73_sumout\ = SUM(( \comb_3|counter\(28) ) + ( GND ) + ( \comb_3|Add0~54\ ))
-- \comb_3|Add0~74\ = CARRY(( \comb_3|counter\(28) ) + ( GND ) + ( \comb_3|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(28),
	cin => \comb_3|Add0~54\,
	sumout => \comb_3|Add0~73_sumout\,
	cout => \comb_3|Add0~74\);

-- Location: FF_X80_Y1_N26
\comb_3|counter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~73_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(28));

-- Location: LABCELL_X80_Y1_N27
\comb_3|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~29_sumout\ = SUM(( \comb_3|counter\(29) ) + ( GND ) + ( \comb_3|Add0~74\ ))
-- \comb_3|Add0~30\ = CARRY(( \comb_3|counter\(29) ) + ( GND ) + ( \comb_3|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(29),
	cin => \comb_3|Add0~74\,
	sumout => \comb_3|Add0~29_sumout\,
	cout => \comb_3|Add0~30\);

-- Location: FF_X80_Y1_N28
\comb_3|counter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~29_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(29));

-- Location: LABCELL_X80_Y1_N30
\comb_3|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~5_sumout\ = SUM(( \comb_3|counter\(30) ) + ( GND ) + ( \comb_3|Add0~30\ ))
-- \comb_3|Add0~6\ = CARRY(( \comb_3|counter\(30) ) + ( GND ) + ( \comb_3|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(30),
	cin => \comb_3|Add0~30\,
	sumout => \comb_3|Add0~5_sumout\,
	cout => \comb_3|Add0~6\);

-- Location: FF_X80_Y1_N32
\comb_3|counter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~5_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(30));

-- Location: LABCELL_X79_Y2_N27
\comb_3|Equal4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal4~0_combout\ = ( \comb_3|counter\(12) & ( !\comb_3|counter\(9) & ( (!\comb_3|counter\(10) & (\comb_3|counter\(14) & \comb_3|counter\(13))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_counter\(10),
	datac => \comb_3|ALT_INV_counter\(14),
	datad => \comb_3|ALT_INV_counter\(13),
	datae => \comb_3|ALT_INV_counter\(12),
	dataf => \comb_3|ALT_INV_counter\(9),
	combout => \comb_3|Equal4~0_combout\);

-- Location: LABCELL_X79_Y2_N30
\comb_3|Equal4~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal4~2_combout\ = ( \comb_3|counter\(5) & ( !\comb_3|counter\(27) & ( (!\comb_3|counter\(8) & (!\comb_3|counter\(7) & \comb_3|counter\(4))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_3|ALT_INV_counter\(8),
	datac => \comb_3|ALT_INV_counter\(7),
	datad => \comb_3|ALT_INV_counter\(4),
	datae => \comb_3|ALT_INV_counter\(5),
	dataf => \comb_3|ALT_INV_counter\(27),
	combout => \comb_3|Equal4~2_combout\);

-- Location: LABCELL_X80_Y1_N33
\comb_3|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~89_sumout\ = SUM(( \comb_3|counter\(31) ) + ( GND ) + ( \comb_3|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(31),
	cin => \comb_3|Add0~6\,
	sumout => \comb_3|Add0~89_sumout\);

-- Location: FF_X80_Y1_N34
\comb_3|counter[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~89_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(31));

-- Location: LABCELL_X79_Y2_N3
\comb_3|Equal4~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal4~3_combout\ = ( !\comb_3|counter\(28) & ( !\comb_3|counter\(31) & ( (\comb_3|counter\(3) & (\comb_3|counter\(2) & \comb_3|counter\(1))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_counter\(3),
	datac => \comb_3|ALT_INV_counter\(2),
	datad => \comb_3|ALT_INV_counter\(1),
	datae => \comb_3|ALT_INV_counter\(28),
	dataf => \comb_3|ALT_INV_counter\(31),
	combout => \comb_3|Equal4~3_combout\);

-- Location: LABCELL_X80_Y1_N42
\comb_3|Equal4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal4~1_combout\ = ( \comb_3|counter\(0) & ( \comb_3|counter\(19) & ( (\comb_3|counter\(20) & (\comb_3|counter\(22) & (\comb_3|counter\(21) & !\comb_3|counter\(29)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_counter\(20),
	datab => \comb_3|ALT_INV_counter\(22),
	datac => \comb_3|ALT_INV_counter\(21),
	datad => \comb_3|ALT_INV_counter\(29),
	datae => \comb_3|ALT_INV_counter\(0),
	dataf => \comb_3|ALT_INV_counter\(19),
	combout => \comb_3|Equal4~1_combout\);

-- Location: LABCELL_X79_Y2_N42
\comb_3|Equal4~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal4~4_combout\ = ( \comb_3|Equal4~3_combout\ & ( \comb_3|Equal4~1_combout\ & ( (!\comb_3|counter\(30) & (!\comb_3|counter\(26) & (\comb_3|Equal4~0_combout\ & \comb_3|Equal4~2_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_counter\(30),
	datab => \comb_3|ALT_INV_counter\(26),
	datac => \comb_3|ALT_INV_Equal4~0_combout\,
	datad => \comb_3|ALT_INV_Equal4~2_combout\,
	datae => \comb_3|ALT_INV_Equal4~3_combout\,
	dataf => \comb_3|ALT_INV_Equal4~1_combout\,
	combout => \comb_3|Equal4~4_combout\);

-- Location: LABCELL_X79_Y2_N21
\comb_3|counter[27]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|counter[27]~0_combout\ = ( \comb_3|Equal4~6_combout\ & ( \comb_3|Equal4~4_combout\ & ( (!\switch[0]~input_o\) # ((\comb_3|clock_en~1_combout\ & \comb_3|clock_en~0_combout\)) ) ) ) # ( !\comb_3|Equal4~6_combout\ & ( \comb_3|Equal4~4_combout\ & ( 
-- (!\comb_3|clock_en~1_combout\ & (!\switch[1]~input_o\ & (!\switch[0]~input_o\))) # (\comb_3|clock_en~1_combout\ & (((!\switch[1]~input_o\ & !\switch[0]~input_o\)) # (\comb_3|clock_en~0_combout\))) ) ) ) # ( \comb_3|Equal4~6_combout\ & ( 
-- !\comb_3|Equal4~4_combout\ & ( (!\switch[1]~input_o\ & !\switch[0]~input_o\) ) ) ) # ( !\comb_3|Equal4~6_combout\ & ( !\comb_3|Equal4~4_combout\ & ( (!\switch[1]~input_o\ & !\switch[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000110000001100000011000000110101011111000011110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_clock_en~1_combout\,
	datab => \ALT_INV_switch[1]~input_o\,
	datac => \ALT_INV_switch[0]~input_o\,
	datad => \comb_3|ALT_INV_clock_en~0_combout\,
	datae => \comb_3|ALT_INV_Equal4~6_combout\,
	dataf => \comb_3|ALT_INV_Equal4~4_combout\,
	combout => \comb_3|counter[27]~0_combout\);

-- Location: FF_X80_Y2_N1
\comb_3|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~33_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(0));

-- Location: LABCELL_X80_Y2_N3
\comb_3|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~77_sumout\ = SUM(( \comb_3|counter\(1) ) + ( GND ) + ( \comb_3|Add0~34\ ))
-- \comb_3|Add0~78\ = CARRY(( \comb_3|counter\(1) ) + ( GND ) + ( \comb_3|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(1),
	cin => \comb_3|Add0~34\,
	sumout => \comb_3|Add0~77_sumout\,
	cout => \comb_3|Add0~78\);

-- Location: FF_X80_Y2_N5
\comb_3|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~77_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(1));

-- Location: LABCELL_X80_Y2_N6
\comb_3|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~81_sumout\ = SUM(( \comb_3|counter\(2) ) + ( GND ) + ( \comb_3|Add0~78\ ))
-- \comb_3|Add0~82\ = CARRY(( \comb_3|counter\(2) ) + ( GND ) + ( \comb_3|Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(2),
	cin => \comb_3|Add0~78\,
	sumout => \comb_3|Add0~81_sumout\,
	cout => \comb_3|Add0~82\);

-- Location: FF_X80_Y2_N7
\comb_3|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~81_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(2));

-- Location: LABCELL_X80_Y2_N9
\comb_3|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~85_sumout\ = SUM(( \comb_3|counter\(3) ) + ( GND ) + ( \comb_3|Add0~82\ ))
-- \comb_3|Add0~86\ = CARRY(( \comb_3|counter\(3) ) + ( GND ) + ( \comb_3|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(3),
	cin => \comb_3|Add0~82\,
	sumout => \comb_3|Add0~85_sumout\,
	cout => \comb_3|Add0~86\);

-- Location: FF_X80_Y2_N11
\comb_3|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~85_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(3));

-- Location: LABCELL_X80_Y2_N12
\comb_3|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~69_sumout\ = SUM(( \comb_3|counter\(4) ) + ( GND ) + ( \comb_3|Add0~86\ ))
-- \comb_3|Add0~70\ = CARRY(( \comb_3|counter\(4) ) + ( GND ) + ( \comb_3|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(4),
	cin => \comb_3|Add0~86\,
	sumout => \comb_3|Add0~69_sumout\,
	cout => \comb_3|Add0~70\);

-- Location: FF_X80_Y2_N14
\comb_3|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~69_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(4));

-- Location: LABCELL_X80_Y2_N15
\comb_3|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~65_sumout\ = SUM(( \comb_3|counter\(5) ) + ( GND ) + ( \comb_3|Add0~70\ ))
-- \comb_3|Add0~66\ = CARRY(( \comb_3|counter\(5) ) + ( GND ) + ( \comb_3|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(5),
	cin => \comb_3|Add0~70\,
	sumout => \comb_3|Add0~65_sumout\,
	cout => \comb_3|Add0~66\);

-- Location: FF_X80_Y2_N17
\comb_3|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~65_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(5));

-- Location: LABCELL_X80_Y2_N18
\comb_3|Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~109_sumout\ = SUM(( \comb_3|counter\(6) ) + ( GND ) + ( \comb_3|Add0~66\ ))
-- \comb_3|Add0~110\ = CARRY(( \comb_3|counter\(6) ) + ( GND ) + ( \comb_3|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(6),
	cin => \comb_3|Add0~66\,
	sumout => \comb_3|Add0~109_sumout\,
	cout => \comb_3|Add0~110\);

-- Location: FF_X80_Y2_N20
\comb_3|counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~109_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(6));

-- Location: LABCELL_X80_Y2_N21
\comb_3|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~61_sumout\ = SUM(( \comb_3|counter\(7) ) + ( GND ) + ( \comb_3|Add0~110\ ))
-- \comb_3|Add0~62\ = CARRY(( \comb_3|counter\(7) ) + ( GND ) + ( \comb_3|Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(7),
	cin => \comb_3|Add0~110\,
	sumout => \comb_3|Add0~61_sumout\,
	cout => \comb_3|Add0~62\);

-- Location: FF_X80_Y2_N23
\comb_3|counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~61_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(7));

-- Location: LABCELL_X80_Y2_N24
\comb_3|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~57_sumout\ = SUM(( \comb_3|counter\(8) ) + ( GND ) + ( \comb_3|Add0~62\ ))
-- \comb_3|Add0~58\ = CARRY(( \comb_3|counter\(8) ) + ( GND ) + ( \comb_3|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(8),
	cin => \comb_3|Add0~62\,
	sumout => \comb_3|Add0~57_sumout\,
	cout => \comb_3|Add0~58\);

-- Location: FF_X80_Y2_N26
\comb_3|counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~57_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(8));

-- Location: LABCELL_X80_Y2_N27
\comb_3|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~25_sumout\ = SUM(( \comb_3|counter\(9) ) + ( GND ) + ( \comb_3|Add0~58\ ))
-- \comb_3|Add0~26\ = CARRY(( \comb_3|counter\(9) ) + ( GND ) + ( \comb_3|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(9),
	cin => \comb_3|Add0~58\,
	sumout => \comb_3|Add0~25_sumout\,
	cout => \comb_3|Add0~26\);

-- Location: FF_X80_Y2_N28
\comb_3|counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~25_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(9));

-- Location: LABCELL_X80_Y2_N30
\comb_3|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~21_sumout\ = SUM(( \comb_3|counter\(10) ) + ( GND ) + ( \comb_3|Add0~26\ ))
-- \comb_3|Add0~22\ = CARRY(( \comb_3|counter\(10) ) + ( GND ) + ( \comb_3|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(10),
	cin => \comb_3|Add0~26\,
	sumout => \comb_3|Add0~21_sumout\,
	cout => \comb_3|Add0~22\);

-- Location: FF_X80_Y2_N32
\comb_3|counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~21_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(10));

-- Location: LABCELL_X80_Y2_N33
\comb_3|Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~105_sumout\ = SUM(( \comb_3|counter\(11) ) + ( GND ) + ( \comb_3|Add0~22\ ))
-- \comb_3|Add0~106\ = CARRY(( \comb_3|counter\(11) ) + ( GND ) + ( \comb_3|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(11),
	cin => \comb_3|Add0~22\,
	sumout => \comb_3|Add0~105_sumout\,
	cout => \comb_3|Add0~106\);

-- Location: FF_X80_Y2_N35
\comb_3|counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~105_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(11));

-- Location: LABCELL_X80_Y2_N36
\comb_3|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~17_sumout\ = SUM(( \comb_3|counter\(12) ) + ( GND ) + ( \comb_3|Add0~106\ ))
-- \comb_3|Add0~18\ = CARRY(( \comb_3|counter\(12) ) + ( GND ) + ( \comb_3|Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(12),
	cin => \comb_3|Add0~106\,
	sumout => \comb_3|Add0~17_sumout\,
	cout => \comb_3|Add0~18\);

-- Location: FF_X80_Y2_N37
\comb_3|counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~17_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(12));

-- Location: LABCELL_X80_Y2_N39
\comb_3|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~13_sumout\ = SUM(( \comb_3|counter\(13) ) + ( GND ) + ( \comb_3|Add0~18\ ))
-- \comb_3|Add0~14\ = CARRY(( \comb_3|counter\(13) ) + ( GND ) + ( \comb_3|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(13),
	cin => \comb_3|Add0~18\,
	sumout => \comb_3|Add0~13_sumout\,
	cout => \comb_3|Add0~14\);

-- Location: FF_X80_Y2_N41
\comb_3|counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~13_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(13));

-- Location: LABCELL_X80_Y2_N42
\comb_3|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~9_sumout\ = SUM(( \comb_3|counter\(14) ) + ( GND ) + ( \comb_3|Add0~14\ ))
-- \comb_3|Add0~10\ = CARRY(( \comb_3|counter\(14) ) + ( GND ) + ( \comb_3|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(14),
	cin => \comb_3|Add0~14\,
	sumout => \comb_3|Add0~9_sumout\,
	cout => \comb_3|Add0~10\);

-- Location: FF_X80_Y2_N43
\comb_3|counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~9_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(14));

-- Location: LABCELL_X80_Y2_N45
\comb_3|Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~101_sumout\ = SUM(( \comb_3|counter\(15) ) + ( GND ) + ( \comb_3|Add0~10\ ))
-- \comb_3|Add0~102\ = CARRY(( \comb_3|counter\(15) ) + ( GND ) + ( \comb_3|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(15),
	cin => \comb_3|Add0~10\,
	sumout => \comb_3|Add0~101_sumout\,
	cout => \comb_3|Add0~102\);

-- Location: FF_X80_Y2_N47
\comb_3|counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~101_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(15));

-- Location: LABCELL_X80_Y2_N48
\comb_3|Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~97_sumout\ = SUM(( \comb_3|counter\(16) ) + ( GND ) + ( \comb_3|Add0~102\ ))
-- \comb_3|Add0~98\ = CARRY(( \comb_3|counter\(16) ) + ( GND ) + ( \comb_3|Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(16),
	cin => \comb_3|Add0~102\,
	sumout => \comb_3|Add0~97_sumout\,
	cout => \comb_3|Add0~98\);

-- Location: FF_X80_Y2_N50
\comb_3|counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~97_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(16));

-- Location: LABCELL_X80_Y2_N51
\comb_3|Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~93_sumout\ = SUM(( \comb_3|counter\(17) ) + ( GND ) + ( \comb_3|Add0~98\ ))
-- \comb_3|Add0~94\ = CARRY(( \comb_3|counter\(17) ) + ( GND ) + ( \comb_3|Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(17),
	cin => \comb_3|Add0~98\,
	sumout => \comb_3|Add0~93_sumout\,
	cout => \comb_3|Add0~94\);

-- Location: FF_X80_Y2_N53
\comb_3|counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~93_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(17));

-- Location: LABCELL_X80_Y2_N54
\comb_3|Add0~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~125_sumout\ = SUM(( \comb_3|counter\(18) ) + ( GND ) + ( \comb_3|Add0~94\ ))
-- \comb_3|Add0~126\ = CARRY(( \comb_3|counter\(18) ) + ( GND ) + ( \comb_3|Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(18),
	cin => \comb_3|Add0~94\,
	sumout => \comb_3|Add0~125_sumout\,
	cout => \comb_3|Add0~126\);

-- Location: FF_X80_Y2_N56
\comb_3|counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~125_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(18));

-- Location: LABCELL_X80_Y2_N57
\comb_3|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~49_sumout\ = SUM(( \comb_3|counter\(19) ) + ( GND ) + ( \comb_3|Add0~126\ ))
-- \comb_3|Add0~50\ = CARRY(( \comb_3|counter\(19) ) + ( GND ) + ( \comb_3|Add0~126\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(19),
	cin => \comb_3|Add0~126\,
	sumout => \comb_3|Add0~49_sumout\,
	cout => \comb_3|Add0~50\);

-- Location: FF_X80_Y2_N59
\comb_3|counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~49_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(19));

-- Location: LABCELL_X80_Y1_N0
\comb_3|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~45_sumout\ = SUM(( \comb_3|counter\(20) ) + ( GND ) + ( \comb_3|Add0~50\ ))
-- \comb_3|Add0~46\ = CARRY(( \comb_3|counter\(20) ) + ( GND ) + ( \comb_3|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(20),
	cin => \comb_3|Add0~50\,
	sumout => \comb_3|Add0~45_sumout\,
	cout => \comb_3|Add0~46\);

-- Location: FF_X80_Y1_N2
\comb_3|counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~45_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(20));

-- Location: LABCELL_X80_Y1_N3
\comb_3|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~41_sumout\ = SUM(( \comb_3|counter\(21) ) + ( GND ) + ( \comb_3|Add0~46\ ))
-- \comb_3|Add0~42\ = CARRY(( \comb_3|counter\(21) ) + ( GND ) + ( \comb_3|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(21),
	cin => \comb_3|Add0~46\,
	sumout => \comb_3|Add0~41_sumout\,
	cout => \comb_3|Add0~42\);

-- Location: FF_X80_Y1_N5
\comb_3|counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~41_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(21));

-- Location: LABCELL_X80_Y1_N6
\comb_3|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~37_sumout\ = SUM(( \comb_3|counter\(22) ) + ( GND ) + ( \comb_3|Add0~42\ ))
-- \comb_3|Add0~38\ = CARRY(( \comb_3|counter\(22) ) + ( GND ) + ( \comb_3|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(22),
	cin => \comb_3|Add0~42\,
	sumout => \comb_3|Add0~37_sumout\,
	cout => \comb_3|Add0~38\);

-- Location: FF_X80_Y1_N8
\comb_3|counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~37_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(22));

-- Location: LABCELL_X80_Y1_N9
\comb_3|Add0~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add0~121_sumout\ = SUM(( \comb_3|counter\(23) ) + ( GND ) + ( \comb_3|Add0~38\ ))
-- \comb_3|Add0~122\ = CARRY(( \comb_3|counter\(23) ) + ( GND ) + ( \comb_3|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_counter\(23),
	cin => \comb_3|Add0~38\,
	sumout => \comb_3|Add0~121_sumout\,
	cout => \comb_3|Add0~122\);

-- Location: FF_X80_Y1_N11
\comb_3|counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~121_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(23));

-- Location: FF_X80_Y1_N14
\comb_3|counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add0~117_sumout\,
	sclr => \comb_3|counter[27]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|counter\(24));

-- Location: LABCELL_X79_Y1_N15
\comb_3|clock_en~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|clock_en~0_combout\ = ( \comb_3|counter\(25) & ( \comb_3|counter\(6) & ( (\switch[0]~input_o\ & (!\comb_3|counter\(24) & (!\comb_3|counter\(18) & \comb_3|counter\(23)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switch[0]~input_o\,
	datab => \comb_3|ALT_INV_counter\(24),
	datac => \comb_3|ALT_INV_counter\(18),
	datad => \comb_3|ALT_INV_counter\(23),
	datae => \comb_3|ALT_INV_counter\(25),
	dataf => \comb_3|ALT_INV_counter\(6),
	combout => \comb_3|clock_en~0_combout\);

-- Location: MLABCELL_X82_Y3_N24
\comb_3|clock_en~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|clock_en~2_combout\ = ( \comb_3|Equal4~6_combout\ & ( \comb_3|Equal4~4_combout\ & ( (!\switch[1]~input_o\ & (\comb_3|clock_en~0_combout\ & ((\comb_3|clock_en~1_combout\)))) # (\switch[1]~input_o\ & ((!\switch[0]~input_o\) # 
-- ((\comb_3|clock_en~0_combout\ & \comb_3|clock_en~1_combout\)))) ) ) ) # ( !\comb_3|Equal4~6_combout\ & ( \comb_3|Equal4~4_combout\ & ( (\comb_3|clock_en~0_combout\ & \comb_3|clock_en~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switch[1]~input_o\,
	datab => \comb_3|ALT_INV_clock_en~0_combout\,
	datac => \ALT_INV_switch[0]~input_o\,
	datad => \comb_3|ALT_INV_clock_en~1_combout\,
	datae => \comb_3|ALT_INV_Equal4~6_combout\,
	dataf => \comb_3|ALT_INV_Equal4~4_combout\,
	combout => \comb_3|clock_en~2_combout\);

-- Location: FF_X82_Y3_N26
\comb_3|clock_en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|clock_en~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|clock_en~q\);

-- Location: LABCELL_X81_Y3_N48
\comb_3|always2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|always2~1_combout\ = ( \comb_3|clock_en~q\ & ( !\comb_3|ta\(0) ) ) # ( !\comb_3|clock_en~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \comb_3|ALT_INV_ta\(0),
	dataf => \comb_3|ALT_INV_clock_en~q\,
	combout => \comb_3|always2~1_combout\);

-- Location: LABCELL_X83_Y1_N54
\comb_3|LessThan2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|LessThan2~0_combout\ = ( \comb_3|led_out\(5) & ( \comb_3|led_out\(4) & ( (\comb_3|led_out\(1) & (\comb_3|led_out\(2) & (\comb_3|led_out\(3) & \comb_3|led_out\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_led_out\(1),
	datab => \comb_3|ALT_INV_led_out\(2),
	datac => \comb_3|ALT_INV_led_out\(3),
	datad => \comb_3|ALT_INV_led_out\(0),
	datae => \comb_3|ALT_INV_led_out\(5),
	dataf => \comb_3|ALT_INV_led_out\(4),
	combout => \comb_3|LessThan2~0_combout\);

-- Location: MLABCELL_X82_Y3_N39
\comb_3|led_out[9]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|led_out[9]~5_combout\ = ( \comb_3|led_out\(8) & ( (!\comb_3|led_out\(9)) # (!\switch[1]~input_o\) ) ) # ( !\comb_3|led_out\(8) & ( (!\comb_3|led_out\(9) & \switch[1]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101011111111101010101111111110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_led_out\(9),
	datad => \ALT_INV_switch[1]~input_o\,
	dataf => \comb_3|ALT_INV_led_out\(8),
	combout => \comb_3|led_out[9]~5_combout\);

-- Location: LABCELL_X83_Y3_N18
\comb_3|always2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|always2~2_combout\ = ( !\comb_3|led_out\(8) & ( (!\comb_3|led_out\(9) & (\comb_3|clock_en~q\ & \comb_3|tb\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001100000000000000110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_3|ALT_INV_led_out\(9),
	datac => \comb_3|ALT_INV_clock_en~q\,
	datad => \comb_3|ALT_INV_tb\(0),
	dataf => \comb_3|ALT_INV_led_out\(8),
	combout => \comb_3|always2~2_combout\);

-- Location: MLABCELL_X82_Y3_N0
\comb_3|led_out[9]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|led_out[9]~1_combout\ = ( \switch[1]~input_o\ & ( \comb_3|always2~2_combout\ & ( (!\switch[0]~input_o\ & (\comb_3|led_out\(7) & (\comb_3|led_out\(6) & \comb_3|LessThan2~0_combout\))) ) ) ) # ( \switch[1]~input_o\ & ( !\comb_3|always2~2_combout\ & 
-- ( !\switch[0]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switch[0]~input_o\,
	datab => \comb_3|ALT_INV_led_out\(7),
	datac => \comb_3|ALT_INV_led_out\(6),
	datad => \comb_3|ALT_INV_LessThan2~0_combout\,
	datae => \ALT_INV_switch[1]~input_o\,
	dataf => \comb_3|ALT_INV_always2~2_combout\,
	combout => \comb_3|led_out[9]~1_combout\);

-- Location: LABCELL_X81_Y1_N48
\comb_3|Equal5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal5~1_combout\ = ( \comb_3|always1~4_combout\ & ( !\comb_3|Equal5~0_combout\ ) ) # ( !\comb_3|always1~4_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \comb_3|ALT_INV_Equal5~0_combout\,
	dataf => \comb_3|ALT_INV_always1~4_combout\,
	combout => \comb_3|Equal5~1_combout\);

-- Location: MLABCELL_X82_Y3_N18
\comb_3|led_out[9]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|led_out[9]~6_combout\ = ( \comb_3|led_out\(9) & ( \comb_3|Equal5~1_combout\ & ( ((\switch[0]~input_o\ & ((!\comb_3|led_out[9]~2_combout\) # (\comb_3|led_out[9]~5_combout\)))) # (\comb_3|led_out[9]~1_combout\) ) ) ) # ( !\comb_3|led_out\(9) & ( 
-- \comb_3|Equal5~1_combout\ & ( (\switch[0]~input_o\ & (\comb_3|led_out[9]~5_combout\ & (!\comb_3|led_out[9]~1_combout\ & \comb_3|led_out[9]~2_combout\))) ) ) ) # ( \comb_3|led_out\(9) & ( !\comb_3|Equal5~1_combout\ & ( (\switch[0]~input_o\ & 
-- (\comb_3|led_out[9]~5_combout\ & \comb_3|led_out[9]~2_combout\)) ) ) ) # ( !\comb_3|led_out\(9) & ( !\comb_3|Equal5~1_combout\ & ( (\switch[0]~input_o\ & (\comb_3|led_out[9]~5_combout\ & \comb_3|led_out[9]~2_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001000000000001000100000000000100000101111100011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switch[0]~input_o\,
	datab => \comb_3|ALT_INV_led_out[9]~5_combout\,
	datac => \comb_3|ALT_INV_led_out[9]~1_combout\,
	datad => \comb_3|ALT_INV_led_out[9]~2_combout\,
	datae => \comb_3|ALT_INV_led_out\(9),
	dataf => \comb_3|ALT_INV_Equal5~1_combout\,
	combout => \comb_3|led_out[9]~6_combout\);

-- Location: FF_X82_Y3_N20
\comb_3|led_out[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|led_out[9]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|led_out\(9));

-- Location: MLABCELL_X82_Y3_N36
\comb_3|led_out[9]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|led_out[9]~2_combout\ = ( \comb_3|tb\(0) & ( (\comb_3|clock_en~q\ & ((!\switch[1]~input_o\ & (!\comb_3|led_out\(9))) # (\switch[1]~input_o\ & ((\comb_3|ta\(0)))))) ) ) # ( !\comb_3|tb\(0) & ( (\switch[1]~input_o\ & (\comb_3|clock_en~q\ & 
-- \comb_3|ta\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000011000000000000001100001000000010110000100000001011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_led_out\(9),
	datab => \ALT_INV_switch[1]~input_o\,
	datac => \comb_3|ALT_INV_clock_en~q\,
	datad => \comb_3|ALT_INV_ta\(0),
	dataf => \comb_3|ALT_INV_tb\(0),
	combout => \comb_3|led_out[9]~2_combout\);

-- Location: MLABCELL_X84_Y3_N54
\comb_3|led_out[8]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|led_out[8]~3_combout\ = ( \comb_3|led_out\(8) & ( (!\switch[1]~input_o\ & \comb_3|led_out\(7)) ) ) # ( !\comb_3|led_out\(8) & ( (\comb_3|led_out\(7)) # (\switch[1]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_switch[1]~input_o\,
	datad => \comb_3|ALT_INV_led_out\(7),
	dataf => \comb_3|ALT_INV_led_out\(8),
	combout => \comb_3|led_out[8]~3_combout\);

-- Location: MLABCELL_X82_Y3_N51
\comb_3|led_out[8]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|led_out[8]~4_combout\ = ( \comb_3|led_out\(8) & ( \comb_3|Equal5~1_combout\ & ( ((\switch[0]~input_o\ & ((!\comb_3|led_out[9]~2_combout\) # (\comb_3|led_out[8]~3_combout\)))) # (\comb_3|led_out[9]~1_combout\) ) ) ) # ( !\comb_3|led_out\(8) & ( 
-- \comb_3|Equal5~1_combout\ & ( (\switch[0]~input_o\ & (\comb_3|led_out[9]~2_combout\ & (\comb_3|led_out[8]~3_combout\ & !\comb_3|led_out[9]~1_combout\))) ) ) ) # ( \comb_3|led_out\(8) & ( !\comb_3|Equal5~1_combout\ & ( (\switch[0]~input_o\ & 
-- (\comb_3|led_out[9]~2_combout\ & \comb_3|led_out[8]~3_combout\)) ) ) ) # ( !\comb_3|led_out\(8) & ( !\comb_3|Equal5~1_combout\ & ( (\switch[0]~input_o\ & (\comb_3|led_out[9]~2_combout\ & \comb_3|led_out[8]~3_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000000100010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switch[0]~input_o\,
	datab => \comb_3|ALT_INV_led_out[9]~2_combout\,
	datac => \comb_3|ALT_INV_led_out[8]~3_combout\,
	datad => \comb_3|ALT_INV_led_out[9]~1_combout\,
	datae => \comb_3|ALT_INV_led_out\(8),
	dataf => \comb_3|ALT_INV_Equal5~1_combout\,
	combout => \comb_3|led_out[8]~4_combout\);

-- Location: FF_X82_Y3_N53
\comb_3|led_out[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|led_out[8]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|led_out\(8));

-- Location: MLABCELL_X84_Y3_N15
\comb_3|tb[10]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|tb[10]~0_combout\ = ( \comb_3|led_out\(6) & ( (\comb_3|LessThan2~0_combout\ & (\comb_3|led_out\(7) & (\comb_3|always2~0_combout\ & \comb_3|led_out\(8)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000100000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_LessThan2~0_combout\,
	datab => \comb_3|ALT_INV_led_out\(7),
	datac => \comb_3|ALT_INV_always2~0_combout\,
	datad => \comb_3|ALT_INV_led_out\(8),
	datae => \comb_3|ALT_INV_led_out\(6),
	combout => \comb_3|tb[10]~0_combout\);

-- Location: MLABCELL_X84_Y3_N36
\comb_3|tb[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|tb[0]~1_combout\ = ( \comb_3|tb\(0) & ( \comb_3|Equal5~0_combout\ & ( ((\switch[0]~input_o\ & !\comb_3|tb[10]~0_combout\)) # (\switch[1]~input_o\) ) ) ) # ( !\comb_3|tb\(0) & ( \comb_3|Equal5~0_combout\ & ( (\comb_3|always1~4_combout\ & 
-- (((\switch[0]~input_o\ & !\comb_3|tb[10]~0_combout\)) # (\switch[1]~input_o\))) ) ) ) # ( \comb_3|tb\(0) & ( !\comb_3|Equal5~0_combout\ & ( ((\switch[0]~input_o\ & !\comb_3|tb[10]~0_combout\)) # (\switch[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001111110011001100010101000100010011111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_always1~4_combout\,
	datab => \ALT_INV_switch[1]~input_o\,
	datac => \ALT_INV_switch[0]~input_o\,
	datad => \comb_3|ALT_INV_tb[10]~0_combout\,
	datae => \comb_3|ALT_INV_tb\(0),
	dataf => \comb_3|ALT_INV_Equal5~0_combout\,
	combout => \comb_3|tb[0]~1_combout\);

-- Location: FF_X84_Y3_N38
\comb_3|tb[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|tb[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|tb\(0));

-- Location: LABCELL_X83_Y3_N42
\comb_3|always2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|always2~0_combout\ = ( !\comb_3|led_out\(9) & ( (\comb_3|tb\(0) & \comb_3|clock_en~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_3|ALT_INV_tb\(0),
	datac => \comb_3|ALT_INV_clock_en~q\,
	dataf => \comb_3|ALT_INV_led_out\(9),
	combout => \comb_3|always2~0_combout\);

-- Location: LABCELL_X83_Y1_N24
\comb_3|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux8~0_combout\ = ( !\switch[1]~input_o\ & ( ((\comb_3|led_out\(0) & (\comb_3|always2~0_combout\ & (\switch[0]~input_o\)))) ) ) # ( \switch[1]~input_o\ & ( (!\switch[0]~input_o\ & (((\comb_3|led_out\(0) & ((!\comb_3|always2~3_combout\)))))) # 
-- (\switch[0]~input_o\ & (!\comb_3|led_out\(1) & (((!\comb_3|always2~1_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000000011001100111010000000000000000000110000000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_led_out\(1),
	datab => \comb_3|ALT_INV_led_out\(0),
	datac => \comb_3|ALT_INV_always2~1_combout\,
	datad => \ALT_INV_switch[0]~input_o\,
	datae => \ALT_INV_switch[1]~input_o\,
	dataf => \comb_3|ALT_INV_always2~3_combout\,
	datag => \comb_3|ALT_INV_always2~0_combout\,
	combout => \comb_3|Mux8~0_combout\);

-- Location: LABCELL_X83_Y1_N18
\comb_3|led_out[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|led_out[2]~0_combout\ = ( \comb_3|always2~0_combout\ & ( \comb_3|Equal5~1_combout\ & ( (!\switch[1]~input_o\) # ((!\switch[0]~input_o\ & ((!\comb_3|always2~3_combout\))) # (\switch[0]~input_o\ & (!\comb_3|always2~1_combout\))) ) ) ) # ( 
-- !\comb_3|always2~0_combout\ & ( \comb_3|Equal5~1_combout\ & ( (!\switch[0]~input_o\ & (((!\comb_3|always2~3_combout\) # (!\switch[1]~input_o\)))) # (\switch[0]~input_o\ & (!\comb_3|always2~1_combout\ & ((\switch[1]~input_o\)))) ) ) ) # ( 
-- \comb_3|always2~0_combout\ & ( !\comb_3|Equal5~1_combout\ ) ) # ( !\comb_3|always2~0_combout\ & ( !\comb_3|Equal5~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111110000110010101111111111001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_always2~1_combout\,
	datab => \comb_3|ALT_INV_always2~3_combout\,
	datac => \ALT_INV_switch[0]~input_o\,
	datad => \ALT_INV_switch[1]~input_o\,
	datae => \comb_3|ALT_INV_always2~0_combout\,
	dataf => \comb_3|ALT_INV_Equal5~1_combout\,
	combout => \comb_3|led_out[2]~0_combout\);

-- Location: FF_X83_Y1_N26
\comb_3|led_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Mux8~0_combout\,
	ena => \comb_3|led_out[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|led_out\(1));

-- Location: LABCELL_X83_Y1_N6
\comb_3|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux7~0_combout\ = ( !\switch[1]~input_o\ & ( (\comb_3|led_out\(1) & (\switch[0]~input_o\ & (\comb_3|always2~0_combout\))) ) ) # ( \switch[1]~input_o\ & ( (!\switch[0]~input_o\ & (\comb_3|led_out\(1) & (((!\comb_3|always2~3_combout\))))) # 
-- (\switch[0]~input_o\ & (((!\comb_3|always2~1_combout\ & (!\comb_3|led_out\(2)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000100000001011101000100010000000001000000010011000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_led_out\(1),
	datab => \ALT_INV_switch[0]~input_o\,
	datac => \comb_3|ALT_INV_always2~1_combout\,
	datad => \comb_3|ALT_INV_led_out\(2),
	datae => \ALT_INV_switch[1]~input_o\,
	dataf => \comb_3|ALT_INV_always2~3_combout\,
	datag => \comb_3|ALT_INV_always2~0_combout\,
	combout => \comb_3|Mux7~0_combout\);

-- Location: FF_X83_Y1_N8
\comb_3|led_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Mux7~0_combout\,
	ena => \comb_3|led_out[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|led_out\(2));

-- Location: LABCELL_X83_Y1_N48
\comb_3|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux6~0_combout\ = ( !\switch[1]~input_o\ & ( ((\switch[0]~input_o\ & (\comb_3|always2~0_combout\ & (\comb_3|led_out\(2))))) ) ) # ( \switch[1]~input_o\ & ( (!\switch[0]~input_o\ & ((((\comb_3|led_out\(2) & !\comb_3|always2~3_combout\))))) # 
-- (\switch[0]~input_o\ & (!\comb_3|led_out\(3) & (!\comb_3|always2~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000000011001000001110110000000000000000110010000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_led_out\(3),
	datab => \ALT_INV_switch[0]~input_o\,
	datac => \comb_3|ALT_INV_always2~1_combout\,
	datad => \comb_3|ALT_INV_led_out\(2),
	datae => \ALT_INV_switch[1]~input_o\,
	dataf => \comb_3|ALT_INV_always2~3_combout\,
	datag => \comb_3|ALT_INV_always2~0_combout\,
	combout => \comb_3|Mux6~0_combout\);

-- Location: FF_X83_Y1_N50
\comb_3|led_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Mux6~0_combout\,
	ena => \comb_3|led_out[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|led_out\(3));

-- Location: LABCELL_X83_Y1_N42
\comb_3|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux5~0_combout\ = ( !\switch[1]~input_o\ & ( (\comb_3|led_out\(3) & (\switch[0]~input_o\ & (\comb_3|always2~0_combout\))) ) ) # ( \switch[1]~input_o\ & ( (!\switch[0]~input_o\ & (\comb_3|led_out\(3) & (((!\comb_3|always2~3_combout\))))) # 
-- (\switch[0]~input_o\ & (((!\comb_3|always2~1_combout\ & (!\comb_3|led_out\(4)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000100000001011101000100010000000001000000010011000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_led_out\(3),
	datab => \ALT_INV_switch[0]~input_o\,
	datac => \comb_3|ALT_INV_always2~1_combout\,
	datad => \comb_3|ALT_INV_led_out\(4),
	datae => \ALT_INV_switch[1]~input_o\,
	dataf => \comb_3|ALT_INV_always2~3_combout\,
	datag => \comb_3|ALT_INV_always2~0_combout\,
	combout => \comb_3|Mux5~0_combout\);

-- Location: FF_X83_Y1_N44
\comb_3|led_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Mux5~0_combout\,
	ena => \comb_3|led_out[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|led_out\(4));

-- Location: LABCELL_X83_Y1_N0
\comb_3|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux4~0_combout\ = ( !\switch[1]~input_o\ & ( ((\switch[0]~input_o\ & (\comb_3|always2~0_combout\ & (\comb_3|led_out\(4))))) ) ) # ( \switch[1]~input_o\ & ( (!\switch[0]~input_o\ & ((((\comb_3|led_out\(4) & !\comb_3|always2~3_combout\))))) # 
-- (\switch[0]~input_o\ & (!\comb_3|led_out\(5) & (!\comb_3|always2~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000000011001000001110110000000000000000110010000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_led_out\(5),
	datab => \ALT_INV_switch[0]~input_o\,
	datac => \comb_3|ALT_INV_always2~1_combout\,
	datad => \comb_3|ALT_INV_led_out\(4),
	datae => \ALT_INV_switch[1]~input_o\,
	dataf => \comb_3|ALT_INV_always2~3_combout\,
	datag => \comb_3|ALT_INV_always2~0_combout\,
	combout => \comb_3|Mux4~0_combout\);

-- Location: FF_X83_Y1_N2
\comb_3|led_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Mux4~0_combout\,
	ena => \comb_3|led_out[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|led_out\(5));

-- Location: LABCELL_X83_Y1_N30
\comb_3|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux3~0_combout\ = ( !\switch[1]~input_o\ & ( (\comb_3|led_out\(5) & (((\comb_3|always2~0_combout\ & (\switch[0]~input_o\))))) ) ) # ( \switch[1]~input_o\ & ( (!\switch[0]~input_o\ & (\comb_3|led_out\(5) & (((!\comb_3|always2~3_combout\))))) # 
-- (\switch[0]~input_o\ & (((!\comb_3|led_out\(6) & (!\comb_3|always2~1_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000000101010101011100000000000000000001010000000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_led_out\(5),
	datab => \comb_3|ALT_INV_led_out\(6),
	datac => \comb_3|ALT_INV_always2~1_combout\,
	datad => \ALT_INV_switch[0]~input_o\,
	datae => \ALT_INV_switch[1]~input_o\,
	dataf => \comb_3|ALT_INV_always2~3_combout\,
	datag => \comb_3|ALT_INV_always2~0_combout\,
	combout => \comb_3|Mux3~0_combout\);

-- Location: FF_X83_Y1_N32
\comb_3|led_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Mux3~0_combout\,
	ena => \comb_3|led_out[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|led_out\(6));

-- Location: LABCELL_X83_Y1_N12
\comb_3|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux2~0_combout\ = ( !\switch[1]~input_o\ & ( (\switch[0]~input_o\ & (((\comb_3|always2~0_combout\ & (\comb_3|led_out\(6)))))) ) ) # ( \switch[1]~input_o\ & ( (!\switch[0]~input_o\ & ((((\comb_3|led_out\(6) & !\comb_3|always2~3_combout\))))) # 
-- (\switch[0]~input_o\ & (!\comb_3|led_out\(7) & (!\comb_3|always2~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000000101010000001110101000000000000001010100000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switch[0]~input_o\,
	datab => \comb_3|ALT_INV_led_out\(7),
	datac => \comb_3|ALT_INV_always2~1_combout\,
	datad => \comb_3|ALT_INV_led_out\(6),
	datae => \ALT_INV_switch[1]~input_o\,
	dataf => \comb_3|ALT_INV_always2~3_combout\,
	datag => \comb_3|ALT_INV_always2~0_combout\,
	combout => \comb_3|Mux2~0_combout\);

-- Location: FF_X83_Y1_N14
\comb_3|led_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Mux2~0_combout\,
	ena => \comb_3|led_out[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|led_out\(7));

-- Location: LABCELL_X83_Y1_N39
\comb_3|always2~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|always2~3_combout\ = ( \comb_3|LessThan2~0_combout\ & ( \comb_3|always2~2_combout\ & ( (\comb_3|led_out\(7) & \comb_3|led_out\(6)) ) ) ) # ( \comb_3|LessThan2~0_combout\ & ( !\comb_3|always2~2_combout\ ) ) # ( !\comb_3|LessThan2~0_combout\ & ( 
-- !\comb_3|always2~2_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_3|ALT_INV_led_out\(7),
	datac => \comb_3|ALT_INV_led_out\(6),
	datae => \comb_3|ALT_INV_LessThan2~0_combout\,
	dataf => \comb_3|ALT_INV_always2~2_combout\,
	combout => \comb_3|always2~3_combout\);

-- Location: MLABCELL_X82_Y1_N12
\comb_3|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux9~0_combout\ = ( \comb_3|always1~4_combout\ & ( \comb_3|led_out\(0) & ( (!\comb_3|Equal5~0_combout\ & (\switch[1]~input_o\ & (!\comb_3|always2~1_combout\))) # (\comb_3|Equal5~0_combout\ & (((!\comb_3|always2~0_combout\)) # 
-- (\switch[1]~input_o\))) ) ) ) # ( !\comb_3|always1~4_combout\ & ( \comb_3|led_out\(0) & ( (\switch[1]~input_o\ & !\comb_3|always2~1_combout\) ) ) ) # ( \comb_3|always1~4_combout\ & ( !\comb_3|led_out\(0) & ( (!\switch[1]~input_o\ & 
-- ((!\comb_3|always2~0_combout\))) # (\switch[1]~input_o\ & (\comb_3|always2~1_combout\)) ) ) ) # ( !\comb_3|always1~4_combout\ & ( !\comb_3|led_out\(0) & ( (!\switch[1]~input_o\ & ((!\comb_3|always2~0_combout\))) # (\switch[1]~input_o\ & 
-- (\comb_3|always2~1_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100111100000011110011110000001100110000001100000111010100110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_Equal5~0_combout\,
	datab => \ALT_INV_switch[1]~input_o\,
	datac => \comb_3|ALT_INV_always2~1_combout\,
	datad => \comb_3|ALT_INV_always2~0_combout\,
	datae => \comb_3|ALT_INV_always1~4_combout\,
	dataf => \comb_3|ALT_INV_led_out\(0),
	combout => \comb_3|Mux9~0_combout\);

-- Location: MLABCELL_X82_Y1_N30
\comb_3|Mux9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux9~1_combout\ = ( \comb_3|led_out\(0) & ( \comb_3|Mux9~0_combout\ & ( (!\switch[0]~input_o\ & (\switch[1]~input_o\ & ((!\comb_3|always2~3_combout\) # (\comb_3|Equal5~1_combout\)))) ) ) ) # ( !\comb_3|led_out\(0) & ( \comb_3|Mux9~0_combout\ & ( 
-- (!\switch[0]~input_o\ & (\switch[1]~input_o\ & !\comb_3|always2~3_combout\)) ) ) ) # ( \comb_3|led_out\(0) & ( !\comb_3|Mux9~0_combout\ & ( ((\switch[1]~input_o\ & ((!\comb_3|always2~3_combout\) # (\comb_3|Equal5~1_combout\)))) # (\switch[0]~input_o\) ) ) 
-- ) # ( !\comb_3|led_out\(0) & ( !\comb_3|Mux9~0_combout\ & ( ((\switch[1]~input_o\ & !\comb_3|always2~3_combout\)) # (\switch[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111010101110101011101010111011100100000001000000010000000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switch[0]~input_o\,
	datab => \ALT_INV_switch[1]~input_o\,
	datac => \comb_3|ALT_INV_always2~3_combout\,
	datad => \comb_3|ALT_INV_Equal5~1_combout\,
	datae => \comb_3|ALT_INV_led_out\(0),
	dataf => \comb_3|ALT_INV_Mux9~0_combout\,
	combout => \comb_3|Mux9~1_combout\);

-- Location: FF_X82_Y1_N32
\comb_3|led_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Mux9~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|led_out\(0));

-- Location: LABCELL_X85_Y4_N0
\comb_3|Add5~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~105_sumout\ = SUM(( \comb_3|ssm_counter\(0) ) + ( VCC ) + ( !VCC ))
-- \comb_3|Add5~106\ = CARRY(( \comb_3|ssm_counter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(0),
	cin => GND,
	sumout => \comb_3|Add5~105_sumout\,
	cout => \comb_3|Add5~106\);

-- Location: MLABCELL_X84_Y3_N18
\comb_3|ssm_counter[21]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|ssm_counter[21]~0_combout\ = ( \comb_3|LessThan2~0_combout\ & ( \comb_3|always2~2_combout\ & ( (!\switch[0]~input_o\ & (\switch[1]~input_o\ & ((!\comb_3|led_out\(6)) # (!\comb_3|led_out\(7))))) ) ) ) # ( !\comb_3|LessThan2~0_combout\ & ( 
-- \comb_3|always2~2_combout\ & ( (!\switch[0]~input_o\ & \switch[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111100000000000011100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_led_out\(6),
	datab => \comb_3|ALT_INV_led_out\(7),
	datac => \ALT_INV_switch[0]~input_o\,
	datad => \ALT_INV_switch[1]~input_o\,
	datae => \comb_3|ALT_INV_LessThan2~0_combout\,
	dataf => \comb_3|ALT_INV_always2~2_combout\,
	combout => \comb_3|ssm_counter[21]~0_combout\);

-- Location: FF_X85_Y4_N2
\comb_3|ssm_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~105_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(0));

-- Location: LABCELL_X85_Y4_N3
\comb_3|Add5~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~109_sumout\ = SUM(( \comb_3|ssm_counter\(1) ) + ( GND ) + ( \comb_3|Add5~106\ ))
-- \comb_3|Add5~110\ = CARRY(( \comb_3|ssm_counter\(1) ) + ( GND ) + ( \comb_3|Add5~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(1),
	cin => \comb_3|Add5~106\,
	sumout => \comb_3|Add5~109_sumout\,
	cout => \comb_3|Add5~110\);

-- Location: FF_X85_Y4_N5
\comb_3|ssm_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~109_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(1));

-- Location: LABCELL_X85_Y4_N6
\comb_3|Add5~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~113_sumout\ = SUM(( \comb_3|ssm_counter\(2) ) + ( GND ) + ( \comb_3|Add5~110\ ))
-- \comb_3|Add5~114\ = CARRY(( \comb_3|ssm_counter\(2) ) + ( GND ) + ( \comb_3|Add5~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(2),
	cin => \comb_3|Add5~110\,
	sumout => \comb_3|Add5~113_sumout\,
	cout => \comb_3|Add5~114\);

-- Location: FF_X85_Y4_N8
\comb_3|ssm_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~113_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(2));

-- Location: LABCELL_X85_Y4_N9
\comb_3|Add5~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~117_sumout\ = SUM(( \comb_3|ssm_counter\(3) ) + ( GND ) + ( \comb_3|Add5~114\ ))
-- \comb_3|Add5~118\ = CARRY(( \comb_3|ssm_counter\(3) ) + ( GND ) + ( \comb_3|Add5~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(3),
	cin => \comb_3|Add5~114\,
	sumout => \comb_3|Add5~117_sumout\,
	cout => \comb_3|Add5~118\);

-- Location: FF_X85_Y4_N11
\comb_3|ssm_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~117_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(3));

-- Location: LABCELL_X85_Y4_N12
\comb_3|Add5~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~121_sumout\ = SUM(( \comb_3|ssm_counter\(4) ) + ( GND ) + ( \comb_3|Add5~118\ ))
-- \comb_3|Add5~122\ = CARRY(( \comb_3|ssm_counter\(4) ) + ( GND ) + ( \comb_3|Add5~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(4),
	cin => \comb_3|Add5~118\,
	sumout => \comb_3|Add5~121_sumout\,
	cout => \comb_3|Add5~122\);

-- Location: FF_X85_Y4_N14
\comb_3|ssm_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~121_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(4));

-- Location: LABCELL_X85_Y4_N15
\comb_3|Add5~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~125_sumout\ = SUM(( \comb_3|ssm_counter\(5) ) + ( GND ) + ( \comb_3|Add5~122\ ))
-- \comb_3|Add5~126\ = CARRY(( \comb_3|ssm_counter\(5) ) + ( GND ) + ( \comb_3|Add5~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(5),
	cin => \comb_3|Add5~122\,
	sumout => \comb_3|Add5~125_sumout\,
	cout => \comb_3|Add5~126\);

-- Location: FF_X85_Y4_N17
\comb_3|ssm_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~125_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(5));

-- Location: MLABCELL_X84_Y4_N33
\comb_3|Equal8~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal8~5_combout\ = ( \comb_3|ssm_counter\(0) & ( !\comb_3|ssm_counter\(4) & ( (!\comb_3|ssm_counter\(2) & (!\comb_3|ssm_counter\(5) & (!\comb_3|ssm_counter\(3) & !\comb_3|ssm_counter\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_ssm_counter\(2),
	datab => \comb_3|ALT_INV_ssm_counter\(5),
	datac => \comb_3|ALT_INV_ssm_counter\(3),
	datad => \comb_3|ALT_INV_ssm_counter\(1),
	datae => \comb_3|ALT_INV_ssm_counter\(0),
	dataf => \comb_3|ALT_INV_ssm_counter\(4),
	combout => \comb_3|Equal8~5_combout\);

-- Location: LABCELL_X85_Y4_N18
\comb_3|Add5~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~57_sumout\ = SUM(( \comb_3|ssm_counter\(6) ) + ( GND ) + ( \comb_3|Add5~126\ ))
-- \comb_3|Add5~58\ = CARRY(( \comb_3|ssm_counter\(6) ) + ( GND ) + ( \comb_3|Add5~126\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(6),
	cin => \comb_3|Add5~126\,
	sumout => \comb_3|Add5~57_sumout\,
	cout => \comb_3|Add5~58\);

-- Location: FF_X85_Y4_N20
\comb_3|ssm_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~57_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(6));

-- Location: LABCELL_X85_Y4_N21
\comb_3|Add5~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~61_sumout\ = SUM(( \comb_3|ssm_counter\(7) ) + ( GND ) + ( \comb_3|Add5~58\ ))
-- \comb_3|Add5~62\ = CARRY(( \comb_3|ssm_counter\(7) ) + ( GND ) + ( \comb_3|Add5~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(7),
	cin => \comb_3|Add5~58\,
	sumout => \comb_3|Add5~61_sumout\,
	cout => \comb_3|Add5~62\);

-- Location: FF_X85_Y4_N23
\comb_3|ssm_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~61_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(7));

-- Location: LABCELL_X85_Y4_N24
\comb_3|Add5~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~65_sumout\ = SUM(( \comb_3|ssm_counter\(8) ) + ( GND ) + ( \comb_3|Add5~62\ ))
-- \comb_3|Add5~66\ = CARRY(( \comb_3|ssm_counter\(8) ) + ( GND ) + ( \comb_3|Add5~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(8),
	cin => \comb_3|Add5~62\,
	sumout => \comb_3|Add5~65_sumout\,
	cout => \comb_3|Add5~66\);

-- Location: FF_X85_Y4_N26
\comb_3|ssm_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~65_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(8));

-- Location: LABCELL_X85_Y4_N27
\comb_3|Add5~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~69_sumout\ = SUM(( \comb_3|ssm_counter\(9) ) + ( GND ) + ( \comb_3|Add5~66\ ))
-- \comb_3|Add5~70\ = CARRY(( \comb_3|ssm_counter\(9) ) + ( GND ) + ( \comb_3|Add5~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(9),
	cin => \comb_3|Add5~66\,
	sumout => \comb_3|Add5~69_sumout\,
	cout => \comb_3|Add5~70\);

-- Location: FF_X85_Y4_N28
\comb_3|ssm_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~69_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(9));

-- Location: LABCELL_X85_Y4_N30
\comb_3|Add5~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~73_sumout\ = SUM(( \comb_3|ssm_counter\(10) ) + ( GND ) + ( \comb_3|Add5~70\ ))
-- \comb_3|Add5~74\ = CARRY(( \comb_3|ssm_counter\(10) ) + ( GND ) + ( \comb_3|Add5~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(10),
	cin => \comb_3|Add5~70\,
	sumout => \comb_3|Add5~73_sumout\,
	cout => \comb_3|Add5~74\);

-- Location: FF_X85_Y4_N32
\comb_3|ssm_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~73_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(10));

-- Location: LABCELL_X85_Y4_N33
\comb_3|Add5~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~77_sumout\ = SUM(( \comb_3|ssm_counter\(11) ) + ( GND ) + ( \comb_3|Add5~74\ ))
-- \comb_3|Add5~78\ = CARRY(( \comb_3|ssm_counter\(11) ) + ( GND ) + ( \comb_3|Add5~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(11),
	cin => \comb_3|Add5~74\,
	sumout => \comb_3|Add5~77_sumout\,
	cout => \comb_3|Add5~78\);

-- Location: FF_X85_Y4_N35
\comb_3|ssm_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~77_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(11));

-- Location: LABCELL_X85_Y4_N36
\comb_3|Add5~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~33_sumout\ = SUM(( \comb_3|ssm_counter\(12) ) + ( GND ) + ( \comb_3|Add5~78\ ))
-- \comb_3|Add5~34\ = CARRY(( \comb_3|ssm_counter\(12) ) + ( GND ) + ( \comb_3|Add5~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(12),
	cin => \comb_3|Add5~78\,
	sumout => \comb_3|Add5~33_sumout\,
	cout => \comb_3|Add5~34\);

-- Location: FF_X85_Y4_N38
\comb_3|ssm_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~33_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(12));

-- Location: LABCELL_X85_Y4_N39
\comb_3|Add5~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~37_sumout\ = SUM(( \comb_3|ssm_counter\(13) ) + ( GND ) + ( \comb_3|Add5~34\ ))
-- \comb_3|Add5~38\ = CARRY(( \comb_3|ssm_counter\(13) ) + ( GND ) + ( \comb_3|Add5~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(13),
	cin => \comb_3|Add5~34\,
	sumout => \comb_3|Add5~37_sumout\,
	cout => \comb_3|Add5~38\);

-- Location: FF_X85_Y4_N41
\comb_3|ssm_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~37_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(13));

-- Location: LABCELL_X85_Y4_N42
\comb_3|Add5~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~41_sumout\ = SUM(( \comb_3|ssm_counter\(14) ) + ( GND ) + ( \comb_3|Add5~38\ ))
-- \comb_3|Add5~42\ = CARRY(( \comb_3|ssm_counter\(14) ) + ( GND ) + ( \comb_3|Add5~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(14),
	cin => \comb_3|Add5~38\,
	sumout => \comb_3|Add5~41_sumout\,
	cout => \comb_3|Add5~42\);

-- Location: FF_X85_Y4_N43
\comb_3|ssm_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~41_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(14));

-- Location: LABCELL_X85_Y4_N45
\comb_3|Add5~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~45_sumout\ = SUM(( \comb_3|ssm_counter\(15) ) + ( GND ) + ( \comb_3|Add5~42\ ))
-- \comb_3|Add5~46\ = CARRY(( \comb_3|ssm_counter\(15) ) + ( GND ) + ( \comb_3|Add5~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(15),
	cin => \comb_3|Add5~42\,
	sumout => \comb_3|Add5~45_sumout\,
	cout => \comb_3|Add5~46\);

-- Location: FF_X85_Y4_N46
\comb_3|ssm_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~45_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(15));

-- Location: LABCELL_X85_Y4_N48
\comb_3|Add5~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~53_sumout\ = SUM(( \comb_3|ssm_counter\(16) ) + ( GND ) + ( \comb_3|Add5~46\ ))
-- \comb_3|Add5~54\ = CARRY(( \comb_3|ssm_counter\(16) ) + ( GND ) + ( \comb_3|Add5~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(16),
	cin => \comb_3|Add5~46\,
	sumout => \comb_3|Add5~53_sumout\,
	cout => \comb_3|Add5~54\);

-- Location: FF_X85_Y4_N49
\comb_3|ssm_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~53_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(16));

-- Location: LABCELL_X85_Y4_N51
\comb_3|Add5~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~9_sumout\ = SUM(( \comb_3|ssm_counter\(17) ) + ( GND ) + ( \comb_3|Add5~54\ ))
-- \comb_3|Add5~10\ = CARRY(( \comb_3|ssm_counter\(17) ) + ( GND ) + ( \comb_3|Add5~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(17),
	cin => \comb_3|Add5~54\,
	sumout => \comb_3|Add5~9_sumout\,
	cout => \comb_3|Add5~10\);

-- Location: FF_X85_Y4_N53
\comb_3|ssm_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~9_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(17));

-- Location: LABCELL_X85_Y4_N54
\comb_3|Add5~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~13_sumout\ = SUM(( \comb_3|ssm_counter\(18) ) + ( GND ) + ( \comb_3|Add5~10\ ))
-- \comb_3|Add5~14\ = CARRY(( \comb_3|ssm_counter\(18) ) + ( GND ) + ( \comb_3|Add5~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(18),
	cin => \comb_3|Add5~10\,
	sumout => \comb_3|Add5~13_sumout\,
	cout => \comb_3|Add5~14\);

-- Location: FF_X85_Y4_N56
\comb_3|ssm_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~13_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(18));

-- Location: LABCELL_X85_Y4_N57
\comb_3|Add5~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~17_sumout\ = SUM(( \comb_3|ssm_counter\(19) ) + ( GND ) + ( \comb_3|Add5~14\ ))
-- \comb_3|Add5~18\ = CARRY(( \comb_3|ssm_counter\(19) ) + ( GND ) + ( \comb_3|Add5~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(19),
	cin => \comb_3|Add5~14\,
	sumout => \comb_3|Add5~17_sumout\,
	cout => \comb_3|Add5~18\);

-- Location: FF_X85_Y4_N58
\comb_3|ssm_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~17_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(19));

-- Location: LABCELL_X85_Y3_N0
\comb_3|Add5~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~21_sumout\ = SUM(( \comb_3|ssm_counter\(20) ) + ( GND ) + ( \comb_3|Add5~18\ ))
-- \comb_3|Add5~22\ = CARRY(( \comb_3|ssm_counter\(20) ) + ( GND ) + ( \comb_3|Add5~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(20),
	cin => \comb_3|Add5~18\,
	sumout => \comb_3|Add5~21_sumout\,
	cout => \comb_3|Add5~22\);

-- Location: FF_X85_Y3_N2
\comb_3|ssm_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~21_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(20));

-- Location: LABCELL_X85_Y3_N3
\comb_3|Add5~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~97_sumout\ = SUM(( \comb_3|ssm_counter\(21) ) + ( GND ) + ( \comb_3|Add5~22\ ))
-- \comb_3|Add5~98\ = CARRY(( \comb_3|ssm_counter\(21) ) + ( GND ) + ( \comb_3|Add5~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(21),
	cin => \comb_3|Add5~22\,
	sumout => \comb_3|Add5~97_sumout\,
	cout => \comb_3|Add5~98\);

-- Location: FF_X85_Y3_N5
\comb_3|ssm_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~97_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(21));

-- Location: LABCELL_X85_Y3_N6
\comb_3|Add5~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~101_sumout\ = SUM(( \comb_3|ssm_counter\(22) ) + ( GND ) + ( \comb_3|Add5~98\ ))
-- \comb_3|Add5~102\ = CARRY(( \comb_3|ssm_counter\(22) ) + ( GND ) + ( \comb_3|Add5~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(22),
	cin => \comb_3|Add5~98\,
	sumout => \comb_3|Add5~101_sumout\,
	cout => \comb_3|Add5~102\);

-- Location: FF_X85_Y3_N8
\comb_3|ssm_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~101_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(22));

-- Location: LABCELL_X85_Y3_N9
\comb_3|Add5~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~49_sumout\ = SUM(( \comb_3|ssm_counter\(23) ) + ( GND ) + ( \comb_3|Add5~102\ ))
-- \comb_3|Add5~50\ = CARRY(( \comb_3|ssm_counter\(23) ) + ( GND ) + ( \comb_3|Add5~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(23),
	cin => \comb_3|Add5~102\,
	sumout => \comb_3|Add5~49_sumout\,
	cout => \comb_3|Add5~50\);

-- Location: FF_X85_Y3_N11
\comb_3|ssm_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~49_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(23));

-- Location: LABCELL_X85_Y3_N12
\comb_3|Add5~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~93_sumout\ = SUM(( \comb_3|ssm_counter\(24) ) + ( GND ) + ( \comb_3|Add5~50\ ))
-- \comb_3|Add5~94\ = CARRY(( \comb_3|ssm_counter\(24) ) + ( GND ) + ( \comb_3|Add5~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(24),
	cin => \comb_3|Add5~50\,
	sumout => \comb_3|Add5~93_sumout\,
	cout => \comb_3|Add5~94\);

-- Location: FF_X85_Y3_N14
\comb_3|ssm_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~93_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(24));

-- Location: LABCELL_X85_Y3_N15
\comb_3|Add5~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~89_sumout\ = SUM(( \comb_3|ssm_counter\(25) ) + ( GND ) + ( \comb_3|Add5~94\ ))
-- \comb_3|Add5~90\ = CARRY(( \comb_3|ssm_counter\(25) ) + ( GND ) + ( \comb_3|Add5~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(25),
	cin => \comb_3|Add5~94\,
	sumout => \comb_3|Add5~89_sumout\,
	cout => \comb_3|Add5~90\);

-- Location: FF_X85_Y3_N17
\comb_3|ssm_counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~89_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(25));

-- Location: LABCELL_X85_Y3_N18
\comb_3|Add5~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~85_sumout\ = SUM(( \comb_3|ssm_counter\(26) ) + ( GND ) + ( \comb_3|Add5~90\ ))
-- \comb_3|Add5~86\ = CARRY(( \comb_3|ssm_counter\(26) ) + ( GND ) + ( \comb_3|Add5~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(26),
	cin => \comb_3|Add5~90\,
	sumout => \comb_3|Add5~85_sumout\,
	cout => \comb_3|Add5~86\);

-- Location: FF_X85_Y3_N20
\comb_3|ssm_counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~85_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(26));

-- Location: LABCELL_X85_Y3_N21
\comb_3|Add5~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~81_sumout\ = SUM(( \comb_3|ssm_counter\(27) ) + ( GND ) + ( \comb_3|Add5~86\ ))
-- \comb_3|Add5~82\ = CARRY(( \comb_3|ssm_counter\(27) ) + ( GND ) + ( \comb_3|Add5~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(27),
	cin => \comb_3|Add5~86\,
	sumout => \comb_3|Add5~81_sumout\,
	cout => \comb_3|Add5~82\);

-- Location: FF_X85_Y3_N23
\comb_3|ssm_counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~81_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(27));

-- Location: LABCELL_X85_Y3_N48
\comb_3|Equal8~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal8~4_combout\ = ( !\comb_3|ssm_counter\(27) & ( !\comb_3|ssm_counter\(25) & ( (!\comb_3|ssm_counter\(21) & (!\comb_3|ssm_counter\(22) & (!\comb_3|ssm_counter\(26) & !\comb_3|ssm_counter\(24)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_ssm_counter\(21),
	datab => \comb_3|ALT_INV_ssm_counter\(22),
	datac => \comb_3|ALT_INV_ssm_counter\(26),
	datad => \comb_3|ALT_INV_ssm_counter\(24),
	datae => \comb_3|ALT_INV_ssm_counter\(27),
	dataf => \comb_3|ALT_INV_ssm_counter\(25),
	combout => \comb_3|Equal8~4_combout\);

-- Location: LABCELL_X85_Y3_N54
\comb_3|Equal8~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal8~2_combout\ = ( !\comb_3|ssm_counter\(13) & ( !\comb_3|ssm_counter\(12) & ( (!\comb_3|ssm_counter\(16) & (!\comb_3|ssm_counter\(23) & (!\comb_3|ssm_counter\(14) & !\comb_3|ssm_counter\(15)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_ssm_counter\(16),
	datab => \comb_3|ALT_INV_ssm_counter\(23),
	datac => \comb_3|ALT_INV_ssm_counter\(14),
	datad => \comb_3|ALT_INV_ssm_counter\(15),
	datae => \comb_3|ALT_INV_ssm_counter\(13),
	dataf => \comb_3|ALT_INV_ssm_counter\(12),
	combout => \comb_3|Equal8~2_combout\);

-- Location: LABCELL_X85_Y3_N24
\comb_3|Add5~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~5_sumout\ = SUM(( \comb_3|ssm_counter\(28) ) + ( GND ) + ( \comb_3|Add5~82\ ))
-- \comb_3|Add5~6\ = CARRY(( \comb_3|ssm_counter\(28) ) + ( GND ) + ( \comb_3|Add5~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(28),
	cin => \comb_3|Add5~82\,
	sumout => \comb_3|Add5~5_sumout\,
	cout => \comb_3|Add5~6\);

-- Location: FF_X85_Y3_N26
\comb_3|ssm_counter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~5_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(28));

-- Location: LABCELL_X85_Y3_N27
\comb_3|Add5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~1_sumout\ = SUM(( \comb_3|ssm_counter\(29) ) + ( GND ) + ( \comb_3|Add5~6\ ))
-- \comb_3|Add5~2\ = CARRY(( \comb_3|ssm_counter\(29) ) + ( GND ) + ( \comb_3|Add5~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(29),
	cin => \comb_3|Add5~6\,
	sumout => \comb_3|Add5~1_sumout\,
	cout => \comb_3|Add5~2\);

-- Location: FF_X85_Y3_N29
\comb_3|ssm_counter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~1_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(29));

-- Location: MLABCELL_X84_Y3_N42
\comb_3|Equal8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal8~0_combout\ = ( !\comb_3|ssm_counter\(29) & ( !\comb_3|ssm_counter\(28) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \comb_3|ALT_INV_ssm_counter\(29),
	dataf => \comb_3|ALT_INV_ssm_counter\(28),
	combout => \comb_3|Equal8~0_combout\);

-- Location: LABCELL_X85_Y3_N30
\comb_3|Add5~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~29_sumout\ = SUM(( \comb_3|ssm_counter\(30) ) + ( GND ) + ( \comb_3|Add5~2\ ))
-- \comb_3|Add5~30\ = CARRY(( \comb_3|ssm_counter\(30) ) + ( GND ) + ( \comb_3|Add5~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(30),
	cin => \comb_3|Add5~2\,
	sumout => \comb_3|Add5~29_sumout\,
	cout => \comb_3|Add5~30\);

-- Location: FF_X85_Y3_N32
\comb_3|ssm_counter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~29_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(30));

-- Location: LABCELL_X85_Y3_N33
\comb_3|Add5~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add5~25_sumout\ = SUM(( \comb_3|ssm_counter\(31) ) + ( GND ) + ( \comb_3|Add5~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \comb_3|ALT_INV_ssm_counter\(31),
	cin => \comb_3|Add5~30\,
	sumout => \comb_3|Add5~25_sumout\);

-- Location: FF_X85_Y3_N35
\comb_3|ssm_counter[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Add5~25_sumout\,
	sclr => \comb_3|Equal8~6_combout\,
	ena => \comb_3|ssm_counter[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm_counter\(31));

-- Location: LABCELL_X85_Y3_N36
\comb_3|Equal8~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal8~1_combout\ = ( !\comb_3|ssm_counter\(18) & ( !\comb_3|ssm_counter\(19) & ( (!\comb_3|ssm_counter\(20) & (!\comb_3|ssm_counter\(30) & (!\comb_3|ssm_counter\(31) & !\comb_3|ssm_counter\(17)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_ssm_counter\(20),
	datab => \comb_3|ALT_INV_ssm_counter\(30),
	datac => \comb_3|ALT_INV_ssm_counter\(31),
	datad => \comb_3|ALT_INV_ssm_counter\(17),
	datae => \comb_3|ALT_INV_ssm_counter\(18),
	dataf => \comb_3|ALT_INV_ssm_counter\(19),
	combout => \comb_3|Equal8~1_combout\);

-- Location: MLABCELL_X84_Y4_N0
\comb_3|Equal8~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal8~3_combout\ = ( !\comb_3|ssm_counter\(7) & ( !\comb_3|ssm_counter\(6) & ( (!\comb_3|ssm_counter\(11) & (!\comb_3|ssm_counter\(8) & (!\comb_3|ssm_counter\(10) & !\comb_3|ssm_counter\(9)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_ssm_counter\(11),
	datab => \comb_3|ALT_INV_ssm_counter\(8),
	datac => \comb_3|ALT_INV_ssm_counter\(10),
	datad => \comb_3|ALT_INV_ssm_counter\(9),
	datae => \comb_3|ALT_INV_ssm_counter\(7),
	dataf => \comb_3|ALT_INV_ssm_counter\(6),
	combout => \comb_3|Equal8~3_combout\);

-- Location: LABCELL_X85_Y3_N42
\comb_3|Equal8~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Equal8~6_combout\ = ( \comb_3|Equal8~1_combout\ & ( \comb_3|Equal8~3_combout\ & ( (\comb_3|Equal8~5_combout\ & (\comb_3|Equal8~4_combout\ & (\comb_3|Equal8~2_combout\ & \comb_3|Equal8~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_Equal8~5_combout\,
	datab => \comb_3|ALT_INV_Equal8~4_combout\,
	datac => \comb_3|ALT_INV_Equal8~2_combout\,
	datad => \comb_3|ALT_INV_Equal8~0_combout\,
	datae => \comb_3|ALT_INV_Equal8~1_combout\,
	dataf => \comb_3|ALT_INV_Equal8~3_combout\,
	combout => \comb_3|Equal8~6_combout\);

-- Location: MLABCELL_X82_Y1_N54
\comb_3|ssm~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|ssm~3_combout\ = ( \comb_3|led_out\(7) & ( (\comb_3|always2~2_combout\ & (!\comb_3|Equal8~6_combout\ & ((!\comb_3|LessThan2~0_combout\) # (!\comb_3|led_out\(6))))) ) ) # ( !\comb_3|led_out\(7) & ( (\comb_3|always2~2_combout\ & 
-- !\comb_3|Equal8~6_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101010000000001010100000000000101010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_always2~2_combout\,
	datab => \comb_3|ALT_INV_LessThan2~0_combout\,
	datac => \comb_3|ALT_INV_led_out\(6),
	datad => \comb_3|ALT_INV_Equal8~6_combout\,
	dataf => \comb_3|ALT_INV_led_out\(7),
	combout => \comb_3|ssm~3_combout\);

-- Location: MLABCELL_X82_Y1_N0
\comb_3|Add4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add4~1_sumout\ = SUM(( VCC ) + ( (\comb_3|Equal5~1_combout\ & \comb_3|led_out1\(0)) ) + ( !VCC ))
-- \comb_3|Add4~2\ = CARRY(( VCC ) + ( (\comb_3|Equal5~1_combout\ & \comb_3|led_out1\(0)) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111100110000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_3|ALT_INV_Equal5~1_combout\,
	dataf => \comb_3|ALT_INV_led_out1\(0),
	cin => GND,
	sumout => \comb_3|Add4~1_sumout\,
	cout => \comb_3|Add4~2\);

-- Location: MLABCELL_X82_Y1_N24
\comb_3|Mux45~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux45~0_combout\ = ( \comb_3|led_out1\(0) & ( (!\comb_3|Equal5~0_combout\) # (!\comb_3|always1~4_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111100001111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \comb_3|ALT_INV_Equal5~0_combout\,
	datad => \comb_3|ALT_INV_always1~4_combout\,
	dataf => \comb_3|ALT_INV_led_out1\(0),
	combout => \comb_3|Mux45~0_combout\);

-- Location: MLABCELL_X82_Y1_N39
\comb_3|Mux45~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux45~1_combout\ = ( \comb_3|Add4~1_sumout\ & ( \comb_3|Mux45~0_combout\ ) ) # ( !\comb_3|Add4~1_sumout\ & ( \comb_3|Mux45~0_combout\ & ( (!\switch[1]~input_o\ & (((!\comb_3|always2~0_combout\ & \switch[0]~input_o\)))) # (\switch[1]~input_o\ & 
-- ((!\comb_3|ssm~3_combout\) # ((\switch[0]~input_o\)))) ) ) ) # ( \comb_3|Add4~1_sumout\ & ( !\comb_3|Mux45~0_combout\ & ( (!\switch[1]~input_o\ & (((!\switch[0]~input_o\) # (\comb_3|always2~0_combout\)))) # (\switch[1]~input_o\ & (\comb_3|ssm~3_combout\ & 
-- ((!\switch[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110111010000110000100010111100111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_ssm~3_combout\,
	datab => \ALT_INV_switch[1]~input_o\,
	datac => \comb_3|ALT_INV_always2~0_combout\,
	datad => \ALT_INV_switch[0]~input_o\,
	datae => \comb_3|ALT_INV_Add4~1_sumout\,
	dataf => \comb_3|ALT_INV_Mux45~0_combout\,
	combout => \comb_3|Mux45~1_combout\);

-- Location: MLABCELL_X84_Y3_N48
\comb_3|led_out1[30]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|led_out1[30]~0_combout\ = ( !\switch[1]~input_o\ & ( !\switch[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_switch[0]~input_o\,
	dataf => \ALT_INV_switch[1]~input_o\,
	combout => \comb_3|led_out1[30]~0_combout\);

-- Location: FF_X82_Y1_N41
\comb_3|led_out1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Mux45~1_combout\,
	sclr => \comb_3|led_out1[30]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|led_out1\(0));

-- Location: MLABCELL_X82_Y3_N54
\comb_3|ssm~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|ssm~1_combout\ = ( \comb_3|ssm\(0) & ( \comb_3|always1~4_combout\ & ( (\comb_3|led_out1\(0) & (\comb_3|always2~0_combout\ & !\comb_3|Equal5~0_combout\)) ) ) ) # ( !\comb_3|ssm\(0) & ( \comb_3|always1~4_combout\ & ( (!\comb_3|always2~0_combout\) # 
-- ((\comb_3|led_out1\(0) & !\comb_3|Equal5~0_combout\)) ) ) ) # ( \comb_3|ssm\(0) & ( !\comb_3|always1~4_combout\ & ( (\comb_3|led_out1\(0) & \comb_3|always2~0_combout\) ) ) ) # ( !\comb_3|ssm\(0) & ( !\comb_3|always1~4_combout\ & ( 
-- (!\comb_3|always2~0_combout\) # (\comb_3|led_out1\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111010111110101000001010000010111110101111100000000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_led_out1\(0),
	datac => \comb_3|ALT_INV_always2~0_combout\,
	datad => \comb_3|ALT_INV_Equal5~0_combout\,
	datae => \comb_3|ALT_INV_ssm\(0),
	dataf => \comb_3|ALT_INV_always1~4_combout\,
	combout => \comb_3|ssm~1_combout\);

-- Location: MLABCELL_X82_Y3_N12
\comb_3|ssm~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|ssm~0_combout\ = ( \comb_3|Equal8~6_combout\ & ( \comb_3|always1~4_combout\ & ( !\comb_3|ssm\(0) ) ) ) # ( !\comb_3|Equal8~6_combout\ & ( \comb_3|always1~4_combout\ & ( (!\comb_3|always2~3_combout\ & (\comb_3|led_out1\(0) & 
-- ((!\comb_3|Equal5~0_combout\)))) # (\comb_3|always2~3_combout\ & (((!\comb_3|ssm\(0))))) ) ) ) # ( \comb_3|Equal8~6_combout\ & ( !\comb_3|always1~4_combout\ & ( !\comb_3|ssm\(0) ) ) ) # ( !\comb_3|Equal8~6_combout\ & ( !\comb_3|always1~4_combout\ & ( 
-- (!\comb_3|always2~3_combout\ & (\comb_3|led_out1\(0))) # (\comb_3|always2~3_combout\ & ((!\comb_3|ssm\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101110001011100110011001100110001011100000011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_led_out1\(0),
	datab => \comb_3|ALT_INV_ssm\(0),
	datac => \comb_3|ALT_INV_always2~3_combout\,
	datad => \comb_3|ALT_INV_Equal5~0_combout\,
	datae => \comb_3|ALT_INV_Equal8~6_combout\,
	dataf => \comb_3|ALT_INV_always1~4_combout\,
	combout => \comb_3|ssm~0_combout\);

-- Location: MLABCELL_X82_Y3_N30
\comb_3|Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux13~0_combout\ = ( \switch[0]~input_o\ & ( \comb_3|ssm\(0) & ( (!\switch[1]~input_o\ & (!\comb_3|ssm~1_combout\)) # (\switch[1]~input_o\ & ((\comb_3|always2~1_combout\))) ) ) ) # ( !\switch[0]~input_o\ & ( \comb_3|ssm\(0) & ( 
-- (!\comb_3|ssm~0_combout\) # (!\switch[1]~input_o\) ) ) ) # ( \switch[0]~input_o\ & ( !\comb_3|ssm\(0) & ( (!\comb_3|ssm~1_combout\ & !\switch[1]~input_o\) ) ) ) # ( !\switch[0]~input_o\ & ( !\comb_3|ssm\(0) & ( (!\comb_3|ssm~0_combout\ & 
-- \switch[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100101010100000000011111111110011001010101000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_ssm~1_combout\,
	datab => \comb_3|ALT_INV_ssm~0_combout\,
	datac => \comb_3|ALT_INV_always2~1_combout\,
	datad => \ALT_INV_switch[1]~input_o\,
	datae => \ALT_INV_switch[0]~input_o\,
	dataf => \comb_3|ALT_INV_ssm\(0),
	combout => \comb_3|Mux13~0_combout\);

-- Location: FF_X83_Y3_N44
\comb_3|ssm[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \comb_3|Mux13~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm\(0));

-- Location: MLABCELL_X82_Y1_N27
\comb_3|led_out1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|led_out1~2_combout\ = ( \comb_3|always1~4_combout\ & ( (!\comb_3|Equal5~0_combout\ & \comb_3|led_out1\(2)) ) ) # ( !\comb_3|always1~4_combout\ & ( \comb_3|led_out1\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \comb_3|ALT_INV_Equal5~0_combout\,
	datad => \comb_3|ALT_INV_led_out1\(2),
	dataf => \comb_3|ALT_INV_always1~4_combout\,
	combout => \comb_3|led_out1~2_combout\);

-- Location: MLABCELL_X82_Y1_N3
\comb_3|Add4~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add4~5_sumout\ = SUM(( GND ) + ( (\comb_3|Equal5~1_combout\ & \comb_3|led_out1\(1)) ) + ( \comb_3|Add4~2\ ))
-- \comb_3|Add4~6\ = CARRY(( GND ) + ( (\comb_3|Equal5~1_combout\ & \comb_3|led_out1\(1)) ) + ( \comb_3|Add4~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \comb_3|ALT_INV_Equal5~1_combout\,
	dataf => \comb_3|ALT_INV_led_out1\(1),
	cin => \comb_3|Add4~2\,
	sumout => \comb_3|Add4~5_sumout\,
	cout => \comb_3|Add4~6\);

-- Location: MLABCELL_X82_Y1_N18
\comb_3|led_out1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|led_out1~1_combout\ = ( !\comb_3|always1~4_combout\ & ( \comb_3|Equal5~0_combout\ & ( \comb_3|led_out1\(1) ) ) ) # ( \comb_3|always1~4_combout\ & ( !\comb_3|Equal5~0_combout\ & ( \comb_3|led_out1\(1) ) ) ) # ( !\comb_3|always1~4_combout\ & ( 
-- !\comb_3|Equal5~0_combout\ & ( \comb_3|led_out1\(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_3|ALT_INV_led_out1\(1),
	datae => \comb_3|ALT_INV_always1~4_combout\,
	dataf => \comb_3|ALT_INV_Equal5~0_combout\,
	combout => \comb_3|led_out1~1_combout\);

-- Location: MLABCELL_X82_Y1_N42
\comb_3|Mux44~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux44~0_combout\ = ( \comb_3|Add4~5_sumout\ & ( \comb_3|led_out1~1_combout\ ) ) # ( !\comb_3|Add4~5_sumout\ & ( \comb_3|led_out1~1_combout\ & ( (!\switch[0]~input_o\ & (\switch[1]~input_o\ & (!\comb_3|ssm~3_combout\))) # (\switch[0]~input_o\ & 
-- (((!\comb_3|always2~0_combout\)) # (\switch[1]~input_o\))) ) ) ) # ( \comb_3|Add4~5_sumout\ & ( !\comb_3|led_out1~1_combout\ & ( (!\switch[0]~input_o\ & ((!\switch[1]~input_o\) # ((\comb_3|ssm~3_combout\)))) # (\switch[0]~input_o\ & (!\switch[1]~input_o\ 
-- & ((\comb_3|always2~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100010101100111001110101001100011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switch[0]~input_o\,
	datab => \ALT_INV_switch[1]~input_o\,
	datac => \comb_3|ALT_INV_ssm~3_combout\,
	datad => \comb_3|ALT_INV_always2~0_combout\,
	datae => \comb_3|ALT_INV_Add4~5_sumout\,
	dataf => \comb_3|ALT_INV_led_out1~1_combout\,
	combout => \comb_3|Mux44~0_combout\);

-- Location: FF_X82_Y1_N44
\comb_3|led_out1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Mux44~0_combout\,
	sclr => \comb_3|led_out1[30]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|led_out1\(1));

-- Location: MLABCELL_X82_Y1_N6
\comb_3|Add4~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add4~9_sumout\ = SUM(( GND ) + ( (\comb_3|Equal5~1_combout\ & \comb_3|led_out1\(2)) ) + ( \comb_3|Add4~6\ ))
-- \comb_3|Add4~10\ = CARRY(( GND ) + ( (\comb_3|Equal5~1_combout\ & \comb_3|led_out1\(2)) ) + ( \comb_3|Add4~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_3|ALT_INV_Equal5~1_combout\,
	dataf => \comb_3|ALT_INV_led_out1\(2),
	cin => \comb_3|Add4~6\,
	sumout => \comb_3|Add4~9_sumout\,
	cout => \comb_3|Add4~10\);

-- Location: MLABCELL_X82_Y1_N51
\comb_3|Mux43~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux43~0_combout\ = ( \comb_3|led_out1~2_combout\ & ( \comb_3|Add4~9_sumout\ ) ) # ( !\comb_3|led_out1~2_combout\ & ( \comb_3|Add4~9_sumout\ & ( (!\switch[1]~input_o\ & (((!\switch[0]~input_o\) # (\comb_3|always2~0_combout\)))) # 
-- (\switch[1]~input_o\ & (\comb_3|ssm~3_combout\ & ((!\switch[0]~input_o\)))) ) ) ) # ( \comb_3|led_out1~2_combout\ & ( !\comb_3|Add4~9_sumout\ & ( (!\switch[1]~input_o\ & (((!\comb_3|always2~0_combout\ & \switch[0]~input_o\)))) # (\switch[1]~input_o\ & 
-- ((!\comb_3|ssm~3_combout\) # ((\switch[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001000101111001111011101000011001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_ssm~3_combout\,
	datab => \ALT_INV_switch[1]~input_o\,
	datac => \comb_3|ALT_INV_always2~0_combout\,
	datad => \ALT_INV_switch[0]~input_o\,
	datae => \comb_3|ALT_INV_led_out1~2_combout\,
	dataf => \comb_3|ALT_INV_Add4~9_sumout\,
	combout => \comb_3|Mux43~0_combout\);

-- Location: FF_X82_Y1_N53
\comb_3|led_out1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Mux43~0_combout\,
	sclr => \comb_3|led_out1[30]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|led_out1\(2));

-- Location: MLABCELL_X82_Y3_N6
\comb_3|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux11~0_combout\ = ( \switch[0]~input_o\ & ( \comb_3|always1~4_combout\ & ( (!\switch[1]~input_o\ & (!\comb_3|Equal5~0_combout\ & (!\comb_3|led_out1\(2) $ (!\comb_3|led_out1\(1))))) ) ) ) # ( !\switch[0]~input_o\ & ( \comb_3|always1~4_combout\ & ( 
-- (!\comb_3|Equal5~0_combout\ & (!\comb_3|led_out1\(2) $ (((!\comb_3|led_out1\(1)) # (\switch[1]~input_o\))))) ) ) ) # ( \switch[0]~input_o\ & ( !\comb_3|always1~4_combout\ & ( (!\switch[1]~input_o\ & (!\comb_3|led_out1\(2) $ (!\comb_3|led_out1\(1)))) ) ) ) 
-- # ( !\switch[0]~input_o\ & ( !\comb_3|always1~4_combout\ & ( !\comb_3|led_out1\(2) $ (((!\comb_3|led_out1\(1)) # (\switch[1]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110011001010001001000100001010000100100000100000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_led_out1\(2),
	datab => \ALT_INV_switch[1]~input_o\,
	datac => \comb_3|ALT_INV_Equal5~0_combout\,
	datad => \comb_3|ALT_INV_led_out1\(1),
	datae => \ALT_INV_switch[0]~input_o\,
	dataf => \comb_3|ALT_INV_always1~4_combout\,
	combout => \comb_3|Mux11~0_combout\);

-- Location: MLABCELL_X84_Y3_N27
\comb_3|ssm[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|ssm[1]~2_combout\ = ( \comb_3|Equal8~6_combout\ & ( \comb_3|always2~3_combout\ & ( (\switch[0]~input_o\ & ((!\switch[1]~input_o\ & ((\comb_3|always2~0_combout\))) # (\switch[1]~input_o\ & (!\comb_3|always2~1_combout\)))) ) ) ) # ( 
-- !\comb_3|Equal8~6_combout\ & ( \comb_3|always2~3_combout\ & ( (\switch[0]~input_o\ & ((!\switch[1]~input_o\ & ((\comb_3|always2~0_combout\))) # (\switch[1]~input_o\ & (!\comb_3|always2~1_combout\)))) ) ) ) # ( \comb_3|Equal8~6_combout\ & ( 
-- !\comb_3|always2~3_combout\ & ( (\switch[0]~input_o\ & ((!\switch[1]~input_o\ & ((\comb_3|always2~0_combout\))) # (\switch[1]~input_o\ & (!\comb_3|always2~1_combout\)))) ) ) ) # ( !\comb_3|Equal8~6_combout\ & ( !\comb_3|always2~3_combout\ & ( 
-- (!\switch[1]~input_o\ & (((\comb_3|always2~0_combout\ & \switch[0]~input_o\)))) # (\switch[1]~input_o\ & ((!\comb_3|always2~1_combout\) # ((!\switch[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101001110000000000100111000000000010011100000000001001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switch[1]~input_o\,
	datab => \comb_3|ALT_INV_always2~1_combout\,
	datac => \comb_3|ALT_INV_always2~0_combout\,
	datad => \ALT_INV_switch[0]~input_o\,
	datae => \comb_3|ALT_INV_Equal8~6_combout\,
	dataf => \comb_3|ALT_INV_always2~3_combout\,
	combout => \comb_3|ssm[1]~2_combout\);

-- Location: FF_X83_Y3_N5
\comb_3|ssm[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \comb_3|Mux11~0_combout\,
	sload => VCC,
	ena => \comb_3|ssm[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm\(2));

-- Location: MLABCELL_X82_Y1_N57
\comb_3|led_out1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|led_out1~3_combout\ = ( \comb_3|always1~4_combout\ & ( (!\comb_3|Equal5~0_combout\ & \comb_3|led_out1\(3)) ) ) # ( !\comb_3|always1~4_combout\ & ( \comb_3|led_out1\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \comb_3|ALT_INV_Equal5~0_combout\,
	datad => \comb_3|ALT_INV_led_out1\(3),
	dataf => \comb_3|ALT_INV_always1~4_combout\,
	combout => \comb_3|led_out1~3_combout\);

-- Location: MLABCELL_X82_Y1_N9
\comb_3|Add4~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Add4~13_sumout\ = SUM(( GND ) + ( (\comb_3|Equal5~1_combout\ & \comb_3|led_out1\(3)) ) + ( \comb_3|Add4~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \comb_3|ALT_INV_Equal5~1_combout\,
	dataf => \comb_3|ALT_INV_led_out1\(3),
	cin => \comb_3|Add4~10\,
	sumout => \comb_3|Add4~13_sumout\);

-- Location: MLABCELL_X82_Y1_N48
\comb_3|Mux42~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux42~0_combout\ = ( \comb_3|led_out1~3_combout\ & ( \comb_3|Add4~13_sumout\ ) ) # ( !\comb_3|led_out1~3_combout\ & ( \comb_3|Add4~13_sumout\ & ( (!\switch[1]~input_o\ & (((!\switch[0]~input_o\) # (\comb_3|always2~0_combout\)))) # 
-- (\switch[1]~input_o\ & (\comb_3|ssm~3_combout\ & (!\switch[0]~input_o\))) ) ) ) # ( \comb_3|led_out1~3_combout\ & ( !\comb_3|Add4~13_sumout\ & ( (!\switch[1]~input_o\ & (((\switch[0]~input_o\ & !\comb_3|always2~0_combout\)))) # (\switch[1]~input_o\ & 
-- ((!\comb_3|ssm~3_combout\) # ((\switch[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001011110010001111010000110111001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_ssm~3_combout\,
	datab => \ALT_INV_switch[1]~input_o\,
	datac => \ALT_INV_switch[0]~input_o\,
	datad => \comb_3|ALT_INV_always2~0_combout\,
	datae => \comb_3|ALT_INV_led_out1~3_combout\,
	dataf => \comb_3|ALT_INV_Add4~13_sumout\,
	combout => \comb_3|Mux42~0_combout\);

-- Location: FF_X82_Y1_N50
\comb_3|led_out1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Mux42~0_combout\,
	sclr => \comb_3|led_out1[30]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|led_out1\(3));

-- Location: LABCELL_X83_Y3_N0
\comb_3|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux10~0_combout\ = ( \comb_3|Equal5~1_combout\ & ( \switch[0]~input_o\ & ( (!\comb_3|led_out1\(3) $ (((\comb_3|led_out1\(2)) # (\comb_3|led_out1\(1))))) # (\switch[1]~input_o\) ) ) ) # ( !\comb_3|Equal5~1_combout\ & ( \switch[0]~input_o\ ) ) # ( 
-- \comb_3|Equal5~1_combout\ & ( !\switch[0]~input_o\ & ( !\comb_3|led_out1\(3) $ (((!\comb_3|led_out1\(2) & ((\switch[1]~input_o\) # (\comb_3|led_out1\(1)))) # (\comb_3|led_out1\(2) & ((!\switch[1]~input_o\))))) ) ) ) # ( !\comb_3|Equal5~1_combout\ & ( 
-- !\switch[0]~input_o\ & ( !\switch[1]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000100100110011110011111111111111111001001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_led_out1\(1),
	datab => \comb_3|ALT_INV_led_out1\(3),
	datac => \comb_3|ALT_INV_led_out1\(2),
	datad => \ALT_INV_switch[1]~input_o\,
	datae => \comb_3|ALT_INV_Equal5~1_combout\,
	dataf => \ALT_INV_switch[0]~input_o\,
	combout => \comb_3|Mux10~0_combout\);

-- Location: FF_X83_Y3_N2
\comb_3|ssm[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Mux10~0_combout\,
	ena => \comb_3|ssm[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm\(3));

-- Location: LABCELL_X83_Y3_N30
\comb_3|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_3|Mux12~0_combout\ = ( \switch[1]~input_o\ & ( ((!\comb_3|led_out1\(1)) # ((\comb_3|Equal5~0_combout\ & \comb_3|always1~4_combout\))) # (\switch[0]~input_o\) ) ) # ( !\switch[1]~input_o\ & ( (\comb_3|led_out1\(1) & ((!\comb_3|Equal5~0_combout\) # 
-- (!\comb_3|always1~4_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111100000000001111110011111111010101111111111101010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switch[0]~input_o\,
	datab => \comb_3|ALT_INV_Equal5~0_combout\,
	datac => \comb_3|ALT_INV_always1~4_combout\,
	datad => \comb_3|ALT_INV_led_out1\(1),
	dataf => \ALT_INV_switch[1]~input_o\,
	combout => \comb_3|Mux12~0_combout\);

-- Location: FF_X83_Y3_N32
\comb_3|ssm[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \comb_3|Mux12~0_combout\,
	ena => \comb_3|ssm[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \comb_3|ssm\(1));

-- Location: LABCELL_X83_Y3_N24
\comb_4|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|Mux0~0_combout\ = ( !\comb_3|ssm\(1) & ( (!\comb_3|ssm\(3) & (!\comb_3|ssm\(0) $ (!\comb_3|ssm\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000000000001111000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_3|ALT_INV_ssm\(0),
	datac => \comb_3|ALT_INV_ssm\(2),
	datad => \comb_3|ALT_INV_ssm\(3),
	dataf => \comb_3|ALT_INV_ssm\(1),
	combout => \comb_4|Mux0~0_combout\);

-- Location: LABCELL_X83_Y3_N57
\comb_4|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|Mux7~0_combout\ = ( \comb_3|ssm\(3) & ( ((\comb_3|ssm\(1) & \comb_3|ssm\(0))) # (\comb_3|ssm\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000011111111110000001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_3|ALT_INV_ssm\(1),
	datac => \comb_3|ALT_INV_ssm\(0),
	datad => \comb_3|ALT_INV_ssm\(2),
	dataf => \comb_3|ALT_INV_ssm\(3),
	combout => \comb_4|Mux7~0_combout\);

-- Location: LABCELL_X83_Y3_N33
\comb_4|seven_display[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|seven_display\(0) = ( \comb_4|seven_display\(0) & ( (\comb_4|Mux7~0_combout\) # (\comb_4|Mux0~0_combout\) ) ) # ( !\comb_4|seven_display\(0) & ( (\comb_4|Mux0~0_combout\ & !\comb_4|Mux7~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \comb_4|ALT_INV_Mux0~0_combout\,
	datad => \comb_4|ALT_INV_Mux7~0_combout\,
	dataf => \comb_4|ALT_INV_seven_display\(0),
	combout => \comb_4|seven_display\(0));

-- Location: LABCELL_X83_Y3_N36
\comb_4|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|Mux1~0_combout\ = ( \comb_3|ssm\(1) & ( (!\comb_3|ssm\(0) & (!\comb_3|ssm\(2) $ (!\comb_3|ssm\(3)))) ) ) # ( !\comb_3|ssm\(1) & ( (\comb_3|ssm\(0) & (\comb_3|ssm\(2) & !\comb_3|ssm\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000000001010000000000001010101000000000101010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_ssm\(0),
	datac => \comb_3|ALT_INV_ssm\(2),
	datad => \comb_3|ALT_INV_ssm\(3),
	dataf => \comb_3|ALT_INV_ssm\(1),
	combout => \comb_4|Mux1~0_combout\);

-- Location: LABCELL_X83_Y3_N15
\comb_4|seven_display[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|seven_display\(1) = ( \comb_4|seven_display\(1) & ( (\comb_4|Mux7~0_combout\) # (\comb_4|Mux1~0_combout\) ) ) # ( !\comb_4|seven_display\(1) & ( (\comb_4|Mux1~0_combout\ & !\comb_4|Mux7~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101010000000001010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_4|ALT_INV_Mux1~0_combout\,
	datad => \comb_4|ALT_INV_Mux7~0_combout\,
	dataf => \comb_4|ALT_INV_seven_display\(1),
	combout => \comb_4|seven_display\(1));

-- Location: LABCELL_X83_Y3_N12
\comb_4|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|Mux2~0_combout\ = ( \comb_3|ssm\(1) & ( (!\comb_3|ssm\(0) & !\comb_3|ssm\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100000000001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_3|ALT_INV_ssm\(0),
	datad => \comb_3|ALT_INV_ssm\(2),
	dataf => \comb_3|ALT_INV_ssm\(1),
	combout => \comb_4|Mux2~0_combout\);

-- Location: LABCELL_X83_Y3_N27
\comb_4|seven_display[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|seven_display\(2) = ( \comb_4|Mux7~0_combout\ & ( \comb_4|seven_display\(2) ) ) # ( !\comb_4|Mux7~0_combout\ & ( \comb_4|Mux2~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_4|ALT_INV_Mux2~0_combout\,
	datad => \comb_4|ALT_INV_seven_display\(2),
	dataf => \comb_4|ALT_INV_Mux7~0_combout\,
	combout => \comb_4|seven_display\(2));

-- Location: LABCELL_X83_Y3_N21
\comb_4|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|Mux3~0_combout\ = ( \comb_3|ssm\(1) & ( (\comb_3|ssm\(2) & (\comb_3|ssm\(0) & !\comb_3|ssm\(3))) ) ) # ( !\comb_3|ssm\(1) & ( (!\comb_3|ssm\(3) & (!\comb_3|ssm\(2) $ (!\comb_3|ssm\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101000000000010110100000000000000101000000000000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_ssm\(2),
	datac => \comb_3|ALT_INV_ssm\(0),
	datad => \comb_3|ALT_INV_ssm\(3),
	dataf => \comb_3|ALT_INV_ssm\(1),
	combout => \comb_4|Mux3~0_combout\);

-- Location: LABCELL_X83_Y3_N39
\comb_4|seven_display[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|seven_display\(3) = ( \comb_4|Mux7~0_combout\ & ( \comb_4|seven_display\(3) ) ) # ( !\comb_4|Mux7~0_combout\ & ( \comb_4|Mux3~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_4|ALT_INV_Mux3~0_combout\,
	datac => \comb_4|ALT_INV_seven_display\(3),
	dataf => \comb_4|ALT_INV_Mux7~0_combout\,
	combout => \comb_4|seven_display\(3));

-- Location: LABCELL_X83_Y3_N9
\comb_4|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|Mux4~0_combout\ = ( \comb_3|ssm\(1) & ( \comb_3|ssm\(0) ) ) # ( !\comb_3|ssm\(1) & ( (\comb_3|ssm\(2)) # (\comb_3|ssm\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111111111010101011111111101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_ssm\(0),
	datad => \comb_3|ALT_INV_ssm\(2),
	dataf => \comb_3|ALT_INV_ssm\(1),
	combout => \comb_4|Mux4~0_combout\);

-- Location: LABCELL_X83_Y3_N6
\comb_4|seven_display[4]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|seven_display\(4) = ( \comb_4|seven_display\(4) & ( (\comb_4|Mux7~0_combout\) # (\comb_4|Mux4~0_combout\) ) ) # ( !\comb_4|seven_display\(4) & ( (\comb_4|Mux4~0_combout\ & !\comb_4|Mux7~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100110000000000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_4|ALT_INV_Mux4~0_combout\,
	datad => \comb_4|ALT_INV_Mux7~0_combout\,
	dataf => \comb_4|ALT_INV_seven_display\(4),
	combout => \comb_4|seven_display\(4));

-- Location: LABCELL_X83_Y3_N54
\comb_4|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|Mux5~0_combout\ = ( \comb_3|ssm\(1) & ( (!\comb_3|ssm\(3) & ((!\comb_3|ssm\(2)) # (\comb_3|ssm\(0)))) ) ) # ( !\comb_3|ssm\(1) & ( (!\comb_3|ssm\(2) & (\comb_3|ssm\(0) & !\comb_3|ssm\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000010101111000000001010111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_3|ALT_INV_ssm\(2),
	datac => \comb_3|ALT_INV_ssm\(0),
	datad => \comb_3|ALT_INV_ssm\(3),
	dataf => \comb_3|ALT_INV_ssm\(1),
	combout => \comb_4|Mux5~0_combout\);

-- Location: LABCELL_X83_Y3_N45
\comb_4|seven_display[5]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|seven_display\(5) = ( \comb_4|Mux7~0_combout\ & ( \comb_4|seven_display\(5) ) ) # ( !\comb_4|Mux7~0_combout\ & ( \comb_4|Mux5~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_4|ALT_INV_Mux5~0_combout\,
	datad => \comb_4|ALT_INV_seven_display\(5),
	dataf => \comb_4|ALT_INV_Mux7~0_combout\,
	combout => \comb_4|seven_display\(5));

-- Location: LABCELL_X83_Y3_N48
\comb_4|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|Mux6~0_combout\ = ( \comb_3|ssm\(1) & ( (!\comb_3|ssm\(3) & ((!\comb_3|ssm\(2)))) # (\comb_3|ssm\(3) & ((\comb_3|ssm\(2)) # (\comb_3|ssm\(0)))) ) ) # ( !\comb_3|ssm\(1) & ( ((\comb_3|ssm\(0) & \comb_3|ssm\(3))) # (\comb_3|ssm\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111111111000000111111111111110011000011111111001100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \comb_3|ALT_INV_ssm\(0),
	datac => \comb_3|ALT_INV_ssm\(3),
	datad => \comb_3|ALT_INV_ssm\(2),
	dataf => \comb_3|ALT_INV_ssm\(1),
	combout => \comb_4|Mux6~0_combout\);

-- Location: LABCELL_X83_Y3_N51
\comb_4|seven_display[6]\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb_4|seven_display\(6) = ( \comb_4|seven_display\(6) & ( (!\comb_4|Mux6~0_combout\) # (\comb_4|Mux7~0_combout\) ) ) # ( !\comb_4|seven_display\(6) & ( (!\comb_4|Mux6~0_combout\ & !\comb_4|Mux7~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000101010100000000010101010111111111010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comb_4|ALT_INV_Mux6~0_combout\,
	datad => \comb_4|ALT_INV_Mux7~0_combout\,
	dataf => \comb_4|ALT_INV_seven_display\(6),
	combout => \comb_4|seven_display\(6));

-- Location: MLABCELL_X21_Y26_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


