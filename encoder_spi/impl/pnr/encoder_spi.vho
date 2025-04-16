--Copyright (C)2014-2024 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Post-PnR VHDL Simulation Model file
--Tool Version: V1.9.9.01 (64-bit)
--Created Time: Wed Apr 16 13:26:55 2025

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
library gw2a;
use gw2a.components.all;

entity top is
    port (
	 clk : in std_logic ;
	 encoder_data_in1 : in std_logic ;
	 encoder_data_in2 : in std_logic ;
	 encoder_data_in3 : in std_logic ;
	 encoder_data_in4 : in std_logic ;
	 encoder_data_in5 : in std_logic ;
	 encoder_data_in6 : in std_logic ;
	 encoder_data_in7 : in std_logic ;
	 encoder_data_in8 : in std_logic ;
	 reset : in std_logic ;
	 LED0_PIN : out std_logic ;
	 LED1_PIN : out std_logic ;
	 LED2_PIN : out std_logic ;
	 LED3_PIN : out std_logic ;
	 LED4_PIN : out std_logic ;
	 LED5_PIN : out std_logic ;
	 encoder_clk1_pin : out std_logic ;
	 encoder_clk2_pin : out std_logic ;
	 encoder_clk3_pin : out std_logic ;
	 encoder_clk4_pin : out std_logic ;
	 encoder_clk5_pin : out std_logic ;
	 encoder_clk6_pin : out std_logic ;
	 encoder_clk7_pin : out std_logic ;
	 encoder_clk8_pin : out std_logic ;
	 spi_clk_pin : out std_logic ;
	 spi_mosi_pin : out std_logic ;
	 spi_nss_pin : out std_logic 
       );
end top;

architecture beh of top is
      signal CRC_DONE_Z : std_logic ;
      signal CRC_START : std_logic ;
      signal GND_0 : std_logic ;
      signal LED0_PIN_11 : std_logic ;
      signal LED0_PIN_d : std_logic ;
      signal LED1_PIN_10 : std_logic ;
      signal LED1_PIN_d : std_logic ;
      signal LED2_PIN_13 : std_logic ;
      signal LED2_PIN_9 : std_logic ;
      signal LED2_PIN_d : std_logic ;
      signal LED3_PIN_8 : std_logic ;
      signal LED3_PIN_d : std_logic ;
      signal LED4_PIN_11 : std_logic ;
      signal LED4_PIN_9 : std_logic ;
      signal LED4_PIN_d : std_logic ;
      signal LED5_PIN_8 : std_logic ;
      signal LED5_PIN_d : std_logic ;
      signal RS485_DONE_Z : std_logic ;
      signal RS485_START : std_logic ;
      signal SPI_DONE_Z : std_logic ;
      signal SPI_START : std_logic ;
      signal SPI_START_7 : std_logic ;
      signal VCC_0 : std_logic ;
      signal \rs_inst/enc_read_frame_counter_31_11\ : std_logic ;
      signal \rs_inst/n1000_18\ : std_logic ;
      signal \rs_inst/n1000_19\ : std_logic ;
      signal \rs_inst/n1000_20\ : std_logic ;
      signal \rs_inst/n1000_21\ : std_logic ;
      signal \rs_inst/n1002_18\ : std_logic ;
      signal \rs_inst/n1002_21\ : std_logic ;
      signal \rs_inst/n1004_18\ : std_logic ;
      signal \rs_inst/n1004_21\ : std_logic ;
      signal \rs_inst/n1006_18\ : std_logic ;
      signal \rs_inst/n1006_21\ : std_logic ;
      signal \rs_inst/n1008_18\ : std_logic ;
      signal \rs_inst/n1008_19\ : std_logic ;
      signal \rs_inst/n1010_18\ : std_logic ;
      signal \rs_inst/n1012_12\ : std_logic ;
      signal \rs_inst/n1012_14\ : std_logic ;
      signal \rs_inst/n1012_15\ : std_logic ;
      signal \rs_inst/n1012_19\ : std_logic ;
      signal \rs_inst/n1012_21\ : std_logic ;
      signal \rs_inst/n1014_12\ : std_logic ;
      signal \rs_inst/n1014_13\ : std_logic ;
      signal \rs_inst/n1016_12\ : std_logic ;
      signal \rs_inst/n1016_13\ : std_logic ;
      signal \rs_inst/n1018_12\ : std_logic ;
      signal \rs_inst/n1018_13\ : std_logic ;
      signal \rs_inst/n1020_12\ : std_logic ;
      signal \rs_inst/n1020_13\ : std_logic ;
      signal \rs_inst/n1022_12\ : std_logic ;
      signal \rs_inst/n1022_13\ : std_logic ;
      signal \rs_inst/n1024_12\ : std_logic ;
      signal \rs_inst/n1024_13\ : std_logic ;
      signal \rs_inst/n1026_12\ : std_logic ;
      signal \rs_inst/n1026_13\ : std_logic ;
      signal \rs_inst/n1027_23\ : std_logic ;
      signal \rs_inst/n1030_19\ : std_logic ;
      signal \rs_inst/n1030_20\ : std_logic ;
      signal \rs_inst/n1030_23\ : std_logic ;
      signal \rs_inst/n1031_24\ : std_logic ;
      signal \rs_inst/n1032_19\ : std_logic ;
      signal \rs_inst/n10_1\ : std_logic ;
      signal \rs_inst/n10_2\ : std_logic ;
      signal \rs_inst/n11_1\ : std_logic ;
      signal \rs_inst/n11_2\ : std_logic ;
      signal \rs_inst/n12_1\ : std_logic ;
      signal \rs_inst/n12_2\ : std_logic ;
      signal \rs_inst/n13_1\ : std_logic ;
      signal \rs_inst/n13_2\ : std_logic ;
      signal \rs_inst/n14_1\ : std_logic ;
      signal \rs_inst/n14_2\ : std_logic ;
      signal \rs_inst/n15_1\ : std_logic ;
      signal \rs_inst/n15_2\ : std_logic ;
      signal \rs_inst/n16_1\ : std_logic ;
      signal \rs_inst/n16_2\ : std_logic ;
      signal \rs_inst/n17_1\ : std_logic ;
      signal \rs_inst/n17_2\ : std_logic ;
      signal \rs_inst/n18_1\ : std_logic ;
      signal \rs_inst/n18_2\ : std_logic ;
      signal \rs_inst/n19_1\ : std_logic ;
      signal \rs_inst/n19_2\ : std_logic ;
      signal \rs_inst/n20_1\ : std_logic ;
      signal \rs_inst/n20_2\ : std_logic ;
      signal \rs_inst/n21_1\ : std_logic ;
      signal \rs_inst/n21_2\ : std_logic ;
      signal \rs_inst/n22_1\ : std_logic ;
      signal \rs_inst/n22_2\ : std_logic ;
      signal \rs_inst/n23_1\ : std_logic ;
      signal \rs_inst/n23_2\ : std_logic ;
      signal \rs_inst/n24_1\ : std_logic ;
      signal \rs_inst/n24_2\ : std_logic ;
      signal \rs_inst/n25_1\ : std_logic ;
      signal \rs_inst/n25_2\ : std_logic ;
      signal \rs_inst/n26_1\ : std_logic ;
      signal \rs_inst/n26_2\ : std_logic ;
      signal \rs_inst/n27_1\ : std_logic ;
      signal \rs_inst/n27_2\ : std_logic ;
      signal \rs_inst/n28_1\ : std_logic ;
      signal \rs_inst/n28_2\ : std_logic ;
      signal \rs_inst/n2922_14\ : std_logic ;
      signal \rs_inst/n2922_15\ : std_logic ;
      signal \rs_inst/n2922_16\ : std_logic ;
      signal \rs_inst/n2922_17\ : std_logic ;
      signal \rs_inst/n2922_18\ : std_logic ;
      signal \rs_inst/n2922_23\ : std_logic ;
      signal \rs_inst/n2922_28\ : std_logic ;
      signal \rs_inst/n2922_3\ : std_logic ;
      signal \rs_inst/n2922_4\ : std_logic ;
      signal \rs_inst/n2922_6\ : std_logic ;
      signal \rs_inst/n2922_7\ : std_logic ;
      signal \rs_inst/n2922_8\ : std_logic ;
      signal \rs_inst/n2922_9\ : std_logic ;
      signal \rs_inst/n29_1\ : std_logic ;
      signal \rs_inst/n29_2\ : std_logic ;
      signal \rs_inst/n30_1\ : std_logic ;
      signal \rs_inst/n30_2\ : std_logic ;
      signal \rs_inst/n31_1\ : std_logic ;
      signal \rs_inst/n31_2\ : std_logic ;
      signal \rs_inst/n32_1\ : std_logic ;
      signal \rs_inst/n32_2\ : std_logic ;
      signal \rs_inst/n33_1\ : std_logic ;
      signal \rs_inst/n33_2\ : std_logic ;
      signal \rs_inst/n34_1\ : std_logic ;
      signal \rs_inst/n34_2\ : std_logic ;
      signal \rs_inst/n35_1\ : std_logic ;
      signal \rs_inst/n35_2\ : std_logic ;
      signal \rs_inst/n36_1\ : std_logic ;
      signal \rs_inst/n36_2\ : std_logic ;
      signal \rs_inst/n37_6\ : std_logic ;
      signal \rs_inst/n41_10\ : std_logic ;
      signal \rs_inst/n41_11\ : std_logic ;
      signal \rs_inst/n41_12\ : std_logic ;
      signal \rs_inst/n41_13\ : std_logic ;
      signal \rs_inst/n41_14\ : std_logic ;
      signal \rs_inst/n41_16\ : std_logic ;
      signal \rs_inst/n41_5\ : std_logic ;
      signal \rs_inst/n41_6\ : std_logic ;
      signal \rs_inst/n41_7\ : std_logic ;
      signal \rs_inst/n41_8\ : std_logic ;
      signal \rs_inst/n41_9\ : std_logic ;
      signal \rs_inst/n43_12\ : std_logic ;
      signal \rs_inst/n466_5\ : std_logic ;
      signal \rs_inst/n466_8\ : std_logic ;
      signal \rs_inst/n467_5\ : std_logic ;
      signal \rs_inst/n467_6\ : std_logic ;
      signal \rs_inst/n468_5\ : std_logic ;
      signal \rs_inst/n469_5\ : std_logic ;
      signal \rs_inst/n469_6\ : std_logic ;
      signal \rs_inst/n469_7\ : std_logic ;
      signal \rs_inst/n470_5\ : std_logic ;
      signal \rs_inst/n470_8\ : std_logic ;
      signal \rs_inst/n471_5\ : std_logic ;
      signal \rs_inst/n471_6\ : std_logic ;
      signal \rs_inst/n472_5\ : std_logic ;
      signal \rs_inst/n473_5\ : std_logic ;
      signal \rs_inst/n473_6\ : std_logic ;
      signal \rs_inst/n473_9\ : std_logic ;
      signal \rs_inst/n474_5\ : std_logic ;
      signal \rs_inst/n474_8\ : std_logic ;
      signal \rs_inst/n475_5\ : std_logic ;
      signal \rs_inst/n475_6\ : std_logic ;
      signal \rs_inst/n476_5\ : std_logic ;
      signal \rs_inst/n477_5\ : std_logic ;
      signal \rs_inst/n477_6\ : std_logic ;
      signal \rs_inst/n477_7\ : std_logic ;
      signal \rs_inst/n478_5\ : std_logic ;
      signal \rs_inst/n479_10\ : std_logic ;
      signal \rs_inst/n479_5\ : std_logic ;
      signal \rs_inst/n479_7\ : std_logic ;
      signal \rs_inst/n479_8\ : std_logic ;
      signal \rs_inst/n480_5\ : std_logic ;
      signal \rs_inst/n480_6\ : std_logic ;
      signal \rs_inst/n481_5\ : std_logic ;
      signal \rs_inst/n482_5\ : std_logic ;
      signal \rs_inst/n482_7\ : std_logic ;
      signal \rs_inst/n482_9\ : std_logic ;
      signal \rs_inst/n483_5\ : std_logic ;
      signal \rs_inst/n484_11\ : std_logic ;
      signal \rs_inst/n484_5\ : std_logic ;
      signal \rs_inst/n484_9\ : std_logic ;
      signal \rs_inst/n485_5\ : std_logic ;
      signal \rs_inst/n485_6\ : std_logic ;
      signal \rs_inst/n486_5\ : std_logic ;
      signal \rs_inst/n487_5\ : std_logic ;
      signal \rs_inst/n487_8\ : std_logic ;
      signal \rs_inst/n488_5\ : std_logic ;
      signal \rs_inst/n489_6\ : std_logic ;
      signal \rs_inst/n489_8\ : std_logic ;
      signal \rs_inst/n490_5\ : std_logic ;
      signal \rs_inst/n490_8\ : std_logic ;
      signal \rs_inst/n491_5\ : std_logic ;
      signal \rs_inst/n491_6\ : std_logic ;
      signal \rs_inst/n492_5\ : std_logic ;
      signal \rs_inst/n493_5\ : std_logic ;
      signal \rs_inst/n493_6\ : std_logic ;
      signal \rs_inst/n494_5\ : std_logic ;
      signal \rs_inst/n495_6\ : std_logic ;
      signal \rs_inst/n495_8\ : std_logic ;
      signal \rs_inst/n496_5\ : std_logic ;
      signal \rs_inst/n497_13\ : std_logic ;
      signal \rs_inst/n497_9\ : std_logic ;
      signal \rs_inst/n6_0_COUT\ : std_logic ;
      signal \rs_inst/n6_1\ : std_logic ;
      signal \rs_inst/n760_3\ : std_logic ;
      signal \rs_inst/n761_5\ : std_logic ;
      signal \rs_inst/n762_3\ : std_logic ;
      signal \rs_inst/n763_3\ : std_logic ;
      signal \rs_inst/n764_5\ : std_logic ;
      signal \rs_inst/n765_3\ : std_logic ;
      signal \rs_inst/n766_3\ : std_logic ;
      signal \rs_inst/n767_5\ : std_logic ;
      signal \rs_inst/n768_3\ : std_logic ;
      signal \rs_inst/n769_3\ : std_logic ;
      signal \rs_inst/n770_5\ : std_logic ;
      signal \rs_inst/n771_3\ : std_logic ;
      signal \rs_inst/n772_3\ : std_logic ;
      signal \rs_inst/n773_5\ : std_logic ;
      signal \rs_inst/n774_5\ : std_logic ;
      signal \rs_inst/n775_3\ : std_logic ;
      signal \rs_inst/n776_4\ : std_logic ;
      signal \rs_inst/n776_6\ : std_logic ;
      signal \rs_inst/n777_5\ : std_logic ;
      signal \rs_inst/n778_3\ : std_logic ;
      signal \rs_inst/n779_3\ : std_logic ;
      signal \rs_inst/n779_4\ : std_logic ;
      signal \rs_inst/n780_5\ : std_logic ;
      signal \rs_inst/n781_3\ : std_logic ;
      signal \rs_inst/n782_3\ : std_logic ;
      signal \rs_inst/n783_3\ : std_logic ;
      signal \rs_inst/n784_5\ : std_logic ;
      signal \rs_inst/n785_3\ : std_logic ;
      signal \rs_inst/n786_3\ : std_logic ;
      signal \rs_inst/n787_5\ : std_logic ;
      signal \rs_inst/n788_3\ : std_logic ;
      signal \rs_inst/n789_3\ : std_logic ;
      signal \rs_inst/n790_5\ : std_logic ;
      signal \rs_inst/n791_3\ : std_logic ;
      signal \rs_inst/n792_3\ : std_logic ;
      signal \rs_inst/n793_5\ : std_logic ;
      signal \rs_inst/n794_4\ : std_logic ;
      signal \rs_inst/n794_6\ : std_logic ;
      signal \rs_inst/n795_3\ : std_logic ;
      signal \rs_inst/n796_5\ : std_logic ;
      signal \rs_inst/n797_3\ : std_logic ;
      signal \rs_inst/n798_3\ : std_logic ;
      signal \rs_inst/n799_4\ : std_logic ;
      signal \rs_inst/n799_6\ : std_logic ;
      signal \rs_inst/n7_1\ : std_logic ;
      signal \rs_inst/n7_2\ : std_logic ;
      signal \rs_inst/n800_3\ : std_logic ;
      signal \rs_inst/n801_4\ : std_logic ;
      signal \rs_inst/n801_6\ : std_logic ;
      signal \rs_inst/n802_3\ : std_logic ;
      signal \rs_inst/n803_3\ : std_logic ;
      signal \rs_inst/n804_3\ : std_logic ;
      signal \rs_inst/n805_3\ : std_logic ;
      signal \rs_inst/n806_3\ : std_logic ;
      signal \rs_inst/n807_5\ : std_logic ;
      signal \rs_inst/n808_3\ : std_logic ;
      signal \rs_inst/n809_3\ : std_logic ;
      signal \rs_inst/n810_5\ : std_logic ;
      signal \rs_inst/n811_3\ : std_logic ;
      signal \rs_inst/n812_3\ : std_logic ;
      signal \rs_inst/n813_5\ : std_logic ;
      signal \rs_inst/n814_3\ : std_logic ;
      signal \rs_inst/n815_3\ : std_logic ;
      signal \rs_inst/n816_5\ : std_logic ;
      signal \rs_inst/n817_4\ : std_logic ;
      signal \rs_inst/n817_6\ : std_logic ;
      signal \rs_inst/n818_3\ : std_logic ;
      signal \rs_inst/n819_5\ : std_logic ;
      signal \rs_inst/n820_3\ : std_logic ;
      signal \rs_inst/n821_3\ : std_logic ;
      signal \rs_inst/n822_4\ : std_logic ;
      signal \rs_inst/n822_6\ : std_logic ;
      signal \rs_inst/n823_3\ : std_logic ;
      signal \rs_inst/n824_4\ : std_logic ;
      signal \rs_inst/n824_6\ : std_logic ;
      signal \rs_inst/n825_3\ : std_logic ;
      signal \rs_inst/n826_3\ : std_logic ;
      signal \rs_inst/n827_3\ : std_logic ;
      signal \rs_inst/n828_3\ : std_logic ;
      signal \rs_inst/n829_3\ : std_logic ;
      signal \rs_inst/n830_5\ : std_logic ;
      signal \rs_inst/n831_3\ : std_logic ;
      signal \rs_inst/n832_3\ : std_logic ;
      signal \rs_inst/n833_5\ : std_logic ;
      signal \rs_inst/n834_3\ : std_logic ;
      signal \rs_inst/n835_3\ : std_logic ;
      signal \rs_inst/n836_5\ : std_logic ;
      signal \rs_inst/n837_3\ : std_logic ;
      signal \rs_inst/n838_3\ : std_logic ;
      signal \rs_inst/n839_5\ : std_logic ;
      signal \rs_inst/n840_4\ : std_logic ;
      signal \rs_inst/n840_6\ : std_logic ;
      signal \rs_inst/n841_3\ : std_logic ;
      signal \rs_inst/n842_5\ : std_logic ;
      signal \rs_inst/n843_3\ : std_logic ;
      signal \rs_inst/n844_3\ : std_logic ;
      signal \rs_inst/n845_4\ : std_logic ;
      signal \rs_inst/n845_6\ : std_logic ;
      signal \rs_inst/n846_3\ : std_logic ;
      signal \rs_inst/n847_4\ : std_logic ;
      signal \rs_inst/n847_6\ : std_logic ;
      signal \rs_inst/n848_3\ : std_logic ;
      signal \rs_inst/n849_3\ : std_logic ;
      signal \rs_inst/n850_3\ : std_logic ;
      signal \rs_inst/n851_3\ : std_logic ;
      signal \rs_inst/n8_1\ : std_logic ;
      signal \rs_inst/n8_2\ : std_logic ;
      signal \rs_inst/n938_4\ : std_logic ;
      signal \rs_inst/n946_10\ : std_logic ;
      signal \rs_inst/n946_14\ : std_logic ;
      signal \rs_inst/n948_21\ : std_logic ;
      signal \rs_inst/n948_28\ : std_logic ;
      signal \rs_inst/n948_30\ : std_logic ;
      signal \rs_inst/n998_18\ : std_logic ;
      signal \rs_inst/n9_1\ : std_logic ;
      signal \rs_inst/n9_2\ : std_logic ;
      signal \rs_inst/slow_clk\ : std_logic ;
      signal \scs_inst/bit_index_31_9\ : std_logic ;
      signal \scs_inst/byte_count_31_11\ : std_logic ;
      signal \scs_inst/crc_reg_30_11\ : std_logic ;
      signal \scs_inst/n103_37\ : std_logic ;
      signal \scs_inst/n103_38\ : std_logic ;
      signal \scs_inst/n103_39\ : std_logic ;
      signal \scs_inst/n103_40\ : std_logic ;
      signal \scs_inst/n103_41\ : std_logic ;
      signal \scs_inst/n103_42\ : std_logic ;
      signal \scs_inst/n103_43\ : std_logic ;
      signal \scs_inst/n103_44\ : std_logic ;
      signal \scs_inst/n103_45\ : std_logic ;
      signal \scs_inst/n103_46\ : std_logic ;
      signal \scs_inst/n103_47\ : std_logic ;
      signal \scs_inst/n103_48\ : std_logic ;
      signal \scs_inst/n103_49\ : std_logic ;
      signal \scs_inst/n103_50\ : std_logic ;
      signal \scs_inst/n103_51\ : std_logic ;
      signal \scs_inst/n103_52\ : std_logic ;
      signal \scs_inst/n103_56\ : std_logic ;
      signal \scs_inst/n103_66\ : std_logic ;
      signal \scs_inst/n103_68\ : std_logic ;
      signal \scs_inst/n103_70\ : std_logic ;
      signal \scs_inst/n103_72\ : std_logic ;
      signal \scs_inst/n103_74\ : std_logic ;
      signal \scs_inst/n103_76\ : std_logic ;
      signal \scs_inst/n103_78\ : std_logic ;
      signal \scs_inst/n103_80\ : std_logic ;
      signal \scs_inst/n103_82\ : std_logic ;
      signal \scs_inst/n103_84\ : std_logic ;
      signal \scs_inst/n104_37\ : std_logic ;
      signal \scs_inst/n104_38\ : std_logic ;
      signal \scs_inst/n104_39\ : std_logic ;
      signal \scs_inst/n104_40\ : std_logic ;
      signal \scs_inst/n104_41\ : std_logic ;
      signal \scs_inst/n104_42\ : std_logic ;
      signal \scs_inst/n104_43\ : std_logic ;
      signal \scs_inst/n104_44\ : std_logic ;
      signal \scs_inst/n104_45\ : std_logic ;
      signal \scs_inst/n104_46\ : std_logic ;
      signal \scs_inst/n104_47\ : std_logic ;
      signal \scs_inst/n104_48\ : std_logic ;
      signal \scs_inst/n104_49\ : std_logic ;
      signal \scs_inst/n104_50\ : std_logic ;
      signal \scs_inst/n104_51\ : std_logic ;
      signal \scs_inst/n104_52\ : std_logic ;
      signal \scs_inst/n105_37\ : std_logic ;
      signal \scs_inst/n105_38\ : std_logic ;
      signal \scs_inst/n105_39\ : std_logic ;
      signal \scs_inst/n105_40\ : std_logic ;
      signal \scs_inst/n105_41\ : std_logic ;
      signal \scs_inst/n105_42\ : std_logic ;
      signal \scs_inst/n105_43\ : std_logic ;
      signal \scs_inst/n105_44\ : std_logic ;
      signal \scs_inst/n105_45\ : std_logic ;
      signal \scs_inst/n105_46\ : std_logic ;
      signal \scs_inst/n105_47\ : std_logic ;
      signal \scs_inst/n105_48\ : std_logic ;
      signal \scs_inst/n105_49\ : std_logic ;
      signal \scs_inst/n105_50\ : std_logic ;
      signal \scs_inst/n105_51\ : std_logic ;
      signal \scs_inst/n105_52\ : std_logic ;
      signal \scs_inst/n106_37\ : std_logic ;
      signal \scs_inst/n106_38\ : std_logic ;
      signal \scs_inst/n106_39\ : std_logic ;
      signal \scs_inst/n106_40\ : std_logic ;
      signal \scs_inst/n106_42\ : std_logic ;
      signal \scs_inst/n106_43\ : std_logic ;
      signal \scs_inst/n106_45\ : std_logic ;
      signal \scs_inst/n106_46\ : std_logic ;
      signal \scs_inst/n106_47\ : std_logic ;
      signal \scs_inst/n106_48\ : std_logic ;
      signal \scs_inst/n106_49\ : std_logic ;
      signal \scs_inst/n106_51\ : std_logic ;
      signal \scs_inst/n106_52\ : std_logic ;
      signal \scs_inst/n106_53\ : std_logic ;
      signal \scs_inst/n106_54\ : std_logic ;
      signal \scs_inst/n106_55\ : std_logic ;
      signal \scs_inst/n106_57\ : std_logic ;
      signal \scs_inst/n106_58\ : std_logic ;
      signal \scs_inst/n106_59\ : std_logic ;
      signal \scs_inst/n106_61\ : std_logic ;
      signal \scs_inst/n106_63\ : std_logic ;
      signal \scs_inst/n107_37\ : std_logic ;
      signal \scs_inst/n107_38\ : std_logic ;
      signal \scs_inst/n107_39\ : std_logic ;
      signal \scs_inst/n107_40\ : std_logic ;
      signal \scs_inst/n107_41\ : std_logic ;
      signal \scs_inst/n107_45\ : std_logic ;
      signal \scs_inst/n107_46\ : std_logic ;
      signal \scs_inst/n107_47\ : std_logic ;
      signal \scs_inst/n107_48\ : std_logic ;
      signal \scs_inst/n107_49\ : std_logic ;
      signal \scs_inst/n107_50\ : std_logic ;
      signal \scs_inst/n107_51\ : std_logic ;
      signal \scs_inst/n107_53\ : std_logic ;
      signal \scs_inst/n107_55\ : std_logic ;
      signal \scs_inst/n107_56\ : std_logic ;
      signal \scs_inst/n107_57\ : std_logic ;
      signal \scs_inst/n107_58\ : std_logic ;
      signal \scs_inst/n107_59\ : std_logic ;
      signal \scs_inst/n107_61\ : std_logic ;
      signal \scs_inst/n107_63\ : std_logic ;
      signal \scs_inst/n107_65\ : std_logic ;
      signal \scs_inst/n107_67\ : std_logic ;
      signal \scs_inst/n108_37\ : std_logic ;
      signal \scs_inst/n108_38\ : std_logic ;
      signal \scs_inst/n108_39\ : std_logic ;
      signal \scs_inst/n108_40\ : std_logic ;
      signal \scs_inst/n108_41\ : std_logic ;
      signal \scs_inst/n108_44\ : std_logic ;
      signal \scs_inst/n108_45\ : std_logic ;
      signal \scs_inst/n108_46\ : std_logic ;
      signal \scs_inst/n108_47\ : std_logic ;
      signal \scs_inst/n108_50\ : std_logic ;
      signal \scs_inst/n108_51\ : std_logic ;
      signal \scs_inst/n108_52\ : std_logic ;
      signal \scs_inst/n108_53\ : std_logic ;
      signal \scs_inst/n108_56\ : std_logic ;
      signal \scs_inst/n108_57\ : std_logic ;
      signal \scs_inst/n108_58\ : std_logic ;
      signal \scs_inst/n108_59\ : std_logic ;
      signal \scs_inst/n108_60\ : std_logic ;
      signal \scs_inst/n108_62\ : std_logic ;
      signal \scs_inst/n108_64\ : std_logic ;
      signal \scs_inst/n108_66\ : std_logic ;
      signal \scs_inst/n108_68\ : std_logic ;
      signal \scs_inst/n108_70\ : std_logic ;
      signal \scs_inst/n109_37\ : std_logic ;
      signal \scs_inst/n109_38\ : std_logic ;
      signal \scs_inst/n109_39\ : std_logic ;
      signal \scs_inst/n109_40\ : std_logic ;
      signal \scs_inst/n109_41\ : std_logic ;
      signal \scs_inst/n109_44\ : std_logic ;
      signal \scs_inst/n109_45\ : std_logic ;
      signal \scs_inst/n109_46\ : std_logic ;
      signal \scs_inst/n109_47\ : std_logic ;
      signal \scs_inst/n109_48\ : std_logic ;
      signal \scs_inst/n109_49\ : std_logic ;
      signal \scs_inst/n109_50\ : std_logic ;
      signal \scs_inst/n109_51\ : std_logic ;
      signal \scs_inst/n109_52\ : std_logic ;
      signal \scs_inst/n109_53\ : std_logic ;
      signal \scs_inst/n109_54\ : std_logic ;
      signal \scs_inst/n109_55\ : std_logic ;
      signal \scs_inst/n109_57\ : std_logic ;
      signal \scs_inst/n109_59\ : std_logic ;
      signal \scs_inst/n110_37\ : std_logic ;
      signal \scs_inst/n110_38\ : std_logic ;
      signal \scs_inst/n110_39\ : std_logic ;
      signal \scs_inst/n110_40\ : std_logic ;
      signal \scs_inst/n110_41\ : std_logic ;
      signal \scs_inst/n110_42\ : std_logic ;
      signal \scs_inst/n110_43\ : std_logic ;
      signal \scs_inst/n110_44\ : std_logic ;
      signal \scs_inst/n110_45\ : std_logic ;
      signal \scs_inst/n110_47\ : std_logic ;
      signal \scs_inst/n110_48\ : std_logic ;
      signal \scs_inst/n110_49\ : std_logic ;
      signal \scs_inst/n110_50\ : std_logic ;
      signal \scs_inst/n110_51\ : std_logic ;
      signal \scs_inst/n110_52\ : std_logic ;
      signal \scs_inst/n110_53\ : std_logic ;
      signal \scs_inst/n110_54\ : std_logic ;
      signal \scs_inst/n110_55\ : std_logic ;
      signal \scs_inst/n110_57\ : std_logic ;
      signal \scs_inst/n1139_5\ : std_logic ;
      signal \scs_inst/n1140_5\ : std_logic ;
      signal \scs_inst/n1141_5\ : std_logic ;
      signal \scs_inst/n1142_5\ : std_logic ;
      signal \scs_inst/n1143_5\ : std_logic ;
      signal \scs_inst/n1144_5\ : std_logic ;
      signal \scs_inst/n1145_5\ : std_logic ;
      signal \scs_inst/n1146_5\ : std_logic ;
      signal \scs_inst/n1147_5\ : std_logic ;
      signal \scs_inst/n1148_5\ : std_logic ;
      signal \scs_inst/n1149_5\ : std_logic ;
      signal \scs_inst/n1150_5\ : std_logic ;
      signal \scs_inst/n1151_5\ : std_logic ;
      signal \scs_inst/n1152_5\ : std_logic ;
      signal \scs_inst/n1153_5\ : std_logic ;
      signal \scs_inst/n1154_5\ : std_logic ;
      signal \scs_inst/n1155_5\ : std_logic ;
      signal \scs_inst/n1156_5\ : std_logic ;
      signal \scs_inst/n1157_5\ : std_logic ;
      signal \scs_inst/n1158_5\ : std_logic ;
      signal \scs_inst/n1159_5\ : std_logic ;
      signal \scs_inst/n1160_5\ : std_logic ;
      signal \scs_inst/n1161_5\ : std_logic ;
      signal \scs_inst/n1162_5\ : std_logic ;
      signal \scs_inst/n1163_5\ : std_logic ;
      signal \scs_inst/n1164_5\ : std_logic ;
      signal \scs_inst/n1165_5\ : std_logic ;
      signal \scs_inst/n1166_5\ : std_logic ;
      signal \scs_inst/n1167_5\ : std_logic ;
      signal \scs_inst/n1168_5\ : std_logic ;
      signal \scs_inst/n1169_5\ : std_logic ;
      signal \scs_inst/n1170_5\ : std_logic ;
      signal \scs_inst/n222_5\ : std_logic ;
      signal \scs_inst/n222_8\ : std_logic ;
      signal \scs_inst/n223_5\ : std_logic ;
      signal \scs_inst/n223_6\ : std_logic ;
      signal \scs_inst/n224_5\ : std_logic ;
      signal \scs_inst/n225_5\ : std_logic ;
      signal \scs_inst/n225_6\ : std_logic ;
      signal \scs_inst/n225_7\ : std_logic ;
      signal \scs_inst/n226_5\ : std_logic ;
      signal \scs_inst/n226_8\ : std_logic ;
      signal \scs_inst/n227_5\ : std_logic ;
      signal \scs_inst/n227_6\ : std_logic ;
      signal \scs_inst/n228_5\ : std_logic ;
      signal \scs_inst/n229_5\ : std_logic ;
      signal \scs_inst/n229_6\ : std_logic ;
      signal \scs_inst/n230_5\ : std_logic ;
      signal \scs_inst/n230_8\ : std_logic ;
      signal \scs_inst/n231_5\ : std_logic ;
      signal \scs_inst/n231_6\ : std_logic ;
      signal \scs_inst/n232_5\ : std_logic ;
      signal \scs_inst/n233_5\ : std_logic ;
      signal \scs_inst/n233_6\ : std_logic ;
      signal \scs_inst/n233_9\ : std_logic ;
      signal \scs_inst/n234_5\ : std_logic ;
      signal \scs_inst/n235_10\ : std_logic ;
      signal \scs_inst/n235_5\ : std_logic ;
      signal \scs_inst/n235_8\ : std_logic ;
      signal \scs_inst/n236_5\ : std_logic ;
      signal \scs_inst/n236_6\ : std_logic ;
      signal \scs_inst/n237_5\ : std_logic ;
      signal \scs_inst/n238_5\ : std_logic ;
      signal \scs_inst/n238_7\ : std_logic ;
      signal \scs_inst/n238_9\ : std_logic ;
      signal \scs_inst/n239_5\ : std_logic ;
      signal \scs_inst/n240_11\ : std_logic ;
      signal \scs_inst/n240_5\ : std_logic ;
      signal \scs_inst/n240_9\ : std_logic ;
      signal \scs_inst/n241_5\ : std_logic ;
      signal \scs_inst/n241_6\ : std_logic ;
      signal \scs_inst/n242_5\ : std_logic ;
      signal \scs_inst/n243_5\ : std_logic ;
      signal \scs_inst/n243_8\ : std_logic ;
      signal \scs_inst/n244_5\ : std_logic ;
      signal \scs_inst/n245_6\ : std_logic ;
      signal \scs_inst/n245_8\ : std_logic ;
      signal \scs_inst/n246_5\ : std_logic ;
      signal \scs_inst/n246_8\ : std_logic ;
      signal \scs_inst/n247_5\ : std_logic ;
      signal \scs_inst/n247_6\ : std_logic ;
      signal \scs_inst/n248_5\ : std_logic ;
      signal \scs_inst/n249_5\ : std_logic ;
      signal \scs_inst/n249_6\ : std_logic ;
      signal \scs_inst/n250_5\ : std_logic ;
      signal \scs_inst/n251_6\ : std_logic ;
      signal \scs_inst/n251_8\ : std_logic ;
      signal \scs_inst/n252_5\ : std_logic ;
      signal \scs_inst/n253_7\ : std_logic ;
      signal \scs_inst/n286_5\ : std_logic ;
      signal \scs_inst/n286_8\ : std_logic ;
      signal \scs_inst/n287_5\ : std_logic ;
      signal \scs_inst/n287_6\ : std_logic ;
      signal \scs_inst/n288_5\ : std_logic ;
      signal \scs_inst/n289_5\ : std_logic ;
      signal \scs_inst/n289_6\ : std_logic ;
      signal \scs_inst/n289_7\ : std_logic ;
      signal \scs_inst/n290_5\ : std_logic ;
      signal \scs_inst/n290_8\ : std_logic ;
      signal \scs_inst/n291_5\ : std_logic ;
      signal \scs_inst/n291_6\ : std_logic ;
      signal \scs_inst/n292_5\ : std_logic ;
      signal \scs_inst/n293_5\ : std_logic ;
      signal \scs_inst/n293_6\ : std_logic ;
      signal \scs_inst/n294_5\ : std_logic ;
      signal \scs_inst/n294_7\ : std_logic ;
      signal \scs_inst/n294_9\ : std_logic ;
      signal \scs_inst/n295_5\ : std_logic ;
      signal \scs_inst/n295_6\ : std_logic ;
      signal \scs_inst/n296_5\ : std_logic ;
      signal \scs_inst/n297_5\ : std_logic ;
      signal \scs_inst/n297_6\ : std_logic ;
      signal \scs_inst/n297_7\ : std_logic ;
      signal \scs_inst/n298_5\ : std_logic ;
      signal \scs_inst/n299_10\ : std_logic ;
      signal \scs_inst/n299_5\ : std_logic ;
      signal \scs_inst/n299_7\ : std_logic ;
      signal \scs_inst/n299_8\ : std_logic ;
      signal \scs_inst/n300_5\ : std_logic ;
      signal \scs_inst/n300_6\ : std_logic ;
      signal \scs_inst/n301_5\ : std_logic ;
      signal \scs_inst/n302_5\ : std_logic ;
      signal \scs_inst/n302_7\ : std_logic ;
      signal \scs_inst/n302_9\ : std_logic ;
      signal \scs_inst/n303_5\ : std_logic ;
      signal \scs_inst/n304_5\ : std_logic ;
      signal \scs_inst/n304_7\ : std_logic ;
      signal \scs_inst/n304_9\ : std_logic ;
      signal \scs_inst/n305_5\ : std_logic ;
      signal \scs_inst/n306_5\ : std_logic ;
      signal \scs_inst/n306_8\ : std_logic ;
      signal \scs_inst/n307_5\ : std_logic ;
      signal \scs_inst/n307_6\ : std_logic ;
      signal \scs_inst/n308_5\ : std_logic ;
      signal \scs_inst/n309_5\ : std_logic ;
      signal \scs_inst/n309_6\ : std_logic ;
      signal \scs_inst/n310_5\ : std_logic ;
      signal \scs_inst/n311_5\ : std_logic ;
      signal \scs_inst/n311_8\ : std_logic ;
      signal \scs_inst/n312_5\ : std_logic ;
      signal \scs_inst/n312_7\ : std_logic ;
      signal \scs_inst/n312_9\ : std_logic ;
      signal \scs_inst/n313_5\ : std_logic ;
      signal \scs_inst/n314_5\ : std_logic ;
      signal \scs_inst/n314_6\ : std_logic ;
      signal \scs_inst/n315_5\ : std_logic ;
      signal \scs_inst/n316_5\ : std_logic ;
      signal \scs_inst/n368_4\ : std_logic ;
      signal \scs_inst/n370_4\ : std_logic ;
      signal \scs_inst/n378_5\ : std_logic ;
      signal \scs_inst/n381_10\ : std_logic ;
      signal \scs_inst/n381_14\ : std_logic ;
      signal \scs_inst/n445_10\ : std_logic ;
      signal \scs_inst/n543_20\ : std_logic ;
      signal \scs_inst/n545_18\ : std_logic ;
      signal \scs_inst/n545_20\ : std_logic ;
      signal \scs_inst/n547_18\ : std_logic ;
      signal \scs_inst/n549_20\ : std_logic ;
      signal \scs_inst/n551_18\ : std_logic ;
      signal \scs_inst/n553_18\ : std_logic ;
      signal \scs_inst/n555_20\ : std_logic ;
      signal \scs_inst/n557_18\ : std_logic ;
      signal \scs_inst/n559_18\ : std_logic ;
      signal \scs_inst/n561_20\ : std_logic ;
      signal \scs_inst/n563_18\ : std_logic ;
      signal \scs_inst/n565_18\ : std_logic ;
      signal \scs_inst/n567_18\ : std_logic ;
      signal \scs_inst/n569_20\ : std_logic ;
      signal \scs_inst/n571_20\ : std_logic ;
      signal \scs_inst/n573_20\ : std_logic ;
      signal \scs_inst/n575_18\ : std_logic ;
      signal \scs_inst/n577_20\ : std_logic ;
      signal \scs_inst/n579_20\ : std_logic ;
      signal \scs_inst/n581_20\ : std_logic ;
      signal \scs_inst/n583_20\ : std_logic ;
      signal \scs_inst/n585_20\ : std_logic ;
      signal \scs_inst/n587_18\ : std_logic ;
      signal \scs_inst/n589_18\ : std_logic ;
      signal \scs_inst/n591_15\ : std_logic ;
      signal \scs_inst/n591_16\ : std_logic ;
      signal \scs_inst/n591_17\ : std_logic ;
      signal \scs_inst/n591_19\ : std_logic ;
      signal \scs_inst/n591_21\ : std_logic ;
      signal \scs_inst/n593_13\ : std_logic ;
      signal \scs_inst/n593_14\ : std_logic ;
      signal \scs_inst/n593_16\ : std_logic ;
      signal \scs_inst/n595_12\ : std_logic ;
      signal \scs_inst/n595_13\ : std_logic ;
      signal \scs_inst/n595_14\ : std_logic ;
      signal \scs_inst/n597_13\ : std_logic ;
      signal \scs_inst/n597_14\ : std_logic ;
      signal \scs_inst/n597_16\ : std_logic ;
      signal \scs_inst/n599_13\ : std_logic ;
      signal \scs_inst/n599_14\ : std_logic ;
      signal \scs_inst/n599_16\ : std_logic ;
      signal \scs_inst/n601_13\ : std_logic ;
      signal \scs_inst/n601_14\ : std_logic ;
      signal \scs_inst/n601_16\ : std_logic ;
      signal \scs_inst/n603_13\ : std_logic ;
      signal \scs_inst/n603_14\ : std_logic ;
      signal \scs_inst/n603_16\ : std_logic ;
      signal \scs_inst/n605_13\ : std_logic ;
      signal \scs_inst/n605_14\ : std_logic ;
      signal \scs_inst/n605_16\ : std_logic ;
      signal \scs_inst/n613_13\ : std_logic ;
      signal \scs_inst/n613_14\ : std_logic ;
      signal \scs_inst/n613_15\ : std_logic ;
      signal \scs_inst/n613_18\ : std_logic ;
      signal \scs_inst/n613_19\ : std_logic ;
      signal \scs_inst/n613_20\ : std_logic ;
      signal \scs_inst/n613_21\ : std_logic ;
      signal \scs_inst/n613_22\ : std_logic ;
      signal \scs_inst/n613_23\ : std_logic ;
      signal \scs_inst/n613_24\ : std_logic ;
      signal \scs_inst/n613_25\ : std_logic ;
      signal \scs_inst/n613_26\ : std_logic ;
      signal \scs_inst/n613_27\ : std_logic ;
      signal \scs_inst/n613_28\ : std_logic ;
      signal \scs_inst/n613_29\ : std_logic ;
      signal \scs_inst/n613_30\ : std_logic ;
      signal \scs_inst/n613_31\ : std_logic ;
      signal \scs_inst/n613_32\ : std_logic ;
      signal \scs_inst/n613_33\ : std_logic ;
      signal \scs_inst/n613_34\ : std_logic ;
      signal \scs_inst/n613_35\ : std_logic ;
      signal \scs_inst/n613_37\ : std_logic ;
      signal \scs_inst/n613_39\ : std_logic ;
      signal \scs_inst/n616_12\ : std_logic ;
      signal \scs_inst/n616_15\ : std_logic ;
      signal \scs_inst/n618_13\ : std_logic ;
      signal \scs_inst/n618_14\ : std_logic ;
      signal \scs_inst/n618_15\ : std_logic ;
      signal \spi_inst/EDGE_REG\ : std_logic ;
      signal \spi_inst/EDGE_REG_9\ : std_logic ;
      signal \spi_inst/bit_index_8_10\ : std_logic ;
      signal \spi_inst/clk_spi_internal\ : std_logic ;
      signal \spi_inst/n11_0_COUT\ : std_logic ;
      signal \spi_inst/n11_1\ : std_logic ;
      signal \spi_inst/n12_1\ : std_logic ;
      signal \spi_inst/n12_2\ : std_logic ;
      signal \spi_inst/n13_1\ : std_logic ;
      signal \spi_inst/n13_2\ : std_logic ;
      signal \spi_inst/n14_1\ : std_logic ;
      signal \spi_inst/n14_2\ : std_logic ;
      signal \spi_inst/n15_1\ : std_logic ;
      signal \spi_inst/n15_2\ : std_logic ;
      signal \spi_inst/n16_1\ : std_logic ;
      signal \spi_inst/n16_2\ : std_logic ;
      signal \spi_inst/n17_1\ : std_logic ;
      signal \spi_inst/n17_2\ : std_logic ;
      signal \spi_inst/n18_1\ : std_logic ;
      signal \spi_inst/n18_2\ : std_logic ;
      signal \spi_inst/n19_1\ : std_logic ;
      signal \spi_inst/n19_2\ : std_logic ;
      signal \spi_inst/n20_1\ : std_logic ;
      signal \spi_inst/n20_2\ : std_logic ;
      signal \spi_inst/n21_1\ : std_logic ;
      signal \spi_inst/n21_2\ : std_logic ;
      signal \spi_inst/n22_1\ : std_logic ;
      signal \spi_inst/n22_2\ : std_logic ;
      signal \spi_inst/n23_1\ : std_logic ;
      signal \spi_inst/n23_2\ : std_logic ;
      signal \spi_inst/n24_1\ : std_logic ;
      signal \spi_inst/n24_2\ : std_logic ;
      signal \spi_inst/n257_10\ : std_logic ;
      signal \spi_inst/n257_11\ : std_logic ;
      signal \spi_inst/n258_10\ : std_logic ;
      signal \spi_inst/n259_11\ : std_logic ;
      signal \spi_inst/n259_13\ : std_logic ;
      signal \spi_inst/n25_1\ : std_logic ;
      signal \spi_inst/n25_2\ : std_logic ;
      signal \spi_inst/n260_10\ : std_logic ;
      signal \spi_inst/n262_566\ : std_logic ;
      signal \spi_inst/n262_567\ : std_logic ;
      signal \spi_inst/n262_568\ : std_logic ;
      signal \spi_inst/n262_569\ : std_logic ;
      signal \spi_inst/n262_570\ : std_logic ;
      signal \spi_inst/n262_571\ : std_logic ;
      signal \spi_inst/n262_572\ : std_logic ;
      signal \spi_inst/n262_573\ : std_logic ;
      signal \spi_inst/n262_574\ : std_logic ;
      signal \spi_inst/n262_575\ : std_logic ;
      signal \spi_inst/n262_576\ : std_logic ;
      signal \spi_inst/n262_577\ : std_logic ;
      signal \spi_inst/n262_578\ : std_logic ;
      signal \spi_inst/n262_579\ : std_logic ;
      signal \spi_inst/n262_580\ : std_logic ;
      signal \spi_inst/n262_581\ : std_logic ;
      signal \spi_inst/n262_582\ : std_logic ;
      signal \spi_inst/n262_583\ : std_logic ;
      signal \spi_inst/n262_584\ : std_logic ;
      signal \spi_inst/n262_585\ : std_logic ;
      signal \spi_inst/n262_586\ : std_logic ;
      signal \spi_inst/n262_587\ : std_logic ;
      signal \spi_inst/n262_588\ : std_logic ;
      signal \spi_inst/n262_589\ : std_logic ;
      signal \spi_inst/n262_590\ : std_logic ;
      signal \spi_inst/n262_591\ : std_logic ;
      signal \spi_inst/n262_592\ : std_logic ;
      signal \spi_inst/n262_593\ : std_logic ;
      signal \spi_inst/n262_594\ : std_logic ;
      signal \spi_inst/n262_595\ : std_logic ;
      signal \spi_inst/n262_596\ : std_logic ;
      signal \spi_inst/n262_597\ : std_logic ;
      signal \spi_inst/n262_598\ : std_logic ;
      signal \spi_inst/n262_599\ : std_logic ;
      signal \spi_inst/n262_600\ : std_logic ;
      signal \spi_inst/n262_601\ : std_logic ;
      signal \spi_inst/n262_602\ : std_logic ;
      signal \spi_inst/n262_603\ : std_logic ;
      signal \spi_inst/n262_604\ : std_logic ;
      signal \spi_inst/n262_605\ : std_logic ;
      signal \spi_inst/n262_606\ : std_logic ;
      signal \spi_inst/n262_607\ : std_logic ;
      signal \spi_inst/n262_608\ : std_logic ;
      signal \spi_inst/n262_609\ : std_logic ;
      signal \spi_inst/n262_610\ : std_logic ;
      signal \spi_inst/n262_611\ : std_logic ;
      signal \spi_inst/n262_612\ : std_logic ;
      signal \spi_inst/n262_613\ : std_logic ;
      signal \spi_inst/n262_614\ : std_logic ;
      signal \spi_inst/n262_615\ : std_logic ;
      signal \spi_inst/n262_616\ : std_logic ;
      signal \spi_inst/n262_617\ : std_logic ;
      signal \spi_inst/n262_618\ : std_logic ;
      signal \spi_inst/n262_619\ : std_logic ;
      signal \spi_inst/n262_620\ : std_logic ;
      signal \spi_inst/n262_621\ : std_logic ;
      signal \spi_inst/n262_622\ : std_logic ;
      signal \spi_inst/n262_623\ : std_logic ;
      signal \spi_inst/n262_624\ : std_logic ;
      signal \spi_inst/n262_625\ : std_logic ;
      signal \spi_inst/n262_626\ : std_logic ;
      signal \spi_inst/n262_627\ : std_logic ;
      signal \spi_inst/n262_628\ : std_logic ;
      signal \spi_inst/n262_629\ : std_logic ;
      signal \spi_inst/n262_630\ : std_logic ;
      signal \spi_inst/n262_631\ : std_logic ;
      signal \spi_inst/n262_632\ : std_logic ;
      signal \spi_inst/n262_633\ : std_logic ;
      signal \spi_inst/n262_634\ : std_logic ;
      signal \spi_inst/n262_635\ : std_logic ;
      signal \spi_inst/n262_636\ : std_logic ;
      signal \spi_inst/n262_637\ : std_logic ;
      signal \spi_inst/n262_638\ : std_logic ;
      signal \spi_inst/n262_639\ : std_logic ;
      signal \spi_inst/n262_640\ : std_logic ;
      signal \spi_inst/n262_641\ : std_logic ;
      signal \spi_inst/n262_642\ : std_logic ;
      signal \spi_inst/n262_643\ : std_logic ;
      signal \spi_inst/n262_644\ : std_logic ;
      signal \spi_inst/n262_645\ : std_logic ;
      signal \spi_inst/n262_646\ : std_logic ;
      signal \spi_inst/n262_647\ : std_logic ;
      signal \spi_inst/n262_648\ : std_logic ;
      signal \spi_inst/n262_649\ : std_logic ;
      signal \spi_inst/n262_650\ : std_logic ;
      signal \spi_inst/n262_651\ : std_logic ;
      signal \spi_inst/n262_652\ : std_logic ;
      signal \spi_inst/n262_653\ : std_logic ;
      signal \spi_inst/n262_654\ : std_logic ;
      signal \spi_inst/n262_655\ : std_logic ;
      signal \spi_inst/n262_656\ : std_logic ;
      signal \spi_inst/n262_657\ : std_logic ;
      signal \spi_inst/n262_658\ : std_logic ;
      signal \spi_inst/n262_659\ : std_logic ;
      signal \spi_inst/n262_660\ : std_logic ;
      signal \spi_inst/n262_661\ : std_logic ;
      signal \spi_inst/n262_662\ : std_logic ;
      signal \spi_inst/n262_663\ : std_logic ;
      signal \spi_inst/n262_664\ : std_logic ;
      signal \spi_inst/n262_665\ : std_logic ;
      signal \spi_inst/n262_666\ : std_logic ;
      signal \spi_inst/n262_667\ : std_logic ;
      signal \spi_inst/n262_668\ : std_logic ;
      signal \spi_inst/n262_669\ : std_logic ;
      signal \spi_inst/n262_670\ : std_logic ;
      signal \spi_inst/n262_671\ : std_logic ;
      signal \spi_inst/n262_672\ : std_logic ;
      signal \spi_inst/n262_673\ : std_logic ;
      signal \spi_inst/n262_674\ : std_logic ;
      signal \spi_inst/n262_675\ : std_logic ;
      signal \spi_inst/n262_676\ : std_logic ;
      signal \spi_inst/n262_677\ : std_logic ;
      signal \spi_inst/n262_679\ : std_logic ;
      signal \spi_inst/n262_681\ : std_logic ;
      signal \spi_inst/n262_683\ : std_logic ;
      signal \spi_inst/n262_685\ : std_logic ;
      signal \spi_inst/n262_687\ : std_logic ;
      signal \spi_inst/n262_689\ : std_logic ;
      signal \spi_inst/n262_691\ : std_logic ;
      signal \spi_inst/n262_693\ : std_logic ;
      signal \spi_inst/n262_695\ : std_logic ;
      signal \spi_inst/n262_697\ : std_logic ;
      signal \spi_inst/n262_699\ : std_logic ;
      signal \spi_inst/n262_701\ : std_logic ;
      signal \spi_inst/n262_703\ : std_logic ;
      signal \spi_inst/n262_705\ : std_logic ;
      signal \spi_inst/n262_707\ : std_logic ;
      signal \spi_inst/n262_709\ : std_logic ;
      signal \spi_inst/n262_711\ : std_logic ;
      signal \spi_inst/n262_713\ : std_logic ;
      signal \spi_inst/n262_715\ : std_logic ;
      signal \spi_inst/n262_717\ : std_logic ;
      signal \spi_inst/n262_719\ : std_logic ;
      signal \spi_inst/n262_721\ : std_logic ;
      signal \spi_inst/n262_723\ : std_logic ;
      signal \spi_inst/n262_725\ : std_logic ;
      signal \spi_inst/n262_727\ : std_logic ;
      signal \spi_inst/n262_729\ : std_logic ;
      signal \spi_inst/n262_731\ : std_logic ;
      signal \spi_inst/n262_733\ : std_logic ;
      signal \spi_inst/n262_735\ : std_logic ;
      signal \spi_inst/n262_737\ : std_logic ;
      signal \spi_inst/n262_739\ : std_logic ;
      signal \spi_inst/n262_741\ : std_logic ;
      signal \spi_inst/n262_743\ : std_logic ;
      signal \spi_inst/n262_745\ : std_logic ;
      signal \spi_inst/n262_747\ : std_logic ;
      signal \spi_inst/n262_749\ : std_logic ;
      signal \spi_inst/n262_751\ : std_logic ;
      signal \spi_inst/n262_753\ : std_logic ;
      signal \spi_inst/n262_755\ : std_logic ;
      signal \spi_inst/n262_757\ : std_logic ;
      signal \spi_inst/n262_759\ : std_logic ;
      signal \spi_inst/n262_761\ : std_logic ;
      signal \spi_inst/n262_763\ : std_logic ;
      signal \spi_inst/n262_765\ : std_logic ;
      signal \spi_inst/n262_767\ : std_logic ;
      signal \spi_inst/n262_769\ : std_logic ;
      signal \spi_inst/n262_771\ : std_logic ;
      signal \spi_inst/n262_773\ : std_logic ;
      signal \spi_inst/n262_775\ : std_logic ;
      signal \spi_inst/n262_777\ : std_logic ;
      signal \spi_inst/n262_779\ : std_logic ;
      signal \spi_inst/n262_781\ : std_logic ;
      signal \spi_inst/n262_783\ : std_logic ;
      signal \spi_inst/n262_785\ : std_logic ;
      signal \spi_inst/n262_787\ : std_logic ;
      signal \spi_inst/n262_789\ : std_logic ;
      signal \spi_inst/n262_791\ : std_logic ;
      signal \spi_inst/n262_793\ : std_logic ;
      signal \spi_inst/n262_795\ : std_logic ;
      signal \spi_inst/n262_797\ : std_logic ;
      signal \spi_inst/n262_799\ : std_logic ;
      signal \spi_inst/n262_801\ : std_logic ;
      signal \spi_inst/n262_803\ : std_logic ;
      signal \spi_inst/n262_805\ : std_logic ;
      signal \spi_inst/n262_807\ : std_logic ;
      signal \spi_inst/n262_809\ : std_logic ;
      signal \spi_inst/n262_811\ : std_logic ;
      signal \spi_inst/n262_813\ : std_logic ;
      signal \spi_inst/n262_815\ : std_logic ;
      signal \spi_inst/n262_817\ : std_logic ;
      signal \spi_inst/n262_819\ : std_logic ;
      signal \spi_inst/n262_821\ : std_logic ;
      signal \spi_inst/n262_823\ : std_logic ;
      signal \spi_inst/n262_825\ : std_logic ;
      signal \spi_inst/n262_827\ : std_logic ;
      signal \spi_inst/n262_829\ : std_logic ;
      signal \spi_inst/n262_831\ : std_logic ;
      signal \spi_inst/n262_833\ : std_logic ;
      signal \spi_inst/n262_835\ : std_logic ;
      signal \spi_inst/n262_837\ : std_logic ;
      signal \spi_inst/n262_839\ : std_logic ;
      signal \spi_inst/n262_841\ : std_logic ;
      signal \spi_inst/n262_843\ : std_logic ;
      signal \spi_inst/n262_845\ : std_logic ;
      signal \spi_inst/n262_847\ : std_logic ;
      signal \spi_inst/n262_849\ : std_logic ;
      signal \spi_inst/n262_851\ : std_logic ;
      signal \spi_inst/n262_853\ : std_logic ;
      signal \spi_inst/n262_855\ : std_logic ;
      signal \spi_inst/n262_857\ : std_logic ;
      signal \spi_inst/n262_859\ : std_logic ;
      signal \spi_inst/n262_861\ : std_logic ;
      signal \spi_inst/n262_863\ : std_logic ;
      signal \spi_inst/n262_865\ : std_logic ;
      signal \spi_inst/n262_867\ : std_logic ;
      signal \spi_inst/n26_1\ : std_logic ;
      signal \spi_inst/n26_2\ : std_logic ;
      signal \spi_inst/n27_1\ : std_logic ;
      signal \spi_inst/n27_2\ : std_logic ;
      signal \spi_inst/n28_1\ : std_logic ;
      signal \spi_inst/n28_2\ : std_logic ;
      signal \spi_inst/n29_1\ : std_logic ;
      signal \spi_inst/n29_2\ : std_logic ;
      signal \spi_inst/n30_1\ : std_logic ;
      signal \spi_inst/n30_2\ : std_logic ;
      signal \spi_inst/n31_1\ : std_logic ;
      signal \spi_inst/n31_2\ : std_logic ;
      signal \spi_inst/n32_1\ : std_logic ;
      signal \spi_inst/n32_2\ : std_logic ;
      signal \spi_inst/n33_1\ : std_logic ;
      signal \spi_inst/n33_2\ : std_logic ;
      signal \spi_inst/n34_1\ : std_logic ;
      signal \spi_inst/n34_2\ : std_logic ;
      signal \spi_inst/n35_1\ : std_logic ;
      signal \spi_inst/n35_2\ : std_logic ;
      signal \spi_inst/n36_1\ : std_logic ;
      signal \spi_inst/n36_2\ : std_logic ;
      signal \spi_inst/n37_1\ : std_logic ;
      signal \spi_inst/n37_2\ : std_logic ;
      signal \spi_inst/n38_1\ : std_logic ;
      signal \spi_inst/n38_2\ : std_logic ;
      signal \spi_inst/n397_10\ : std_logic ;
      signal \spi_inst/n397_11\ : std_logic ;
      signal \spi_inst/n397_12\ : std_logic ;
      signal \spi_inst/n397_13\ : std_logic ;
      signal \spi_inst/n397_14\ : std_logic ;
      signal \spi_inst/n397_15\ : std_logic ;
      signal \spi_inst/n397_16\ : std_logic ;
      signal \spi_inst/n397_17\ : std_logic ;
      signal \spi_inst/n397_18\ : std_logic ;
      signal \spi_inst/n397_19\ : std_logic ;
      signal \spi_inst/n397_24\ : std_logic ;
      signal \spi_inst/n397_25\ : std_logic ;
      signal \spi_inst/n397_26\ : std_logic ;
      signal \spi_inst/n397_27\ : std_logic ;
      signal \spi_inst/n397_28\ : std_logic ;
      signal \spi_inst/n397_29\ : std_logic ;
      signal \spi_inst/n397_30\ : std_logic ;
      signal \spi_inst/n397_31\ : std_logic ;
      signal \spi_inst/n397_32\ : std_logic ;
      signal \spi_inst/n397_33\ : std_logic ;
      signal \spi_inst/n397_34\ : std_logic ;
      signal \spi_inst/n397_35\ : std_logic ;
      signal \spi_inst/n397_36\ : std_logic ;
      signal \spi_inst/n397_38\ : std_logic ;
      signal \spi_inst/n397_40\ : std_logic ;
      signal \spi_inst/n397_42\ : std_logic ;
      signal \spi_inst/n397_44\ : std_logic ;
      signal \spi_inst/n397_9\ : std_logic ;
      signal \spi_inst/n399_5\ : std_logic ;
      signal \spi_inst/n399_6\ : std_logic ;
      signal \spi_inst/n39_1\ : std_logic ;
      signal \spi_inst/n39_2\ : std_logic ;
      signal \spi_inst/n400_5\ : std_logic ;
      signal \spi_inst/n401_11\ : std_logic ;
      signal \spi_inst/n401_5\ : std_logic ;
      signal \spi_inst/n401_9\ : std_logic ;
      signal \spi_inst/n402_5\ : std_logic ;
      signal \spi_inst/n402_6\ : std_logic ;
      signal \spi_inst/n403_5\ : std_logic ;
      signal \spi_inst/n404_5\ : std_logic ;
      signal \spi_inst/n404_6\ : std_logic ;
      signal \spi_inst/n404_7\ : std_logic ;
      signal \spi_inst/n405_5\ : std_logic ;
      signal \spi_inst/n405_8\ : std_logic ;
      signal \spi_inst/n406_5\ : std_logic ;
      signal \spi_inst/n406_8\ : std_logic ;
      signal \spi_inst/n407_5\ : std_logic ;
      signal \spi_inst/n407_6\ : std_logic ;
      signal \spi_inst/n408_5\ : std_logic ;
      signal \spi_inst/n409_6\ : std_logic ;
      signal \spi_inst/n409_7\ : std_logic ;
      signal \spi_inst/n409_9\ : std_logic ;
      signal \spi_inst/n40_1\ : std_logic ;
      signal \spi_inst/n40_2\ : std_logic ;
      signal \spi_inst/n410_5\ : std_logic ;
      signal \spi_inst/n410_6\ : std_logic ;
      signal \spi_inst/n411_5\ : std_logic ;
      signal \spi_inst/n411_6\ : std_logic ;
      signal \spi_inst/n412_5\ : std_logic ;
      signal \spi_inst/n413_5\ : std_logic ;
      signal \spi_inst/n413_6\ : std_logic ;
      signal \spi_inst/n413_7\ : std_logic ;
      signal \spi_inst/n414_5\ : std_logic ;
      signal \spi_inst/n414_6\ : std_logic ;
      signal \spi_inst/n415_5\ : std_logic ;
      signal \spi_inst/n415_6\ : std_logic ;
      signal \spi_inst/n416_5\ : std_logic ;
      signal \spi_inst/n416_6\ : std_logic ;
      signal \spi_inst/n417_5\ : std_logic ;
      signal \spi_inst/n418_6\ : std_logic ;
      signal \spi_inst/n418_8\ : std_logic ;
      signal \spi_inst/n419_5\ : std_logic ;
      signal \spi_inst/n419_7\ : std_logic ;
      signal \spi_inst/n419_9\ : std_logic ;
      signal \spi_inst/n41_1\ : std_logic ;
      signal \spi_inst/n41_2\ : std_logic ;
      signal \spi_inst/n420_5\ : std_logic ;
      signal \spi_inst/n420_6\ : std_logic ;
      signal \spi_inst/n421_5\ : std_logic ;
      signal \spi_inst/n421_6\ : std_logic ;
      signal \spi_inst/n422_5\ : std_logic ;
      signal \spi_inst/n423_6\ : std_logic ;
      signal \spi_inst/n423_8\ : std_logic ;
      signal \spi_inst/n424_10\ : std_logic ;
      signal \spi_inst/n424_5\ : std_logic ;
      signal \spi_inst/n424_7\ : std_logic ;
      signal \spi_inst/n424_8\ : std_logic ;
      signal \spi_inst/n425_5\ : std_logic ;
      signal \spi_inst/n425_8\ : std_logic ;
      signal \spi_inst/n426_5\ : std_logic ;
      signal \spi_inst/n426_6\ : std_logic ;
      signal \spi_inst/n427_5\ : std_logic ;
      signal \spi_inst/n428_6\ : std_logic ;
      signal \spi_inst/n428_8\ : std_logic ;
      signal \spi_inst/n429_5\ : std_logic ;
      signal \spi_inst/n429_6\ : std_logic ;
      signal \spi_inst/n429_7\ : std_logic ;
      signal \spi_inst/n429_8\ : std_logic ;
      signal \spi_inst/n42_6\ : std_logic ;
      signal \spi_inst/n430_5\ : std_logic ;
      signal \spi_inst/n430_8\ : std_logic ;
      signal \spi_inst/n431_5\ : std_logic ;
      signal \spi_inst/n431_6\ : std_logic ;
      signal \spi_inst/n432_5\ : std_logic ;
      signal \spi_inst/n433_5\ : std_logic ;
      signal \spi_inst/n433_8\ : std_logic ;
      signal \spi_inst/n434_10\ : std_logic ;
      signal \spi_inst/n434_5\ : std_logic ;
      signal \spi_inst/n434_6\ : std_logic ;
      signal \spi_inst/n434_8\ : std_logic ;
      signal \spi_inst/n435_5\ : std_logic ;
      signal \spi_inst/n435_8\ : std_logic ;
      signal \spi_inst/n436_5\ : std_logic ;
      signal \spi_inst/n436_6\ : std_logic ;
      signal \spi_inst/n437_5\ : std_logic ;
      signal \spi_inst/n438_5\ : std_logic ;
      signal \spi_inst/n438_6\ : std_logic ;
      signal \spi_inst/n439_5\ : std_logic ;
      signal \spi_inst/n439_6\ : std_logic ;
      signal \spi_inst/n43_11\ : std_logic ;
      signal \spi_inst/n440_5\ : std_logic ;
      signal \spi_inst/n440_8\ : std_logic ;
      signal \spi_inst/n441_5\ : std_logic ;
      signal \spi_inst/n441_6\ : std_logic ;
      signal \spi_inst/n442_5\ : std_logic ;
      signal \spi_inst/n443_5\ : std_logic ;
      signal \spi_inst/n443_6\ : std_logic ;
      signal \spi_inst/n444_7\ : std_logic ;
      signal \spi_inst/n444_9\ : std_logic ;
      signal \spi_inst/n445_5\ : std_logic ;
      signal \spi_inst/n445_8\ : std_logic ;
      signal \spi_inst/n446_5\ : std_logic ;
      signal \spi_inst/n446_6\ : std_logic ;
      signal \spi_inst/n447_5\ : std_logic ;
      signal \spi_inst/n448_6\ : std_logic ;
      signal \spi_inst/n448_8\ : std_logic ;
      signal \spi_inst/n449_5\ : std_logic ;
      signal \spi_inst/n449_6\ : std_logic ;
      signal \spi_inst/n449_7\ : std_logic ;
      signal \spi_inst/n450_5\ : std_logic ;
      signal \spi_inst/n450_8\ : std_logic ;
      signal \spi_inst/n451_5\ : std_logic ;
      signal \spi_inst/n451_6\ : std_logic ;
      signal \spi_inst/n452_5\ : std_logic ;
      signal \spi_inst/n453_5\ : std_logic ;
      signal \spi_inst/n453_6\ : std_logic ;
      signal \spi_inst/n453_7\ : std_logic ;
      signal \spi_inst/n455_6\ : std_logic ;
      signal \spi_inst/n455_8\ : std_logic ;
      signal \spi_inst/n456_11\ : std_logic ;
      signal \spi_inst/n456_7\ : std_logic ;
      signal \spi_inst/n456_9\ : std_logic ;
      signal \spi_inst/n458_7\ : std_logic ;
      signal \spi_inst/n459_7\ : std_logic ;
      signal \spi_inst/n460_7\ : std_logic ;
      signal \spi_inst/n461_7\ : std_logic ;
      signal \spi_inst/n597_20\ : std_logic ;
      signal \spi_inst/n597_21\ : std_logic ;
      signal \spi_inst/n597_22\ : std_logic ;
      signal \spi_inst/n597_27\ : std_logic ;
      signal \spi_inst/n599_18\ : std_logic ;
      signal \spi_inst/n599_19\ : std_logic ;
      signal \spi_inst/n601_18\ : std_logic ;
      signal \spi_inst/n601_21\ : std_logic ;
      signal \spi_inst/n603_18\ : std_logic ;
      signal \spi_inst/n603_21\ : std_logic ;
      signal \spi_inst/n605_18\ : std_logic ;
      signal \spi_inst/n605_19\ : std_logic ;
      signal \spi_inst/n607_18\ : std_logic ;
      signal \spi_inst/n607_19\ : std_logic ;
      signal \spi_inst/n607_21\ : std_logic ;
      signal \spi_inst/n607_22\ : std_logic ;
      signal \spi_inst/n607_24\ : std_logic ;
      signal \spi_inst/n609_18\ : std_logic ;
      signal \spi_inst/n609_19\ : std_logic ;
      signal \spi_inst/n609_20\ : std_logic ;
      signal \spi_inst/n611_18\ : std_logic ;
      signal \spi_inst/n611_19\ : std_logic ;
      signal \spi_inst/n613_18\ : std_logic ;
      signal \spi_inst/n613_19\ : std_logic ;
      signal \spi_inst/n615_18\ : std_logic ;
      signal \spi_inst/n615_19\ : std_logic ;
      signal \spi_inst/n615_20\ : std_logic ;
      signal \spi_inst/n617_18\ : std_logic ;
      signal \spi_inst/n617_19\ : std_logic ;
      signal \spi_inst/n617_20\ : std_logic ;
      signal \spi_inst/n619_18\ : std_logic ;
      signal \spi_inst/n619_19\ : std_logic ;
      signal \spi_inst/n621_18\ : std_logic ;
      signal \spi_inst/n621_19\ : std_logic ;
      signal \spi_inst/n623_18\ : std_logic ;
      signal \spi_inst/n623_19\ : std_logic ;
      signal \spi_inst/n625_18\ : std_logic ;
      signal \spi_inst/n625_20\ : std_logic ;
      signal \spi_inst/n625_22\ : std_logic ;
      signal \spi_inst/n627_18\ : std_logic ;
      signal \spi_inst/n627_19\ : std_logic ;
      signal \spi_inst/n629_18\ : std_logic ;
      signal \spi_inst/n629_19\ : std_logic ;
      signal \spi_inst/n631_18\ : std_logic ;
      signal \spi_inst/n631_21\ : std_logic ;
      signal \spi_inst/n633_18\ : std_logic ;
      signal \spi_inst/n633_19\ : std_logic ;
      signal \spi_inst/n633_20\ : std_logic ;
      signal \spi_inst/n633_23\ : std_logic ;
      signal \spi_inst/n635_18\ : std_logic ;
      signal \spi_inst/n635_21\ : std_logic ;
      signal \spi_inst/n637_18\ : std_logic ;
      signal \spi_inst/n637_21\ : std_logic ;
      signal \spi_inst/n639_18\ : std_logic ;
      signal \spi_inst/n639_19\ : std_logic ;
      signal \spi_inst/n641_18\ : std_logic ;
      signal \spi_inst/n641_19\ : std_logic ;
      signal \spi_inst/n643_18\ : std_logic ;
      signal \spi_inst/n643_19\ : std_logic ;
      signal \spi_inst/n645_18\ : std_logic ;
      signal \spi_inst/n645_19\ : std_logic ;
      signal \spi_inst/n645_20\ : std_logic ;
      signal \spi_inst/n647_16\ : std_logic ;
      signal \spi_inst/n647_17\ : std_logic ;
      signal \spi_inst/n647_20\ : std_logic ;
      signal \spi_inst/n649_17\ : std_logic ;
      signal \spi_inst/n649_24\ : std_logic ;
      signal \spi_inst/n651_18\ : std_logic ;
      signal \spi_inst/n651_19\ : std_logic ;
      signal \spi_inst/n653_18\ : std_logic ;
      signal \spi_inst/n653_19\ : std_logic ;
      signal \spi_inst/n655_17\ : std_logic ;
      signal \spi_inst/n655_18\ : std_logic ;
      signal \spi_inst/n655_25\ : std_logic ;
      signal \spi_inst/n657_18\ : std_logic ;
      signal \spi_inst/n659_21\ : std_logic ;
      signal \spi_inst/n659_23\ : std_logic ;
      signal \spi_inst/n661_15\ : std_logic ;
      signal \spi_inst/n661_17\ : std_logic ;
      signal \spi_inst/n661_18\ : std_logic ;
      signal \spi_inst/n663_11\ : std_logic ;
      signal \spi_inst/n663_13\ : std_logic ;
      signal \spi_inst/n663_14\ : std_logic ;
      signal \spi_inst/n663_16\ : std_logic ;
      signal \spi_inst/n663_9\ : std_logic ;
      signal \spi_inst/n665_19\ : std_logic ;
      signal \spi_inst/n665_20\ : std_logic ;
      signal \spi_inst/n779_19\ : std_logic ;
      signal \spi_inst/n779_21\ : std_logic ;
      signal \spi_inst/n785_19\ : std_logic ;
      signal \spi_inst/n785_21\ : std_logic ;
      signal \spi_inst/n795_14\ : std_logic ;
      signal \spi_inst/n795_16\ : std_logic ;
      signal \spi_inst/n799_16\ : std_logic ;
      signal \spi_inst/n799_17\ : std_logic ;
      signal \spi_inst/n799_19\ : std_logic ;
      signal \spi_inst/n799_20\ : std_logic ;
      signal \spi_inst/n799_21\ : std_logic ;
      signal \spi_inst/n799_22\ : std_logic ;
      signal \spi_inst/n799_23\ : std_logic ;
      signal \spi_inst/n799_24\ : std_logic ;
      signal \spi_inst/n799_25\ : std_logic ;
      signal \spi_inst/n799_26\ : std_logic ;
      signal \spi_inst/n799_27\ : std_logic ;
      signal \spi_inst/n799_29\ : std_logic ;
      signal \spi_inst/n800_16\ : std_logic ;
      signal \spi_inst/n801_18\ : std_logic ;
      signal \spi_inst/n801_20\ : std_logic ;
      signal \spi_inst/n801_22\ : std_logic ;
      signal \spi_inst/n8_10\ : std_logic ;
      signal \spi_inst/n8_11\ : std_logic ;
      signal \spi_inst/n8_12\ : std_logic ;
      signal \spi_inst/n8_13\ : std_logic ;
      signal \spi_inst/n8_15\ : std_logic ;
      signal \spi_inst/n8_4\ : std_logic ;
      signal \spi_inst/n8_5\ : std_logic ;
      signal \spi_inst/n8_6\ : std_logic ;
      signal \spi_inst/n8_7\ : std_logic ;
      signal \spi_inst/n8_8\ : std_logic ;
      signal \spi_inst/n8_9\ : std_logic ;
      signal \spi_inst/spi_mosi_7\ : std_logic ;
      signal \spi_inst/spi_nss_6\ : std_logic ;
      signal clk_d : std_logic ;
      signal crc_done_reg : std_logic ;
      signal crc_done_reg_10 : std_logic ;
      signal encoder_clk1_pin_d : std_logic ;
      signal encoder_clk2_pin_d : std_logic ;
      signal encoder_clk3_pin_d : std_logic ;
      signal encoder_clk4_pin_d : std_logic ;
      signal encoder_clk5_pin_d : std_logic ;
      signal encoder_clk6_pin_d : std_logic ;
      signal encoder_clk7_pin_d : std_logic ;
      signal encoder_clk8_pin_d : std_logic ;
      signal encoder_data_in1_d : std_logic ;
      signal encoder_data_in2_d : std_logic ;
      signal encoder_data_in3_d : std_logic ;
      signal encoder_data_in4_d : std_logic ;
      signal encoder_data_in5_d : std_logic ;
      signal encoder_data_in6_d : std_logic ;
      signal encoder_data_in7_d : std_logic ;
      signal encoder_data_in8_d : std_logic ;
      signal n104_18 : std_logic ;
      signal n104_19 : std_logic ;
      signal n106_18 : std_logic ;
      signal n106_19 : std_logic ;
      signal n106_20 : std_logic ;
      signal n107_19 : std_logic ;
      signal n107_20 : std_logic ;
      signal n107_23 : std_logic ;
      signal n73_21 : std_logic ;
      signal n73_22 : std_logic ;
      signal n75_21 : std_logic ;
      signal n75_22 : std_logic ;
      signal n77_21 : std_logic ;
      signal n80_12 : std_logic ;
      signal n83_12 : std_logic ;
      signal n86_12 : std_logic ;
      signal n88_11 : std_logic ;
      signal n90_9 : std_logic ;
      signal n92_11 : std_logic ;
      signal n94_11 : std_logic ;
      signal n96_14 : std_logic ;
      signal n98_9 : std_logic ;
      signal reset_d : std_logic ;
      signal rs485_done_reg : std_logic ;
      signal rs485_done_reg_10 : std_logic ;
      signal spi_clk_Z : std_logic ;
      signal spi_clk_pin_d : std_logic ;
      signal spi_done_reg : std_logic ;
      signal spi_done_reg_10 : std_logic ;
      signal spi_done_reg_11 : std_logic ;
      signal spi_mosi_Z : std_logic ;
      signal spi_mosi_pin_d : std_logic ;
      signal spi_nss_Z : std_logic ;
      signal spi_nss_pin_d : std_logic ;
      signal BUFF_CRC : std_logic_vector(279 downto 0);
      signal BUFF_NOCRC : std_logic_vector(247 downto 0);
      signal \rs_inst/clk_div_counter\ : std_logic_vector(31 downto 0);
      signal \rs_inst/enc_read_frame_counter\ : std_logic_vector(31 downto 0);
      signal \rs_inst/encoder_data_buffer[0]\ : std_logic_vector(23 downto 0);
      signal \rs_inst/encoder_data_buffer[1]\ : std_logic_vector(23 downto 0);
      signal \rs_inst/encoder_data_buffer[2]\ : std_logic_vector(23 downto 0);
      signal \rs_inst/encoder_data_buffer[3]\ : std_logic_vector(23 downto 0);
      signal \rs_inst/encoder_data_buffer[4]\ : std_logic_vector(23 downto 0);
      signal \rs_inst/encoder_data_buffer[5]\ : std_logic_vector(23 downto 0);
      signal \rs_inst/encoder_data_buffer[6]\ : std_logic_vector(23 downto 0);
      signal \rs_inst/encoder_data_buffer[7]\ : std_logic_vector(23 downto 0);
      signal \rs_inst/period_counter\ : std_logic_vector(31 downto 0);
      signal \rs_inst/state\ : std_logic_vector(2 downto 0);
      signal \scs_inst/RegBuffIn\ : std_logic_vector(248 downto 0);
      signal \scs_inst/bit_index\ : std_logic_vector(31 downto 0);
      signal \scs_inst/byte_count\ : std_logic_vector(31 downto 0);
      signal \scs_inst/crc_reg\ : std_logic_vector(31 downto 0);
      signal \scs_inst/data_byte\ : std_logic_vector(7 downto 0);
      signal \scs_inst/state\ : std_logic_vector(2 downto 0);
      signal \spi_inst/bit_index\ : std_logic_vector(63 downto 0);
      signal \spi_inst/delay_counter\ : std_logic_vector(31 downto 0);
      signal \spi_inst/spi_div_counter\ : std_logic_vector(31 downto 0);
      signal \spi_inst/state\ : std_logic_vector(2 downto 0);
      signal encoder_clk_buff : std_logic_vector(7 downto 0);
      signal encoder_data_in_buff : std_logic_vector(7 downto 0);
      signal state : std_logic_vector(2 downto 0);
begin
      clk_ibuf : IBUF
           port map (
               I => clk,
               O => clk_d
           );
      reset_ibuf : IBUF
           port map (
               I => reset,
               O => reset_d
           );
      encoder_data_in1_ibuf : IBUF
           port map (
               I => encoder_data_in1,
               O => encoder_data_in1_d
           );
      encoder_data_in2_ibuf : IBUF
           port map (
               I => encoder_data_in2,
               O => encoder_data_in2_d
           );
      encoder_data_in3_ibuf : IBUF
           port map (
               I => encoder_data_in3,
               O => encoder_data_in3_d
           );
      encoder_data_in4_ibuf : IBUF
           port map (
               I => encoder_data_in4,
               O => encoder_data_in4_d
           );
      encoder_data_in5_ibuf : IBUF
           port map (
               I => encoder_data_in5,
               O => encoder_data_in5_d
           );
      encoder_data_in6_ibuf : IBUF
           port map (
               I => encoder_data_in6,
               O => encoder_data_in6_d
           );
      encoder_data_in7_ibuf : IBUF
           port map (
               I => encoder_data_in7,
               O => encoder_data_in7_d
           );
      encoder_data_in8_ibuf : IBUF
           port map (
               I => encoder_data_in8,
               O => encoder_data_in8_d
           );
      encoder_clk1_pin_obuf : OBUF
           port map (
               I => encoder_clk1_pin_d,
               O => encoder_clk1_pin
           );
      encoder_clk2_pin_obuf : OBUF
           port map (
               I => encoder_clk2_pin_d,
               O => encoder_clk2_pin
           );
      encoder_clk3_pin_obuf : OBUF
           port map (
               I => encoder_clk3_pin_d,
               O => encoder_clk3_pin
           );
      encoder_clk4_pin_obuf : OBUF
           port map (
               I => encoder_clk4_pin_d,
               O => encoder_clk4_pin
           );
      encoder_clk5_pin_obuf : OBUF
           port map (
               I => encoder_clk5_pin_d,
               O => encoder_clk5_pin
           );
      encoder_clk6_pin_obuf : OBUF
           port map (
               I => encoder_clk6_pin_d,
               O => encoder_clk6_pin
           );
      encoder_clk7_pin_obuf : OBUF
           port map (
               I => encoder_clk7_pin_d,
               O => encoder_clk7_pin
           );
      encoder_clk8_pin_obuf : OBUF
           port map (
               I => encoder_clk8_pin_d,
               O => encoder_clk8_pin
           );
      spi_clk_pin_obuf : OBUF
           port map (
               I => spi_clk_pin_d,
               O => spi_clk_pin
           );
      spi_mosi_pin_obuf : OBUF
           port map (
               I => spi_mosi_pin_d,
               O => spi_mosi_pin
           );
      spi_nss_pin_obuf : OBUF
           port map (
               I => spi_nss_pin_d,
               O => spi_nss_pin
           );
      LED0_PIN_obuf : OBUF
           port map (
               I => LED0_PIN_d,
               O => LED0_PIN
           );
      LED1_PIN_obuf : OBUF
           port map (
               I => LED1_PIN_d,
               O => LED1_PIN
           );
      LED2_PIN_obuf : OBUF
           port map (
               I => LED2_PIN_d,
               O => LED2_PIN
           );
      LED3_PIN_obuf : OBUF
           port map (
               I => LED3_PIN_d,
               O => LED3_PIN
           );
      LED4_PIN_obuf : OBUF
           port map (
               I => LED4_PIN_d,
               O => LED4_PIN
           );
      LED5_PIN_obuf : OBUF
           port map (
               I => LED5_PIN_d,
               O => LED5_PIN
           );
      RS485_START_s4 : LUT4
           generic map (
               INIT => X"002B"
           )
           port map (
               I0 => state(0),
               I1 => state(1),
               I2 => state(2),
               I3 => reset_d,
               F => SPI_START_7
           );
      LED3_PIN_s6 : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => state(0),
               I1 => state(1),
               I2 => reset_d,
               F => LED3_PIN_8
           );
      LED5_PIN_s6 : LUT4
           generic map (
               INIT => X"1001"
           )
           port map (
               I0 => state(0),
               I1 => reset_d,
               I2 => state(2),
               I3 => state(1),
               F => LED5_PIN_8
           );
      n104_s14 : LUT3
           generic map (
               INIT => X"0E"
           )
           port map (
               I0 => state(2),
               I1 => CRC_DONE_Z,
               I2 => n104_19,
               F => n104_18
           );
      n106_s14 : LUT4
           generic map (
               INIT => X"80FF"
           )
           port map (
               I0 => LED2_PIN_9,
               I1 => SPI_DONE_Z,
               I2 => state(2),
               I3 => n106_19,
               F => n106_18
           );
      n107_s15 : LUT4
           generic map (
               INIT => X"FFFE"
           )
           port map (
               I0 => n86_12,
               I1 => n107_20,
               I2 => n107_23,
               I3 => n83_12,
               F => n107_19
           );
      n73_s15 : LUT4
           generic map (
               INIT => X"0E00"
           )
           port map (
               I0 => RS485_DONE_Z,
               I1 => rs485_done_reg,
               I2 => state(2),
               I3 => n73_22,
               F => n73_21
           );
      n75_s15 : LUT3
           generic map (
               INIT => X"E0"
           )
           port map (
               I0 => crc_done_reg,
               I1 => CRC_DONE_Z,
               I2 => n75_22,
               F => n75_21
           );
      n77_s15 : LUT4
           generic map (
               INIT => X"E000"
           )
           port map (
               I0 => SPI_DONE_Z,
               I1 => spi_done_reg,
               I2 => state(0),
               I3 => LED4_PIN_9,
               F => n77_21
           );
      n90_s5 : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => state(0),
               I1 => state(2),
               I2 => LED1_PIN_d,
               I3 => state(1),
               F => n90_9
           );
      n98_s5 : LUT4
           generic map (
               INIT => X"1000"
           )
           port map (
               I0 => state(0),
               I1 => LED5_PIN_d,
               I2 => state(2),
               I3 => state(1),
               F => n98_9
           );
      n96_s9 : LUT4
           generic map (
               INIT => X"4B00"
           )
           port map (
               I0 => state(0),
               I1 => CRC_DONE_Z,
               I2 => LED4_PIN_d,
               I3 => LED4_PIN_9,
               F => n96_14
           );
      rs485_done_reg_s6 : LUT3
           generic map (
               INIT => X"F4"
           )
           port map (
               I0 => RS485_DONE_Z,
               I1 => LED1_PIN_10,
               I2 => LED0_PIN_11,
               F => rs485_done_reg_10
           );
      crc_done_reg_s6 : LUT3
           generic map (
               INIT => X"0E"
           )
           port map (
               I0 => n107_20,
               I1 => n75_22,
               I2 => reset_d,
               F => crc_done_reg_10
           );
      spi_done_reg_s6 : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => reset_d,
               I1 => spi_done_reg_11,
               F => spi_done_reg_10
           );
      LED2_PIN_s7 : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => state(0),
               I1 => state(1),
               F => LED2_PIN_9
           );
      LED4_PIN_s7 : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => state(1),
               I1 => state(2),
               F => LED4_PIN_9
           );
      n104_s15 : LUT4
           generic map (
               INIT => X"C43F"
           )
           port map (
               I0 => SPI_DONE_Z,
               I1 => state(1),
               I2 => state(0),
               I3 => state(2),
               F => n104_19
           );
      n106_s15 : LUT4
           generic map (
               INIT => X"00BF"
           )
           port map (
               I0 => state(2),
               I1 => n73_22,
               I2 => RS485_DONE_Z,
               I3 => n106_20,
               F => n106_19
           );
      n107_s16 : LUT4
           generic map (
               INIT => X"0007"
           )
           port map (
               I0 => state(2),
               I1 => CRC_DONE_Z,
               I2 => state(1),
               I3 => state(0),
               F => n107_20
           );
      n73_s16 : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => state(1),
               I1 => state(0),
               F => n73_22
           );
      n75_s16 : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => state(2),
               I1 => state(1),
               I2 => state(0),
               F => n75_22
           );
      spi_done_reg_s7 : LUT4
           generic map (
               INIT => X"E3FC"
           )
           port map (
               I0 => SPI_DONE_Z,
               I1 => state(0),
               I2 => state(1),
               I3 => state(2),
               F => spi_done_reg_11
           );
      n106_s16 : LUT4
           generic map (
               INIT => X"0700"
           )
           port map (
               I0 => state(0),
               I1 => CRC_DONE_Z,
               I2 => state(2),
               I3 => state(1),
               F => n106_20
           );
      LED1_PIN_s7 : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => state(0),
               I1 => state(2),
               I2 => reset_d,
               F => LED1_PIN_10
           );
      LED0_PIN_s8 : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => state(1),
               I1 => state(2),
               I2 => reset_d,
               F => LED0_PIN_11
           );
      LED2_PIN_s9 : LUT4
           generic map (
               INIT => X"1001"
           )
           port map (
               I0 => state(2),
               I1 => reset_d,
               I2 => state(0),
               I3 => state(1),
               F => LED2_PIN_13
           );
      n107_s18 : LUT4
           generic map (
               INIT => X"0110"
           )
           port map (
               I0 => state(2),
               I1 => RS485_DONE_Z,
               I2 => state(0),
               I3 => state(1),
               F => n107_23
           );
      n94_s6 : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => state(0),
               I1 => LED3_PIN_d,
               I2 => state(1),
               I3 => state(2),
               F => n94_11
           );
      LED4_PIN_s8 : LUT4
           generic map (
               INIT => X"FF10"
           )
           port map (
               I0 => reset_d,
               I1 => state(1),
               I2 => state(2),
               I3 => LED3_PIN_8,
               F => LED4_PIN_11
           );
      n92_s6 : LUT4
           generic map (
               INIT => X"1000"
           )
           port map (
               I0 => LED2_PIN_d,
               I1 => state(2),
               I2 => state(1),
               I3 => state(0),
               F => n92_11
           );
      n83_s7 : LUT4
           generic map (
               INIT => X"1000"
           )
           port map (
               I0 => CRC_DONE_Z,
               I1 => state(2),
               I2 => state(1),
               I3 => state(0),
               F => n83_12
           );
      n88_s6 : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => state(2),
               I1 => LED0_PIN_d,
               I2 => state(1),
               I3 => state(0),
               F => n88_11
           );
      n86_s7 : LUT4
           generic map (
               INIT => X"0400"
           )
           port map (
               I0 => SPI_DONE_Z,
               I1 => state(2),
               I2 => state(1),
               I3 => state(0),
               F => n86_12
           );
      n80_s7 : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => state(2),
               I1 => RS485_DONE_Z,
               I2 => state(1),
               I3 => state(0),
               F => n80_12
           );
      state_2_s0 : DFFC
           generic map (
               INIT => '0'
           )
           port map (
               D => n104_18,
               CLK => clk_d,
               CLEAR => reset_d,
               Q => state(2)
           );
      state_1_s0 : DFFC
           generic map (
               INIT => '0'
           )
           port map (
               D => n106_18,
               CLK => clk_d,
               CLEAR => reset_d,
               Q => state(1)
           );
      state_0_s0 : DFFC
           generic map (
               INIT => '0'
           )
           port map (
               D => n107_19,
               CLK => clk_d,
               CLEAR => reset_d,
               Q => state(0)
           );
      rs485_done_reg_s0 : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => n73_21,
               CLK => clk_d,
               CE => rs485_done_reg_10,
               Q => rs485_done_reg
           );
      crc_done_reg_s0 : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => n75_21,
               CLK => clk_d,
               CE => crc_done_reg_10,
               Q => crc_done_reg
           );
      spi_done_reg_s0 : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => n77_21,
               CLK => clk_d,
               CE => spi_done_reg_10,
               Q => spi_done_reg
           );
      RS485_START_s0 : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => n80_12,
               CLK => clk_d,
               CE => SPI_START_7,
               Q => RS485_START
           );
      CRC_START_s0 : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => n83_12,
               CLK => clk_d,
               CE => SPI_START_7,
               Q => CRC_START
           );
      SPI_START_s0 : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => n86_12,
               CLK => clk_d,
               CE => SPI_START_7,
               Q => SPI_START
           );
      LED0_PIN_s2 : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => n88_11,
               CLK => clk_d,
               CE => LED0_PIN_11,
               Q => LED0_PIN_d
           );
      LED1_PIN_s2 : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => n90_9,
               CLK => clk_d,
               CE => LED1_PIN_10,
               Q => LED1_PIN_d
           );
      LED2_PIN_s2 : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => n92_11,
               CLK => clk_d,
               CE => LED2_PIN_13,
               Q => LED2_PIN_d
           );
      LED3_PIN_s2 : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => n94_11,
               CLK => clk_d,
               CE => LED3_PIN_8,
               Q => LED3_PIN_d
           );
      LED4_PIN_s2 : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => n96_14,
               CLK => clk_d,
               CE => LED4_PIN_11,
               Q => LED4_PIN_d
           );
      LED5_PIN_s2 : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => n98_9,
               CLK => clk_d,
               CE => LED5_PIN_8,
               Q => LED5_PIN_d
           );
      encoder_data_in_buff_7_s0 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in8_d,
               CLK => clk_d,
               Q => encoder_data_in_buff(7)
           );
      encoder_data_in_buff_6_s0 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in7_d,
               CLK => clk_d,
               Q => encoder_data_in_buff(6)
           );
      encoder_data_in_buff_5_s0 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in6_d,
               CLK => clk_d,
               Q => encoder_data_in_buff(5)
           );
      encoder_data_in_buff_4_s0 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in5_d,
               CLK => clk_d,
               Q => encoder_data_in_buff(4)
           );
      encoder_data_in_buff_3_s0 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in4_d,
               CLK => clk_d,
               Q => encoder_data_in_buff(3)
           );
      encoder_data_in_buff_2_s0 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in3_d,
               CLK => clk_d,
               Q => encoder_data_in_buff(2)
           );
      encoder_data_in_buff_1_s0 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in2_d,
               CLK => clk_d,
               Q => encoder_data_in_buff(1)
           );
      encoder_data_in_buff_0_s0 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in1_d,
               CLK => clk_d,
               Q => encoder_data_in_buff(0)
           );
      spi_clk_pin_s2 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => spi_clk_Z,
               CLK => clk_d,
               Q => spi_clk_pin_d
           );
      spi_mosi_pin_s2 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => spi_mosi_Z,
               CLK => clk_d,
               Q => spi_mosi_pin_d
           );
      spi_nss_pin_s2 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => spi_nss_Z,
               CLK => clk_d,
               Q => spi_nss_pin_d
           );
      encoder_clk1_pin_s2 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_clk_buff(0),
               CLK => clk_d,
               Q => encoder_clk1_pin_d
           );
      encoder_clk2_pin_s2 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_clk_buff(1),
               CLK => clk_d,
               Q => encoder_clk2_pin_d
           );
      encoder_clk3_pin_s2 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_clk_buff(2),
               CLK => clk_d,
               Q => encoder_clk3_pin_d
           );
      encoder_clk4_pin_s2 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_clk_buff(3),
               CLK => clk_d,
               Q => encoder_clk4_pin_d
           );
      encoder_clk5_pin_s2 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_clk_buff(4),
               CLK => clk_d,
               Q => encoder_clk5_pin_d
           );
      encoder_clk6_pin_s2 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_clk_buff(5),
               CLK => clk_d,
               Q => encoder_clk6_pin_d
           );
      encoder_clk7_pin_s2 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_clk_buff(6),
               CLK => clk_d,
               Q => encoder_clk7_pin_d
           );
      encoder_clk8_pin_s2 : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_clk_buff(7),
               CLK => clk_d,
               Q => encoder_clk8_pin_d
           );
      \rs_inst/n760_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(23),
               I1 => \rs_inst/encoder_data_buffer[0]\(22),
               F => \rs_inst/n760_3\
           );
      \rs_inst/n762_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(23),
               I1 => \rs_inst/encoder_data_buffer[0]\(22),
               I2 => \rs_inst/encoder_data_buffer[0]\(21),
               I3 => \rs_inst/encoder_data_buffer[0]\(20),
               F => \rs_inst/n762_3\
           );
      \rs_inst/n763_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(19),
               I1 => \rs_inst/n762_3\,
               F => \rs_inst/n763_3\
           );
      \rs_inst/n765_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(19),
               I1 => \rs_inst/encoder_data_buffer[0]\(18),
               I2 => \rs_inst/encoder_data_buffer[0]\(17),
               I3 => \rs_inst/n762_3\,
               F => \rs_inst/n765_3\
           );
      \rs_inst/n766_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(16),
               I1 => \rs_inst/n765_3\,
               F => \rs_inst/n766_3\
           );
      \rs_inst/n768_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(16),
               I1 => \rs_inst/encoder_data_buffer[0]\(15),
               I2 => \rs_inst/encoder_data_buffer[0]\(14),
               I3 => \rs_inst/n765_3\,
               F => \rs_inst/n768_3\
           );
      \rs_inst/n769_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(13),
               I1 => \rs_inst/n768_3\,
               F => \rs_inst/n769_3\
           );
      \rs_inst/n771_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(13),
               I1 => \rs_inst/encoder_data_buffer[0]\(12),
               I2 => \rs_inst/encoder_data_buffer[0]\(11),
               I3 => \rs_inst/n768_3\,
               F => \rs_inst/n771_3\
           );
      \rs_inst/n772_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(10),
               I1 => \rs_inst/n771_3\,
               F => \rs_inst/n772_3\
           );
      \rs_inst/n775_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(9),
               I1 => \rs_inst/encoder_data_buffer[0]\(8),
               I2 => \rs_inst/encoder_data_buffer[0]\(7),
               I3 => \rs_inst/n772_3\,
               F => \rs_inst/n775_3\
           );
      \rs_inst/n778_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(5),
               I1 => \rs_inst/encoder_data_buffer[0]\(4),
               I2 => \rs_inst/n772_3\,
               I3 => \rs_inst/n776_4\,
               F => \rs_inst/n778_3\
           );
      \rs_inst/n779_s0\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/n771_3\,
               I1 => \rs_inst/n776_4\,
               I2 => \rs_inst/n779_4\,
               F => \rs_inst/n779_3\
           );
      \rs_inst/n781_s0\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(2),
               I1 => \rs_inst/encoder_data_buffer[0]\(1),
               I2 => \rs_inst/n779_3\,
               F => \rs_inst/n781_3\
           );
      \rs_inst/n782_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(2),
               I1 => \rs_inst/encoder_data_buffer[0]\(1),
               I2 => \rs_inst/encoder_data_buffer[0]\(0),
               I3 => \rs_inst/n779_3\,
               F => \rs_inst/n782_3\
           );
      \rs_inst/n783_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(23),
               I1 => \rs_inst/encoder_data_buffer[2]\(22),
               F => \rs_inst/n783_3\
           );
      \rs_inst/n785_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(23),
               I1 => \rs_inst/encoder_data_buffer[2]\(22),
               I2 => \rs_inst/encoder_data_buffer[2]\(21),
               I3 => \rs_inst/encoder_data_buffer[2]\(20),
               F => \rs_inst/n785_3\
           );
      \rs_inst/n786_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(19),
               I1 => \rs_inst/n785_3\,
               F => \rs_inst/n786_3\
           );
      \rs_inst/n788_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(19),
               I1 => \rs_inst/encoder_data_buffer[2]\(18),
               I2 => \rs_inst/encoder_data_buffer[2]\(17),
               I3 => \rs_inst/n785_3\,
               F => \rs_inst/n788_3\
           );
      \rs_inst/n789_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(16),
               I1 => \rs_inst/n788_3\,
               F => \rs_inst/n789_3\
           );
      \rs_inst/n791_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(16),
               I1 => \rs_inst/encoder_data_buffer[2]\(15),
               I2 => \rs_inst/encoder_data_buffer[2]\(14),
               I3 => \rs_inst/n788_3\,
               F => \rs_inst/n791_3\
           );
      \rs_inst/n792_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(13),
               I1 => \rs_inst/n791_3\,
               F => \rs_inst/n792_3\
           );
      \rs_inst/n795_s0\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(10),
               I1 => \rs_inst/n791_3\,
               I2 => \rs_inst/n794_4\,
               F => \rs_inst/n795_3\
           );
      \rs_inst/n797_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(8),
               I1 => \rs_inst/n796_5\,
               F => \rs_inst/n797_3\
           );
      \rs_inst/n798_s0\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(8),
               I1 => \rs_inst/encoder_data_buffer[2]\(7),
               I2 => \rs_inst/n796_5\,
               F => \rs_inst/n798_3\
           );
      \rs_inst/n800_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(5),
               I1 => \rs_inst/n799_6\,
               F => \rs_inst/n800_3\
           );
      \rs_inst/n802_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(3),
               I1 => \rs_inst/n795_3\,
               I2 => \rs_inst/n799_4\,
               I3 => \rs_inst/n801_4\,
               F => \rs_inst/n802_3\
           );
      \rs_inst/n803_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(2),
               I1 => \rs_inst/n802_3\,
               F => \rs_inst/n803_3\
           );
      \rs_inst/n804_s0\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(2),
               I1 => \rs_inst/encoder_data_buffer[2]\(1),
               I2 => \rs_inst/n802_3\,
               F => \rs_inst/n804_3\
           );
      \rs_inst/n805_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(2),
               I1 => \rs_inst/encoder_data_buffer[2]\(1),
               I2 => \rs_inst/encoder_data_buffer[2]\(0),
               I3 => \rs_inst/n802_3\,
               F => \rs_inst/n805_3\
           );
      \rs_inst/n806_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(23),
               I1 => \rs_inst/encoder_data_buffer[4]\(22),
               F => \rs_inst/n806_3\
           );
      \rs_inst/n808_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(23),
               I1 => \rs_inst/encoder_data_buffer[4]\(22),
               I2 => \rs_inst/encoder_data_buffer[4]\(21),
               I3 => \rs_inst/encoder_data_buffer[4]\(20),
               F => \rs_inst/n808_3\
           );
      \rs_inst/n809_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(19),
               I1 => \rs_inst/n808_3\,
               F => \rs_inst/n809_3\
           );
      \rs_inst/n811_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(19),
               I1 => \rs_inst/encoder_data_buffer[4]\(18),
               I2 => \rs_inst/encoder_data_buffer[4]\(17),
               I3 => \rs_inst/n808_3\,
               F => \rs_inst/n811_3\
           );
      \rs_inst/n812_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(16),
               I1 => \rs_inst/n811_3\,
               F => \rs_inst/n812_3\
           );
      \rs_inst/n814_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(16),
               I1 => \rs_inst/encoder_data_buffer[4]\(15),
               I2 => \rs_inst/encoder_data_buffer[4]\(14),
               I3 => \rs_inst/n811_3\,
               F => \rs_inst/n814_3\
           );
      \rs_inst/n815_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(13),
               I1 => \rs_inst/n814_3\,
               F => \rs_inst/n815_3\
           );
      \rs_inst/n818_s0\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(10),
               I1 => \rs_inst/n814_3\,
               I2 => \rs_inst/n817_4\,
               F => \rs_inst/n818_3\
           );
      \rs_inst/n820_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(8),
               I1 => \rs_inst/n819_5\,
               F => \rs_inst/n820_3\
           );
      \rs_inst/n821_s0\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(8),
               I1 => \rs_inst/encoder_data_buffer[4]\(7),
               I2 => \rs_inst/n819_5\,
               F => \rs_inst/n821_3\
           );
      \rs_inst/n823_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(5),
               I1 => \rs_inst/n822_6\,
               F => \rs_inst/n823_3\
           );
      \rs_inst/n825_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(3),
               I1 => \rs_inst/n818_3\,
               I2 => \rs_inst/n822_4\,
               I3 => \rs_inst/n824_4\,
               F => \rs_inst/n825_3\
           );
      \rs_inst/n826_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(2),
               I1 => \rs_inst/n825_3\,
               F => \rs_inst/n826_3\
           );
      \rs_inst/n827_s0\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(2),
               I1 => \rs_inst/encoder_data_buffer[4]\(1),
               I2 => \rs_inst/n825_3\,
               F => \rs_inst/n827_3\
           );
      \rs_inst/n828_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(2),
               I1 => \rs_inst/encoder_data_buffer[4]\(1),
               I2 => \rs_inst/encoder_data_buffer[4]\(0),
               I3 => \rs_inst/n825_3\,
               F => \rs_inst/n828_3\
           );
      \rs_inst/n829_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(23),
               I1 => \rs_inst/encoder_data_buffer[6]\(22),
               F => \rs_inst/n829_3\
           );
      \rs_inst/n831_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(23),
               I1 => \rs_inst/encoder_data_buffer[6]\(22),
               I2 => \rs_inst/encoder_data_buffer[6]\(21),
               I3 => \rs_inst/encoder_data_buffer[6]\(20),
               F => \rs_inst/n831_3\
           );
      \rs_inst/n832_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(19),
               I1 => \rs_inst/n831_3\,
               F => \rs_inst/n832_3\
           );
      \rs_inst/n834_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(19),
               I1 => \rs_inst/encoder_data_buffer[6]\(18),
               I2 => \rs_inst/encoder_data_buffer[6]\(17),
               I3 => \rs_inst/n831_3\,
               F => \rs_inst/n834_3\
           );
      \rs_inst/n835_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(16),
               I1 => \rs_inst/n834_3\,
               F => \rs_inst/n835_3\
           );
      \rs_inst/n837_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(16),
               I1 => \rs_inst/encoder_data_buffer[6]\(15),
               I2 => \rs_inst/encoder_data_buffer[6]\(14),
               I3 => \rs_inst/n834_3\,
               F => \rs_inst/n837_3\
           );
      \rs_inst/n838_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(13),
               I1 => \rs_inst/n837_3\,
               F => \rs_inst/n838_3\
           );
      \rs_inst/n841_s0\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(10),
               I1 => \rs_inst/n837_3\,
               I2 => \rs_inst/n840_4\,
               F => \rs_inst/n841_3\
           );
      \rs_inst/n843_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(8),
               I1 => \rs_inst/n842_5\,
               F => \rs_inst/n843_3\
           );
      \rs_inst/n844_s0\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(8),
               I1 => \rs_inst/encoder_data_buffer[6]\(7),
               I2 => \rs_inst/n842_5\,
               F => \rs_inst/n844_3\
           );
      \rs_inst/n846_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(5),
               I1 => \rs_inst/n845_6\,
               F => \rs_inst/n846_3\
           );
      \rs_inst/n848_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(3),
               I1 => \rs_inst/n841_3\,
               I2 => \rs_inst/n845_4\,
               I3 => \rs_inst/n847_4\,
               F => \rs_inst/n848_3\
           );
      \rs_inst/n849_s0\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(2),
               I1 => \rs_inst/n848_3\,
               F => \rs_inst/n849_3\
           );
      \rs_inst/n850_s0\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(2),
               I1 => \rs_inst/encoder_data_buffer[6]\(1),
               I2 => \rs_inst/n848_3\,
               F => \rs_inst/n850_3\
           );
      \rs_inst/n851_s0\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(2),
               I1 => \rs_inst/encoder_data_buffer[6]\(1),
               I2 => \rs_inst/encoder_data_buffer[6]\(0),
               I3 => \rs_inst/n848_3\,
               F => \rs_inst/n851_3\
           );
      \rs_inst/n2922_s0\ : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => \rs_inst/n2922_4\,
               I1 => \rs_inst/n497_13\,
               I2 => \rs_inst/n2922_28\,
               F => \rs_inst/n2922_3\
           );
      \rs_inst/n938_s1\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \rs_inst/state\(0),
               I1 => \rs_inst/state\(2),
               I2 => \rs_inst/state\(1),
               F => \rs_inst/n938_4\
           );
      \rs_inst/n946_s6\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \rs_inst/state\(0),
               I1 => \rs_inst/state\(1),
               F => \rs_inst/n946_10\
           );
      \rs_inst/n1012_s8\ : LUT3
           generic map (
               INIT => X"07"
           )
           port map (
               I0 => \rs_inst/state\(1),
               I1 => \rs_inst/state\(0),
               I2 => \rs_inst/state\(2),
               F => \rs_inst/n1012_12\
           );
      \rs_inst/n1012_s9\ : LUT4
           generic map (
               INIT => X"7D55"
           )
           port map (
               I0 => \rs_inst/n1012_15\,
               I1 => encoder_clk_buff(7),
               I2 => \rs_inst/n2922_28\,
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n1012_14\
           );
      \rs_inst/n1014_s8\ : LUT4
           generic map (
               INIT => X"7D55"
           )
           port map (
               I0 => \rs_inst/n1014_13\,
               I1 => encoder_clk_buff(6),
               I2 => \rs_inst/n2922_28\,
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n1014_12\
           );
      \rs_inst/n1016_s8\ : LUT4
           generic map (
               INIT => X"7D55"
           )
           port map (
               I0 => \rs_inst/n1016_13\,
               I1 => encoder_clk_buff(5),
               I2 => \rs_inst/n2922_28\,
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n1016_12\
           );
      \rs_inst/n1018_s8\ : LUT4
           generic map (
               INIT => X"7D55"
           )
           port map (
               I0 => \rs_inst/n1018_13\,
               I1 => encoder_clk_buff(4),
               I2 => \rs_inst/n2922_28\,
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n1018_12\
           );
      \rs_inst/n1020_s8\ : LUT4
           generic map (
               INIT => X"7D55"
           )
           port map (
               I0 => \rs_inst/n1020_13\,
               I1 => encoder_clk_buff(3),
               I2 => \rs_inst/n2922_28\,
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n1020_12\
           );
      \rs_inst/n1022_s8\ : LUT4
           generic map (
               INIT => X"7D55"
           )
           port map (
               I0 => \rs_inst/n1022_13\,
               I1 => encoder_clk_buff(2),
               I2 => \rs_inst/n2922_28\,
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n1022_12\
           );
      \rs_inst/n1024_s8\ : LUT4
           generic map (
               INIT => X"7D55"
           )
           port map (
               I0 => \rs_inst/n1024_13\,
               I1 => encoder_clk_buff(1),
               I2 => \rs_inst/n2922_28\,
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n1024_12\
           );
      \rs_inst/n1026_s8\ : LUT4
           generic map (
               INIT => X"7D55"
           )
           port map (
               I0 => \rs_inst/n1026_13\,
               I1 => encoder_clk_buff(0),
               I2 => \rs_inst/n2922_28\,
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n1026_12\
           );
      \rs_inst/n1030_s15\ : LUT4
           generic map (
               INIT => X"F088"
           )
           port map (
               I0 => \rs_inst/state\(1),
               I1 => \rs_inst/n1030_20\,
               I2 => \rs_inst/n1030_23\,
               I3 => \rs_inst/state\(2),
               F => \rs_inst/n1030_19\
           );
      \rs_inst/n1032_s15\ : LUT4
           generic map (
               INIT => X"000D"
           )
           port map (
               I0 => \rs_inst/n946_10\,
               I1 => RS485_START,
               I2 => \rs_inst/state\(2),
               I3 => \rs_inst/n1030_20\,
               F => \rs_inst/n1032_19\
           );
      \rs_inst/n998_s13\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \rs_inst/n948_28\,
               I1 => \rs_inst/period_counter\(31),
               F => \rs_inst/n998_18\
           );
      \rs_inst/n1000_s13\ : LUT4
           generic map (
               INIT => X"FF80"
           )
           port map (
               I0 => \rs_inst/n948_21\,
               I1 => \rs_inst/n1000_19\,
               I2 => \rs_inst/period_counter\(4),
               I3 => \rs_inst/n1000_20\,
               F => \rs_inst/n1000_18\
           );
      \rs_inst/n1002_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \rs_inst/n1002_21\,
               I1 => \rs_inst/n1000_19\,
               I2 => \rs_inst/n948_21\,
               I3 => \rs_inst/period_counter\(4),
               F => \rs_inst/n1002_18\
           );
      \rs_inst/n1004_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \rs_inst/n1002_21\,
               I1 => \rs_inst/n1004_21\,
               I2 => \rs_inst/n948_21\,
               I3 => \rs_inst/period_counter\(3),
               F => \rs_inst/n1004_18\
           );
      \rs_inst/n1006_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \rs_inst/n1002_21\,
               I1 => \rs_inst/n1006_21\,
               I2 => \rs_inst/n948_21\,
               I3 => \rs_inst/period_counter\(2),
               F => \rs_inst/n1006_18\
           );
      \rs_inst/n1008_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \rs_inst/n1002_21\,
               I1 => \rs_inst/n1008_19\,
               I2 => \rs_inst/n948_21\,
               I3 => \rs_inst/period_counter\(1),
               F => \rs_inst/n1008_18\
           );
      \rs_inst/n1010_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \rs_inst/n1002_21\,
               I1 => \rs_inst/n2922_28\,
               I2 => \rs_inst/n948_21\,
               I3 => \rs_inst/period_counter\(0),
               F => \rs_inst/n1010_18\
           );
      \rs_inst/n496_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(0),
               I1 => \rs_inst/enc_read_frame_counter\(1),
               I2 => \rs_inst/n1012_21\,
               F => \rs_inst/n496_5\
           );
      \rs_inst/n494_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(2),
               I1 => \rs_inst/n495_6\,
               I2 => \rs_inst/enc_read_frame_counter\(3),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n494_5\
           );
      \rs_inst/n493_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(4),
               I1 => \rs_inst/n493_6\,
               I2 => \rs_inst/n1012_21\,
               F => \rs_inst/n493_5\
           );
      \rs_inst/n492_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(4),
               I1 => \rs_inst/n493_6\,
               I2 => \rs_inst/enc_read_frame_counter\(5),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n492_5\
           );
      \rs_inst/n491_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/n493_6\,
               I1 => \rs_inst/n491_6\,
               I2 => \rs_inst/enc_read_frame_counter\(6),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n491_5\
           );
      \rs_inst/n490_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(7),
               I1 => \rs_inst/n490_8\,
               I2 => \rs_inst/n1012_21\,
               F => \rs_inst/n490_5\
           );
      \rs_inst/n488_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(8),
               I1 => \rs_inst/n489_6\,
               I2 => \rs_inst/enc_read_frame_counter\(9),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n488_5\
           );
      \rs_inst/n487_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(10),
               I1 => \rs_inst/n487_8\,
               I2 => \rs_inst/n1012_21\,
               F => \rs_inst/n487_5\
           );
      \rs_inst/n486_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(10),
               I1 => \rs_inst/n487_8\,
               I2 => \rs_inst/enc_read_frame_counter\(11),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n486_5\
           );
      \rs_inst/n485_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/n487_8\,
               I1 => \rs_inst/n485_6\,
               I2 => \rs_inst/enc_read_frame_counter\(12),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n485_5\
           );
      \rs_inst/n484_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(13),
               I1 => \rs_inst/n484_11\,
               I2 => \rs_inst/n1012_21\,
               F => \rs_inst/n484_5\
           );
      \rs_inst/n483_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(13),
               I1 => \rs_inst/n484_11\,
               I2 => \rs_inst/enc_read_frame_counter\(14),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n483_5\
           );
      \rs_inst/n482_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(15),
               I1 => \rs_inst/n482_9\,
               I2 => \rs_inst/n1012_21\,
               F => \rs_inst/n482_5\
           );
      \rs_inst/n481_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(15),
               I1 => \rs_inst/n482_9\,
               I2 => \rs_inst/enc_read_frame_counter\(16),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n481_5\
           );
      \rs_inst/n480_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/n487_8\,
               I1 => \rs_inst/n480_6\,
               I2 => \rs_inst/enc_read_frame_counter\(17),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n480_5\
           );
      \rs_inst/n479_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(18),
               I1 => \rs_inst/n479_10\,
               I2 => \rs_inst/n1012_21\,
               F => \rs_inst/n479_5\
           );
      \rs_inst/n478_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(18),
               I1 => \rs_inst/n479_10\,
               I2 => \rs_inst/enc_read_frame_counter\(19),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n478_5\
           );
      \rs_inst/n477_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(20),
               I1 => \rs_inst/n477_6\,
               I2 => \rs_inst/n1012_21\,
               F => \rs_inst/n477_5\
           );
      \rs_inst/n476_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(20),
               I1 => \rs_inst/n477_6\,
               I2 => \rs_inst/enc_read_frame_counter\(21),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n476_5\
           );
      \rs_inst/n475_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/n477_6\,
               I1 => \rs_inst/n475_6\,
               I2 => \rs_inst/enc_read_frame_counter\(22),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n475_5\
           );
      \rs_inst/n474_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/n479_10\,
               I1 => \rs_inst/n474_8\,
               I2 => \rs_inst/enc_read_frame_counter\(23),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n474_5\
           );
      \rs_inst/n473_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(24),
               I1 => \rs_inst/n473_6\,
               I2 => \rs_inst/n1012_21\,
               F => \rs_inst/n473_5\
           );
      \rs_inst/n472_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(24),
               I1 => \rs_inst/n473_6\,
               I2 => \rs_inst/enc_read_frame_counter\(25),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n472_5\
           );
      \rs_inst/n471_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/n473_6\,
               I1 => \rs_inst/n471_6\,
               I2 => \rs_inst/enc_read_frame_counter\(26),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n471_5\
           );
      \rs_inst/n470_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/n473_6\,
               I1 => \rs_inst/n470_8\,
               I2 => \rs_inst/enc_read_frame_counter\(27),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n470_5\
           );
      \rs_inst/n469_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(28),
               I1 => \rs_inst/n469_6\,
               I2 => \rs_inst/n1012_21\,
               F => \rs_inst/n469_5\
           );
      \rs_inst/n468_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(28),
               I1 => \rs_inst/n469_6\,
               I2 => \rs_inst/enc_read_frame_counter\(29),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n468_5\
           );
      \rs_inst/n467_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/n469_6\,
               I1 => \rs_inst/n467_6\,
               I2 => \rs_inst/enc_read_frame_counter\(30),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n467_5\
           );
      \rs_inst/n466_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \rs_inst/n469_6\,
               I1 => \rs_inst/n466_8\,
               I2 => \rs_inst/enc_read_frame_counter\(31),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n466_5\
           );
      \rs_inst/n41_s1\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/n41_7\,
               I1 => \rs_inst/n41_8\,
               I2 => \rs_inst/n41_9\,
               I3 => \rs_inst/n41_10\,
               F => \rs_inst/n41_5\
           );
      \rs_inst/n41_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/n41_11\,
               I1 => \rs_inst/n41_12\,
               I2 => \rs_inst/n41_13\,
               I3 => \rs_inst/n41_14\,
               F => \rs_inst/n41_6\
           );
      \rs_inst/n776_s1\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(9),
               I1 => \rs_inst/encoder_data_buffer[0]\(8),
               I2 => \rs_inst/encoder_data_buffer[0]\(7),
               I3 => \rs_inst/encoder_data_buffer[0]\(6),
               F => \rs_inst/n776_4\
           );
      \rs_inst/n779_s1\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(10),
               I1 => \rs_inst/encoder_data_buffer[0]\(5),
               I2 => \rs_inst/encoder_data_buffer[0]\(4),
               I3 => \rs_inst/encoder_data_buffer[0]\(3),
               F => \rs_inst/n779_4\
           );
      \rs_inst/n794_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(13),
               I1 => \rs_inst/encoder_data_buffer[2]\(12),
               I2 => \rs_inst/encoder_data_buffer[2]\(11),
               F => \rs_inst/n794_4\
           );
      \rs_inst/n799_s1\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(9),
               I1 => \rs_inst/encoder_data_buffer[2]\(8),
               I2 => \rs_inst/encoder_data_buffer[2]\(7),
               I3 => \rs_inst/encoder_data_buffer[2]\(6),
               F => \rs_inst/n799_4\
           );
      \rs_inst/n801_s1\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(5),
               I1 => \rs_inst/encoder_data_buffer[2]\(4),
               F => \rs_inst/n801_4\
           );
      \rs_inst/n817_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(13),
               I1 => \rs_inst/encoder_data_buffer[4]\(12),
               I2 => \rs_inst/encoder_data_buffer[4]\(11),
               F => \rs_inst/n817_4\
           );
      \rs_inst/n822_s1\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(9),
               I1 => \rs_inst/encoder_data_buffer[4]\(8),
               I2 => \rs_inst/encoder_data_buffer[4]\(7),
               I3 => \rs_inst/encoder_data_buffer[4]\(6),
               F => \rs_inst/n822_4\
           );
      \rs_inst/n824_s1\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(5),
               I1 => \rs_inst/encoder_data_buffer[4]\(4),
               F => \rs_inst/n824_4\
           );
      \rs_inst/n840_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(13),
               I1 => \rs_inst/encoder_data_buffer[6]\(12),
               I2 => \rs_inst/encoder_data_buffer[6]\(11),
               F => \rs_inst/n840_4\
           );
      \rs_inst/n845_s1\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(9),
               I1 => \rs_inst/encoder_data_buffer[6]\(8),
               I2 => \rs_inst/encoder_data_buffer[6]\(7),
               I3 => \rs_inst/encoder_data_buffer[6]\(6),
               F => \rs_inst/n845_4\
           );
      \rs_inst/n847_s1\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(5),
               I1 => \rs_inst/encoder_data_buffer[6]\(4),
               F => \rs_inst/n847_4\
           );
      \rs_inst/n2922_s1\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/n2922_6\,
               I1 => \rs_inst/n2922_7\,
               I2 => \rs_inst/n2922_8\,
               I3 => \rs_inst/n2922_9\,
               F => \rs_inst/n2922_4\
           );
      \rs_inst/n948_s15\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \rs_inst/state\(2),
               I1 => \rs_inst/state\(0),
               F => \rs_inst/n948_21\
           );
      \rs_inst/n1012_s10\ : LUT4
           generic map (
               INIT => X"001F"
           )
           port map (
               I0 => RS485_START,
               I1 => encoder_clk_buff(7),
               I2 => \rs_inst/n1012_19\,
               I3 => \rs_inst/n938_4\,
               F => \rs_inst/n1012_15\
           );
      \rs_inst/n1014_s9\ : LUT4
           generic map (
               INIT => X"001F"
           )
           port map (
               I0 => RS485_START,
               I1 => encoder_clk_buff(6),
               I2 => \rs_inst/n1012_19\,
               I3 => \rs_inst/n938_4\,
               F => \rs_inst/n1014_13\
           );
      \rs_inst/n1016_s9\ : LUT4
           generic map (
               INIT => X"001F"
           )
           port map (
               I0 => RS485_START,
               I1 => encoder_clk_buff(5),
               I2 => \rs_inst/n1012_19\,
               I3 => \rs_inst/n938_4\,
               F => \rs_inst/n1016_13\
           );
      \rs_inst/n1018_s9\ : LUT4
           generic map (
               INIT => X"001F"
           )
           port map (
               I0 => RS485_START,
               I1 => encoder_clk_buff(4),
               I2 => \rs_inst/n1012_19\,
               I3 => \rs_inst/n938_4\,
               F => \rs_inst/n1018_13\
           );
      \rs_inst/n1020_s9\ : LUT4
           generic map (
               INIT => X"001F"
           )
           port map (
               I0 => RS485_START,
               I1 => encoder_clk_buff(3),
               I2 => \rs_inst/n1012_19\,
               I3 => \rs_inst/n938_4\,
               F => \rs_inst/n1020_13\
           );
      \rs_inst/n1022_s9\ : LUT4
           generic map (
               INIT => X"001F"
           )
           port map (
               I0 => RS485_START,
               I1 => encoder_clk_buff(2),
               I2 => \rs_inst/n1012_19\,
               I3 => \rs_inst/n938_4\,
               F => \rs_inst/n1022_13\
           );
      \rs_inst/n1024_s9\ : LUT4
           generic map (
               INIT => X"001F"
           )
           port map (
               I0 => RS485_START,
               I1 => encoder_clk_buff(1),
               I2 => \rs_inst/n1012_19\,
               I3 => \rs_inst/n938_4\,
               F => \rs_inst/n1024_13\
           );
      \rs_inst/n1026_s9\ : LUT4
           generic map (
               INIT => X"001F"
           )
           port map (
               I0 => RS485_START,
               I1 => encoder_clk_buff(0),
               I2 => \rs_inst/n1012_19\,
               I3 => \rs_inst/n938_4\,
               F => \rs_inst/n1026_13\
           );
      \rs_inst/n1030_s16\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \rs_inst/n2922_28\,
               I1 => \rs_inst/state\(0),
               F => \rs_inst/n1030_20\
           );
      \rs_inst/n1000_s14\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/period_counter\(3),
               I1 => \rs_inst/period_counter\(2),
               I2 => \rs_inst/n2922_28\,
               I3 => \rs_inst/n1000_21\,
               F => \rs_inst/n1000_19\
           );
      \rs_inst/n1000_s15\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \rs_inst/n948_28\,
               I1 => \rs_inst/period_counter\(5),
               F => \rs_inst/n1000_20\
           );
      \rs_inst/n1008_s14\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \rs_inst/period_counter\(0),
               I1 => \rs_inst/n2922_28\,
               F => \rs_inst/n1008_19\
           );
      \rs_inst/n495_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(0),
               I1 => \rs_inst/enc_read_frame_counter\(1),
               F => \rs_inst/n495_6\
           );
      \rs_inst/n493_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(0),
               I1 => \rs_inst/enc_read_frame_counter\(1),
               I2 => \rs_inst/enc_read_frame_counter\(2),
               I3 => \rs_inst/enc_read_frame_counter\(3),
               F => \rs_inst/n493_6\
           );
      \rs_inst/n491_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(4),
               I1 => \rs_inst/enc_read_frame_counter\(5),
               F => \rs_inst/n491_6\
           );
      \rs_inst/n489_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(7),
               I1 => \rs_inst/n490_8\,
               F => \rs_inst/n489_6\
           );
      \rs_inst/n485_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(10),
               I1 => \rs_inst/enc_read_frame_counter\(11),
               F => \rs_inst/n485_6\
           );
      \rs_inst/n480_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(15),
               I1 => \rs_inst/enc_read_frame_counter\(16),
               I2 => \rs_inst/n484_9\,
               I3 => \rs_inst/n482_7\,
               F => \rs_inst/n480_6\
           );
      \rs_inst/n477_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/n487_8\,
               I1 => \rs_inst/n484_9\,
               I2 => \rs_inst/n479_7\,
               I3 => \rs_inst/n477_7\,
               F => \rs_inst/n477_6\
           );
      \rs_inst/n475_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(20),
               I1 => \rs_inst/enc_read_frame_counter\(21),
               F => \rs_inst/n475_6\
           );
      \rs_inst/n473_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(23),
               I1 => \rs_inst/n487_8\,
               I2 => \rs_inst/n484_9\,
               I3 => \rs_inst/n473_9\,
               F => \rs_inst/n473_6\
           );
      \rs_inst/n471_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(24),
               I1 => \rs_inst/enc_read_frame_counter\(25),
               F => \rs_inst/n471_6\
           );
      \rs_inst/n469_s2\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \rs_inst/n487_8\,
               I1 => \rs_inst/n473_9\,
               I2 => \rs_inst/n469_7\,
               F => \rs_inst/n469_6\
           );
      \rs_inst/n467_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(28),
               I1 => \rs_inst/enc_read_frame_counter\(29),
               F => \rs_inst/n467_6\
           );
      \rs_inst/n41_s3\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \rs_inst/clk_div_counter\(20),
               I1 => \rs_inst/clk_div_counter\(21),
               I2 => \rs_inst/clk_div_counter\(22),
               I3 => \rs_inst/clk_div_counter\(23),
               F => \rs_inst/n41_7\
           );
      \rs_inst/n41_s4\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \rs_inst/clk_div_counter\(16),
               I1 => \rs_inst/clk_div_counter\(17),
               I2 => \rs_inst/clk_div_counter\(18),
               I3 => \rs_inst/clk_div_counter\(19),
               F => \rs_inst/n41_8\
           );
      \rs_inst/n41_s5\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \rs_inst/clk_div_counter\(28),
               I1 => \rs_inst/clk_div_counter\(29),
               I2 => \rs_inst/clk_div_counter\(30),
               I3 => \rs_inst/clk_div_counter\(31),
               F => \rs_inst/n41_9\
           );
      \rs_inst/n41_s6\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \rs_inst/clk_div_counter\(24),
               I1 => \rs_inst/clk_div_counter\(25),
               I2 => \rs_inst/clk_div_counter\(26),
               I3 => \rs_inst/clk_div_counter\(27),
               F => \rs_inst/n41_10\
           );
      \rs_inst/n41_s7\ : LUT4
           generic map (
               INIT => X"1000"
           )
           port map (
               I0 => \rs_inst/clk_div_counter\(6),
               I1 => \rs_inst/clk_div_counter\(7),
               I2 => \rs_inst/clk_div_counter\(4),
               I3 => \rs_inst/clk_div_counter\(5),
               F => \rs_inst/n41_11\
           );
      \rs_inst/n41_s8\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => \rs_inst/clk_div_counter\(1),
               I1 => \rs_inst/clk_div_counter\(2),
               I2 => \rs_inst/clk_div_counter\(3),
               I3 => \rs_inst/clk_div_counter\(0),
               F => \rs_inst/n41_12\
           );
      \rs_inst/n41_s9\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \rs_inst/clk_div_counter\(12),
               I1 => \rs_inst/clk_div_counter\(13),
               I2 => \rs_inst/clk_div_counter\(14),
               I3 => \rs_inst/clk_div_counter\(15),
               F => \rs_inst/n41_13\
           );
      \rs_inst/n41_s10\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \rs_inst/clk_div_counter\(8),
               I1 => \rs_inst/clk_div_counter\(9),
               I2 => \rs_inst/clk_div_counter\(10),
               I3 => \rs_inst/clk_div_counter\(11),
               F => \rs_inst/n41_14\
           );
      \rs_inst/n2922_s3\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(21),
               I1 => \rs_inst/enc_read_frame_counter\(22),
               I2 => \rs_inst/enc_read_frame_counter\(23),
               I3 => \rs_inst/enc_read_frame_counter\(24),
               F => \rs_inst/n2922_6\
           );
      \rs_inst/n2922_s4\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(17),
               I1 => \rs_inst/enc_read_frame_counter\(18),
               I2 => \rs_inst/enc_read_frame_counter\(19),
               I3 => \rs_inst/enc_read_frame_counter\(20),
               F => \rs_inst/n2922_7\
           );
      \rs_inst/n2922_s5\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(29),
               I1 => \rs_inst/enc_read_frame_counter\(30),
               I2 => \rs_inst/enc_read_frame_counter\(31),
               I3 => \rs_inst/n2922_14\,
               F => \rs_inst/n2922_8\
           );
      \rs_inst/n2922_s6\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/n2922_15\,
               I1 => \rs_inst/n2922_16\,
               I2 => \rs_inst/n2922_17\,
               I3 => \rs_inst/n2922_18\,
               F => \rs_inst/n2922_9\
           );
      \rs_inst/n1000_s16\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \rs_inst/period_counter\(1),
               I1 => \rs_inst/period_counter\(0),
               F => \rs_inst/n1000_21\
           );
      \rs_inst/n482_s3\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(13),
               I1 => \rs_inst/enc_read_frame_counter\(14),
               F => \rs_inst/n482_7\
           );
      \rs_inst/n479_s3\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(13),
               I1 => \rs_inst/n479_8\,
               F => \rs_inst/n479_7\
           );
      \rs_inst/n477_s3\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(18),
               I1 => \rs_inst/enc_read_frame_counter\(19),
               F => \rs_inst/n477_7\
           );
      \rs_inst/n469_s3\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(23),
               I1 => \rs_inst/enc_read_frame_counter\(27),
               I2 => \rs_inst/n484_9\,
               I3 => \rs_inst/n470_8\,
               F => \rs_inst/n469_7\
           );
      \rs_inst/n2922_s11\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(25),
               I1 => \rs_inst/enc_read_frame_counter\(26),
               I2 => \rs_inst/enc_read_frame_counter\(27),
               I3 => \rs_inst/enc_read_frame_counter\(28),
               F => \rs_inst/n2922_14\
           );
      \rs_inst/n2922_s12\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(5),
               I1 => \rs_inst/enc_read_frame_counter\(6),
               I2 => \rs_inst/enc_read_frame_counter\(7),
               I3 => \rs_inst/enc_read_frame_counter\(8),
               F => \rs_inst/n2922_15\
           );
      \rs_inst/n2922_s13\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(1),
               I1 => \rs_inst/enc_read_frame_counter\(2),
               I2 => \rs_inst/enc_read_frame_counter\(3),
               I3 => \rs_inst/enc_read_frame_counter\(4),
               F => \rs_inst/n2922_16\
           );
      \rs_inst/n2922_s14\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(13),
               I1 => \rs_inst/enc_read_frame_counter\(14),
               I2 => \rs_inst/enc_read_frame_counter\(15),
               I3 => \rs_inst/enc_read_frame_counter\(16),
               F => \rs_inst/n2922_17\
           );
      \rs_inst/n2922_s15\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(9),
               I1 => \rs_inst/enc_read_frame_counter\(10),
               I2 => \rs_inst/enc_read_frame_counter\(11),
               I3 => \rs_inst/enc_read_frame_counter\(12),
               F => \rs_inst/n2922_18\
           );
      \rs_inst/n479_s4\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(14),
               I1 => \rs_inst/enc_read_frame_counter\(15),
               I2 => \rs_inst/enc_read_frame_counter\(16),
               I3 => \rs_inst/enc_read_frame_counter\(17),
               F => \rs_inst/n479_8\
           );
      \rs_inst/n2922_s20\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \rs_inst/period_counter\(3),
               I1 => \rs_inst/period_counter\(2),
               I2 => \rs_inst/period_counter\(1),
               F => \rs_inst/n2922_23\
           );
      \rs_inst/n466_s3\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(30),
               I1 => \rs_inst/enc_read_frame_counter\(28),
               I2 => \rs_inst/enc_read_frame_counter\(29),
               F => \rs_inst/n466_8\
           );
      \rs_inst/n470_s3\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(26),
               I1 => \rs_inst/enc_read_frame_counter\(24),
               I2 => \rs_inst/enc_read_frame_counter\(25),
               F => \rs_inst/n470_8\
           );
      \rs_inst/n474_s3\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(22),
               I1 => \rs_inst/n477_7\,
               I2 => \rs_inst/enc_read_frame_counter\(20),
               I3 => \rs_inst/enc_read_frame_counter\(21),
               F => \rs_inst/n474_8\
           );
      \rs_inst/n482_s4\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/n487_8\,
               I1 => \rs_inst/n484_9\,
               I2 => \rs_inst/enc_read_frame_counter\(13),
               I3 => \rs_inst/enc_read_frame_counter\(14),
               F => \rs_inst/n482_9\
           );
      \rs_inst/n484_s4\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(12),
               I1 => \rs_inst/enc_read_frame_counter\(10),
               I2 => \rs_inst/enc_read_frame_counter\(11),
               F => \rs_inst/n484_9\
           );
      \rs_inst/n490_s3\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(6),
               I1 => \rs_inst/n493_6\,
               I2 => \rs_inst/enc_read_frame_counter\(4),
               I3 => \rs_inst/enc_read_frame_counter\(5),
               F => \rs_inst/n490_8\
           );
      \rs_inst/n495_s3\ : LUT4
           generic map (
               INIT => X"6A00"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(2),
               I1 => \rs_inst/enc_read_frame_counter\(0),
               I2 => \rs_inst/enc_read_frame_counter\(1),
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n495_8\
           );
      \rs_inst/n761_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(21),
               I1 => \rs_inst/encoder_data_buffer[0]\(23),
               I2 => \rs_inst/encoder_data_buffer[0]\(22),
               F => \rs_inst/n761_5\
           );
      \rs_inst/n764_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(18),
               I1 => \rs_inst/encoder_data_buffer[0]\(19),
               I2 => \rs_inst/n762_3\,
               F => \rs_inst/n764_5\
           );
      \rs_inst/n767_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(15),
               I1 => \rs_inst/encoder_data_buffer[0]\(16),
               I2 => \rs_inst/n765_3\,
               F => \rs_inst/n767_5\
           );
      \rs_inst/n770_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(12),
               I1 => \rs_inst/encoder_data_buffer[0]\(13),
               I2 => \rs_inst/n768_3\,
               F => \rs_inst/n770_5\
           );
      \rs_inst/n784_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(21),
               I1 => \rs_inst/encoder_data_buffer[2]\(23),
               I2 => \rs_inst/encoder_data_buffer[2]\(22),
               F => \rs_inst/n784_5\
           );
      \rs_inst/n787_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(18),
               I1 => \rs_inst/encoder_data_buffer[2]\(19),
               I2 => \rs_inst/n785_3\,
               F => \rs_inst/n787_5\
           );
      \rs_inst/n790_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(15),
               I1 => \rs_inst/encoder_data_buffer[2]\(16),
               I2 => \rs_inst/n788_3\,
               F => \rs_inst/n790_5\
           );
      \rs_inst/n793_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(12),
               I1 => \rs_inst/encoder_data_buffer[2]\(13),
               I2 => \rs_inst/n791_3\,
               F => \rs_inst/n793_5\
           );
      \rs_inst/n794_s2\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/n791_3\,
               I1 => \rs_inst/encoder_data_buffer[2]\(13),
               I2 => \rs_inst/encoder_data_buffer[2]\(12),
               I3 => \rs_inst/encoder_data_buffer[2]\(11),
               F => \rs_inst/n794_6\
           );
      \rs_inst/n801_s2\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/n799_6\,
               I1 => \rs_inst/encoder_data_buffer[2]\(5),
               I2 => \rs_inst/encoder_data_buffer[2]\(4),
               F => \rs_inst/n801_6\
           );
      \rs_inst/n807_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(21),
               I1 => \rs_inst/encoder_data_buffer[4]\(23),
               I2 => \rs_inst/encoder_data_buffer[4]\(22),
               F => \rs_inst/n807_5\
           );
      \rs_inst/n810_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(18),
               I1 => \rs_inst/encoder_data_buffer[4]\(19),
               I2 => \rs_inst/n808_3\,
               F => \rs_inst/n810_5\
           );
      \rs_inst/n813_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(15),
               I1 => \rs_inst/encoder_data_buffer[4]\(16),
               I2 => \rs_inst/n811_3\,
               F => \rs_inst/n813_5\
           );
      \rs_inst/n816_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(12),
               I1 => \rs_inst/encoder_data_buffer[4]\(13),
               I2 => \rs_inst/n814_3\,
               F => \rs_inst/n816_5\
           );
      \rs_inst/n817_s2\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/n814_3\,
               I1 => \rs_inst/encoder_data_buffer[4]\(13),
               I2 => \rs_inst/encoder_data_buffer[4]\(12),
               I3 => \rs_inst/encoder_data_buffer[4]\(11),
               F => \rs_inst/n817_6\
           );
      \rs_inst/n824_s2\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/n822_6\,
               I1 => \rs_inst/encoder_data_buffer[4]\(5),
               I2 => \rs_inst/encoder_data_buffer[4]\(4),
               F => \rs_inst/n824_6\
           );
      \rs_inst/n830_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(21),
               I1 => \rs_inst/encoder_data_buffer[6]\(23),
               I2 => \rs_inst/encoder_data_buffer[6]\(22),
               F => \rs_inst/n830_5\
           );
      \rs_inst/n833_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(18),
               I1 => \rs_inst/encoder_data_buffer[6]\(19),
               I2 => \rs_inst/n831_3\,
               F => \rs_inst/n833_5\
           );
      \rs_inst/n836_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(15),
               I1 => \rs_inst/encoder_data_buffer[6]\(16),
               I2 => \rs_inst/n834_3\,
               F => \rs_inst/n836_5\
           );
      \rs_inst/n839_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(12),
               I1 => \rs_inst/encoder_data_buffer[6]\(13),
               I2 => \rs_inst/n837_3\,
               F => \rs_inst/n839_5\
           );
      \rs_inst/n840_s2\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/n837_3\,
               I1 => \rs_inst/encoder_data_buffer[6]\(13),
               I2 => \rs_inst/encoder_data_buffer[6]\(12),
               I3 => \rs_inst/encoder_data_buffer[6]\(11),
               F => \rs_inst/n840_6\
           );
      \rs_inst/n847_s2\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/n845_6\,
               I1 => \rs_inst/encoder_data_buffer[6]\(5),
               I2 => \rs_inst/encoder_data_buffer[6]\(4),
               F => \rs_inst/n847_6\
           );
      \rs_inst/n1006_s15\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \rs_inst/n2922_28\,
               I1 => \rs_inst/period_counter\(1),
               I2 => \rs_inst/period_counter\(0),
               F => \rs_inst/n1006_21\
           );
      \rs_inst/n1004_s15\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/period_counter\(2),
               I1 => \rs_inst/n2922_28\,
               I2 => \rs_inst/period_counter\(1),
               I3 => \rs_inst/period_counter\(0),
               F => \rs_inst/n1004_21\
           );
      \rs_inst/n473_s4\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(13),
               I1 => \rs_inst/n479_8\,
               I2 => \rs_inst/n474_8\,
               F => \rs_inst/n473_9\
           );
      \rs_inst/n479_s5\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/n487_8\,
               I1 => \rs_inst/n484_9\,
               I2 => \rs_inst/enc_read_frame_counter\(13),
               I3 => \rs_inst/n479_8\,
               F => \rs_inst/n479_10\
           );
      \rs_inst/n487_s3\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(8),
               I1 => \rs_inst/enc_read_frame_counter\(9),
               I2 => \rs_inst/enc_read_frame_counter\(7),
               I3 => \rs_inst/n490_8\,
               F => \rs_inst/n487_8\
           );
      \rs_inst/n489_s3\ : LUT4
           generic map (
               INIT => X"6A00"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(8),
               I1 => \rs_inst/enc_read_frame_counter\(7),
               I2 => \rs_inst/n490_8\,
               I3 => \rs_inst/n1012_21\,
               F => \rs_inst/n489_8\
           );
      \rs_inst/n780_s1\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(2),
               I1 => \rs_inst/n771_3\,
               I2 => \rs_inst/n776_4\,
               I3 => \rs_inst/n779_4\,
               F => \rs_inst/n780_5\
           );
      \rs_inst/n799_s2\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(10),
               I1 => \rs_inst/n791_3\,
               I2 => \rs_inst/n794_4\,
               I3 => \rs_inst/n799_4\,
               F => \rs_inst/n799_6\
           );
      \rs_inst/n796_s1\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[2]\(9),
               I1 => \rs_inst/encoder_data_buffer[2]\(10),
               I2 => \rs_inst/n791_3\,
               I3 => \rs_inst/n794_4\,
               F => \rs_inst/n796_5\
           );
      \rs_inst/n822_s2\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(10),
               I1 => \rs_inst/n814_3\,
               I2 => \rs_inst/n817_4\,
               I3 => \rs_inst/n822_4\,
               F => \rs_inst/n822_6\
           );
      \rs_inst/n819_s1\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[4]\(9),
               I1 => \rs_inst/encoder_data_buffer[4]\(10),
               I2 => \rs_inst/n814_3\,
               I3 => \rs_inst/n817_4\,
               F => \rs_inst/n819_5\
           );
      \rs_inst/n845_s2\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(10),
               I1 => \rs_inst/n837_3\,
               I2 => \rs_inst/n840_4\,
               I3 => \rs_inst/n845_4\,
               F => \rs_inst/n845_6\
           );
      \rs_inst/n842_s1\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[6]\(9),
               I1 => \rs_inst/encoder_data_buffer[6]\(10),
               I2 => \rs_inst/n837_3\,
               I3 => \rs_inst/n840_4\,
               F => \rs_inst/n842_5\
           );
      \rs_inst/n777_s1\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(5),
               I1 => \rs_inst/encoder_data_buffer[0]\(10),
               I2 => \rs_inst/n771_3\,
               I3 => \rs_inst/n776_4\,
               F => \rs_inst/n777_5\
           );
      \rs_inst/n776_s2\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(10),
               I1 => \rs_inst/n771_3\,
               I2 => \rs_inst/n776_4\,
               F => \rs_inst/n776_6\
           );
      \rs_inst/n774_s1\ : LUT4
           generic map (
               INIT => X"6996"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(9),
               I1 => \rs_inst/encoder_data_buffer[0]\(8),
               I2 => \rs_inst/encoder_data_buffer[0]\(10),
               I3 => \rs_inst/n771_3\,
               F => \rs_inst/n774_5\
           );
      \rs_inst/n773_s1\ : LUT3
           generic map (
               INIT => X"96"
           )
           port map (
               I0 => \rs_inst/encoder_data_buffer[0]\(9),
               I1 => \rs_inst/encoder_data_buffer[0]\(10),
               I2 => \rs_inst/n771_3\,
               F => \rs_inst/n773_5\
           );
      \rs_inst/n1012_s13\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \rs_inst/state\(2),
               I1 => \rs_inst/state\(0),
               I2 => \rs_inst/state\(1),
               F => \rs_inst/n1012_19\
           );
      \rs_inst/n1030_s18\ : LUT4
           generic map (
               INIT => X"000E"
           )
           port map (
               I0 => rs485_done_reg,
               I1 => RS485_START,
               I2 => \rs_inst/state\(0),
               I3 => \rs_inst/state\(1),
               F => \rs_inst/n1030_23\
           );
      \rs_inst/n946_s8\ : LUT4
           generic map (
               INIT => X"0004"
           )
           port map (
               I0 => rs485_done_reg,
               I1 => \rs_inst/state\(2),
               I2 => \rs_inst/state\(0),
               I3 => \rs_inst/state\(1),
               F => \rs_inst/n946_14\
           );
      \rs_inst/n948_s19\ : LUT3
           generic map (
               INIT => X"0B"
           )
           port map (
               I0 => \rs_inst/state\(2),
               I1 => \rs_inst/state\(0),
               I2 => \rs_inst/n1002_21\,
               F => \rs_inst/n948_28\
           );
      \rs_inst/n1012_s14\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \rs_inst/state\(1),
               I1 => \rs_inst/state\(2),
               I2 => \rs_inst/state\(0),
               F => \rs_inst/n1012_21\
           );
      \rs_inst/n41_s11\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \rs_inst/n41_5\,
               I1 => \rs_inst/n41_6\,
               F => \rs_inst/n41_16\
           );
      \rs_inst/n1031_s18\ : LUT4
           generic map (
               INIT => X"C9CC"
           )
           port map (
               I0 => \rs_inst/n2922_28\,
               I1 => \rs_inst/state\(1),
               I2 => \rs_inst/state\(2),
               I3 => \rs_inst/state\(0),
               F => \rs_inst/n1031_24\
           );
      \rs_inst/n1027_s17\ : LUT3
           generic map (
               INIT => X"37"
           )
           port map (
               I0 => \rs_inst/state\(1),
               I1 => \rs_inst/state\(2),
               I2 => \rs_inst/state\(0),
               F => \rs_inst/n1027_23\
           );
      \rs_inst/n497_s4\ : LUT4
           generic map (
               INIT => X"306C"
           )
           port map (
               I0 => \rs_inst/n2922_28\,
               I1 => \rs_inst/enc_read_frame_counter\(0),
               I2 => \rs_inst/n1012_21\,
               I3 => \rs_inst/n938_4\,
               F => \rs_inst/n497_9\
           );
      \rs_inst/enc_read_frame_counter_31_s5\ : LUT3
           generic map (
               INIT => X"F8"
           )
           port map (
               I0 => \rs_inst/n2922_28\,
               I1 => \rs_inst/n1012_21\,
               I2 => \rs_inst/n938_4\,
               F => \rs_inst/enc_read_frame_counter_31_11\
           );
      \rs_inst/n948_s20\ : LUT3
           generic map (
               INIT => X"35"
           )
           port map (
               I0 => \rs_inst/state\(1),
               I1 => \rs_inst/state\(2),
               I2 => \rs_inst/state\(0),
               F => \rs_inst/n948_30\
           );
      \rs_inst/n2922_s23\ : LUT4
           generic map (
               INIT => X"4555"
           )
           port map (
               I0 => \rs_inst/period_counter\(31),
               I1 => \rs_inst/n2922_23\,
               I2 => \rs_inst/period_counter\(4),
               I3 => \rs_inst/period_counter\(5),
               F => \rs_inst/n2922_28\
           );
      \rs_inst/n484_s5\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \rs_inst/n487_8\,
               I1 => \rs_inst/enc_read_frame_counter\(12),
               I2 => \rs_inst/enc_read_frame_counter\(10),
               I3 => \rs_inst/enc_read_frame_counter\(11),
               F => \rs_inst/n484_11\
           );
      \rs_inst/n1002_s15\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => RS485_START,
               I1 => \rs_inst/state\(2),
               I2 => \rs_inst/state\(0),
               I3 => \rs_inst/state\(1),
               F => \rs_inst/n1002_21\
           );
      \rs_inst/n43_s5\ : LUT3
           generic map (
               INIT => X"78"
           )
           port map (
               I0 => \rs_inst/n41_5\,
               I1 => \rs_inst/n41_6\,
               I2 => \rs_inst/slow_clk\,
               F => \rs_inst/n43_12\
           );
      \rs_inst/n497_s6\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => \rs_inst/enc_read_frame_counter\(0),
               I1 => \rs_inst/state\(1),
               I2 => \rs_inst/state\(2),
               I3 => \rs_inst/state\(0),
               F => \rs_inst/n497_13\
           );
      \rs_inst/clk_div_counter_30_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n7_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(30)
           );
      \rs_inst/clk_div_counter_29_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n8_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(29)
           );
      \rs_inst/clk_div_counter_28_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n9_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(28)
           );
      \rs_inst/clk_div_counter_27_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n10_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(27)
           );
      \rs_inst/clk_div_counter_26_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n11_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(26)
           );
      \rs_inst/clk_div_counter_25_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n12_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(25)
           );
      \rs_inst/clk_div_counter_24_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n13_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(24)
           );
      \rs_inst/clk_div_counter_23_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n14_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(23)
           );
      \rs_inst/clk_div_counter_22_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n15_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(22)
           );
      \rs_inst/clk_div_counter_21_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n16_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(21)
           );
      \rs_inst/clk_div_counter_20_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n17_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(20)
           );
      \rs_inst/clk_div_counter_19_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n18_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(19)
           );
      \rs_inst/clk_div_counter_18_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n19_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(18)
           );
      \rs_inst/clk_div_counter_17_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n20_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(17)
           );
      \rs_inst/clk_div_counter_16_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n21_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(16)
           );
      \rs_inst/clk_div_counter_15_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n22_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(15)
           );
      \rs_inst/clk_div_counter_14_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n23_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(14)
           );
      \rs_inst/clk_div_counter_13_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n24_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(13)
           );
      \rs_inst/clk_div_counter_12_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n25_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(12)
           );
      \rs_inst/clk_div_counter_11_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n26_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(11)
           );
      \rs_inst/clk_div_counter_10_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n27_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(10)
           );
      \rs_inst/clk_div_counter_9_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n28_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(9)
           );
      \rs_inst/clk_div_counter_8_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n29_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(8)
           );
      \rs_inst/clk_div_counter_7_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n30_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(7)
           );
      \rs_inst/clk_div_counter_6_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n31_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(6)
           );
      \rs_inst/clk_div_counter_5_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n32_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(5)
           );
      \rs_inst/clk_div_counter_4_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n33_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(4)
           );
      \rs_inst/clk_div_counter_3_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n34_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(3)
           );
      \rs_inst/clk_div_counter_2_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n35_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(2)
           );
      \rs_inst/clk_div_counter_1_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n36_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(1)
           );
      \rs_inst/clk_div_counter_0_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n37_6\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(0)
           );
      \rs_inst/encoder_data_buffer[7]_23_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(22),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(23)
           );
      \rs_inst/encoder_data_buffer[7]_22_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(21),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(22)
           );
      \rs_inst/encoder_data_buffer[7]_21_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(20),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(21)
           );
      \rs_inst/encoder_data_buffer[7]_20_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(19),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(20)
           );
      \rs_inst/encoder_data_buffer[7]_19_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(18),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(19)
           );
      \rs_inst/encoder_data_buffer[7]_18_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(17),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(18)
           );
      \rs_inst/encoder_data_buffer[7]_17_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(16),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(17)
           );
      \rs_inst/encoder_data_buffer[7]_16_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(15),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(16)
           );
      \rs_inst/encoder_data_buffer[7]_15_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(14),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(15)
           );
      \rs_inst/encoder_data_buffer[7]_14_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(13),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(14)
           );
      \rs_inst/encoder_data_buffer[7]_13_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(12),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(13)
           );
      \rs_inst/encoder_data_buffer[7]_12_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(11),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(12)
           );
      \rs_inst/encoder_data_buffer[7]_11_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(10),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(11)
           );
      \rs_inst/encoder_data_buffer[7]_10_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(9),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(10)
           );
      \rs_inst/encoder_data_buffer[7]_9_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(8),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(9)
           );
      \rs_inst/encoder_data_buffer[7]_8_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(7),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(8)
           );
      \rs_inst/encoder_data_buffer[7]_7_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(6),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(7)
           );
      \rs_inst/encoder_data_buffer[7]_6_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(5),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(6)
           );
      \rs_inst/encoder_data_buffer[7]_5_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(4),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(5)
           );
      \rs_inst/encoder_data_buffer[7]_4_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(3),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(4)
           );
      \rs_inst/encoder_data_buffer[7]_3_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(2),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(3)
           );
      \rs_inst/encoder_data_buffer[7]_2_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(1),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(2)
           );
      \rs_inst/encoder_data_buffer[7]_1_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(0),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(1)
           );
      \rs_inst/encoder_data_buffer[7]_0_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in_buff(7),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[7]\(0)
           );
      \rs_inst/encoder_data_buffer[6]_23_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(22),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(23)
           );
      \rs_inst/encoder_data_buffer[6]_22_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(21),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(22)
           );
      \rs_inst/encoder_data_buffer[6]_21_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(20),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(21)
           );
      \rs_inst/encoder_data_buffer[6]_20_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(19),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(20)
           );
      \rs_inst/encoder_data_buffer[6]_19_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(18),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(19)
           );
      \rs_inst/encoder_data_buffer[6]_18_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(17),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(18)
           );
      \rs_inst/encoder_data_buffer[6]_17_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(16),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(17)
           );
      \rs_inst/encoder_data_buffer[6]_16_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(15),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(16)
           );
      \rs_inst/encoder_data_buffer[6]_15_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(14),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(15)
           );
      \rs_inst/encoder_data_buffer[6]_14_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(13),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(14)
           );
      \rs_inst/encoder_data_buffer[6]_13_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(12),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(13)
           );
      \rs_inst/encoder_data_buffer[6]_12_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(11),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(12)
           );
      \rs_inst/encoder_data_buffer[6]_11_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(10),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(11)
           );
      \rs_inst/encoder_data_buffer[6]_10_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(9),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(10)
           );
      \rs_inst/encoder_data_buffer[6]_9_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(8),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(9)
           );
      \rs_inst/encoder_data_buffer[6]_8_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(7),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(8)
           );
      \rs_inst/encoder_data_buffer[6]_7_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(6),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(7)
           );
      \rs_inst/encoder_data_buffer[6]_6_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(5),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(6)
           );
      \rs_inst/encoder_data_buffer[6]_5_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(4),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(5)
           );
      \rs_inst/encoder_data_buffer[6]_4_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(3),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(4)
           );
      \rs_inst/encoder_data_buffer[6]_3_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(2),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(3)
           );
      \rs_inst/encoder_data_buffer[6]_2_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(1),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(2)
           );
      \rs_inst/encoder_data_buffer[6]_1_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(0),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(1)
           );
      \rs_inst/encoder_data_buffer[6]_0_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in_buff(6),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[6]\(0)
           );
      \rs_inst/encoder_data_buffer[5]_23_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(22),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(23)
           );
      \rs_inst/encoder_data_buffer[5]_22_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(21),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(22)
           );
      \rs_inst/encoder_data_buffer[5]_21_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(20),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(21)
           );
      \rs_inst/encoder_data_buffer[5]_20_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(19),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(20)
           );
      \rs_inst/encoder_data_buffer[5]_19_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(18),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(19)
           );
      \rs_inst/encoder_data_buffer[5]_18_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(17),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(18)
           );
      \rs_inst/encoder_data_buffer[5]_17_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(16),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(17)
           );
      \rs_inst/encoder_data_buffer[5]_16_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(15),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(16)
           );
      \rs_inst/encoder_data_buffer[5]_15_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(14),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(15)
           );
      \rs_inst/encoder_data_buffer[5]_14_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(13),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(14)
           );
      \rs_inst/encoder_data_buffer[5]_13_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(12),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(13)
           );
      \rs_inst/encoder_data_buffer[5]_12_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(11),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(12)
           );
      \rs_inst/encoder_data_buffer[5]_11_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(10),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(11)
           );
      \rs_inst/encoder_data_buffer[5]_10_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(9),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(10)
           );
      \rs_inst/encoder_data_buffer[5]_9_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(8),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(9)
           );
      \rs_inst/encoder_data_buffer[5]_8_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(7),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(8)
           );
      \rs_inst/encoder_data_buffer[5]_7_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(6),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(7)
           );
      \rs_inst/encoder_data_buffer[5]_6_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(5),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(6)
           );
      \rs_inst/encoder_data_buffer[5]_5_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(4),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(5)
           );
      \rs_inst/encoder_data_buffer[5]_4_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(3),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(4)
           );
      \rs_inst/encoder_data_buffer[5]_3_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(2),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(3)
           );
      \rs_inst/encoder_data_buffer[5]_2_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(1),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(2)
           );
      \rs_inst/encoder_data_buffer[5]_1_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(0),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(1)
           );
      \rs_inst/encoder_data_buffer[5]_0_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in_buff(5),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[5]\(0)
           );
      \rs_inst/encoder_data_buffer[4]_23_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(22),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(23)
           );
      \rs_inst/encoder_data_buffer[4]_22_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(21),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(22)
           );
      \rs_inst/encoder_data_buffer[4]_21_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(20),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(21)
           );
      \rs_inst/encoder_data_buffer[4]_20_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(19),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(20)
           );
      \rs_inst/encoder_data_buffer[4]_19_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(18),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(19)
           );
      \rs_inst/encoder_data_buffer[4]_18_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(17),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(18)
           );
      \rs_inst/encoder_data_buffer[4]_17_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(16),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(17)
           );
      \rs_inst/encoder_data_buffer[4]_16_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(15),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(16)
           );
      \rs_inst/encoder_data_buffer[4]_15_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(14),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(15)
           );
      \rs_inst/encoder_data_buffer[4]_14_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(13),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(14)
           );
      \rs_inst/encoder_data_buffer[4]_13_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(12),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(13)
           );
      \rs_inst/encoder_data_buffer[4]_12_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(11),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(12)
           );
      \rs_inst/encoder_data_buffer[4]_11_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(10),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(11)
           );
      \rs_inst/encoder_data_buffer[4]_10_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(9),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(10)
           );
      \rs_inst/encoder_data_buffer[4]_9_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(8),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(9)
           );
      \rs_inst/encoder_data_buffer[4]_8_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(7),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(8)
           );
      \rs_inst/encoder_data_buffer[4]_7_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(6),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(7)
           );
      \rs_inst/encoder_data_buffer[4]_6_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(5),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(6)
           );
      \rs_inst/encoder_data_buffer[4]_5_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(4),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(5)
           );
      \rs_inst/encoder_data_buffer[4]_4_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(3),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(4)
           );
      \rs_inst/encoder_data_buffer[4]_3_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(2),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(3)
           );
      \rs_inst/encoder_data_buffer[4]_2_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(1),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(2)
           );
      \rs_inst/encoder_data_buffer[4]_1_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(0),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(1)
           );
      \rs_inst/encoder_data_buffer[4]_0_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in_buff(4),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[4]\(0)
           );
      \rs_inst/encoder_data_buffer[3]_23_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(22),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(23)
           );
      \rs_inst/encoder_data_buffer[3]_22_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(21),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(22)
           );
      \rs_inst/encoder_data_buffer[3]_21_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(20),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(21)
           );
      \rs_inst/encoder_data_buffer[3]_20_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(19),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(20)
           );
      \rs_inst/encoder_data_buffer[3]_19_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(18),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(19)
           );
      \rs_inst/encoder_data_buffer[3]_18_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(17),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(18)
           );
      \rs_inst/encoder_data_buffer[3]_17_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(16),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(17)
           );
      \rs_inst/encoder_data_buffer[3]_16_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(15),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(16)
           );
      \rs_inst/encoder_data_buffer[3]_15_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(14),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(15)
           );
      \rs_inst/encoder_data_buffer[3]_14_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(13),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(14)
           );
      \rs_inst/encoder_data_buffer[3]_13_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(12),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(13)
           );
      \rs_inst/encoder_data_buffer[3]_12_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(11),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(12)
           );
      \rs_inst/encoder_data_buffer[3]_11_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(10),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(11)
           );
      \rs_inst/encoder_data_buffer[3]_10_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(9),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(10)
           );
      \rs_inst/encoder_data_buffer[3]_9_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(8),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(9)
           );
      \rs_inst/encoder_data_buffer[3]_8_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(7),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(8)
           );
      \rs_inst/encoder_data_buffer[3]_7_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(6),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(7)
           );
      \rs_inst/encoder_data_buffer[3]_6_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(5),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(6)
           );
      \rs_inst/encoder_data_buffer[3]_5_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(4),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(5)
           );
      \rs_inst/encoder_data_buffer[3]_4_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(3),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(4)
           );
      \rs_inst/encoder_data_buffer[3]_3_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(2),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(3)
           );
      \rs_inst/encoder_data_buffer[3]_2_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(1),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(2)
           );
      \rs_inst/encoder_data_buffer[3]_1_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(0),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(1)
           );
      \rs_inst/encoder_data_buffer[3]_0_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in_buff(3),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[3]\(0)
           );
      \rs_inst/encoder_data_buffer[2]_23_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(22),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(23)
           );
      \rs_inst/encoder_data_buffer[2]_22_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(21),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(22)
           );
      \rs_inst/encoder_data_buffer[2]_21_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(20),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(21)
           );
      \rs_inst/encoder_data_buffer[2]_20_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(19),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(20)
           );
      \rs_inst/encoder_data_buffer[2]_19_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(18),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(19)
           );
      \rs_inst/encoder_data_buffer[2]_18_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(17),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(18)
           );
      \rs_inst/encoder_data_buffer[2]_17_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(16),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(17)
           );
      \rs_inst/encoder_data_buffer[2]_16_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(15),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(16)
           );
      \rs_inst/encoder_data_buffer[2]_15_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(14),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(15)
           );
      \rs_inst/encoder_data_buffer[2]_14_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(13),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(14)
           );
      \rs_inst/encoder_data_buffer[2]_13_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(12),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(13)
           );
      \rs_inst/encoder_data_buffer[2]_12_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(11),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(12)
           );
      \rs_inst/encoder_data_buffer[2]_11_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(10),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(11)
           );
      \rs_inst/encoder_data_buffer[2]_10_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(9),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(10)
           );
      \rs_inst/encoder_data_buffer[2]_9_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(8),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(9)
           );
      \rs_inst/encoder_data_buffer[2]_8_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(7),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(8)
           );
      \rs_inst/encoder_data_buffer[2]_7_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(6),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(7)
           );
      \rs_inst/encoder_data_buffer[2]_6_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(5),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(6)
           );
      \rs_inst/encoder_data_buffer[2]_5_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(4),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(5)
           );
      \rs_inst/encoder_data_buffer[2]_4_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(3),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(4)
           );
      \rs_inst/encoder_data_buffer[2]_3_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(2),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(3)
           );
      \rs_inst/encoder_data_buffer[2]_2_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(1),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(2)
           );
      \rs_inst/encoder_data_buffer[2]_1_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(0),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(1)
           );
      \rs_inst/encoder_data_buffer[2]_0_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in_buff(2),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[2]\(0)
           );
      \rs_inst/encoder_data_buffer[1]_23_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(22),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(23)
           );
      \rs_inst/encoder_data_buffer[1]_22_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(21),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(22)
           );
      \rs_inst/encoder_data_buffer[1]_21_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(20),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(21)
           );
      \rs_inst/encoder_data_buffer[1]_20_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(19),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(20)
           );
      \rs_inst/encoder_data_buffer[1]_19_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(18),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(19)
           );
      \rs_inst/encoder_data_buffer[1]_18_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(17),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(18)
           );
      \rs_inst/encoder_data_buffer[1]_17_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(16),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(17)
           );
      \rs_inst/encoder_data_buffer[1]_16_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(15),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(16)
           );
      \rs_inst/encoder_data_buffer[1]_15_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(14),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(15)
           );
      \rs_inst/encoder_data_buffer[1]_14_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(13),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(14)
           );
      \rs_inst/encoder_data_buffer[1]_13_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(12),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(13)
           );
      \rs_inst/encoder_data_buffer[1]_12_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(11),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(12)
           );
      \rs_inst/encoder_data_buffer[1]_11_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(10),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(11)
           );
      \rs_inst/encoder_data_buffer[1]_10_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(9),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(10)
           );
      \rs_inst/encoder_data_buffer[1]_9_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(8),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(9)
           );
      \rs_inst/encoder_data_buffer[1]_8_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(7),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(8)
           );
      \rs_inst/encoder_data_buffer[1]_7_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(6),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(7)
           );
      \rs_inst/encoder_data_buffer[1]_6_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(5),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(6)
           );
      \rs_inst/encoder_data_buffer[1]_5_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(4),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(5)
           );
      \rs_inst/encoder_data_buffer[1]_4_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(3),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(4)
           );
      \rs_inst/encoder_data_buffer[1]_3_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(2),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(3)
           );
      \rs_inst/encoder_data_buffer[1]_2_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(1),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(2)
           );
      \rs_inst/encoder_data_buffer[1]_1_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(0),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(1)
           );
      \rs_inst/encoder_data_buffer[1]_0_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in_buff(1),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[1]\(0)
           );
      \rs_inst/encoder_data_buffer[0]_23_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(22),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(23)
           );
      \rs_inst/encoder_data_buffer[0]_22_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(21),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(22)
           );
      \rs_inst/encoder_data_buffer[0]_21_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(20),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(21)
           );
      \rs_inst/encoder_data_buffer[0]_20_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(19),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(20)
           );
      \rs_inst/encoder_data_buffer[0]_19_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(18),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(19)
           );
      \rs_inst/encoder_data_buffer[0]_18_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(17),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(18)
           );
      \rs_inst/encoder_data_buffer[0]_17_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(16),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(17)
           );
      \rs_inst/encoder_data_buffer[0]_16_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(15),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(16)
           );
      \rs_inst/encoder_data_buffer[0]_15_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(14),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(15)
           );
      \rs_inst/encoder_data_buffer[0]_14_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(13),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(14)
           );
      \rs_inst/encoder_data_buffer[0]_13_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(12),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(13)
           );
      \rs_inst/encoder_data_buffer[0]_12_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(11),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(12)
           );
      \rs_inst/encoder_data_buffer[0]_11_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(10),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(11)
           );
      \rs_inst/encoder_data_buffer[0]_10_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(9),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(10)
           );
      \rs_inst/encoder_data_buffer[0]_9_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(8),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(9)
           );
      \rs_inst/encoder_data_buffer[0]_8_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(7),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(8)
           );
      \rs_inst/encoder_data_buffer[0]_7_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(6),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(7)
           );
      \rs_inst/encoder_data_buffer[0]_6_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(5),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(6)
           );
      \rs_inst/encoder_data_buffer[0]_5_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(4),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(5)
           );
      \rs_inst/encoder_data_buffer[0]_4_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(3),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(4)
           );
      \rs_inst/encoder_data_buffer[0]_3_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(2),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(3)
           );
      \rs_inst/encoder_data_buffer[0]_2_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(1),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(2)
           );
      \rs_inst/encoder_data_buffer[0]_1_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(0),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(1)
           );
      \rs_inst/encoder_data_buffer[0]_0_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => encoder_data_in_buff(0),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n2922_3\,
               Q => \rs_inst/encoder_data_buffer[0]\(0)
           );
      \rs_inst/BUFF_247_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[0]\(23),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(247)
           );
      \rs_inst/BUFF_246_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n760_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(246)
           );
      \rs_inst/BUFF_245_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n761_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(245)
           );
      \rs_inst/BUFF_244_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n762_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(244)
           );
      \rs_inst/BUFF_243_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n763_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(243)
           );
      \rs_inst/BUFF_242_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n764_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(242)
           );
      \rs_inst/BUFF_241_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n765_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(241)
           );
      \rs_inst/BUFF_240_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n766_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(240)
           );
      \rs_inst/BUFF_239_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n767_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(239)
           );
      \rs_inst/BUFF_238_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n768_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(238)
           );
      \rs_inst/BUFF_237_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n769_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(237)
           );
      \rs_inst/BUFF_236_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n770_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(236)
           );
      \rs_inst/BUFF_235_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n771_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(235)
           );
      \rs_inst/BUFF_234_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n772_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(234)
           );
      \rs_inst/BUFF_233_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n773_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(233)
           );
      \rs_inst/BUFF_232_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n774_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(232)
           );
      \rs_inst/BUFF_231_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n775_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(231)
           );
      \rs_inst/BUFF_230_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n776_6\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(230)
           );
      \rs_inst/BUFF_229_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n777_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(229)
           );
      \rs_inst/BUFF_228_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n778_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(228)
           );
      \rs_inst/BUFF_227_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n779_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(227)
           );
      \rs_inst/BUFF_226_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n780_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(226)
           );
      \rs_inst/BUFF_225_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n781_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(225)
           );
      \rs_inst/BUFF_224_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n782_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(224)
           );
      \rs_inst/BUFF_215_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(23),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(215)
           );
      \rs_inst/BUFF_214_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(22),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(214)
           );
      \rs_inst/BUFF_213_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(21),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(213)
           );
      \rs_inst/BUFF_212_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(20),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(212)
           );
      \rs_inst/BUFF_211_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(19),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(211)
           );
      \rs_inst/BUFF_210_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(18),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(210)
           );
      \rs_inst/BUFF_209_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(17),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(209)
           );
      \rs_inst/BUFF_208_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(16),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(208)
           );
      \rs_inst/BUFF_207_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(15),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(207)
           );
      \rs_inst/BUFF_206_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(14),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(206)
           );
      \rs_inst/BUFF_205_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(13),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(205)
           );
      \rs_inst/BUFF_204_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(12),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(204)
           );
      \rs_inst/BUFF_203_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(11),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(203)
           );
      \rs_inst/BUFF_202_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(10),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(202)
           );
      \rs_inst/BUFF_201_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(9),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(201)
           );
      \rs_inst/BUFF_200_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(8),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(200)
           );
      \rs_inst/BUFF_199_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(7),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(199)
           );
      \rs_inst/BUFF_198_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(6),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(198)
           );
      \rs_inst/BUFF_197_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(5),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(197)
           );
      \rs_inst/BUFF_196_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(4),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(196)
           );
      \rs_inst/BUFF_195_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(3),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(195)
           );
      \rs_inst/BUFF_194_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(2),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(194)
           );
      \rs_inst/BUFF_193_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(1),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(193)
           );
      \rs_inst/BUFF_192_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[1]\(0),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(192)
           );
      \rs_inst/BUFF_183_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[2]\(23),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(183)
           );
      \rs_inst/BUFF_182_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n783_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(182)
           );
      \rs_inst/BUFF_181_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n784_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(181)
           );
      \rs_inst/BUFF_180_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n785_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(180)
           );
      \rs_inst/BUFF_179_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n786_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(179)
           );
      \rs_inst/BUFF_178_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n787_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(178)
           );
      \rs_inst/BUFF_177_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n788_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(177)
           );
      \rs_inst/BUFF_176_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n789_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(176)
           );
      \rs_inst/BUFF_175_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n790_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(175)
           );
      \rs_inst/BUFF_174_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n791_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(174)
           );
      \rs_inst/BUFF_173_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n792_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(173)
           );
      \rs_inst/BUFF_172_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n793_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(172)
           );
      \rs_inst/BUFF_171_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n794_6\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(171)
           );
      \rs_inst/BUFF_170_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n795_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(170)
           );
      \rs_inst/BUFF_169_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n796_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(169)
           );
      \rs_inst/BUFF_168_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n797_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(168)
           );
      \rs_inst/BUFF_167_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n798_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(167)
           );
      \rs_inst/BUFF_166_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n799_6\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(166)
           );
      \rs_inst/BUFF_165_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n800_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(165)
           );
      \rs_inst/BUFF_164_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n801_6\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(164)
           );
      \rs_inst/BUFF_163_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n802_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(163)
           );
      \rs_inst/BUFF_162_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n803_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(162)
           );
      \rs_inst/BUFF_161_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n804_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(161)
           );
      \rs_inst/BUFF_160_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n805_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(160)
           );
      \rs_inst/BUFF_151_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(23),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(151)
           );
      \rs_inst/BUFF_150_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(22),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(150)
           );
      \rs_inst/BUFF_149_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(21),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(149)
           );
      \rs_inst/BUFF_148_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(20),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(148)
           );
      \rs_inst/BUFF_147_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(19),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(147)
           );
      \rs_inst/BUFF_146_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(18),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(146)
           );
      \rs_inst/BUFF_145_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(17),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(145)
           );
      \rs_inst/BUFF_144_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(16),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(144)
           );
      \rs_inst/BUFF_143_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(15),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(143)
           );
      \rs_inst/BUFF_142_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(14),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(142)
           );
      \rs_inst/BUFF_141_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(13),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(141)
           );
      \rs_inst/BUFF_140_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(12),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(140)
           );
      \rs_inst/BUFF_139_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(11),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(139)
           );
      \rs_inst/BUFF_138_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(10),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(138)
           );
      \rs_inst/BUFF_137_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(9),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(137)
           );
      \rs_inst/BUFF_136_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(8),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(136)
           );
      \rs_inst/BUFF_135_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(7),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(135)
           );
      \rs_inst/BUFF_134_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(6),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(134)
           );
      \rs_inst/BUFF_133_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(5),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(133)
           );
      \rs_inst/BUFF_132_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(4),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(132)
           );
      \rs_inst/BUFF_131_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(3),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(131)
           );
      \rs_inst/BUFF_130_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(2),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(130)
           );
      \rs_inst/BUFF_129_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(1),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(129)
           );
      \rs_inst/BUFF_128_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[3]\(0),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(128)
           );
      \rs_inst/BUFF_119_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[4]\(23),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(119)
           );
      \rs_inst/BUFF_118_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n806_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(118)
           );
      \rs_inst/BUFF_117_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n807_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(117)
           );
      \rs_inst/BUFF_116_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n808_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(116)
           );
      \rs_inst/BUFF_115_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n809_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(115)
           );
      \rs_inst/BUFF_114_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n810_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(114)
           );
      \rs_inst/BUFF_113_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n811_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(113)
           );
      \rs_inst/BUFF_112_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n812_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(112)
           );
      \rs_inst/BUFF_111_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n813_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(111)
           );
      \rs_inst/BUFF_110_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n814_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(110)
           );
      \rs_inst/BUFF_109_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n815_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(109)
           );
      \rs_inst/BUFF_108_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n816_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(108)
           );
      \rs_inst/BUFF_107_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n817_6\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(107)
           );
      \rs_inst/BUFF_106_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n818_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(106)
           );
      \rs_inst/BUFF_105_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n819_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(105)
           );
      \rs_inst/BUFF_104_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n820_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(104)
           );
      \rs_inst/BUFF_103_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n821_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(103)
           );
      \rs_inst/BUFF_102_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n822_6\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(102)
           );
      \rs_inst/BUFF_101_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n823_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(101)
           );
      \rs_inst/BUFF_100_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n824_6\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(100)
           );
      \rs_inst/BUFF_99_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n825_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(99)
           );
      \rs_inst/BUFF_98_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n826_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(98)
           );
      \rs_inst/BUFF_97_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n827_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(97)
           );
      \rs_inst/BUFF_96_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n828_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(96)
           );
      \rs_inst/BUFF_87_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(23),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(87)
           );
      \rs_inst/BUFF_86_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(22),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(86)
           );
      \rs_inst/BUFF_85_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(21),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(85)
           );
      \rs_inst/BUFF_84_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(20),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(84)
           );
      \rs_inst/BUFF_83_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(19),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(83)
           );
      \rs_inst/BUFF_82_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(18),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(82)
           );
      \rs_inst/BUFF_81_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(17),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(81)
           );
      \rs_inst/BUFF_80_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(16),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(80)
           );
      \rs_inst/BUFF_79_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(15),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(79)
           );
      \rs_inst/BUFF_78_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(14),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(78)
           );
      \rs_inst/BUFF_77_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(13),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(77)
           );
      \rs_inst/BUFF_76_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(12),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(76)
           );
      \rs_inst/BUFF_75_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(11),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(75)
           );
      \rs_inst/BUFF_74_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(10),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(74)
           );
      \rs_inst/BUFF_73_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(9),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(73)
           );
      \rs_inst/BUFF_72_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(8),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(72)
           );
      \rs_inst/BUFF_71_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(7),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(71)
           );
      \rs_inst/BUFF_70_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(6),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(70)
           );
      \rs_inst/BUFF_69_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(5),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(69)
           );
      \rs_inst/BUFF_68_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(4),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(68)
           );
      \rs_inst/BUFF_67_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(3),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(67)
           );
      \rs_inst/BUFF_66_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(2),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(66)
           );
      \rs_inst/BUFF_65_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(1),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(65)
           );
      \rs_inst/BUFF_64_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[5]\(0),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(64)
           );
      \rs_inst/BUFF_55_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[6]\(23),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(55)
           );
      \rs_inst/BUFF_54_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n829_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(54)
           );
      \rs_inst/BUFF_53_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n830_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(53)
           );
      \rs_inst/BUFF_52_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n831_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(52)
           );
      \rs_inst/BUFF_51_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n832_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(51)
           );
      \rs_inst/BUFF_50_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n833_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(50)
           );
      \rs_inst/BUFF_49_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n834_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(49)
           );
      \rs_inst/BUFF_48_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n835_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(48)
           );
      \rs_inst/BUFF_47_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n836_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(47)
           );
      \rs_inst/BUFF_46_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n837_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(46)
           );
      \rs_inst/BUFF_45_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n838_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(45)
           );
      \rs_inst/BUFF_44_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n839_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(44)
           );
      \rs_inst/BUFF_43_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n840_6\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(43)
           );
      \rs_inst/BUFF_42_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n841_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(42)
           );
      \rs_inst/BUFF_41_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n842_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(41)
           );
      \rs_inst/BUFF_40_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n843_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(40)
           );
      \rs_inst/BUFF_39_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n844_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(39)
           );
      \rs_inst/BUFF_38_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n845_6\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(38)
           );
      \rs_inst/BUFF_37_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n846_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(37)
           );
      \rs_inst/BUFF_36_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n847_6\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(36)
           );
      \rs_inst/BUFF_35_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n848_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(35)
           );
      \rs_inst/BUFF_34_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n849_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(34)
           );
      \rs_inst/BUFF_33_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n850_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(33)
           );
      \rs_inst/BUFF_32_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n851_3\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(32)
           );
      \rs_inst/BUFF_23_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(23),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(23)
           );
      \rs_inst/BUFF_22_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(22),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(22)
           );
      \rs_inst/BUFF_21_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(21),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(21)
           );
      \rs_inst/BUFF_20_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(20),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(20)
           );
      \rs_inst/BUFF_19_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(19),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(19)
           );
      \rs_inst/BUFF_18_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(18),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(18)
           );
      \rs_inst/BUFF_17_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(17),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(17)
           );
      \rs_inst/BUFF_16_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(16),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(16)
           );
      \rs_inst/BUFF_15_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(15),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(15)
           );
      \rs_inst/BUFF_14_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(14),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(14)
           );
      \rs_inst/BUFF_13_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(13),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(13)
           );
      \rs_inst/BUFF_12_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(12),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(12)
           );
      \rs_inst/BUFF_11_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(11),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(11)
           );
      \rs_inst/BUFF_10_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(10),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(10)
           );
      \rs_inst/BUFF_9_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(9),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(9)
           );
      \rs_inst/BUFF_8_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(8),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(8)
           );
      \rs_inst/BUFF_7_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(7),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(7)
           );
      \rs_inst/BUFF_6_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(6),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(6)
           );
      \rs_inst/BUFF_5_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(5),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(5)
           );
      \rs_inst/BUFF_4_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(4),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(4)
           );
      \rs_inst/BUFF_3_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(3),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(3)
           );
      \rs_inst/BUFF_2_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(2),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(2)
           );
      \rs_inst/BUFF_1_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(1),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(1)
           );
      \rs_inst/BUFF_0_s0\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/encoder_data_buffer[7]\(0),
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(0)
           );
      \rs_inst/clk_div_counter_31_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n6_1\,
               CLK => clk_d,
               RESET => \rs_inst/n41_16\,
               Q => \rs_inst/clk_div_counter\(31)
           );
      \rs_inst/BUFF_27_s4\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => VCC_0,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n938_4\,
               Q => BUFF_NOCRC(27)
           );
      \rs_inst/RS485_DONE_s1\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n946_14\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n946_10\,
               Q => RS485_DONE_Z
           );
      \rs_inst/period_counter_31_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n998_18\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n948_30\,
               Q => \rs_inst/period_counter\(31)
           );
      \rs_inst/period_counter_5_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1000_18\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n948_30\,
               Q => \rs_inst/period_counter\(5)
           );
      \rs_inst/period_counter_4_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1002_18\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n948_30\,
               Q => \rs_inst/period_counter\(4)
           );
      \rs_inst/period_counter_3_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1004_18\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n948_30\,
               Q => \rs_inst/period_counter\(3)
           );
      \rs_inst/period_counter_2_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1006_18\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n948_30\,
               Q => \rs_inst/period_counter\(2)
           );
      \rs_inst/period_counter_1_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1008_18\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n948_30\,
               Q => \rs_inst/period_counter\(1)
           );
      \rs_inst/period_counter_0_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1010_18\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n948_30\,
               Q => \rs_inst/period_counter\(0)
           );
      \rs_inst/encoder_clk_7_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1012_14\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n1012_12\,
               Q => encoder_clk_buff(7)
           );
      \rs_inst/encoder_clk_6_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1014_12\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n1012_12\,
               Q => encoder_clk_buff(6)
           );
      \rs_inst/encoder_clk_5_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1016_12\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n1012_12\,
               Q => encoder_clk_buff(5)
           );
      \rs_inst/encoder_clk_4_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1018_12\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n1012_12\,
               Q => encoder_clk_buff(4)
           );
      \rs_inst/encoder_clk_3_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1020_12\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n1012_12\,
               Q => encoder_clk_buff(3)
           );
      \rs_inst/encoder_clk_2_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1022_12\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n1012_12\,
               Q => encoder_clk_buff(2)
           );
      \rs_inst/encoder_clk_1_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1024_12\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n1012_12\,
               Q => encoder_clk_buff(1)
           );
      \rs_inst/encoder_clk_0_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1026_12\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n1012_12\,
               Q => encoder_clk_buff(0)
           );
      \rs_inst/state_2_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1030_19\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n1027_23\,
               Q => \rs_inst/state\(2)
           );
      \rs_inst/state_0_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1032_19\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/n1027_23\,
               Q => \rs_inst/state\(0)
           );
      \rs_inst/enc_read_frame_counter_31_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n466_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(31)
           );
      \rs_inst/enc_read_frame_counter_30_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n467_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(30)
           );
      \rs_inst/enc_read_frame_counter_29_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n468_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(29)
           );
      \rs_inst/enc_read_frame_counter_28_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n469_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(28)
           );
      \rs_inst/enc_read_frame_counter_27_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n470_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(27)
           );
      \rs_inst/enc_read_frame_counter_26_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n471_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(26)
           );
      \rs_inst/enc_read_frame_counter_25_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n472_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(25)
           );
      \rs_inst/enc_read_frame_counter_24_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n473_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(24)
           );
      \rs_inst/enc_read_frame_counter_23_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n474_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(23)
           );
      \rs_inst/enc_read_frame_counter_22_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n475_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(22)
           );
      \rs_inst/enc_read_frame_counter_21_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n476_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(21)
           );
      \rs_inst/enc_read_frame_counter_20_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n477_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(20)
           );
      \rs_inst/enc_read_frame_counter_19_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n478_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(19)
           );
      \rs_inst/enc_read_frame_counter_18_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n479_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(18)
           );
      \rs_inst/enc_read_frame_counter_17_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n480_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(17)
           );
      \rs_inst/enc_read_frame_counter_16_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n481_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(16)
           );
      \rs_inst/enc_read_frame_counter_15_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n482_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(15)
           );
      \rs_inst/enc_read_frame_counter_14_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n483_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(14)
           );
      \rs_inst/enc_read_frame_counter_13_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n484_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(13)
           );
      \rs_inst/enc_read_frame_counter_12_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n485_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(12)
           );
      \rs_inst/enc_read_frame_counter_11_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n486_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(11)
           );
      \rs_inst/enc_read_frame_counter_10_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n487_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(10)
           );
      \rs_inst/enc_read_frame_counter_9_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n488_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(9)
           );
      \rs_inst/enc_read_frame_counter_8_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n489_8\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(8)
           );
      \rs_inst/enc_read_frame_counter_7_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n490_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(7)
           );
      \rs_inst/enc_read_frame_counter_6_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n491_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(6)
           );
      \rs_inst/enc_read_frame_counter_5_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n492_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(5)
           );
      \rs_inst/enc_read_frame_counter_4_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n493_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(4)
           );
      \rs_inst/enc_read_frame_counter_3_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n494_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(3)
           );
      \rs_inst/enc_read_frame_counter_2_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n495_8\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(2)
           );
      \rs_inst/enc_read_frame_counter_1_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n496_5\,
               CLK => \rs_inst/slow_clk\,
               CE => \rs_inst/enc_read_frame_counter_31_11\,
               Q => \rs_inst/enc_read_frame_counter\(1)
           );
      \rs_inst/slow_clk_s2\ : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n43_12\,
               CLK => clk_d,
               Q => \rs_inst/slow_clk\
           );
      \rs_inst/state_1_s5\ : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n1031_24\,
               CLK => \rs_inst/slow_clk\,
               Q => \rs_inst/state\(1)
           );
      \rs_inst/enc_read_frame_counter_0_s4\ : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => \rs_inst/n497_9\,
               CLK => \rs_inst/slow_clk\,
               Q => \rs_inst/enc_read_frame_counter\(0)
           );
      \rs_inst/n36_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => \rs_inst/clk_div_counter\(1),
               I1 => \rs_inst/clk_div_counter\(0),
               I3 => GND_0,
               CIN => GND_0,
               COUT => \rs_inst/n36_2\,
               SUM => \rs_inst/n36_1\
           );
      \rs_inst/n35_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(2),
               I3 => GND_0,
               CIN => \rs_inst/n36_2\,
               COUT => \rs_inst/n35_2\,
               SUM => \rs_inst/n35_1\
           );
      \rs_inst/n34_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(3),
               I3 => GND_0,
               CIN => \rs_inst/n35_2\,
               COUT => \rs_inst/n34_2\,
               SUM => \rs_inst/n34_1\
           );
      \rs_inst/n33_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(4),
               I3 => GND_0,
               CIN => \rs_inst/n34_2\,
               COUT => \rs_inst/n33_2\,
               SUM => \rs_inst/n33_1\
           );
      \rs_inst/n32_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(5),
               I3 => GND_0,
               CIN => \rs_inst/n33_2\,
               COUT => \rs_inst/n32_2\,
               SUM => \rs_inst/n32_1\
           );
      \rs_inst/n31_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(6),
               I3 => GND_0,
               CIN => \rs_inst/n32_2\,
               COUT => \rs_inst/n31_2\,
               SUM => \rs_inst/n31_1\
           );
      \rs_inst/n30_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(7),
               I3 => GND_0,
               CIN => \rs_inst/n31_2\,
               COUT => \rs_inst/n30_2\,
               SUM => \rs_inst/n30_1\
           );
      \rs_inst/n29_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(8),
               I3 => GND_0,
               CIN => \rs_inst/n30_2\,
               COUT => \rs_inst/n29_2\,
               SUM => \rs_inst/n29_1\
           );
      \rs_inst/n28_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(9),
               I3 => GND_0,
               CIN => \rs_inst/n29_2\,
               COUT => \rs_inst/n28_2\,
               SUM => \rs_inst/n28_1\
           );
      \rs_inst/n27_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(10),
               I3 => GND_0,
               CIN => \rs_inst/n28_2\,
               COUT => \rs_inst/n27_2\,
               SUM => \rs_inst/n27_1\
           );
      \rs_inst/n26_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(11),
               I3 => GND_0,
               CIN => \rs_inst/n27_2\,
               COUT => \rs_inst/n26_2\,
               SUM => \rs_inst/n26_1\
           );
      \rs_inst/n25_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(12),
               I3 => GND_0,
               CIN => \rs_inst/n26_2\,
               COUT => \rs_inst/n25_2\,
               SUM => \rs_inst/n25_1\
           );
      \rs_inst/n24_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(13),
               I3 => GND_0,
               CIN => \rs_inst/n25_2\,
               COUT => \rs_inst/n24_2\,
               SUM => \rs_inst/n24_1\
           );
      \rs_inst/n23_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(14),
               I3 => GND_0,
               CIN => \rs_inst/n24_2\,
               COUT => \rs_inst/n23_2\,
               SUM => \rs_inst/n23_1\
           );
      \rs_inst/n22_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(15),
               I3 => GND_0,
               CIN => \rs_inst/n23_2\,
               COUT => \rs_inst/n22_2\,
               SUM => \rs_inst/n22_1\
           );
      \rs_inst/n21_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(16),
               I3 => GND_0,
               CIN => \rs_inst/n22_2\,
               COUT => \rs_inst/n21_2\,
               SUM => \rs_inst/n21_1\
           );
      \rs_inst/n20_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(17),
               I3 => GND_0,
               CIN => \rs_inst/n21_2\,
               COUT => \rs_inst/n20_2\,
               SUM => \rs_inst/n20_1\
           );
      \rs_inst/n19_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(18),
               I3 => GND_0,
               CIN => \rs_inst/n20_2\,
               COUT => \rs_inst/n19_2\,
               SUM => \rs_inst/n19_1\
           );
      \rs_inst/n18_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(19),
               I3 => GND_0,
               CIN => \rs_inst/n19_2\,
               COUT => \rs_inst/n18_2\,
               SUM => \rs_inst/n18_1\
           );
      \rs_inst/n17_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(20),
               I3 => GND_0,
               CIN => \rs_inst/n18_2\,
               COUT => \rs_inst/n17_2\,
               SUM => \rs_inst/n17_1\
           );
      \rs_inst/n16_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(21),
               I3 => GND_0,
               CIN => \rs_inst/n17_2\,
               COUT => \rs_inst/n16_2\,
               SUM => \rs_inst/n16_1\
           );
      \rs_inst/n15_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(22),
               I3 => GND_0,
               CIN => \rs_inst/n16_2\,
               COUT => \rs_inst/n15_2\,
               SUM => \rs_inst/n15_1\
           );
      \rs_inst/n14_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(23),
               I3 => GND_0,
               CIN => \rs_inst/n15_2\,
               COUT => \rs_inst/n14_2\,
               SUM => \rs_inst/n14_1\
           );
      \rs_inst/n13_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(24),
               I3 => GND_0,
               CIN => \rs_inst/n14_2\,
               COUT => \rs_inst/n13_2\,
               SUM => \rs_inst/n13_1\
           );
      \rs_inst/n12_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(25),
               I3 => GND_0,
               CIN => \rs_inst/n13_2\,
               COUT => \rs_inst/n12_2\,
               SUM => \rs_inst/n12_1\
           );
      \rs_inst/n11_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(26),
               I3 => GND_0,
               CIN => \rs_inst/n12_2\,
               COUT => \rs_inst/n11_2\,
               SUM => \rs_inst/n11_1\
           );
      \rs_inst/n10_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(27),
               I3 => GND_0,
               CIN => \rs_inst/n11_2\,
               COUT => \rs_inst/n10_2\,
               SUM => \rs_inst/n10_1\
           );
      \rs_inst/n9_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(28),
               I3 => GND_0,
               CIN => \rs_inst/n10_2\,
               COUT => \rs_inst/n9_2\,
               SUM => \rs_inst/n9_1\
           );
      \rs_inst/n8_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(29),
               I3 => GND_0,
               CIN => \rs_inst/n9_2\,
               COUT => \rs_inst/n8_2\,
               SUM => \rs_inst/n8_1\
           );
      \rs_inst/n7_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(30),
               I3 => GND_0,
               CIN => \rs_inst/n8_2\,
               COUT => \rs_inst/n7_2\,
               SUM => \rs_inst/n7_1\
           );
      \rs_inst/n6_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \rs_inst/clk_div_counter\(31),
               I3 => GND_0,
               CIN => \rs_inst/n7_2\,
               COUT => \rs_inst/n6_0_COUT\,
               SUM => \rs_inst/n6_1\
           );
      \rs_inst/n37_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \rs_inst/clk_div_counter\(0),
               F => \rs_inst/n37_6\
           );
      \scs_inst/n368_s1\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/state\(1),
               I2 => \scs_inst/state\(0),
               F => \scs_inst/n368_4\
           );
      \scs_inst/n370_s1\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/state\(0),
               I2 => \scs_inst/state\(1),
               F => \scs_inst/n370_4\
           );
      \scs_inst/n378_s2\ : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => \scs_inst/state\(1),
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(0),
               F => \scs_inst/n378_5\
           );
      \scs_inst/n381_s6\ : LUT3
           generic map (
               INIT => X"41"
           )
           port map (
               I0 => \scs_inst/state\(1),
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(0),
               F => \scs_inst/n381_10\
           );
      \scs_inst/n545_s12\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/state\(1),
               I1 => \scs_inst/state\(0),
               F => \scs_inst/n545_18\
           );
      \scs_inst/n103_s33\ : LUT3
           generic map (
               INIT => X"7F"
           )
           port map (
               I0 => \scs_inst/n103_38\,
               I1 => \scs_inst/n103_39\,
               I2 => \scs_inst/n103_40\,
               F => \scs_inst/n103_37\
           );
      \scs_inst/n104_s33\ : LUT3
           generic map (
               INIT => X"7F"
           )
           port map (
               I0 => \scs_inst/n104_38\,
               I1 => \scs_inst/n104_39\,
               I2 => \scs_inst/n104_40\,
               F => \scs_inst/n104_37\
           );
      \scs_inst/n105_s33\ : LUT3
           generic map (
               INIT => X"7F"
           )
           port map (
               I0 => \scs_inst/n105_38\,
               I1 => \scs_inst/n105_39\,
               I2 => \scs_inst/n105_40\,
               F => \scs_inst/n105_37\
           );
      \scs_inst/n106_s33\ : LUT3
           generic map (
               INIT => X"7F"
           )
           port map (
               I0 => \scs_inst/n106_38\,
               I1 => \scs_inst/n106_39\,
               I2 => \scs_inst/n106_40\,
               F => \scs_inst/n106_37\
           );
      \scs_inst/n107_s33\ : LUT4
           generic map (
               INIT => X"7FFF"
           )
           port map (
               I0 => \scs_inst/n107_38\,
               I1 => \scs_inst/n107_39\,
               I2 => \scs_inst/n107_40\,
               I3 => \scs_inst/n107_41\,
               F => \scs_inst/n107_37\
           );
      \scs_inst/n108_s33\ : LUT4
           generic map (
               INIT => X"7FFF"
           )
           port map (
               I0 => \scs_inst/n108_38\,
               I1 => \scs_inst/n108_39\,
               I2 => \scs_inst/n108_40\,
               I3 => \scs_inst/n108_41\,
               F => \scs_inst/n108_37\
           );
      \scs_inst/n109_s33\ : LUT4
           generic map (
               INIT => X"7FFF"
           )
           port map (
               I0 => \scs_inst/n109_38\,
               I1 => \scs_inst/n109_39\,
               I2 => \scs_inst/n109_40\,
               I3 => \scs_inst/n109_41\,
               F => \scs_inst/n109_37\
           );
      \scs_inst/n110_s33\ : LUT4
           generic map (
               INIT => X"7FFF"
           )
           port map (
               I0 => \scs_inst/n110_38\,
               I1 => \scs_inst/n110_39\,
               I2 => \scs_inst/n110_40\,
               I3 => \scs_inst/n110_41\,
               F => \scs_inst/n110_37\
           );
      \scs_inst/n613_s9\ : LUT4
           generic map (
               INIT => X"E0FF"
           )
           port map (
               I0 => \scs_inst/n613_14\,
               I1 => \scs_inst/n613_15\,
               I2 => \scs_inst/n613_39\,
               I3 => \scs_inst/n613_37\,
               F => \scs_inst/n613_13\
           );
      \scs_inst/n616_s8\ : LUT4
           generic map (
               INIT => X"FFF2"
           )
           port map (
               I0 => \scs_inst/n616_15\,
               I1 => \scs_inst/n613_15\,
               I2 => \scs_inst/n368_4\,
               I3 => \scs_inst/n370_4\,
               F => \scs_inst/n616_12\
           );
      \scs_inst/n618_s9\ : LUT4
           generic map (
               INIT => X"FFF8"
           )
           port map (
               I0 => \scs_inst/n616_15\,
               I1 => \scs_inst/n613_15\,
               I2 => \scs_inst/n618_14\,
               I3 => \scs_inst/n618_15\,
               F => \scs_inst/n618_13\
           );
      \scs_inst/n595_s8\ : LUT4
           generic map (
               INIT => X"FFD0"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/n595_13\,
               I2 => \scs_inst/n545_18\,
               I3 => \scs_inst/n595_14\,
               F => \scs_inst/n595_12\
           );
      \scs_inst/n445_s6\ : LUT3
           generic map (
               INIT => X"90"
           )
           port map (
               I0 => \scs_inst/byte_count\(0),
               I1 => \scs_inst/n613_14\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n445_10\
           );
      \scs_inst/bit_index_31_s4\ : LUT4
           generic map (
               INIT => X"004F"
           )
           port map (
               I0 => \scs_inst/state\(1),
               I1 => \scs_inst/n613_14\,
               I2 => \scs_inst/state\(2),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/bit_index_31_9\
           );
      \scs_inst/n252_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/bit_index\(1),
               I1 => \scs_inst/bit_index\(0),
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n252_5\
           );
      \scs_inst/n250_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/bit_index\(2),
               I1 => \scs_inst/n251_6\,
               I2 => \scs_inst/bit_index\(3),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n250_5\
           );
      \scs_inst/n249_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/bit_index\(4),
               I1 => \scs_inst/n249_6\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n249_5\
           );
      \scs_inst/n248_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/bit_index\(4),
               I1 => \scs_inst/n249_6\,
               I2 => \scs_inst/bit_index\(5),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n248_5\
           );
      \scs_inst/n247_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n249_6\,
               I1 => \scs_inst/n247_6\,
               I2 => \scs_inst/bit_index\(6),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n247_5\
           );
      \scs_inst/n246_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/bit_index\(7),
               I1 => \scs_inst/n246_8\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n246_5\
           );
      \scs_inst/n244_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/bit_index\(8),
               I1 => \scs_inst/n245_6\,
               I2 => \scs_inst/bit_index\(9),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n244_5\
           );
      \scs_inst/n243_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/bit_index\(10),
               I1 => \scs_inst/n243_8\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n243_5\
           );
      \scs_inst/n242_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/bit_index\(10),
               I1 => \scs_inst/n243_8\,
               I2 => \scs_inst/bit_index\(11),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n242_5\
           );
      \scs_inst/n241_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n243_8\,
               I1 => \scs_inst/n241_6\,
               I2 => \scs_inst/bit_index\(12),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n241_5\
           );
      \scs_inst/n240_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/bit_index\(13),
               I1 => \scs_inst/n240_11\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n240_5\
           );
      \scs_inst/n239_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/bit_index\(13),
               I1 => \scs_inst/n240_11\,
               I2 => \scs_inst/bit_index\(14),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n239_5\
           );
      \scs_inst/n238_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/bit_index\(15),
               I1 => \scs_inst/n238_9\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n238_5\
           );
      \scs_inst/n237_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/bit_index\(15),
               I1 => \scs_inst/n238_9\,
               I2 => \scs_inst/bit_index\(16),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n237_5\
           );
      \scs_inst/n236_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n243_8\,
               I1 => \scs_inst/n236_6\,
               I2 => \scs_inst/bit_index\(17),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n236_5\
           );
      \scs_inst/n235_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/bit_index\(18),
               I1 => \scs_inst/n235_10\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n235_5\
           );
      \scs_inst/n234_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/bit_index\(18),
               I1 => \scs_inst/n235_10\,
               I2 => \scs_inst/bit_index\(19),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n234_5\
           );
      \scs_inst/n233_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/bit_index\(20),
               I1 => \scs_inst/n233_6\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n233_5\
           );
      \scs_inst/n232_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/bit_index\(20),
               I1 => \scs_inst/n233_6\,
               I2 => \scs_inst/bit_index\(21),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n232_5\
           );
      \scs_inst/n231_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n233_6\,
               I1 => \scs_inst/n231_6\,
               I2 => \scs_inst/bit_index\(22),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n231_5\
           );
      \scs_inst/n230_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n240_11\,
               I1 => \scs_inst/n230_8\,
               I2 => \scs_inst/bit_index\(23),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n230_5\
           );
      \scs_inst/n229_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/bit_index\(24),
               I1 => \scs_inst/n229_6\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n229_5\
           );
      \scs_inst/n228_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/bit_index\(24),
               I1 => \scs_inst/n229_6\,
               I2 => \scs_inst/bit_index\(25),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n228_5\
           );
      \scs_inst/n227_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n229_6\,
               I1 => \scs_inst/n227_6\,
               I2 => \scs_inst/bit_index\(26),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n227_5\
           );
      \scs_inst/n226_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n229_6\,
               I1 => \scs_inst/n226_8\,
               I2 => \scs_inst/bit_index\(27),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n226_5\
           );
      \scs_inst/n225_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/bit_index\(28),
               I1 => \scs_inst/n225_6\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n225_5\
           );
      \scs_inst/n224_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/bit_index\(28),
               I1 => \scs_inst/n225_6\,
               I2 => \scs_inst/bit_index\(29),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n224_5\
           );
      \scs_inst/n223_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n225_6\,
               I1 => \scs_inst/n223_6\,
               I2 => \scs_inst/bit_index\(30),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n223_5\
           );
      \scs_inst/n222_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n225_6\,
               I1 => \scs_inst/n222_8\,
               I2 => \scs_inst/bit_index\(31),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n222_5\
           );
      \scs_inst/n316_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/byte_count\(0),
               I1 => \scs_inst/byte_count\(1),
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n316_5\
           );
      \scs_inst/n315_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/byte_count\(0),
               I1 => \scs_inst/byte_count\(1),
               I2 => \scs_inst/byte_count\(2),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n315_5\
           );
      \scs_inst/n314_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/byte_count\(3),
               I1 => \scs_inst/n314_6\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n314_5\
           );
      \scs_inst/n313_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/byte_count\(3),
               I1 => \scs_inst/n314_6\,
               I2 => \scs_inst/byte_count\(4),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n313_5\
           );
      \scs_inst/n312_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/byte_count\(5),
               I1 => \scs_inst/n312_9\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n312_5\
           );
      \scs_inst/n311_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/byte_count\(6),
               I1 => \scs_inst/n311_8\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n311_5\
           );
      \scs_inst/n310_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/byte_count\(6),
               I1 => \scs_inst/n311_8\,
               I2 => \scs_inst/byte_count\(7),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n310_5\
           );
      \scs_inst/n309_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/byte_count\(8),
               I1 => \scs_inst/n309_6\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n309_5\
           );
      \scs_inst/n308_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/byte_count\(8),
               I1 => \scs_inst/n309_6\,
               I2 => \scs_inst/byte_count\(9),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n308_5\
           );
      \scs_inst/n307_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n309_6\,
               I1 => \scs_inst/n307_6\,
               I2 => \scs_inst/byte_count\(10),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n307_5\
           );
      \scs_inst/n306_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/byte_count\(11),
               I1 => \scs_inst/n306_8\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n306_5\
           );
      \scs_inst/n305_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/byte_count\(11),
               I1 => \scs_inst/n306_8\,
               I2 => \scs_inst/byte_count\(12),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n305_5\
           );
      \scs_inst/n304_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/byte_count\(13),
               I1 => \scs_inst/n304_9\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n304_5\
           );
      \scs_inst/n303_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/byte_count\(13),
               I1 => \scs_inst/n304_9\,
               I2 => \scs_inst/byte_count\(14),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n303_5\
           );
      \scs_inst/n302_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/byte_count\(15),
               I1 => \scs_inst/n302_9\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n302_5\
           );
      \scs_inst/n301_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/byte_count\(15),
               I1 => \scs_inst/n302_9\,
               I2 => \scs_inst/byte_count\(16),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n301_5\
           );
      \scs_inst/n300_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n306_8\,
               I1 => \scs_inst/n300_6\,
               I2 => \scs_inst/byte_count\(17),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n300_5\
           );
      \scs_inst/n299_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/byte_count\(18),
               I1 => \scs_inst/n299_10\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n299_5\
           );
      \scs_inst/n298_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/byte_count\(18),
               I1 => \scs_inst/n299_10\,
               I2 => \scs_inst/byte_count\(19),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n298_5\
           );
      \scs_inst/n297_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/byte_count\(20),
               I1 => \scs_inst/n297_6\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n297_5\
           );
      \scs_inst/n296_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/byte_count\(20),
               I1 => \scs_inst/n297_6\,
               I2 => \scs_inst/byte_count\(21),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n296_5\
           );
      \scs_inst/n295_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n297_6\,
               I1 => \scs_inst/n295_6\,
               I2 => \scs_inst/byte_count\(22),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n295_5\
           );
      \scs_inst/n294_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n306_8\,
               I1 => \scs_inst/n294_9\,
               I2 => \scs_inst/byte_count\(23),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n294_5\
           );
      \scs_inst/n293_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/byte_count\(24),
               I1 => \scs_inst/n293_6\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n293_5\
           );
      \scs_inst/n292_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/byte_count\(24),
               I1 => \scs_inst/n293_6\,
               I2 => \scs_inst/byte_count\(25),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n292_5\
           );
      \scs_inst/n291_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n293_6\,
               I1 => \scs_inst/n291_6\,
               I2 => \scs_inst/byte_count\(26),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n291_5\
           );
      \scs_inst/n290_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n293_6\,
               I1 => \scs_inst/n290_8\,
               I2 => \scs_inst/byte_count\(27),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n290_5\
           );
      \scs_inst/n289_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/byte_count\(28),
               I1 => \scs_inst/n289_6\,
               I2 => \scs_inst/n613_39\,
               F => \scs_inst/n289_5\
           );
      \scs_inst/n288_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/byte_count\(28),
               I1 => \scs_inst/n289_6\,
               I2 => \scs_inst/byte_count\(29),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n288_5\
           );
      \scs_inst/n287_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n289_6\,
               I1 => \scs_inst/n287_6\,
               I2 => \scs_inst/byte_count\(30),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n287_5\
           );
      \scs_inst/n286_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \scs_inst/n289_6\,
               I1 => \scs_inst/n286_8\,
               I2 => \scs_inst/byte_count\(31),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n286_5\
           );
      \scs_inst/n589_s12\ : LUT4
           generic map (
               INIT => X"7D00"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/crc_reg\(9),
               I3 => \scs_inst/n545_18\,
               F => \scs_inst/n589_18\
           );
      \scs_inst/n587_s12\ : LUT4
           generic map (
               INIT => X"7D00"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/crc_reg\(10),
               I3 => \scs_inst/n545_18\,
               F => \scs_inst/n587_18\
           );
      \scs_inst/n575_s12\ : LUT4
           generic map (
               INIT => X"7D00"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/crc_reg\(16),
               I3 => \scs_inst/n545_18\,
               F => \scs_inst/n575_18\
           );
      \scs_inst/n567_s12\ : LUT4
           generic map (
               INIT => X"7D00"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/crc_reg\(20),
               I3 => \scs_inst/n545_18\,
               F => \scs_inst/n567_18\
           );
      \scs_inst/n565_s12\ : LUT4
           generic map (
               INIT => X"7D00"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/crc_reg\(21),
               I3 => \scs_inst/n545_18\,
               F => \scs_inst/n565_18\
           );
      \scs_inst/n563_s12\ : LUT4
           generic map (
               INIT => X"7D00"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/crc_reg\(22),
               I3 => \scs_inst/n545_18\,
               F => \scs_inst/n563_18\
           );
      \scs_inst/n559_s12\ : LUT4
           generic map (
               INIT => X"7D00"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/crc_reg\(24),
               I3 => \scs_inst/n545_18\,
               F => \scs_inst/n559_18\
           );
      \scs_inst/n557_s12\ : LUT4
           generic map (
               INIT => X"7D00"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/crc_reg\(25),
               I3 => \scs_inst/n545_18\,
               F => \scs_inst/n557_18\
           );
      \scs_inst/n553_s12\ : LUT4
           generic map (
               INIT => X"7D00"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/crc_reg\(27),
               I3 => \scs_inst/n545_18\,
               F => \scs_inst/n553_18\
           );
      \scs_inst/n551_s12\ : LUT4
           generic map (
               INIT => X"7D00"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/crc_reg\(28),
               I3 => \scs_inst/n545_18\,
               F => \scs_inst/n551_18\
           );
      \scs_inst/n547_s12\ : LUT4
           generic map (
               INIT => X"7D00"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/crc_reg\(30),
               I3 => \scs_inst/n545_18\,
               F => \scs_inst/n547_18\
           );
      \scs_inst/n545_s13\ : LUT4
           generic map (
               INIT => X"7D00"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/crc_reg\(31),
               I3 => \scs_inst/n545_18\,
               F => \scs_inst/n545_20\
           );
      \scs_inst/n591_s10\ : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/state\(1),
               I2 => \scs_inst/state\(0),
               F => \scs_inst/n591_15\
           );
      \scs_inst/n103_s34\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n103_41\,
               I1 => \scs_inst/n103_42\,
               I2 => \scs_inst/n103_43\,
               I3 => \scs_inst/n103_44\,
               F => \scs_inst/n103_38\
           );
      \scs_inst/n103_s35\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n103_45\,
               I1 => \scs_inst/n103_46\,
               I2 => \scs_inst/n103_47\,
               I3 => \scs_inst/n103_48\,
               F => \scs_inst/n103_39\
           );
      \scs_inst/n103_s36\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n103_49\,
               I1 => \scs_inst/n103_50\,
               I2 => \scs_inst/n103_51\,
               I3 => \scs_inst/n103_52\,
               F => \scs_inst/n103_40\
           );
      \scs_inst/n104_s34\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n104_41\,
               I1 => \scs_inst/n104_42\,
               I2 => \scs_inst/n104_43\,
               I3 => \scs_inst/n104_44\,
               F => \scs_inst/n104_38\
           );
      \scs_inst/n104_s35\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n104_45\,
               I1 => \scs_inst/n104_46\,
               I2 => \scs_inst/n104_47\,
               I3 => \scs_inst/n104_48\,
               F => \scs_inst/n104_39\
           );
      \scs_inst/n104_s36\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n104_49\,
               I1 => \scs_inst/n104_50\,
               I2 => \scs_inst/n104_51\,
               I3 => \scs_inst/n104_52\,
               F => \scs_inst/n104_40\
           );
      \scs_inst/n105_s34\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n105_41\,
               I1 => \scs_inst/n105_42\,
               I2 => \scs_inst/n105_43\,
               I3 => \scs_inst/n105_44\,
               F => \scs_inst/n105_38\
           );
      \scs_inst/n105_s35\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n105_45\,
               I1 => \scs_inst/n105_46\,
               I2 => \scs_inst/n105_47\,
               I3 => \scs_inst/n105_48\,
               F => \scs_inst/n105_39\
           );
      \scs_inst/n105_s36\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n105_49\,
               I1 => \scs_inst/n105_50\,
               I2 => \scs_inst/n105_51\,
               I3 => \scs_inst/n105_52\,
               F => \scs_inst/n105_40\
           );
      \scs_inst/n106_s34\ : LUT4
           generic map (
               INIT => X"7000"
           )
           port map (
               I0 => \scs_inst/n106_61\,
               I1 => \scs_inst/RegBuffIn\(204),
               I2 => \scs_inst/n106_42\,
               I3 => \scs_inst/n106_43\,
               F => \scs_inst/n106_38\
           );
      \scs_inst/n106_s35\ : LUT4
           generic map (
               INIT => X"7000"
           )
           port map (
               I0 => \scs_inst/n106_63\,
               I1 => \scs_inst/RegBuffIn\(36),
               I2 => \scs_inst/n106_45\,
               I3 => \scs_inst/n106_46\,
               F => \scs_inst/n106_39\
           );
      \scs_inst/n106_s36\ : LUT4
           generic map (
               INIT => X"7000"
           )
           port map (
               I0 => \scs_inst/n106_47\,
               I1 => \scs_inst/RegBuffIn\(20),
               I2 => \scs_inst/n106_48\,
               I3 => \scs_inst/n106_49\,
               F => \scs_inst/n106_40\
           );
      \scs_inst/n107_s34\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n107_67\,
               I1 => \scs_inst/RegBuffIn\(235),
               I2 => \scs_inst/RegBuffIn\(227),
               I3 => \scs_inst/n107_63\,
               F => \scs_inst/n107_38\
           );
      \scs_inst/n107_s35\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(99),
               I1 => \scs_inst/n107_61\,
               I2 => \scs_inst/RegBuffIn\(19),
               I3 => \scs_inst/n106_47\,
               F => \scs_inst/n107_39\
           );
      \scs_inst/n107_s36\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/n107_45\,
               I1 => \scs_inst/n107_46\,
               I2 => \scs_inst/n107_47\,
               F => \scs_inst/n107_40\
           );
      \scs_inst/n107_s37\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \scs_inst/n107_48\,
               I1 => \scs_inst/n107_49\,
               I2 => \scs_inst/n107_50\,
               I3 => \scs_inst/n107_51\,
               F => \scs_inst/n107_41\
           );
      \scs_inst/n108_s34\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(138),
               I1 => \scs_inst/n108_62\,
               I2 => \scs_inst/RegBuffIn\(42),
               I3 => \scs_inst/n108_66\,
               F => \scs_inst/n108_38\
           );
      \scs_inst/n108_s35\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \scs_inst/n108_44\,
               I1 => \scs_inst/n108_45\,
               I2 => \scs_inst/n108_46\,
               I3 => \scs_inst/n108_47\,
               F => \scs_inst/n108_39\
           );
      \scs_inst/n108_s36\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n108_70\,
               I1 => \scs_inst/RegBuffIn\(194),
               I2 => \scs_inst/RegBuffIn\(178),
               I3 => \scs_inst/n108_68\,
               F => \scs_inst/n108_40\
           );
      \scs_inst/n108_s37\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/n108_50\,
               I1 => \scs_inst/n108_51\,
               I2 => \scs_inst/n108_52\,
               F => \scs_inst/n108_41\
           );
      \scs_inst/n109_s34\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(161),
               I1 => \scs_inst/n109_57\,
               I2 => \scs_inst/RegBuffIn\(1),
               I3 => \scs_inst/n312_9\,
               F => \scs_inst/n109_38\
           );
      \scs_inst/n109_s35\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(33),
               I1 => \scs_inst/n106_63\,
               I2 => \scs_inst/RegBuffIn\(17),
               I3 => \scs_inst/n106_47\,
               F => \scs_inst/n109_39\
           );
      \scs_inst/n109_s36\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \scs_inst/n109_59\,
               I1 => \scs_inst/n109_44\,
               I2 => \scs_inst/n109_45\,
               I3 => \scs_inst/n109_46\,
               F => \scs_inst/n109_40\
           );
      \scs_inst/n109_s37\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n109_47\,
               I1 => \scs_inst/n109_48\,
               I2 => \scs_inst/n109_49\,
               I3 => \scs_inst/n109_50\,
               F => \scs_inst/n109_41\
           );
      \scs_inst/n110_s34\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n110_42\,
               I1 => \scs_inst/n110_43\,
               I2 => \scs_inst/n110_44\,
               I3 => \scs_inst/n110_45\,
               F => \scs_inst/n110_38\
           );
      \scs_inst/n110_s35\ : LUT3
           generic map (
               INIT => X"70"
           )
           port map (
               I0 => \scs_inst/n110_57\,
               I1 => \scs_inst/RegBuffIn\(48),
               I2 => \scs_inst/n110_47\,
               F => \scs_inst/n110_39\
           );
      \scs_inst/n110_s36\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n110_48\,
               I1 => \scs_inst/n110_49\,
               I2 => \scs_inst/n110_50\,
               I3 => \scs_inst/n110_51\,
               F => \scs_inst/n110_40\
           );
      \scs_inst/n110_s37\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/n110_52\,
               I1 => \scs_inst/n110_53\,
               I2 => \scs_inst/n110_54\,
               F => \scs_inst/n110_41\
           );
      \scs_inst/n613_s10\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/n613_18\,
               I1 => \scs_inst/n613_19\,
               I2 => \scs_inst/n613_20\,
               F => \scs_inst/n613_14\
           );
      \scs_inst/n613_s11\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/n613_21\,
               I1 => \scs_inst/n613_22\,
               I2 => \scs_inst/n613_23\,
               F => \scs_inst/n613_15\
           );
      \scs_inst/n618_s10\ : LUT3
           generic map (
               INIT => X"E0"
           )
           port map (
               I0 => crc_done_reg,
               I1 => CRC_START,
               I2 => \scs_inst/n378_5\,
               F => \scs_inst/n618_14\
           );
      \scs_inst/n618_s11\ : LUT4
           generic map (
               INIT => X"000E"
           )
           port map (
               I0 => CRC_START,
               I1 => \scs_inst/state\(1),
               I2 => \scs_inst/state\(0),
               I3 => \scs_inst/state\(2),
               F => \scs_inst/n618_15\
           );
      \scs_inst/n591_s11\ : LUT4
           generic map (
               INIT => X"5300"
           )
           port map (
               I0 => \scs_inst/crc_reg\(8),
               I1 => \scs_inst/crc_reg\(7),
               I2 => \scs_inst/n613_14\,
               I3 => \scs_inst/state\(2),
               F => \scs_inst/n591_16\
           );
      \scs_inst/n591_s12\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/crc_reg\(7),
               I1 => \scs_inst/data_byte\(7),
               I2 => \scs_inst/n591_15\,
               F => \scs_inst/n591_17\
           );
      \scs_inst/n593_s9\ : LUT4
           generic map (
               INIT => X"5300"
           )
           port map (
               I0 => \scs_inst/crc_reg\(7),
               I1 => \scs_inst/crc_reg\(6),
               I2 => \scs_inst/n613_14\,
               I3 => \scs_inst/state\(2),
               F => \scs_inst/n593_13\
           );
      \scs_inst/n593_s10\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/crc_reg\(6),
               I1 => \scs_inst/data_byte\(6),
               I2 => \scs_inst/n591_15\,
               F => \scs_inst/n593_14\
           );
      \scs_inst/n595_s9\ : LUT4
           generic map (
               INIT => X"3CAA"
           )
           port map (
               I0 => \scs_inst/crc_reg\(5),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/crc_reg\(6),
               I3 => \scs_inst/n613_14\,
               F => \scs_inst/n595_13\
           );
      \scs_inst/n595_s10\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/crc_reg\(5),
               I1 => \scs_inst/data_byte\(5),
               I2 => \scs_inst/n591_15\,
               F => \scs_inst/n595_14\
           );
      \scs_inst/n597_s9\ : LUT4
           generic map (
               INIT => X"5300"
           )
           port map (
               I0 => \scs_inst/crc_reg\(5),
               I1 => \scs_inst/crc_reg\(4),
               I2 => \scs_inst/n613_14\,
               I3 => \scs_inst/state\(2),
               F => \scs_inst/n597_13\
           );
      \scs_inst/n597_s10\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/crc_reg\(4),
               I1 => \scs_inst/data_byte\(4),
               I2 => \scs_inst/n591_15\,
               F => \scs_inst/n597_14\
           );
      \scs_inst/n599_s9\ : LUT4
           generic map (
               INIT => X"5300"
           )
           port map (
               I0 => \scs_inst/crc_reg\(4),
               I1 => \scs_inst/crc_reg\(3),
               I2 => \scs_inst/n613_14\,
               I3 => \scs_inst/state\(2),
               F => \scs_inst/n599_13\
           );
      \scs_inst/n599_s10\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/crc_reg\(3),
               I1 => \scs_inst/data_byte\(3),
               I2 => \scs_inst/n591_15\,
               F => \scs_inst/n599_14\
           );
      \scs_inst/n601_s9\ : LUT4
           generic map (
               INIT => X"5300"
           )
           port map (
               I0 => \scs_inst/crc_reg\(3),
               I1 => \scs_inst/crc_reg\(2),
               I2 => \scs_inst/n613_14\,
               I3 => \scs_inst/state\(2),
               F => \scs_inst/n601_13\
           );
      \scs_inst/n601_s10\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/crc_reg\(2),
               I1 => \scs_inst/data_byte\(2),
               I2 => \scs_inst/n591_15\,
               F => \scs_inst/n601_14\
           );
      \scs_inst/n603_s9\ : LUT4
           generic map (
               INIT => X"5300"
           )
           port map (
               I0 => \scs_inst/crc_reg\(2),
               I1 => \scs_inst/crc_reg\(1),
               I2 => \scs_inst/n613_14\,
               I3 => \scs_inst/state\(2),
               F => \scs_inst/n603_13\
           );
      \scs_inst/n603_s10\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/crc_reg\(1),
               I1 => \scs_inst/data_byte\(1),
               I2 => \scs_inst/n591_15\,
               F => \scs_inst/n603_14\
           );
      \scs_inst/n605_s9\ : LUT4
           generic map (
               INIT => X"5300"
           )
           port map (
               I0 => \scs_inst/crc_reg\(1),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/n613_14\,
               I3 => \scs_inst/state\(2),
               F => \scs_inst/n605_13\
           );
      \scs_inst/n605_s10\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/crc_reg\(0),
               I1 => \scs_inst/data_byte\(0),
               I2 => \scs_inst/n591_15\,
               F => \scs_inst/n605_14\
           );
      \scs_inst/n251_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/bit_index\(1),
               I1 => \scs_inst/bit_index\(0),
               F => \scs_inst/n251_6\
           );
      \scs_inst/n249_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/bit_index\(1),
               I1 => \scs_inst/bit_index\(0),
               I2 => \scs_inst/bit_index\(2),
               I3 => \scs_inst/bit_index\(3),
               F => \scs_inst/n249_6\
           );
      \scs_inst/n247_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/bit_index\(4),
               I1 => \scs_inst/bit_index\(5),
               F => \scs_inst/n247_6\
           );
      \scs_inst/n245_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/bit_index\(7),
               I1 => \scs_inst/n246_8\,
               F => \scs_inst/n245_6\
           );
      \scs_inst/n241_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/bit_index\(10),
               I1 => \scs_inst/bit_index\(11),
               F => \scs_inst/n241_6\
           );
      \scs_inst/n236_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/bit_index\(15),
               I1 => \scs_inst/bit_index\(16),
               I2 => \scs_inst/n240_9\,
               I3 => \scs_inst/n238_7\,
               F => \scs_inst/n236_6\
           );
      \scs_inst/n233_s2\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/n243_8\,
               I1 => \scs_inst/n240_9\,
               I2 => \scs_inst/n233_9\,
               F => \scs_inst/n233_6\
           );
      \scs_inst/n231_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/bit_index\(20),
               I1 => \scs_inst/bit_index\(21),
               F => \scs_inst/n231_6\
           );
      \scs_inst/n229_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/bit_index\(23),
               I1 => \scs_inst/n243_8\,
               I2 => \scs_inst/n240_9\,
               I3 => \scs_inst/n230_8\,
               F => \scs_inst/n229_6\
           );
      \scs_inst/n227_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/bit_index\(24),
               I1 => \scs_inst/bit_index\(25),
               F => \scs_inst/n227_6\
           );
      \scs_inst/n225_s2\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/n243_8\,
               I1 => \scs_inst/n230_8\,
               I2 => \scs_inst/n225_7\,
               F => \scs_inst/n225_6\
           );
      \scs_inst/n223_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/bit_index\(28),
               I1 => \scs_inst/bit_index\(29),
               F => \scs_inst/n223_6\
           );
      \scs_inst/n314_s2\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/byte_count\(0),
               I1 => \scs_inst/byte_count\(1),
               I2 => \scs_inst/byte_count\(2),
               F => \scs_inst/n314_6\
           );
      \scs_inst/n309_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/byte_count\(5),
               I1 => \scs_inst/byte_count\(6),
               I2 => \scs_inst/byte_count\(7),
               I3 => \scs_inst/n312_9\,
               F => \scs_inst/n309_6\
           );
      \scs_inst/n307_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/byte_count\(8),
               I1 => \scs_inst/byte_count\(9),
               F => \scs_inst/n307_6\
           );
      \scs_inst/n300_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/byte_count\(15),
               I1 => \scs_inst/byte_count\(16),
               I2 => \scs_inst/n304_7\,
               I3 => \scs_inst/n302_7\,
               F => \scs_inst/n300_6\
           );
      \scs_inst/n297_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n306_8\,
               I1 => \scs_inst/n304_7\,
               I2 => \scs_inst/n299_7\,
               I3 => \scs_inst/n297_7\,
               F => \scs_inst/n297_6\
           );
      \scs_inst/n295_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/byte_count\(20),
               I1 => \scs_inst/byte_count\(21),
               F => \scs_inst/n295_6\
           );
      \scs_inst/n293_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/byte_count\(23),
               I1 => \scs_inst/n306_8\,
               I2 => \scs_inst/n304_7\,
               I3 => \scs_inst/n294_7\,
               F => \scs_inst/n293_6\
           );
      \scs_inst/n291_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/byte_count\(24),
               I1 => \scs_inst/byte_count\(25),
               F => \scs_inst/n291_6\
           );
      \scs_inst/n289_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n306_8\,
               I1 => \scs_inst/n304_7\,
               I2 => \scs_inst/n294_7\,
               I3 => \scs_inst/n289_7\,
               F => \scs_inst/n289_6\
           );
      \scs_inst/n287_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/byte_count\(28),
               I1 => \scs_inst/byte_count\(29),
               F => \scs_inst/n287_6\
           );
      \scs_inst/n103_s37\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(175),
               I1 => \scs_inst/n103_76\,
               I2 => \scs_inst/RegBuffIn\(143),
               I3 => \scs_inst/n108_62\,
               F => \scs_inst/n103_41\
           );
      \scs_inst/n103_s38\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n107_67\,
               I1 => \scs_inst/RegBuffIn\(239),
               I2 => \scs_inst/RegBuffIn\(199),
               I3 => \scs_inst/n108_70\,
               F => \scs_inst/n103_42\
           );
      \scs_inst/n103_s39\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(87),
               I1 => \scs_inst/n103_70\,
               I2 => \scs_inst/RegBuffIn\(39),
               I3 => \scs_inst/n106_63\,
               F => \scs_inst/n103_43\
           );
      \scs_inst/n103_s40\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_68\,
               I1 => \scs_inst/RegBuffIn\(215),
               I2 => \scs_inst/RegBuffIn\(15),
               I3 => \scs_inst/n103_56\,
               F => \scs_inst/n103_44\
           );
      \scs_inst/n103_s41\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n108_68\,
               I1 => \scs_inst/RegBuffIn\(183),
               I2 => \scs_inst/RegBuffIn\(167),
               I3 => \scs_inst/n109_57\,
               F => \scs_inst/n103_45\
           );
      \scs_inst/n103_s42\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(247),
               I1 => \scs_inst/n103_80\,
               I2 => \scs_inst/RegBuffIn\(119),
               I3 => \scs_inst/n103_78\,
               F => \scs_inst/n103_46\
           );
      \scs_inst/n103_s43\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(103),
               I1 => \scs_inst/n107_61\,
               I2 => \scs_inst/RegBuffIn\(71),
               I3 => \scs_inst/n103_82\,
               F => \scs_inst/n103_47\
           );
      \scs_inst/n103_s44\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(231),
               I1 => \scs_inst/n107_63\,
               I2 => \scs_inst/RegBuffIn\(135),
               I3 => \scs_inst/n103_84\,
               F => \scs_inst/n103_48\
           );
      \scs_inst/n103_s45\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(207),
               I1 => \scs_inst/n106_61\,
               I2 => \scs_inst/RegBuffIn\(79),
               I3 => \scs_inst/n103_72\,
               F => \scs_inst/n103_49\
           );
      \scs_inst/n103_s46\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(111),
               I1 => \scs_inst/n103_74\,
               I2 => \scs_inst/RegBuffIn\(55),
               I3 => \scs_inst/n110_57\,
               F => \scs_inst/n103_50\
           );
      \scs_inst/n103_s47\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n106_47\,
               I1 => \scs_inst/RegBuffIn\(23),
               I2 => \scs_inst/RegBuffIn\(7),
               I3 => \scs_inst/n312_9\,
               F => \scs_inst/n103_51\
           );
      \scs_inst/n103_s48\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(151),
               I1 => \scs_inst/n103_66\,
               I2 => \scs_inst/RegBuffIn\(47),
               I3 => \scs_inst/n108_66\,
               F => \scs_inst/n103_52\
           );
      \scs_inst/n104_s37\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_68\,
               I1 => \scs_inst/RegBuffIn\(214),
               I2 => \scs_inst/RegBuffIn\(86),
               I3 => \scs_inst/n103_70\,
               F => \scs_inst/n104_41\
           );
      \scs_inst/n104_s38\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n110_57\,
               I1 => \scs_inst/RegBuffIn\(54),
               I2 => \scs_inst/RegBuffIn\(46),
               I3 => \scs_inst/n108_66\,
               F => \scs_inst/n104_42\
           );
      \scs_inst/n104_s39\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n108_62\,
               I1 => \scs_inst/RegBuffIn\(142),
               I2 => \scs_inst/RegBuffIn\(102),
               I3 => \scs_inst/n107_61\,
               F => \scs_inst/n104_43\
           );
      \scs_inst/n104_s40\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n106_61\,
               I1 => \scs_inst/RegBuffIn\(206),
               I2 => \scs_inst/RegBuffIn\(150),
               I3 => \scs_inst/n103_66\,
               F => \scs_inst/n104_44\
           );
      \scs_inst/n104_s41\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n107_67\,
               I1 => \scs_inst/RegBuffIn\(238),
               I2 => \scs_inst/RegBuffIn\(230),
               I3 => \scs_inst/n107_63\,
               F => \scs_inst/n104_45\
           );
      \scs_inst/n104_s42\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(166),
               I1 => \scs_inst/n109_57\,
               I2 => \scs_inst/RegBuffIn\(6),
               I3 => \scs_inst/n312_9\,
               F => \scs_inst/n104_46\
           );
      \scs_inst/n104_s43\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(70),
               I1 => \scs_inst/n103_82\,
               I2 => \scs_inst/RegBuffIn\(22),
               I3 => \scs_inst/n106_47\,
               F => \scs_inst/n104_47\
           );
      \scs_inst/n104_s44\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(182),
               I1 => \scs_inst/n108_68\,
               I2 => \scs_inst/RegBuffIn\(38),
               I3 => \scs_inst/n106_63\,
               F => \scs_inst/n104_48\
           );
      \scs_inst/n104_s45\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(246),
               I1 => \scs_inst/n103_80\,
               I2 => \scs_inst/RegBuffIn\(118),
               I3 => \scs_inst/n103_78\,
               F => \scs_inst/n104_49\
           );
      \scs_inst/n104_s46\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_72\,
               I1 => \scs_inst/RegBuffIn\(78),
               I2 => \scs_inst/RegBuffIn\(14),
               I3 => \scs_inst/n103_56\,
               F => \scs_inst/n104_50\
           );
      \scs_inst/n104_s47\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(198),
               I1 => \scs_inst/n108_70\,
               I2 => \scs_inst/RegBuffIn\(174),
               I3 => \scs_inst/n103_76\,
               F => \scs_inst/n104_51\
           );
      \scs_inst/n104_s48\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(134),
               I1 => \scs_inst/n103_84\,
               I2 => \scs_inst/RegBuffIn\(110),
               I3 => \scs_inst/n103_74\,
               F => \scs_inst/n104_52\
           );
      \scs_inst/n105_s37\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n110_57\,
               I1 => \scs_inst/RegBuffIn\(53),
               I2 => \scs_inst/RegBuffIn\(21),
               I3 => \scs_inst/n106_47\,
               F => \scs_inst/n105_41\
           );
      \scs_inst/n105_s38\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(229),
               I1 => \scs_inst/n107_63\,
               I2 => \scs_inst/RegBuffIn\(165),
               I3 => \scs_inst/n109_57\,
               F => \scs_inst/n105_42\
           );
      \scs_inst/n105_s39\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(149),
               I1 => \scs_inst/n103_66\,
               I2 => \scs_inst/RegBuffIn\(77),
               I3 => \scs_inst/n103_72\,
               F => \scs_inst/n105_43\
           );
      \scs_inst/n105_s40\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(141),
               I1 => \scs_inst/n108_62\,
               I2 => \scs_inst/RegBuffIn\(109),
               I3 => \scs_inst/n103_74\,
               F => \scs_inst/n105_44\
           );
      \scs_inst/n105_s41\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(173),
               I1 => \scs_inst/n103_76\,
               I2 => \scs_inst/RegBuffIn\(45),
               I3 => \scs_inst/n108_66\,
               F => \scs_inst/n105_45\
           );
      \scs_inst/n105_s42\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(85),
               I1 => \scs_inst/n103_70\,
               I2 => \scs_inst/RegBuffIn\(13),
               I3 => \scs_inst/n103_56\,
               F => \scs_inst/n105_46\
           );
      \scs_inst/n105_s43\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(101),
               I1 => \scs_inst/n107_61\,
               I2 => \scs_inst/RegBuffIn\(5),
               I3 => \scs_inst/n312_9\,
               F => \scs_inst/n105_47\
           );
      \scs_inst/n105_s44\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n106_61\,
               I1 => \scs_inst/RegBuffIn\(205),
               I2 => \scs_inst/RegBuffIn\(37),
               I3 => \scs_inst/n106_63\,
               F => \scs_inst/n105_48\
           );
      \scs_inst/n105_s45\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_68\,
               I1 => \scs_inst/RegBuffIn\(213),
               I2 => \scs_inst/RegBuffIn\(181),
               I3 => \scs_inst/n108_68\,
               F => \scs_inst/n105_49\
           );
      \scs_inst/n105_s46\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n107_67\,
               I1 => \scs_inst/RegBuffIn\(237),
               I2 => \scs_inst/RegBuffIn\(197),
               I3 => \scs_inst/n108_70\,
               F => \scs_inst/n105_50\
           );
      \scs_inst/n105_s47\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_80\,
               I1 => \scs_inst/RegBuffIn\(245),
               I2 => \scs_inst/RegBuffIn\(69),
               I3 => \scs_inst/n103_82\,
               F => \scs_inst/n105_51\
           );
      \scs_inst/n105_s48\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(133),
               I1 => \scs_inst/n103_84\,
               I2 => \scs_inst/RegBuffIn\(117),
               I3 => \scs_inst/n103_78\,
               F => \scs_inst/n105_52\
           );
      \scs_inst/n106_s38\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(244),
               I1 => \scs_inst/n103_80\,
               I2 => \scs_inst/RegBuffIn\(212),
               I3 => \scs_inst/n103_68\,
               F => \scs_inst/n106_42\
           );
      \scs_inst/n106_s39\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n106_52\,
               I1 => \scs_inst/n106_53\,
               I2 => \scs_inst/n106_54\,
               I3 => \scs_inst/n106_55\,
               F => \scs_inst/n106_43\
           );
      \scs_inst/n106_s41\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(100),
               I1 => \scs_inst/n107_61\,
               I2 => \scs_inst/RegBuffIn\(52),
               I3 => \scs_inst/n110_57\,
               F => \scs_inst/n106_45\
           );
      \scs_inst/n106_s42\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(116),
               I1 => \scs_inst/n103_78\,
               I2 => \scs_inst/RegBuffIn\(44),
               I3 => \scs_inst/n108_66\,
               F => \scs_inst/n106_46\
           );
      \scs_inst/n106_s43\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \scs_inst/byte_count\(1),
               I1 => \scs_inst/byte_count\(0),
               I2 => \scs_inst/byte_count\(4),
               I3 => \scs_inst/n106_57\,
               F => \scs_inst/n106_47\
           );
      \scs_inst/n106_s44\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(12),
               I1 => \scs_inst/n103_56\,
               I2 => \scs_inst/RegBuffIn\(4),
               I3 => \scs_inst/n312_9\,
               F => \scs_inst/n106_48\
           );
      \scs_inst/n106_s45\ : LUT4
           generic map (
               INIT => X"7000"
           )
           port map (
               I0 => \scs_inst/n103_72\,
               I1 => \scs_inst/RegBuffIn\(76),
               I2 => \scs_inst/n106_58\,
               I3 => \scs_inst/n106_59\,
               F => \scs_inst/n106_49\
           );
      \scs_inst/n107_s41\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(179),
               I1 => \scs_inst/n108_68\,
               I2 => \scs_inst/RegBuffIn\(11),
               I3 => \scs_inst/n103_56\,
               F => \scs_inst/n107_45\
           );
      \scs_inst/n107_s42\ : LUT4
           generic map (
               INIT => X"0700"
           )
           port map (
               I0 => \scs_inst/n110_57\,
               I1 => \scs_inst/RegBuffIn\(51),
               I2 => \scs_inst/n107_65\,
               I3 => \scs_inst/n107_55\,
               F => \scs_inst/n107_46\
           );
      \scs_inst/n107_s43\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n107_56\,
               I1 => \scs_inst/n107_57\,
               I2 => \scs_inst/n107_58\,
               I3 => \scs_inst/n107_59\,
               F => \scs_inst/n107_47\
           );
      \scs_inst/n107_s44\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(83),
               I1 => \scs_inst/n103_70\,
               F => \scs_inst/n107_48\
           );
      \scs_inst/n107_s45\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(243),
               I1 => \scs_inst/n103_80\,
               I2 => \scs_inst/RegBuffIn\(211),
               I3 => \scs_inst/n103_68\,
               F => \scs_inst/n107_49\
           );
      \scs_inst/n107_s46\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(171),
               I1 => \scs_inst/n103_76\,
               I2 => \scs_inst/RegBuffIn\(107),
               I3 => \scs_inst/n103_74\,
               F => \scs_inst/n107_50\
           );
      \scs_inst/n107_s47\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(131),
               I1 => \scs_inst/n103_84\,
               I2 => \scs_inst/RegBuffIn\(35),
               I3 => \scs_inst/n106_63\,
               F => \scs_inst/n107_51\
           );
      \scs_inst/n108_s40\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(146),
               I1 => \scs_inst/n103_66\,
               F => \scs_inst/n108_44\
           );
      \scs_inst/n108_s41\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(162),
               I1 => \scs_inst/n109_57\,
               I2 => \scs_inst/RegBuffIn\(106),
               I3 => \scs_inst/n103_74\,
               F => \scs_inst/n108_45\
           );
      \scs_inst/n108_s42\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(242),
               I1 => \scs_inst/n103_80\,
               I2 => \scs_inst/RegBuffIn\(18),
               I3 => \scs_inst/n106_47\,
               F => \scs_inst/n108_46\
           );
      \scs_inst/n108_s43\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_78\,
               I1 => \scs_inst/RegBuffIn\(114),
               I2 => \scs_inst/RegBuffIn\(98),
               I3 => \scs_inst/n107_61\,
               F => \scs_inst/n108_47\
           );
      \scs_inst/n108_s46\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(170),
               I1 => \scs_inst/n103_76\,
               I2 => \scs_inst/RegBuffIn\(74),
               I3 => \scs_inst/n103_72\,
               F => \scs_inst/n108_50\
           );
      \scs_inst/n108_s47\ : LUT4
           generic map (
               INIT => X"0700"
           )
           port map (
               I0 => \scs_inst/n103_68\,
               I1 => \scs_inst/RegBuffIn\(210),
               I2 => \scs_inst/n108_64\,
               I3 => \scs_inst/n108_56\,
               F => \scs_inst/n108_51\
           );
      \scs_inst/n108_s48\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n108_57\,
               I1 => \scs_inst/n108_58\,
               I2 => \scs_inst/n108_59\,
               I3 => \scs_inst/n108_60\,
               F => \scs_inst/n108_52\
           );
      \scs_inst/n109_s40\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_74\,
               I1 => \scs_inst/RegBuffIn\(105),
               I2 => \scs_inst/RegBuffIn\(65),
               I3 => \scs_inst/n103_82\,
               F => \scs_inst/n109_44\
           );
      \scs_inst/n109_s41\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(97),
               I1 => \scs_inst/n107_61\,
               I2 => \scs_inst/RegBuffIn\(49),
               I3 => \scs_inst/n110_57\,
               F => \scs_inst/n109_45\
           );
      \scs_inst/n109_s42\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n107_67\,
               I1 => \scs_inst/RegBuffIn\(233),
               I2 => \scs_inst/RegBuffIn\(129),
               I3 => \scs_inst/n103_84\,
               F => \scs_inst/n109_46\
           );
      \scs_inst/n109_s43\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_76\,
               I1 => \scs_inst/RegBuffIn\(169),
               I2 => \scs_inst/RegBuffIn\(113),
               I3 => \scs_inst/n103_78\,
               F => \scs_inst/n109_47\
           );
      \scs_inst/n109_s44\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(225),
               I1 => \scs_inst/n107_63\,
               I2 => \scs_inst/RegBuffIn\(41),
               I3 => \scs_inst/n108_66\,
               F => \scs_inst/n109_48\
           );
      \scs_inst/n109_s45\ : LUT3
           generic map (
               INIT => X"07"
           )
           port map (
               I0 => \scs_inst/n103_80\,
               I1 => \scs_inst/RegBuffIn\(241),
               I2 => \scs_inst/n109_51\,
               F => \scs_inst/n109_49\
           );
      \scs_inst/n109_s46\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n109_52\,
               I1 => \scs_inst/n109_53\,
               I2 => \scs_inst/n109_54\,
               I3 => \scs_inst/n109_55\,
               F => \scs_inst/n109_50\
           );
      \scs_inst/n110_s38\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_76\,
               I1 => \scs_inst/RegBuffIn\(168),
               I2 => \scs_inst/RegBuffIn\(64),
               I3 => \scs_inst/n103_82\,
               F => \scs_inst/n110_42\
           );
      \scs_inst/n110_s39\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(176),
               I1 => \scs_inst/n108_68\,
               I2 => \scs_inst/RegBuffIn\(72),
               I3 => \scs_inst/n103_72\,
               F => \scs_inst/n110_43\
           );
      \scs_inst/n110_s40\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(224),
               I1 => \scs_inst/n107_63\,
               I2 => \scs_inst/RegBuffIn\(8),
               I3 => \scs_inst/n103_56\,
               F => \scs_inst/n110_44\
           );
      \scs_inst/n110_s41\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(128),
               I1 => \scs_inst/n103_84\,
               I2 => \scs_inst/RegBuffIn\(104),
               I3 => \scs_inst/n103_74\,
               F => \scs_inst/n110_45\
           );
      \scs_inst/n110_s43\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(112),
               I1 => \scs_inst/n103_78\,
               I2 => \scs_inst/RegBuffIn\(0),
               I3 => \scs_inst/n312_9\,
               F => \scs_inst/n110_47\
           );
      \scs_inst/n110_s44\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(192),
               I1 => \scs_inst/n108_70\,
               I2 => \scs_inst/RegBuffIn\(16),
               I3 => \scs_inst/n106_47\,
               F => \scs_inst/n110_48\
           );
      \scs_inst/n110_s45\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(232),
               I1 => \scs_inst/n107_67\,
               I2 => \scs_inst/RegBuffIn\(40),
               I3 => \scs_inst/n108_66\,
               F => \scs_inst/n110_49\
           );
      \scs_inst/n110_s46\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_80\,
               I1 => \scs_inst/RegBuffIn\(240),
               I2 => \scs_inst/RegBuffIn\(96),
               I3 => \scs_inst/n107_61\,
               F => \scs_inst/n110_50\
           );
      \scs_inst/n110_s47\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_66\,
               I1 => \scs_inst/RegBuffIn\(144),
               I2 => \scs_inst/RegBuffIn\(136),
               I3 => \scs_inst/n108_62\,
               F => \scs_inst/n110_51\
           );
      \scs_inst/n110_s48\ : LUT4
           generic map (
               INIT => X"7077"
           )
           port map (
               I0 => \scs_inst/n103_70\,
               I1 => \scs_inst/RegBuffIn\(80),
               I2 => \scs_inst/byte_count\(2),
               I3 => \scs_inst/n110_55\,
               F => \scs_inst/n110_52\
           );
      \scs_inst/n110_s49\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n106_61\,
               I1 => \scs_inst/RegBuffIn\(200),
               I2 => \scs_inst/RegBuffIn\(32),
               I3 => \scs_inst/n106_63\,
               F => \scs_inst/n110_53\
           );
      \scs_inst/n110_s50\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_68\,
               I1 => \scs_inst/RegBuffIn\(208),
               I2 => \scs_inst/RegBuffIn\(160),
               I3 => \scs_inst/n109_57\,
               F => \scs_inst/n110_54\
           );
      \scs_inst/n613_s14\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => \scs_inst/bit_index\(29),
               I1 => \scs_inst/bit_index\(30),
               I2 => \scs_inst/bit_index\(31),
               I3 => \scs_inst/n613_24\,
               F => \scs_inst/n613_18\
           );
      \scs_inst/n613_s15\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n613_25\,
               I1 => \scs_inst/n613_26\,
               I2 => \scs_inst/n613_27\,
               I3 => \scs_inst/n613_28\,
               F => \scs_inst/n613_19\
           );
      \scs_inst/n613_s16\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => \scs_inst/bit_index\(9),
               I1 => \scs_inst/bit_index\(10),
               I2 => \scs_inst/bit_index\(11),
               I3 => \scs_inst/n613_29\,
               F => \scs_inst/n613_20\
           );
      \scs_inst/n613_s17\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \scs_inst/byte_count\(21),
               I1 => \scs_inst/byte_count\(22),
               I2 => \scs_inst/byte_count\(23),
               I3 => \scs_inst/byte_count\(24),
               F => \scs_inst/n613_21\
           );
      \scs_inst/n613_s18\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => \scs_inst/byte_count\(29),
               I1 => \scs_inst/byte_count\(30),
               I2 => \scs_inst/byte_count\(31),
               I3 => \scs_inst/n613_30\,
               F => \scs_inst/n613_22\
           );
      \scs_inst/n613_s19\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n312_9\,
               I1 => \scs_inst/n613_31\,
               I2 => \scs_inst/n613_32\,
               I3 => \scs_inst/n613_33\,
               F => \scs_inst/n613_23\
           );
      \scs_inst/n238_s3\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/bit_index\(13),
               I1 => \scs_inst/bit_index\(14),
               F => \scs_inst/n238_7\
           );
      \scs_inst/n225_s3\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/bit_index\(23),
               I1 => \scs_inst/bit_index\(27),
               I2 => \scs_inst/n240_9\,
               I3 => \scs_inst/n226_8\,
               F => \scs_inst/n225_7\
           );
      \scs_inst/n312_s3\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/byte_count\(3),
               I1 => \scs_inst/byte_count\(4),
               F => \scs_inst/n312_7\
           );
      \scs_inst/n304_s3\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/byte_count\(11),
               I1 => \scs_inst/byte_count\(12),
               F => \scs_inst/n304_7\
           );
      \scs_inst/n302_s3\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/byte_count\(13),
               I1 => \scs_inst/byte_count\(14),
               F => \scs_inst/n302_7\
           );
      \scs_inst/n299_s3\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/byte_count\(13),
               I1 => \scs_inst/n299_8\,
               F => \scs_inst/n299_7\
           );
      \scs_inst/n297_s3\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/byte_count\(18),
               I1 => \scs_inst/byte_count\(19),
               F => \scs_inst/n297_7\
           );
      \scs_inst/n294_s3\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/byte_count\(22),
               I1 => \scs_inst/n299_7\,
               I2 => \scs_inst/n297_7\,
               I3 => \scs_inst/n295_6\,
               F => \scs_inst/n294_7\
           );
      \scs_inst/n289_s3\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/byte_count\(23),
               I1 => \scs_inst/byte_count\(26),
               I2 => \scs_inst/byte_count\(27),
               I3 => \scs_inst/n291_6\,
               F => \scs_inst/n289_7\
           );
      \scs_inst/n103_s52\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \scs_inst/byte_count\(0),
               I1 => \scs_inst/byte_count\(1),
               I2 => \scs_inst/byte_count\(4),
               I3 => \scs_inst/n106_57\,
               F => \scs_inst/n103_56\
           );
      \scs_inst/n106_s47\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/byte_count\(3),
               I1 => \scs_inst/byte_count\(4),
               F => \scs_inst/n106_51\
           );
      \scs_inst/n106_s48\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_66\,
               I1 => \scs_inst/RegBuffIn\(148),
               I2 => \scs_inst/RegBuffIn\(140),
               I3 => \scs_inst/n108_62\,
               F => \scs_inst/n106_52\
           );
      \scs_inst/n106_s49\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(180),
               I1 => \scs_inst/n108_68\,
               I2 => \scs_inst/RegBuffIn\(172),
               I3 => \scs_inst/n103_76\,
               F => \scs_inst/n106_53\
           );
      \scs_inst/n106_s50\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n108_70\,
               I1 => \scs_inst/RegBuffIn\(196),
               I2 => \scs_inst/RegBuffIn\(164),
               I3 => \scs_inst/n109_57\,
               F => \scs_inst/n106_54\
           );
      \scs_inst/n106_s51\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n107_67\,
               I1 => \scs_inst/RegBuffIn\(236),
               I2 => \scs_inst/RegBuffIn\(228),
               I3 => \scs_inst/n107_63\,
               F => \scs_inst/n106_55\
           );
      \scs_inst/n106_s53\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/byte_count\(2),
               I1 => \scs_inst/byte_count\(3),
               F => \scs_inst/n106_57\
           );
      \scs_inst/n106_s54\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_70\,
               I1 => \scs_inst/RegBuffIn\(84),
               I2 => \scs_inst/RegBuffIn\(68),
               I3 => \scs_inst/n103_82\,
               F => \scs_inst/n106_58\
           );
      \scs_inst/n106_s55\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(132),
               I1 => \scs_inst/n103_84\,
               I2 => \scs_inst/RegBuffIn\(108),
               I3 => \scs_inst/n103_74\,
               F => \scs_inst/n106_59\
           );
      \scs_inst/n107_s49\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \scs_inst/byte_count\(3),
               I1 => \scs_inst/byte_count\(4),
               F => \scs_inst/n107_53\
           );
      \scs_inst/n107_s51\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_66\,
               I1 => \scs_inst/RegBuffIn\(147),
               I2 => \scs_inst/RegBuffIn\(67),
               I3 => \scs_inst/n103_82\,
               F => \scs_inst/n107_55\
           );
      \scs_inst/n107_s52\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(139),
               I1 => \scs_inst/n108_62\,
               I2 => \scs_inst/RegBuffIn\(43),
               I3 => \scs_inst/n108_66\,
               F => \scs_inst/n107_56\
           );
      \scs_inst/n107_s53\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n106_61\,
               I1 => \scs_inst/RegBuffIn\(203),
               I2 => \scs_inst/RegBuffIn\(115),
               I3 => \scs_inst/n103_78\,
               F => \scs_inst/n107_57\
           );
      \scs_inst/n107_s54\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(163),
               I1 => \scs_inst/n109_57\,
               I2 => \scs_inst/RegBuffIn\(75),
               I3 => \scs_inst/n103_72\,
               F => \scs_inst/n107_58\
           );
      \scs_inst/n107_s55\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(195),
               I1 => \scs_inst/n108_70\,
               I2 => \scs_inst/RegBuffIn\(3),
               I3 => \scs_inst/n312_9\,
               F => \scs_inst/n107_59\
           );
      \scs_inst/n108_s49\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \scs_inst/byte_count\(4),
               I1 => \scs_inst/byte_count\(3),
               F => \scs_inst/n108_53\
           );
      \scs_inst/n108_s52\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(226),
               I1 => \scs_inst/n107_63\,
               I2 => \scs_inst/RegBuffIn\(10),
               I3 => \scs_inst/n103_56\,
               F => \scs_inst/n108_56\
           );
      \scs_inst/n108_s53\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n107_67\,
               I1 => \scs_inst/RegBuffIn\(234),
               I2 => \scs_inst/RegBuffIn\(130),
               I3 => \scs_inst/n103_84\,
               F => \scs_inst/n108_57\
           );
      \scs_inst/n108_s54\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(82),
               I1 => \scs_inst/n103_70\,
               I2 => \scs_inst/RegBuffIn\(2),
               I3 => \scs_inst/n312_9\,
               F => \scs_inst/n108_58\
           );
      \scs_inst/n108_s55\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n106_61\,
               I1 => \scs_inst/RegBuffIn\(202),
               I2 => \scs_inst/RegBuffIn\(34),
               I3 => \scs_inst/n106_63\,
               F => \scs_inst/n108_59\
           );
      \scs_inst/n108_s56\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(66),
               I1 => \scs_inst/n103_82\,
               I2 => \scs_inst/RegBuffIn\(50),
               I3 => \scs_inst/n110_57\,
               F => \scs_inst/n108_60\
           );
      \scs_inst/n109_s47\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \scs_inst/byte_count\(2),
               I1 => \scs_inst/byte_count\(3),
               I2 => \scs_inst/n110_55\,
               F => \scs_inst/n109_51\
           );
      \scs_inst/n109_s48\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n106_61\,
               I1 => \scs_inst/RegBuffIn\(201),
               I2 => \scs_inst/RegBuffIn\(145),
               I3 => \scs_inst/n103_66\,
               F => \scs_inst/n109_52\
           );
      \scs_inst/n109_s49\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(137),
               I1 => \scs_inst/n108_62\,
               I2 => \scs_inst/RegBuffIn\(73),
               I3 => \scs_inst/n103_72\,
               F => \scs_inst/n109_53\
           );
      \scs_inst/n109_s50\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(81),
               I1 => \scs_inst/n103_70\,
               I2 => \scs_inst/RegBuffIn\(9),
               I3 => \scs_inst/n103_56\,
               F => \scs_inst/n109_54\
           );
      \scs_inst/n109_s51\ : LUT4
           generic map (
               INIT => X"0777"
           )
           port map (
               I0 => \scs_inst/n103_68\,
               I1 => \scs_inst/RegBuffIn\(209),
               I2 => \scs_inst/RegBuffIn\(177),
               I3 => \scs_inst/n108_68\,
               F => \scs_inst/n109_55\
           );
      \scs_inst/n110_s51\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \scs_inst/byte_count\(0),
               I1 => \scs_inst/byte_count\(1),
               I2 => \scs_inst/RegBuffIn\(248),
               F => \scs_inst/n110_55\
           );
      \scs_inst/n613_s20\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \scs_inst/bit_index\(25),
               I1 => \scs_inst/bit_index\(26),
               I2 => \scs_inst/bit_index\(27),
               I3 => \scs_inst/bit_index\(28),
               F => \scs_inst/n613_24\
           );
      \scs_inst/n613_s21\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \scs_inst/bit_index\(21),
               I1 => \scs_inst/bit_index\(22),
               I2 => \scs_inst/bit_index\(23),
               I3 => \scs_inst/bit_index\(24),
               F => \scs_inst/n613_25\
           );
      \scs_inst/n613_s22\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \scs_inst/bit_index\(17),
               I1 => \scs_inst/bit_index\(18),
               I2 => \scs_inst/bit_index\(19),
               I3 => \scs_inst/bit_index\(20),
               F => \scs_inst/n613_26\
           );
      \scs_inst/n613_s23\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \scs_inst/bit_index\(3),
               I1 => \scs_inst/bit_index\(4),
               I2 => \scs_inst/bit_index\(5),
               I3 => \scs_inst/bit_index\(8),
               F => \scs_inst/n613_27\
           );
      \scs_inst/n613_s24\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \scs_inst/bit_index\(6),
               I1 => \scs_inst/bit_index\(7),
               I2 => \scs_inst/bit_index\(12),
               F => \scs_inst/n613_28\
           );
      \scs_inst/n613_s25\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \scs_inst/bit_index\(13),
               I1 => \scs_inst/bit_index\(14),
               I2 => \scs_inst/bit_index\(15),
               I3 => \scs_inst/bit_index\(16),
               F => \scs_inst/n613_29\
           );
      \scs_inst/n613_s26\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \scs_inst/byte_count\(25),
               I1 => \scs_inst/byte_count\(26),
               I2 => \scs_inst/byte_count\(27),
               I3 => \scs_inst/byte_count\(28),
               F => \scs_inst/n613_30\
           );
      \scs_inst/n613_s27\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \scs_inst/byte_count\(17),
               I1 => \scs_inst/byte_count\(18),
               I2 => \scs_inst/byte_count\(19),
               I3 => \scs_inst/byte_count\(20),
               F => \scs_inst/n613_31\
           );
      \scs_inst/n613_s28\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \scs_inst/byte_count\(13),
               I1 => \scs_inst/byte_count\(14),
               I2 => \scs_inst/byte_count\(15),
               I3 => \scs_inst/byte_count\(16),
               F => \scs_inst/n613_32\
           );
      \scs_inst/n613_s29\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \scs_inst/n613_34\,
               I1 => \scs_inst/n613_35\,
               F => \scs_inst/n613_33\
           );
      \scs_inst/n235_s4\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/bit_index\(14),
               I1 => \scs_inst/bit_index\(15),
               I2 => \scs_inst/bit_index\(16),
               I3 => \scs_inst/bit_index\(17),
               F => \scs_inst/n235_8\
           );
      \scs_inst/n299_s4\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/byte_count\(14),
               I1 => \scs_inst/byte_count\(15),
               I2 => \scs_inst/byte_count\(16),
               I3 => \scs_inst/byte_count\(17),
               F => \scs_inst/n299_8\
           );
      \scs_inst/n613_s30\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \scs_inst/byte_count\(9),
               I1 => \scs_inst/byte_count\(10),
               I2 => \scs_inst/byte_count\(11),
               I3 => \scs_inst/byte_count\(12),
               F => \scs_inst/n613_34\
           );
      \scs_inst/n613_s31\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \scs_inst/byte_count\(5),
               I1 => \scs_inst/byte_count\(6),
               I2 => \scs_inst/byte_count\(7),
               I3 => \scs_inst/byte_count\(8),
               F => \scs_inst/n613_35\
           );
      \scs_inst/n222_s3\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/bit_index\(30),
               I1 => \scs_inst/bit_index\(28),
               I2 => \scs_inst/bit_index\(29),
               F => \scs_inst/n222_8\
           );
      \scs_inst/n226_s3\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/bit_index\(26),
               I1 => \scs_inst/bit_index\(24),
               I2 => \scs_inst/bit_index\(25),
               F => \scs_inst/n226_8\
           );
      \scs_inst/n230_s3\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/bit_index\(22),
               I1 => \scs_inst/n233_9\,
               I2 => \scs_inst/bit_index\(20),
               I3 => \scs_inst/bit_index\(21),
               F => \scs_inst/n230_8\
           );
      \scs_inst/n233_s4\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/bit_index\(18),
               I1 => \scs_inst/bit_index\(19),
               I2 => \scs_inst/bit_index\(13),
               I3 => \scs_inst/n235_8\,
               F => \scs_inst/n233_9\
           );
      \scs_inst/n235_s5\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n243_8\,
               I1 => \scs_inst/n240_9\,
               I2 => \scs_inst/bit_index\(13),
               I3 => \scs_inst/n235_8\,
               F => \scs_inst/n235_10\
           );
      \scs_inst/n238_s4\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n243_8\,
               I1 => \scs_inst/n240_9\,
               I2 => \scs_inst/bit_index\(13),
               I3 => \scs_inst/bit_index\(14),
               F => \scs_inst/n238_9\
           );
      \scs_inst/n240_s4\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/bit_index\(12),
               I1 => \scs_inst/bit_index\(10),
               I2 => \scs_inst/bit_index\(11),
               F => \scs_inst/n240_9\
           );
      \scs_inst/n246_s3\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/bit_index\(6),
               I1 => \scs_inst/n249_6\,
               I2 => \scs_inst/bit_index\(4),
               I3 => \scs_inst/bit_index\(5),
               F => \scs_inst/n246_8\
           );
      \scs_inst/n251_s3\ : LUT4
           generic map (
               INIT => X"6A00"
           )
           port map (
               I0 => \scs_inst/bit_index\(2),
               I1 => \scs_inst/bit_index\(1),
               I2 => \scs_inst/bit_index\(0),
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n251_8\
           );
      \scs_inst/n286_s3\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/byte_count\(30),
               I1 => \scs_inst/byte_count\(28),
               I2 => \scs_inst/byte_count\(29),
               F => \scs_inst/n286_8\
           );
      \scs_inst/n302_s4\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n306_8\,
               I1 => \scs_inst/n304_7\,
               I2 => \scs_inst/byte_count\(13),
               I3 => \scs_inst/byte_count\(14),
               F => \scs_inst/n302_9\
           );
      \scs_inst/n306_s3\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/byte_count\(10),
               I1 => \scs_inst/n309_6\,
               I2 => \scs_inst/byte_count\(8),
               I3 => \scs_inst/byte_count\(9),
               F => \scs_inst/n306_8\
           );
      \scs_inst/n613_s32\ : LUT4
           generic map (
               INIT => X"0155"
           )
           port map (
               I0 => \scs_inst/n591_15\,
               I1 => crc_done_reg,
               I2 => CRC_START,
               I3 => \scs_inst/n378_5\,
               F => \scs_inst/n613_37\
           );
      \scs_inst/n103_s61\ : LUT4
           generic map (
               INIT => X"2000"
           )
           port map (
               I0 => \scs_inst/n108_53\,
               I1 => \scs_inst/byte_count\(1),
               I2 => \scs_inst/byte_count\(0),
               I3 => \scs_inst/byte_count\(2),
               F => \scs_inst/n103_66\
           );
      \scs_inst/n103_s62\ : LUT4
           generic map (
               INIT => X"2000"
           )
           port map (
               I0 => \scs_inst/n106_51\,
               I1 => \scs_inst/byte_count\(1),
               I2 => \scs_inst/byte_count\(0),
               I3 => \scs_inst/byte_count\(2),
               F => \scs_inst/n103_68\
           );
      \scs_inst/n103_s63\ : LUT4
           generic map (
               INIT => X"2000"
           )
           port map (
               I0 => \scs_inst/n107_53\,
               I1 => \scs_inst/byte_count\(1),
               I2 => \scs_inst/byte_count\(0),
               I3 => \scs_inst/byte_count\(2),
               F => \scs_inst/n103_70\
           );
      \scs_inst/n103_s64\ : LUT4
           generic map (
               INIT => X"2000"
           )
           port map (
               I0 => \scs_inst/n107_53\,
               I1 => \scs_inst/byte_count\(0),
               I2 => \scs_inst/byte_count\(1),
               I3 => \scs_inst/byte_count\(2),
               F => \scs_inst/n103_72\
           );
      \scs_inst/n108_s57\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \scs_inst/byte_count\(0),
               I1 => \scs_inst/byte_count\(1),
               I2 => \scs_inst/byte_count\(2),
               I3 => \scs_inst/n108_53\,
               F => \scs_inst/n108_62\
           );
      \scs_inst/n106_s56\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \scs_inst/byte_count\(0),
               I1 => \scs_inst/byte_count\(1),
               I2 => \scs_inst/byte_count\(2),
               I3 => \scs_inst/n106_51\,
               F => \scs_inst/n106_61\
           );
      \scs_inst/n243_s3\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/bit_index\(8),
               I1 => \scs_inst/bit_index\(9),
               I2 => \scs_inst/bit_index\(7),
               I3 => \scs_inst/n246_8\,
               F => \scs_inst/n243_8\
           );
      \scs_inst/n245_s3\ : LUT4
           generic map (
               INIT => X"6A00"
           )
           port map (
               I0 => \scs_inst/bit_index\(8),
               I1 => \scs_inst/bit_index\(7),
               I2 => \scs_inst/n246_8\,
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n245_8\
           );
      \scs_inst/n290_s3\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/byte_count\(26),
               I1 => \scs_inst/byte_count\(24),
               I2 => \scs_inst/byte_count\(25),
               F => \scs_inst/n290_8\
           );
      \scs_inst/n299_s5\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n306_8\,
               I1 => \scs_inst/n304_7\,
               I2 => \scs_inst/byte_count\(13),
               I3 => \scs_inst/n299_8\,
               F => \scs_inst/n299_10\
           );
      \scs_inst/n109_s52\ : LUT4
           generic map (
               INIT => X"2000"
           )
           port map (
               I0 => \scs_inst/n108_53\,
               I1 => \scs_inst/byte_count\(2),
               I2 => \scs_inst/byte_count\(1),
               I3 => \scs_inst/byte_count\(0),
               F => \scs_inst/n109_57\
           );
      \scs_inst/n107_s56\ : LUT4
           generic map (
               INIT => X"2000"
           )
           port map (
               I0 => \scs_inst/n107_53\,
               I1 => \scs_inst/byte_count\(2),
               I2 => \scs_inst/byte_count\(1),
               I3 => \scs_inst/byte_count\(0),
               F => \scs_inst/n107_61\
           );
      \scs_inst/n107_s57\ : LUT4
           generic map (
               INIT => X"2000"
           )
           port map (
               I0 => \scs_inst/n106_51\,
               I1 => \scs_inst/byte_count\(2),
               I2 => \scs_inst/byte_count\(1),
               I3 => \scs_inst/byte_count\(0),
               F => \scs_inst/n107_63\
           );
      \scs_inst/n106_s57\ : LUT4
           generic map (
               INIT => X"2000"
           )
           port map (
               I0 => \scs_inst/n312_7\,
               I1 => \scs_inst/byte_count\(2),
               I2 => \scs_inst/byte_count\(1),
               I3 => \scs_inst/byte_count\(0),
               F => \scs_inst/n106_63\
           );
      \scs_inst/n108_s58\ : LUT4
           generic map (
               INIT => X"6A00"
           )
           port map (
               I0 => \scs_inst/byte_count\(4),
               I1 => \scs_inst/byte_count\(2),
               I2 => \scs_inst/byte_count\(3),
               I3 => \scs_inst/n110_55\,
               F => \scs_inst/n108_64\
           );
      \scs_inst/n107_s58\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/byte_count\(4),
               I1 => \scs_inst/byte_count\(2),
               I2 => \scs_inst/byte_count\(3),
               I3 => \scs_inst/n110_55\,
               F => \scs_inst/n107_65\
           );
      \scs_inst/n103_s65\ : LUT4
           generic map (
               INIT => X"0200"
           )
           port map (
               I0 => \scs_inst/n107_53\,
               I1 => \scs_inst/byte_count\(0),
               I2 => \scs_inst/byte_count\(2),
               I3 => \scs_inst/byte_count\(1),
               F => \scs_inst/n103_74\
           );
      \scs_inst/n103_s66\ : LUT4
           generic map (
               INIT => X"1000"
           )
           port map (
               I0 => \scs_inst/byte_count\(0),
               I1 => \scs_inst/byte_count\(2),
               I2 => \scs_inst/byte_count\(1),
               I3 => \scs_inst/n108_53\,
               F => \scs_inst/n103_76\
           );
      \scs_inst/n108_s59\ : LUT4
           generic map (
               INIT => X"0200"
           )
           port map (
               I0 => \scs_inst/n312_7\,
               I1 => \scs_inst/byte_count\(0),
               I2 => \scs_inst/byte_count\(2),
               I3 => \scs_inst/byte_count\(1),
               F => \scs_inst/n108_66\
           );
      \scs_inst/n107_s59\ : LUT4
           generic map (
               INIT => X"0200"
           )
           port map (
               I0 => \scs_inst/n106_51\,
               I1 => \scs_inst/byte_count\(0),
               I2 => \scs_inst/byte_count\(2),
               I3 => \scs_inst/byte_count\(1),
               F => \scs_inst/n107_67\
           );
      \scs_inst/n103_s67\ : LUT4
           generic map (
               INIT => X"0200"
           )
           port map (
               I0 => \scs_inst/n107_53\,
               I1 => \scs_inst/byte_count\(1),
               I2 => \scs_inst/byte_count\(2),
               I3 => \scs_inst/byte_count\(0),
               F => \scs_inst/n103_78\
           );
      \scs_inst/n103_s68\ : LUT4
           generic map (
               INIT => X"0200"
           )
           port map (
               I0 => \scs_inst/n106_51\,
               I1 => \scs_inst/byte_count\(1),
               I2 => \scs_inst/byte_count\(2),
               I3 => \scs_inst/byte_count\(0),
               F => \scs_inst/n103_80\
           );
      \scs_inst/n110_s52\ : LUT4
           generic map (
               INIT => X"0200"
           )
           port map (
               I0 => \scs_inst/n312_7\,
               I1 => \scs_inst/byte_count\(1),
               I2 => \scs_inst/byte_count\(2),
               I3 => \scs_inst/byte_count\(0),
               F => \scs_inst/n110_57\
           );
      \scs_inst/n108_s60\ : LUT4
           generic map (
               INIT => X"1000"
           )
           port map (
               I0 => \scs_inst/byte_count\(1),
               I1 => \scs_inst/byte_count\(2),
               I2 => \scs_inst/byte_count\(0),
               I3 => \scs_inst/n108_53\,
               F => \scs_inst/n108_68\
           );
      \scs_inst/n312_s4\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/byte_count\(3),
               I1 => \scs_inst/byte_count\(4),
               I2 => \scs_inst/n314_6\,
               F => \scs_inst/n312_9\
           );
      \scs_inst/n108_s61\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \scs_inst/byte_count\(3),
               I1 => \scs_inst/byte_count\(4),
               I2 => \scs_inst/n314_6\,
               F => \scs_inst/n108_70\
           );
      \scs_inst/n103_s69\ : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => \scs_inst/byte_count\(3),
               I1 => \scs_inst/byte_count\(4),
               I2 => \scs_inst/n314_6\,
               F => \scs_inst/n103_82\
           );
      \scs_inst/n103_s70\ : LUT3
           generic map (
               INIT => X"20"
           )
           port map (
               I0 => \scs_inst/n314_6\,
               I1 => \scs_inst/byte_count\(4),
               I2 => \scs_inst/byte_count\(3),
               F => \scs_inst/n103_84\
           );
      \scs_inst/n294_s4\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/byte_count\(11),
               I1 => \scs_inst/byte_count\(12),
               I2 => \scs_inst/n294_7\,
               F => \scs_inst/n294_9\
           );
      \scs_inst/n304_s4\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \scs_inst/n306_8\,
               I1 => \scs_inst/byte_count\(11),
               I2 => \scs_inst/byte_count\(12),
               F => \scs_inst/n304_9\
           );
      \scs_inst/n591_s13\ : LUT4
           generic map (
               INIT => X"BAAA"
           )
           port map (
               I0 => \scs_inst/n545_18\,
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n591_19\
           );
      \scs_inst/n616_s10\ : LUT4
           generic map (
               INIT => X"7F00"
           )
           port map (
               I0 => \scs_inst/n613_18\,
               I1 => \scs_inst/n613_19\,
               I2 => \scs_inst/n613_20\,
               I3 => \scs_inst/n613_39\,
               F => \scs_inst/n616_15\
           );
      \scs_inst/n613_s33\ : LUT3
           generic map (
               INIT => X"02"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/state\(1),
               I2 => \scs_inst/state\(0),
               F => \scs_inst/n613_39\
           );
      \scs_inst/n549_s13\ : LUT4
           generic map (
               INIT => X"000B"
           )
           port map (
               I0 => \scs_inst/crc_reg\(29),
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n549_20\
           );
      \scs_inst/n555_s13\ : LUT4
           generic map (
               INIT => X"000B"
           )
           port map (
               I0 => \scs_inst/crc_reg\(26),
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n555_20\
           );
      \scs_inst/n561_s13\ : LUT4
           generic map (
               INIT => X"000B"
           )
           port map (
               I0 => \scs_inst/crc_reg\(23),
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n561_20\
           );
      \scs_inst/n569_s13\ : LUT4
           generic map (
               INIT => X"000B"
           )
           port map (
               I0 => \scs_inst/crc_reg\(19),
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n569_20\
           );
      \scs_inst/n571_s13\ : LUT4
           generic map (
               INIT => X"000B"
           )
           port map (
               I0 => \scs_inst/crc_reg\(18),
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n571_20\
           );
      \scs_inst/n573_s13\ : LUT4
           generic map (
               INIT => X"000B"
           )
           port map (
               I0 => \scs_inst/crc_reg\(17),
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n573_20\
           );
      \scs_inst/n577_s13\ : LUT4
           generic map (
               INIT => X"000B"
           )
           port map (
               I0 => \scs_inst/crc_reg\(15),
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n577_20\
           );
      \scs_inst/n579_s13\ : LUT4
           generic map (
               INIT => X"000B"
           )
           port map (
               I0 => \scs_inst/crc_reg\(14),
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n579_20\
           );
      \scs_inst/n581_s13\ : LUT4
           generic map (
               INIT => X"000B"
           )
           port map (
               I0 => \scs_inst/crc_reg\(13),
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n581_20\
           );
      \scs_inst/n583_s13\ : LUT4
           generic map (
               INIT => X"000B"
           )
           port map (
               I0 => \scs_inst/crc_reg\(12),
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n583_20\
           );
      \scs_inst/n585_s13\ : LUT4
           generic map (
               INIT => X"000B"
           )
           port map (
               I0 => \scs_inst/crc_reg\(11),
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n585_20\
           );
      \scs_inst/n543_s13\ : LUT4
           generic map (
               INIT => X"000D"
           )
           port map (
               I0 => \scs_inst/state\(2),
               I1 => \scs_inst/crc_reg\(0),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n543_20\
           );
      \scs_inst/byte_count_31_s5\ : LUT4
           generic map (
               INIT => X"0007"
           )
           port map (
               I0 => \scs_inst/n613_14\,
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/byte_count_31_11\
           );
      \scs_inst/crc_reg_30_s5\ : LUT4
           generic map (
               INIT => X"000B"
           )
           port map (
               I0 => \scs_inst/n613_14\,
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/crc_reg_30_11\
           );
      \scs_inst/n605_s11\ : LUT4
           generic map (
               INIT => X"FF01"
           )
           port map (
               I0 => \scs_inst/n605_13\,
               I1 => \scs_inst/state\(1),
               I2 => \scs_inst/state\(0),
               I3 => \scs_inst/n605_14\,
               F => \scs_inst/n605_16\
           );
      \scs_inst/n603_s11\ : LUT4
           generic map (
               INIT => X"FF01"
           )
           port map (
               I0 => \scs_inst/n603_13\,
               I1 => \scs_inst/state\(1),
               I2 => \scs_inst/state\(0),
               I3 => \scs_inst/n603_14\,
               F => \scs_inst/n603_16\
           );
      \scs_inst/n601_s11\ : LUT4
           generic map (
               INIT => X"FF01"
           )
           port map (
               I0 => \scs_inst/n601_13\,
               I1 => \scs_inst/state\(1),
               I2 => \scs_inst/state\(0),
               I3 => \scs_inst/n601_14\,
               F => \scs_inst/n601_16\
           );
      \scs_inst/n599_s11\ : LUT4
           generic map (
               INIT => X"FF01"
           )
           port map (
               I0 => \scs_inst/n599_13\,
               I1 => \scs_inst/state\(1),
               I2 => \scs_inst/state\(0),
               I3 => \scs_inst/n599_14\,
               F => \scs_inst/n599_16\
           );
      \scs_inst/n597_s11\ : LUT4
           generic map (
               INIT => X"FF01"
           )
           port map (
               I0 => \scs_inst/n597_13\,
               I1 => \scs_inst/state\(1),
               I2 => \scs_inst/state\(0),
               I3 => \scs_inst/n597_14\,
               F => \scs_inst/n597_16\
           );
      \scs_inst/n593_s11\ : LUT4
           generic map (
               INIT => X"FF01"
           )
           port map (
               I0 => \scs_inst/n593_13\,
               I1 => \scs_inst/state\(1),
               I2 => \scs_inst/state\(0),
               I3 => \scs_inst/n593_14\,
               F => \scs_inst/n593_16\
           );
      \scs_inst/n591_s14\ : LUT4
           generic map (
               INIT => X"FF01"
           )
           port map (
               I0 => \scs_inst/n591_16\,
               I1 => \scs_inst/state\(1),
               I2 => \scs_inst/state\(0),
               I3 => \scs_inst/n591_17\,
               F => \scs_inst/n591_21\
           );
      \scs_inst/n381_s8\ : LUT4
           generic map (
               INIT => X"1000"
           )
           port map (
               I0 => crc_done_reg,
               I1 => \scs_inst/state\(1),
               I2 => \scs_inst/state\(2),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n381_14\
           );
      \scs_inst/n240_s5\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/n243_8\,
               I1 => \scs_inst/bit_index\(12),
               I2 => \scs_inst/bit_index\(10),
               I3 => \scs_inst/bit_index\(11),
               F => \scs_inst/n240_11\
           );
      \scs_inst/n109_s53\ : LUT4
           generic map (
               INIT => X"0200"
           )
           port map (
               I0 => \scs_inst/RegBuffIn\(193),
               I1 => \scs_inst/byte_count\(3),
               I2 => \scs_inst/byte_count\(4),
               I3 => \scs_inst/n314_6\,
               F => \scs_inst/n109_59\
           );
      \scs_inst/n311_s3\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \scs_inst/byte_count\(5),
               I1 => \scs_inst/byte_count\(3),
               I2 => \scs_inst/byte_count\(4),
               I3 => \scs_inst/n314_6\,
               F => \scs_inst/n311_8\
           );
      \scs_inst/n253_s2\ : LUT4
           generic map (
               INIT => X"0004"
           )
           port map (
               I0 => \scs_inst/bit_index\(0),
               I1 => \scs_inst/state\(2),
               I2 => \scs_inst/state\(1),
               I3 => \scs_inst/state\(0),
               F => \scs_inst/n253_7\
           );
      \scs_inst/state_2_s0\ : DFFC
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n613_13\,
               CLK => clk_d,
               CLEAR => reset_d,
               Q => \scs_inst/state\(2)
           );
      \scs_inst/state_1_s0\ : DFFC
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n616_12\,
               CLK => clk_d,
               CLEAR => reset_d,
               Q => \scs_inst/state\(1)
           );
      \scs_inst/state_0_s0\ : DFFC
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n618_13\,
               CLK => clk_d,
               CLEAR => reset_d,
               Q => \scs_inst/state\(0)
           );
      \scs_inst/buff_out_279_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(247),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(279)
           );
      \scs_inst/buff_out_278_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(246),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(278)
           );
      \scs_inst/buff_out_277_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(245),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(277)
           );
      \scs_inst/buff_out_276_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(244),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(276)
           );
      \scs_inst/buff_out_275_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(243),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(275)
           );
      \scs_inst/buff_out_274_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(242),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(274)
           );
      \scs_inst/buff_out_273_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(241),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(273)
           );
      \scs_inst/buff_out_272_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(240),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(272)
           );
      \scs_inst/buff_out_271_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(239),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(271)
           );
      \scs_inst/buff_out_270_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(238),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(270)
           );
      \scs_inst/buff_out_269_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(237),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(269)
           );
      \scs_inst/buff_out_268_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(236),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(268)
           );
      \scs_inst/buff_out_267_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(235),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(267)
           );
      \scs_inst/buff_out_266_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(234),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(266)
           );
      \scs_inst/buff_out_265_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(233),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(265)
           );
      \scs_inst/buff_out_264_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(232),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(264)
           );
      \scs_inst/buff_out_263_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(231),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(263)
           );
      \scs_inst/buff_out_262_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(230),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(262)
           );
      \scs_inst/buff_out_261_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(229),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(261)
           );
      \scs_inst/buff_out_260_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(228),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(260)
           );
      \scs_inst/buff_out_259_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(227),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(259)
           );
      \scs_inst/buff_out_258_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(226),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(258)
           );
      \scs_inst/buff_out_257_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(225),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(257)
           );
      \scs_inst/buff_out_256_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(224),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(256)
           );
      \scs_inst/buff_out_247_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(215),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(247)
           );
      \scs_inst/buff_out_246_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(214),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(246)
           );
      \scs_inst/buff_out_245_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(213),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(245)
           );
      \scs_inst/buff_out_244_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(212),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(244)
           );
      \scs_inst/buff_out_243_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(211),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(243)
           );
      \scs_inst/buff_out_242_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(210),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(242)
           );
      \scs_inst/buff_out_241_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(209),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(241)
           );
      \scs_inst/buff_out_240_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(208),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(240)
           );
      \scs_inst/buff_out_239_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(207),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(239)
           );
      \scs_inst/buff_out_238_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(206),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(238)
           );
      \scs_inst/buff_out_237_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(205),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(237)
           );
      \scs_inst/buff_out_236_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(204),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(236)
           );
      \scs_inst/buff_out_235_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(203),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(235)
           );
      \scs_inst/buff_out_234_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(202),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(234)
           );
      \scs_inst/buff_out_233_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(201),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(233)
           );
      \scs_inst/buff_out_232_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(200),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(232)
           );
      \scs_inst/buff_out_231_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(199),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(231)
           );
      \scs_inst/buff_out_230_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(198),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(230)
           );
      \scs_inst/buff_out_229_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(197),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(229)
           );
      \scs_inst/buff_out_228_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(196),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(228)
           );
      \scs_inst/buff_out_227_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(195),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(227)
           );
      \scs_inst/buff_out_226_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(194),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(226)
           );
      \scs_inst/buff_out_225_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(193),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(225)
           );
      \scs_inst/buff_out_224_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(192),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(224)
           );
      \scs_inst/buff_out_215_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(183),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(215)
           );
      \scs_inst/buff_out_214_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(182),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(214)
           );
      \scs_inst/buff_out_213_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(181),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(213)
           );
      \scs_inst/buff_out_212_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(180),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(212)
           );
      \scs_inst/buff_out_211_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(179),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(211)
           );
      \scs_inst/buff_out_210_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(178),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(210)
           );
      \scs_inst/buff_out_209_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(177),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(209)
           );
      \scs_inst/buff_out_208_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(176),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(208)
           );
      \scs_inst/buff_out_207_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(175),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(207)
           );
      \scs_inst/buff_out_206_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(174),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(206)
           );
      \scs_inst/buff_out_205_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(173),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(205)
           );
      \scs_inst/buff_out_204_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(172),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(204)
           );
      \scs_inst/buff_out_203_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(171),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(203)
           );
      \scs_inst/buff_out_202_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(170),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(202)
           );
      \scs_inst/buff_out_201_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(169),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(201)
           );
      \scs_inst/buff_out_200_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(168),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(200)
           );
      \scs_inst/buff_out_199_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(167),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(199)
           );
      \scs_inst/buff_out_198_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(166),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(198)
           );
      \scs_inst/buff_out_197_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(165),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(197)
           );
      \scs_inst/buff_out_196_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(164),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(196)
           );
      \scs_inst/buff_out_195_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(163),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(195)
           );
      \scs_inst/buff_out_194_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(162),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(194)
           );
      \scs_inst/buff_out_193_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(161),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(193)
           );
      \scs_inst/buff_out_192_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(160),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(192)
           );
      \scs_inst/buff_out_183_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(151),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(183)
           );
      \scs_inst/buff_out_182_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(150),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(182)
           );
      \scs_inst/buff_out_181_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(149),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(181)
           );
      \scs_inst/buff_out_180_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(148),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(180)
           );
      \scs_inst/buff_out_179_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(147),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(179)
           );
      \scs_inst/buff_out_178_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(146),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(178)
           );
      \scs_inst/buff_out_177_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(145),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(177)
           );
      \scs_inst/buff_out_176_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(144),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(176)
           );
      \scs_inst/buff_out_175_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(143),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(175)
           );
      \scs_inst/buff_out_174_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(142),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(174)
           );
      \scs_inst/buff_out_173_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(141),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(173)
           );
      \scs_inst/buff_out_172_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(140),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(172)
           );
      \scs_inst/buff_out_171_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(139),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(171)
           );
      \scs_inst/buff_out_170_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(138),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(170)
           );
      \scs_inst/buff_out_169_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(137),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(169)
           );
      \scs_inst/buff_out_168_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(136),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(168)
           );
      \scs_inst/buff_out_167_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(135),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(167)
           );
      \scs_inst/buff_out_166_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(134),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(166)
           );
      \scs_inst/buff_out_165_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(133),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(165)
           );
      \scs_inst/buff_out_164_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(132),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(164)
           );
      \scs_inst/buff_out_163_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(131),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(163)
           );
      \scs_inst/buff_out_162_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(130),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(162)
           );
      \scs_inst/buff_out_161_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(129),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(161)
           );
      \scs_inst/buff_out_160_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(128),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(160)
           );
      \scs_inst/buff_out_151_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(119),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(151)
           );
      \scs_inst/buff_out_150_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(118),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(150)
           );
      \scs_inst/buff_out_149_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(117),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(149)
           );
      \scs_inst/buff_out_148_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(116),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(148)
           );
      \scs_inst/buff_out_147_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(115),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(147)
           );
      \scs_inst/buff_out_146_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(114),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(146)
           );
      \scs_inst/buff_out_145_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(113),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(145)
           );
      \scs_inst/buff_out_144_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(112),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(144)
           );
      \scs_inst/buff_out_143_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(111),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(143)
           );
      \scs_inst/buff_out_142_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(110),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(142)
           );
      \scs_inst/buff_out_141_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(109),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(141)
           );
      \scs_inst/buff_out_140_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(108),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(140)
           );
      \scs_inst/buff_out_139_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(107),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(139)
           );
      \scs_inst/buff_out_138_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(106),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(138)
           );
      \scs_inst/buff_out_137_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(105),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(137)
           );
      \scs_inst/buff_out_136_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(104),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(136)
           );
      \scs_inst/buff_out_135_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(103),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(135)
           );
      \scs_inst/buff_out_134_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(102),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(134)
           );
      \scs_inst/buff_out_133_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(101),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(133)
           );
      \scs_inst/buff_out_132_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(100),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(132)
           );
      \scs_inst/buff_out_131_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(99),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(131)
           );
      \scs_inst/buff_out_130_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(98),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(130)
           );
      \scs_inst/buff_out_129_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(97),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(129)
           );
      \scs_inst/buff_out_128_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(96),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(128)
           );
      \scs_inst/buff_out_119_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(87),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(119)
           );
      \scs_inst/buff_out_118_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(86),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(118)
           );
      \scs_inst/buff_out_117_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(85),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(117)
           );
      \scs_inst/buff_out_116_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(84),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(116)
           );
      \scs_inst/buff_out_115_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(83),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(115)
           );
      \scs_inst/buff_out_114_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(82),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(114)
           );
      \scs_inst/buff_out_113_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(81),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(113)
           );
      \scs_inst/buff_out_112_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(80),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(112)
           );
      \scs_inst/buff_out_111_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(79),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(111)
           );
      \scs_inst/buff_out_110_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(78),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(110)
           );
      \scs_inst/buff_out_109_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(77),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(109)
           );
      \scs_inst/buff_out_108_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(76),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(108)
           );
      \scs_inst/buff_out_107_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(75),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(107)
           );
      \scs_inst/buff_out_106_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(74),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(106)
           );
      \scs_inst/buff_out_105_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(73),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(105)
           );
      \scs_inst/buff_out_104_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(72),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(104)
           );
      \scs_inst/buff_out_103_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(71),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(103)
           );
      \scs_inst/buff_out_102_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(70),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(102)
           );
      \scs_inst/buff_out_101_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(69),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(101)
           );
      \scs_inst/buff_out_100_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(68),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(100)
           );
      \scs_inst/buff_out_99_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(67),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(99)
           );
      \scs_inst/buff_out_98_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(66),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(98)
           );
      \scs_inst/buff_out_97_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(65),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(97)
           );
      \scs_inst/buff_out_96_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(64),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(96)
           );
      \scs_inst/buff_out_87_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(55),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(87)
           );
      \scs_inst/buff_out_86_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(54),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(86)
           );
      \scs_inst/buff_out_85_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(53),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(85)
           );
      \scs_inst/buff_out_84_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(52),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(84)
           );
      \scs_inst/buff_out_83_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(51),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(83)
           );
      \scs_inst/buff_out_82_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(50),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(82)
           );
      \scs_inst/buff_out_81_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(49),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(81)
           );
      \scs_inst/buff_out_80_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(48),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(80)
           );
      \scs_inst/buff_out_79_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(47),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(79)
           );
      \scs_inst/buff_out_78_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(46),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(78)
           );
      \scs_inst/buff_out_77_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(45),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(77)
           );
      \scs_inst/buff_out_76_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(44),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(76)
           );
      \scs_inst/buff_out_75_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(43),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(75)
           );
      \scs_inst/buff_out_74_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(42),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(74)
           );
      \scs_inst/buff_out_73_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(41),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(73)
           );
      \scs_inst/buff_out_72_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(40),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(72)
           );
      \scs_inst/buff_out_71_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(39),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(71)
           );
      \scs_inst/buff_out_70_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(38),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(70)
           );
      \scs_inst/buff_out_69_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(37),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(69)
           );
      \scs_inst/buff_out_68_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(36),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(68)
           );
      \scs_inst/buff_out_67_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(35),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(67)
           );
      \scs_inst/buff_out_66_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(34),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(66)
           );
      \scs_inst/buff_out_65_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(33),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(65)
           );
      \scs_inst/buff_out_64_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(32),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(64)
           );
      \scs_inst/buff_out_59_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(248),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(59)
           );
      \scs_inst/buff_out_55_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(23),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(55)
           );
      \scs_inst/buff_out_54_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(22),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(54)
           );
      \scs_inst/buff_out_53_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(21),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(53)
           );
      \scs_inst/buff_out_52_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(20),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(52)
           );
      \scs_inst/buff_out_51_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(19),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(51)
           );
      \scs_inst/buff_out_50_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(18),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(50)
           );
      \scs_inst/buff_out_49_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(17),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(49)
           );
      \scs_inst/buff_out_48_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(16),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(48)
           );
      \scs_inst/buff_out_47_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(15),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(47)
           );
      \scs_inst/buff_out_46_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(14),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(46)
           );
      \scs_inst/buff_out_45_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(13),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(45)
           );
      \scs_inst/buff_out_44_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(12),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(44)
           );
      \scs_inst/buff_out_43_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(11),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(43)
           );
      \scs_inst/buff_out_42_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(10),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(42)
           );
      \scs_inst/buff_out_41_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(9),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(41)
           );
      \scs_inst/buff_out_40_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(8),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(40)
           );
      \scs_inst/buff_out_39_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(7),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(39)
           );
      \scs_inst/buff_out_38_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(6),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(38)
           );
      \scs_inst/buff_out_37_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(5),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(37)
           );
      \scs_inst/buff_out_36_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(4),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(36)
           );
      \scs_inst/buff_out_35_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(3),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(35)
           );
      \scs_inst/buff_out_34_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(2),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(34)
           );
      \scs_inst/buff_out_33_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(1),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(33)
           );
      \scs_inst/buff_out_32_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/RegBuffIn\(0),
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(32)
           );
      \scs_inst/buff_out_31_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1139_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(31)
           );
      \scs_inst/buff_out_30_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1140_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(30)
           );
      \scs_inst/buff_out_29_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1141_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(29)
           );
      \scs_inst/buff_out_28_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1142_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(28)
           );
      \scs_inst/buff_out_27_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1143_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(27)
           );
      \scs_inst/buff_out_26_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1144_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(26)
           );
      \scs_inst/buff_out_25_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1145_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(25)
           );
      \scs_inst/buff_out_24_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1146_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(24)
           );
      \scs_inst/buff_out_23_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1147_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(23)
           );
      \scs_inst/buff_out_22_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1148_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(22)
           );
      \scs_inst/buff_out_21_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1149_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(21)
           );
      \scs_inst/buff_out_20_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1150_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(20)
           );
      \scs_inst/buff_out_19_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1151_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(19)
           );
      \scs_inst/buff_out_18_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1152_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(18)
           );
      \scs_inst/buff_out_17_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1153_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(17)
           );
      \scs_inst/buff_out_16_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1154_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(16)
           );
      \scs_inst/buff_out_15_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1155_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(15)
           );
      \scs_inst/buff_out_14_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1156_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(14)
           );
      \scs_inst/buff_out_13_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1157_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(13)
           );
      \scs_inst/buff_out_12_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1158_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(12)
           );
      \scs_inst/buff_out_11_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1159_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(11)
           );
      \scs_inst/buff_out_10_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1160_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(10)
           );
      \scs_inst/buff_out_9_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1161_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(9)
           );
      \scs_inst/buff_out_8_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1162_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(8)
           );
      \scs_inst/buff_out_7_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1163_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(7)
           );
      \scs_inst/buff_out_6_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1164_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(6)
           );
      \scs_inst/buff_out_5_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1165_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(5)
           );
      \scs_inst/buff_out_4_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1166_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(4)
           );
      \scs_inst/buff_out_3_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1167_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(3)
           );
      \scs_inst/buff_out_2_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1168_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(2)
           );
      \scs_inst/buff_out_1_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1169_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(1)
           );
      \scs_inst/buff_out_0_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n1170_5\,
               CLK => clk_d,
               CE => \scs_inst/n378_5\,
               CLEAR => reset_d,
               Q => BUFF_CRC(0)
           );
      \scs_inst/RegBuffIn_248_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(27),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(248)
           );
      \scs_inst/RegBuffIn_247_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(247),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(247)
           );
      \scs_inst/RegBuffIn_246_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(246),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(246)
           );
      \scs_inst/RegBuffIn_245_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(245),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(245)
           );
      \scs_inst/RegBuffIn_244_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(244),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(244)
           );
      \scs_inst/RegBuffIn_243_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(243),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(243)
           );
      \scs_inst/RegBuffIn_242_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(242),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(242)
           );
      \scs_inst/RegBuffIn_241_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(241),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(241)
           );
      \scs_inst/RegBuffIn_240_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(240),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(240)
           );
      \scs_inst/RegBuffIn_239_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(239),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(239)
           );
      \scs_inst/RegBuffIn_238_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(238),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(238)
           );
      \scs_inst/RegBuffIn_237_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(237),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(237)
           );
      \scs_inst/RegBuffIn_236_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(236),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(236)
           );
      \scs_inst/RegBuffIn_235_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(235),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(235)
           );
      \scs_inst/RegBuffIn_234_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(234),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(234)
           );
      \scs_inst/RegBuffIn_233_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(233),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(233)
           );
      \scs_inst/RegBuffIn_232_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(232),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(232)
           );
      \scs_inst/RegBuffIn_231_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(231),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(231)
           );
      \scs_inst/RegBuffIn_230_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(230),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(230)
           );
      \scs_inst/RegBuffIn_229_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(229),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(229)
           );
      \scs_inst/RegBuffIn_228_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(228),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(228)
           );
      \scs_inst/RegBuffIn_227_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(227),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(227)
           );
      \scs_inst/RegBuffIn_226_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(226),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(226)
           );
      \scs_inst/RegBuffIn_225_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(225),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(225)
           );
      \scs_inst/RegBuffIn_224_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(224),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(224)
           );
      \scs_inst/RegBuffIn_215_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(215),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(215)
           );
      \scs_inst/RegBuffIn_214_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(214),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(214)
           );
      \scs_inst/RegBuffIn_213_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(213),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(213)
           );
      \scs_inst/RegBuffIn_212_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(212),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(212)
           );
      \scs_inst/RegBuffIn_211_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(211),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(211)
           );
      \scs_inst/RegBuffIn_210_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(210),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(210)
           );
      \scs_inst/RegBuffIn_209_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(209),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(209)
           );
      \scs_inst/RegBuffIn_208_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(208),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(208)
           );
      \scs_inst/RegBuffIn_207_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(207),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(207)
           );
      \scs_inst/RegBuffIn_206_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(206),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(206)
           );
      \scs_inst/RegBuffIn_205_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(205),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(205)
           );
      \scs_inst/RegBuffIn_204_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(204),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(204)
           );
      \scs_inst/RegBuffIn_203_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(203),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(203)
           );
      \scs_inst/RegBuffIn_202_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(202),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(202)
           );
      \scs_inst/RegBuffIn_201_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(201),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(201)
           );
      \scs_inst/RegBuffIn_200_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(200),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(200)
           );
      \scs_inst/RegBuffIn_199_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(199),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(199)
           );
      \scs_inst/RegBuffIn_198_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(198),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(198)
           );
      \scs_inst/RegBuffIn_197_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(197),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(197)
           );
      \scs_inst/RegBuffIn_196_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(196),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(196)
           );
      \scs_inst/RegBuffIn_195_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(195),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(195)
           );
      \scs_inst/RegBuffIn_194_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(194),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(194)
           );
      \scs_inst/RegBuffIn_193_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(193),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(193)
           );
      \scs_inst/RegBuffIn_192_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(192),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(192)
           );
      \scs_inst/RegBuffIn_183_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(183),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(183)
           );
      \scs_inst/RegBuffIn_182_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(182),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(182)
           );
      \scs_inst/RegBuffIn_181_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(181),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(181)
           );
      \scs_inst/RegBuffIn_180_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(180),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(180)
           );
      \scs_inst/RegBuffIn_179_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(179),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(179)
           );
      \scs_inst/RegBuffIn_178_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(178),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(178)
           );
      \scs_inst/RegBuffIn_177_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(177),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(177)
           );
      \scs_inst/RegBuffIn_176_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(176),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(176)
           );
      \scs_inst/RegBuffIn_175_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(175),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(175)
           );
      \scs_inst/RegBuffIn_174_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(174),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(174)
           );
      \scs_inst/RegBuffIn_173_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(173),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(173)
           );
      \scs_inst/RegBuffIn_172_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(172),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(172)
           );
      \scs_inst/RegBuffIn_171_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(171),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(171)
           );
      \scs_inst/RegBuffIn_170_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(170),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(170)
           );
      \scs_inst/RegBuffIn_169_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(169),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(169)
           );
      \scs_inst/RegBuffIn_168_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(168),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(168)
           );
      \scs_inst/RegBuffIn_167_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(167),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(167)
           );
      \scs_inst/RegBuffIn_166_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(166),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(166)
           );
      \scs_inst/RegBuffIn_165_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(165),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(165)
           );
      \scs_inst/RegBuffIn_164_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(164),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(164)
           );
      \scs_inst/RegBuffIn_163_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(163),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(163)
           );
      \scs_inst/RegBuffIn_162_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(162),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(162)
           );
      \scs_inst/RegBuffIn_161_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(161),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(161)
           );
      \scs_inst/RegBuffIn_160_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(160),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(160)
           );
      \scs_inst/RegBuffIn_151_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(151),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(151)
           );
      \scs_inst/RegBuffIn_150_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(150),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(150)
           );
      \scs_inst/RegBuffIn_149_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(149),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(149)
           );
      \scs_inst/RegBuffIn_148_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(148),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(148)
           );
      \scs_inst/RegBuffIn_147_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(147),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(147)
           );
      \scs_inst/RegBuffIn_146_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(146),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(146)
           );
      \scs_inst/RegBuffIn_145_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(145),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(145)
           );
      \scs_inst/RegBuffIn_144_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(144),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(144)
           );
      \scs_inst/RegBuffIn_143_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(143),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(143)
           );
      \scs_inst/RegBuffIn_142_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(142),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(142)
           );
      \scs_inst/RegBuffIn_141_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(141),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(141)
           );
      \scs_inst/RegBuffIn_140_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(140),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(140)
           );
      \scs_inst/RegBuffIn_139_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(139),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(139)
           );
      \scs_inst/RegBuffIn_138_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(138),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(138)
           );
      \scs_inst/RegBuffIn_137_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(137),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(137)
           );
      \scs_inst/RegBuffIn_136_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(136),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(136)
           );
      \scs_inst/RegBuffIn_135_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(135),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(135)
           );
      \scs_inst/RegBuffIn_134_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(134),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(134)
           );
      \scs_inst/RegBuffIn_133_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(133),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(133)
           );
      \scs_inst/RegBuffIn_132_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(132),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(132)
           );
      \scs_inst/RegBuffIn_131_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(131),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(131)
           );
      \scs_inst/RegBuffIn_130_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(130),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(130)
           );
      \scs_inst/RegBuffIn_129_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(129),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(129)
           );
      \scs_inst/RegBuffIn_128_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(128),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(128)
           );
      \scs_inst/RegBuffIn_119_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(119),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(119)
           );
      \scs_inst/RegBuffIn_118_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(118),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(118)
           );
      \scs_inst/RegBuffIn_117_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(117),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(117)
           );
      \scs_inst/RegBuffIn_116_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(116),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(116)
           );
      \scs_inst/RegBuffIn_115_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(115),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(115)
           );
      \scs_inst/RegBuffIn_114_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(114),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(114)
           );
      \scs_inst/RegBuffIn_113_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(113),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(113)
           );
      \scs_inst/RegBuffIn_112_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(112),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(112)
           );
      \scs_inst/RegBuffIn_111_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(111),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(111)
           );
      \scs_inst/RegBuffIn_110_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(110),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(110)
           );
      \scs_inst/RegBuffIn_109_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(109),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(109)
           );
      \scs_inst/RegBuffIn_108_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(108),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(108)
           );
      \scs_inst/RegBuffIn_107_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(107),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(107)
           );
      \scs_inst/RegBuffIn_106_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(106),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(106)
           );
      \scs_inst/RegBuffIn_105_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(105),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(105)
           );
      \scs_inst/RegBuffIn_104_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(104),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(104)
           );
      \scs_inst/RegBuffIn_103_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(103),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(103)
           );
      \scs_inst/RegBuffIn_102_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(102),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(102)
           );
      \scs_inst/RegBuffIn_101_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(101),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(101)
           );
      \scs_inst/RegBuffIn_100_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(100),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(100)
           );
      \scs_inst/RegBuffIn_99_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(99),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(99)
           );
      \scs_inst/RegBuffIn_98_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(98),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(98)
           );
      \scs_inst/RegBuffIn_97_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(97),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(97)
           );
      \scs_inst/RegBuffIn_96_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(96),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(96)
           );
      \scs_inst/RegBuffIn_87_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(87),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(87)
           );
      \scs_inst/RegBuffIn_86_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(86),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(86)
           );
      \scs_inst/RegBuffIn_85_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(85),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(85)
           );
      \scs_inst/RegBuffIn_84_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(84),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(84)
           );
      \scs_inst/RegBuffIn_83_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(83),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(83)
           );
      \scs_inst/RegBuffIn_82_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(82),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(82)
           );
      \scs_inst/RegBuffIn_81_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(81),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(81)
           );
      \scs_inst/RegBuffIn_80_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(80),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(80)
           );
      \scs_inst/RegBuffIn_79_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(79),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(79)
           );
      \scs_inst/RegBuffIn_78_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(78),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(78)
           );
      \scs_inst/RegBuffIn_77_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(77),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(77)
           );
      \scs_inst/RegBuffIn_76_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(76),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(76)
           );
      \scs_inst/RegBuffIn_75_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(75),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(75)
           );
      \scs_inst/RegBuffIn_74_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(74),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(74)
           );
      \scs_inst/RegBuffIn_73_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(73),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(73)
           );
      \scs_inst/RegBuffIn_72_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(72),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(72)
           );
      \scs_inst/RegBuffIn_71_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(71),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(71)
           );
      \scs_inst/RegBuffIn_70_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(70),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(70)
           );
      \scs_inst/RegBuffIn_69_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(69),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(69)
           );
      \scs_inst/RegBuffIn_68_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(68),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(68)
           );
      \scs_inst/RegBuffIn_67_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(67),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(67)
           );
      \scs_inst/RegBuffIn_66_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(66),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(66)
           );
      \scs_inst/RegBuffIn_65_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(65),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(65)
           );
      \scs_inst/RegBuffIn_64_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(64),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(64)
           );
      \scs_inst/RegBuffIn_55_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(55),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(55)
           );
      \scs_inst/RegBuffIn_54_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(54),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(54)
           );
      \scs_inst/RegBuffIn_53_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(53),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(53)
           );
      \scs_inst/RegBuffIn_52_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(52),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(52)
           );
      \scs_inst/RegBuffIn_51_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(51),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(51)
           );
      \scs_inst/RegBuffIn_50_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(50),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(50)
           );
      \scs_inst/RegBuffIn_49_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(49),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(49)
           );
      \scs_inst/RegBuffIn_48_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(48),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(48)
           );
      \scs_inst/RegBuffIn_47_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(47),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(47)
           );
      \scs_inst/RegBuffIn_46_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(46),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(46)
           );
      \scs_inst/RegBuffIn_45_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(45),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(45)
           );
      \scs_inst/RegBuffIn_44_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(44),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(44)
           );
      \scs_inst/RegBuffIn_43_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(43),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(43)
           );
      \scs_inst/RegBuffIn_42_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(42),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(42)
           );
      \scs_inst/RegBuffIn_41_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(41),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(41)
           );
      \scs_inst/RegBuffIn_40_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(40),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(40)
           );
      \scs_inst/RegBuffIn_39_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(39),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(39)
           );
      \scs_inst/RegBuffIn_38_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(38),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(38)
           );
      \scs_inst/RegBuffIn_37_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(37),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(37)
           );
      \scs_inst/RegBuffIn_36_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(36),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(36)
           );
      \scs_inst/RegBuffIn_35_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(35),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(35)
           );
      \scs_inst/RegBuffIn_34_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(34),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(34)
           );
      \scs_inst/RegBuffIn_33_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(33),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(33)
           );
      \scs_inst/RegBuffIn_32_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(32),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(32)
           );
      \scs_inst/RegBuffIn_23_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(23),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(23)
           );
      \scs_inst/RegBuffIn_22_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(22),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(22)
           );
      \scs_inst/RegBuffIn_21_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(21),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(21)
           );
      \scs_inst/RegBuffIn_20_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(20),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(20)
           );
      \scs_inst/RegBuffIn_19_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(19),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(19)
           );
      \scs_inst/RegBuffIn_18_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(18),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(18)
           );
      \scs_inst/RegBuffIn_17_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(17),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(17)
           );
      \scs_inst/RegBuffIn_16_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(16),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(16)
           );
      \scs_inst/RegBuffIn_15_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(15),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(15)
           );
      \scs_inst/RegBuffIn_14_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(14),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(14)
           );
      \scs_inst/RegBuffIn_13_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(13),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(13)
           );
      \scs_inst/RegBuffIn_12_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(12),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(12)
           );
      \scs_inst/RegBuffIn_11_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(11),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(11)
           );
      \scs_inst/RegBuffIn_10_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(10),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(10)
           );
      \scs_inst/RegBuffIn_9_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(9),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(9)
           );
      \scs_inst/RegBuffIn_8_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(8),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(8)
           );
      \scs_inst/RegBuffIn_7_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(7),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(7)
           );
      \scs_inst/RegBuffIn_6_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(6),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(6)
           );
      \scs_inst/RegBuffIn_5_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(5),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(5)
           );
      \scs_inst/RegBuffIn_4_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(4),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(4)
           );
      \scs_inst/RegBuffIn_3_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(3),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(3)
           );
      \scs_inst/RegBuffIn_2_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(2),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(2)
           );
      \scs_inst/RegBuffIn_1_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(1),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(1)
           );
      \scs_inst/RegBuffIn_0_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => BUFF_NOCRC(0),
               CLK => clk_d,
               CE => \scs_inst/n368_4\,
               CLEAR => reset_d,
               Q => \scs_inst/RegBuffIn\(0)
           );
      \scs_inst/data_byte_7_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n103_37\,
               CLK => clk_d,
               CE => \scs_inst/n370_4\,
               CLEAR => reset_d,
               Q => \scs_inst/data_byte\(7)
           );
      \scs_inst/data_byte_6_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n104_37\,
               CLK => clk_d,
               CE => \scs_inst/n370_4\,
               CLEAR => reset_d,
               Q => \scs_inst/data_byte\(6)
           );
      \scs_inst/data_byte_5_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n105_37\,
               CLK => clk_d,
               CE => \scs_inst/n370_4\,
               CLEAR => reset_d,
               Q => \scs_inst/data_byte\(5)
           );
      \scs_inst/data_byte_4_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n106_37\,
               CLK => clk_d,
               CE => \scs_inst/n370_4\,
               CLEAR => reset_d,
               Q => \scs_inst/data_byte\(4)
           );
      \scs_inst/data_byte_3_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n107_37\,
               CLK => clk_d,
               CE => \scs_inst/n370_4\,
               CLEAR => reset_d,
               Q => \scs_inst/data_byte\(3)
           );
      \scs_inst/data_byte_2_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n108_37\,
               CLK => clk_d,
               CE => \scs_inst/n370_4\,
               CLEAR => reset_d,
               Q => \scs_inst/data_byte\(2)
           );
      \scs_inst/data_byte_1_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n109_37\,
               CLK => clk_d,
               CE => \scs_inst/n370_4\,
               CLEAR => reset_d,
               Q => \scs_inst/data_byte\(1)
           );
      \scs_inst/data_byte_0_s0\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n110_37\,
               CLK => clk_d,
               CE => \scs_inst/n370_4\,
               CLEAR => reset_d,
               Q => \scs_inst/data_byte\(0)
           );
      \scs_inst/CRC_DONE_s1\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n381_14\,
               CLK => clk_d,
               CE => \scs_inst/n381_10\,
               CLEAR => reset_d,
               Q => CRC_DONE_Z
           );
      \scs_inst/crc_reg_30_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n545_20\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(30)
           );
      \scs_inst/crc_reg_29_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n547_18\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(29)
           );
      \scs_inst/crc_reg_28_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n549_20\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(28)
           );
      \scs_inst/crc_reg_27_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n551_18\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(27)
           );
      \scs_inst/crc_reg_26_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n553_18\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(26)
           );
      \scs_inst/crc_reg_25_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n555_20\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(25)
           );
      \scs_inst/crc_reg_24_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n557_18\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(24)
           );
      \scs_inst/crc_reg_23_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n559_18\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(23)
           );
      \scs_inst/crc_reg_22_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n561_20\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(22)
           );
      \scs_inst/crc_reg_21_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n563_18\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(21)
           );
      \scs_inst/crc_reg_20_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n565_18\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(20)
           );
      \scs_inst/crc_reg_19_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n567_18\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(19)
           );
      \scs_inst/crc_reg_18_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n569_20\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(18)
           );
      \scs_inst/crc_reg_17_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n571_20\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(17)
           );
      \scs_inst/crc_reg_16_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n573_20\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(16)
           );
      \scs_inst/crc_reg_15_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n575_18\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(15)
           );
      \scs_inst/crc_reg_14_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n577_20\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(14)
           );
      \scs_inst/crc_reg_13_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n579_20\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(13)
           );
      \scs_inst/crc_reg_12_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n581_20\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(12)
           );
      \scs_inst/crc_reg_11_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n583_20\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(11)
           );
      \scs_inst/crc_reg_10_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n585_20\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(10)
           );
      \scs_inst/crc_reg_9_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n587_18\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(9)
           );
      \scs_inst/crc_reg_8_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n589_18\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(8)
           );
      \scs_inst/crc_reg_7_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n591_21\,
               CLK => clk_d,
               CE => \scs_inst/n591_19\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(7)
           );
      \scs_inst/crc_reg_6_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n593_16\,
               CLK => clk_d,
               CE => \scs_inst/n591_19\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(6)
           );
      \scs_inst/crc_reg_5_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n595_12\,
               CLK => clk_d,
               CE => \scs_inst/n591_19\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(5)
           );
      \scs_inst/crc_reg_4_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n597_16\,
               CLK => clk_d,
               CE => \scs_inst/n591_19\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(4)
           );
      \scs_inst/crc_reg_3_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n599_16\,
               CLK => clk_d,
               CE => \scs_inst/n591_19\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(3)
           );
      \scs_inst/crc_reg_2_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n601_16\,
               CLK => clk_d,
               CE => \scs_inst/n591_19\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(2)
           );
      \scs_inst/crc_reg_1_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n603_16\,
               CLK => clk_d,
               CE => \scs_inst/n591_19\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(1)
           );
      \scs_inst/crc_reg_0_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n605_16\,
               CLK => clk_d,
               CE => \scs_inst/n591_19\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(0)
           );
      \scs_inst/byte_count_31_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n286_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(31)
           );
      \scs_inst/byte_count_30_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n287_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(30)
           );
      \scs_inst/byte_count_29_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n288_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(29)
           );
      \scs_inst/byte_count_28_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n289_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(28)
           );
      \scs_inst/byte_count_27_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n290_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(27)
           );
      \scs_inst/byte_count_26_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n291_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(26)
           );
      \scs_inst/byte_count_25_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n292_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(25)
           );
      \scs_inst/byte_count_24_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n293_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(24)
           );
      \scs_inst/byte_count_23_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n294_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(23)
           );
      \scs_inst/byte_count_22_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n295_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(22)
           );
      \scs_inst/byte_count_21_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n296_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(21)
           );
      \scs_inst/byte_count_20_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n297_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(20)
           );
      \scs_inst/byte_count_19_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n298_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(19)
           );
      \scs_inst/byte_count_18_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n299_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(18)
           );
      \scs_inst/byte_count_17_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n300_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(17)
           );
      \scs_inst/byte_count_16_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n301_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(16)
           );
      \scs_inst/byte_count_15_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n302_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(15)
           );
      \scs_inst/byte_count_14_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n303_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(14)
           );
      \scs_inst/byte_count_13_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n304_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(13)
           );
      \scs_inst/byte_count_12_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n305_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(12)
           );
      \scs_inst/byte_count_11_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n306_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(11)
           );
      \scs_inst/byte_count_10_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n307_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(10)
           );
      \scs_inst/byte_count_9_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n308_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(9)
           );
      \scs_inst/byte_count_8_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n309_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(8)
           );
      \scs_inst/byte_count_7_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n310_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(7)
           );
      \scs_inst/byte_count_6_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n311_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(6)
           );
      \scs_inst/byte_count_5_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n312_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(5)
           );
      \scs_inst/byte_count_4_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n313_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(4)
           );
      \scs_inst/byte_count_3_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n314_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(3)
           );
      \scs_inst/byte_count_2_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n315_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(2)
           );
      \scs_inst/byte_count_1_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n316_5\,
               CLK => clk_d,
               CE => \scs_inst/byte_count_31_11\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(1)
           );
      \scs_inst/byte_count_0_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n445_10\,
               CLK => clk_d,
               CE => \scs_inst/n545_18\,
               CLEAR => reset_d,
               Q => \scs_inst/byte_count\(0)
           );
      \scs_inst/bit_index_31_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n222_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(31)
           );
      \scs_inst/bit_index_30_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n223_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(30)
           );
      \scs_inst/bit_index_29_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n224_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(29)
           );
      \scs_inst/bit_index_28_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n225_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(28)
           );
      \scs_inst/bit_index_27_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n226_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(27)
           );
      \scs_inst/bit_index_26_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n227_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(26)
           );
      \scs_inst/bit_index_25_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n228_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(25)
           );
      \scs_inst/bit_index_24_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n229_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(24)
           );
      \scs_inst/bit_index_23_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n230_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(23)
           );
      \scs_inst/bit_index_22_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n231_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(22)
           );
      \scs_inst/bit_index_21_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n232_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(21)
           );
      \scs_inst/bit_index_20_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n233_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(20)
           );
      \scs_inst/bit_index_19_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n234_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(19)
           );
      \scs_inst/bit_index_18_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n235_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(18)
           );
      \scs_inst/bit_index_17_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n236_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(17)
           );
      \scs_inst/bit_index_16_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n237_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(16)
           );
      \scs_inst/bit_index_15_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n238_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(15)
           );
      \scs_inst/bit_index_14_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n239_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(14)
           );
      \scs_inst/bit_index_13_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n240_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(13)
           );
      \scs_inst/bit_index_12_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n241_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(12)
           );
      \scs_inst/bit_index_11_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n242_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(11)
           );
      \scs_inst/bit_index_10_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n243_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(10)
           );
      \scs_inst/bit_index_9_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n244_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(9)
           );
      \scs_inst/bit_index_8_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n245_8\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(8)
           );
      \scs_inst/bit_index_7_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n246_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(7)
           );
      \scs_inst/bit_index_6_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n247_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(6)
           );
      \scs_inst/bit_index_5_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n248_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(5)
           );
      \scs_inst/bit_index_4_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n249_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(4)
           );
      \scs_inst/bit_index_3_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n250_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(3)
           );
      \scs_inst/bit_index_2_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n251_8\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(2)
           );
      \scs_inst/bit_index_1_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n252_5\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(1)
           );
      \scs_inst/bit_index_0_s2\ : DFFCE
           generic map (
               INIT => '0'
           )
           port map (
               D => \scs_inst/n253_7\,
               CLK => clk_d,
               CE => \scs_inst/bit_index_31_9\,
               CLEAR => reset_d,
               Q => \scs_inst/bit_index\(0)
           );
      \scs_inst/crc_reg_31_s2\ : DFFPE
           generic map (
               INIT => '1'
           )
           port map (
               D => \scs_inst/n543_20\,
               CLK => clk_d,
               CE => \scs_inst/crc_reg_30_11\,
               PRESET => reset_d,
               Q => \scs_inst/crc_reg\(31)
           );
      \scs_inst/n1139_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(31),
               F => \scs_inst/n1139_5\
           );
      \scs_inst/n1140_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(30),
               F => \scs_inst/n1140_5\
           );
      \scs_inst/n1141_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(29),
               F => \scs_inst/n1141_5\
           );
      \scs_inst/n1142_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(28),
               F => \scs_inst/n1142_5\
           );
      \scs_inst/n1143_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(27),
               F => \scs_inst/n1143_5\
           );
      \scs_inst/n1144_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(26),
               F => \scs_inst/n1144_5\
           );
      \scs_inst/n1145_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(25),
               F => \scs_inst/n1145_5\
           );
      \scs_inst/n1146_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(24),
               F => \scs_inst/n1146_5\
           );
      \scs_inst/n1147_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(23),
               F => \scs_inst/n1147_5\
           );
      \scs_inst/n1148_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(22),
               F => \scs_inst/n1148_5\
           );
      \scs_inst/n1149_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(21),
               F => \scs_inst/n1149_5\
           );
      \scs_inst/n1150_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(20),
               F => \scs_inst/n1150_5\
           );
      \scs_inst/n1151_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(19),
               F => \scs_inst/n1151_5\
           );
      \scs_inst/n1152_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(18),
               F => \scs_inst/n1152_5\
           );
      \scs_inst/n1153_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(17),
               F => \scs_inst/n1153_5\
           );
      \scs_inst/n1154_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(16),
               F => \scs_inst/n1154_5\
           );
      \scs_inst/n1155_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(15),
               F => \scs_inst/n1155_5\
           );
      \scs_inst/n1156_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(14),
               F => \scs_inst/n1156_5\
           );
      \scs_inst/n1157_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(13),
               F => \scs_inst/n1157_5\
           );
      \scs_inst/n1158_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(12),
               F => \scs_inst/n1158_5\
           );
      \scs_inst/n1159_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(11),
               F => \scs_inst/n1159_5\
           );
      \scs_inst/n1160_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(10),
               F => \scs_inst/n1160_5\
           );
      \scs_inst/n1161_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(9),
               F => \scs_inst/n1161_5\
           );
      \scs_inst/n1162_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(8),
               F => \scs_inst/n1162_5\
           );
      \scs_inst/n1163_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(7),
               F => \scs_inst/n1163_5\
           );
      \scs_inst/n1164_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(6),
               F => \scs_inst/n1164_5\
           );
      \scs_inst/n1165_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(5),
               F => \scs_inst/n1165_5\
           );
      \scs_inst/n1166_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(4),
               F => \scs_inst/n1166_5\
           );
      \scs_inst/n1167_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(3),
               F => \scs_inst/n1167_5\
           );
      \scs_inst/n1168_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(2),
               F => \scs_inst/n1168_5\
           );
      \scs_inst/n1169_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(1),
               F => \scs_inst/n1169_5\
           );
      \scs_inst/n1170_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \scs_inst/crc_reg\(0),
               F => \scs_inst/n1170_5\
           );
      \spi_inst/n262_s829\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(1),
               I1 => BUFF_CRC(0),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_566\
           );
      \spi_inst/n262_s830\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(3),
               I1 => BUFF_CRC(2),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_567\
           );
      \spi_inst/n262_s831\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(5),
               I1 => BUFF_CRC(4),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_568\
           );
      \spi_inst/n262_s832\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(7),
               I1 => BUFF_CRC(6),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_569\
           );
      \spi_inst/n262_s833\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(9),
               I1 => BUFF_CRC(8),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_570\
           );
      \spi_inst/n262_s834\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(11),
               I1 => BUFF_CRC(10),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_571\
           );
      \spi_inst/n262_s835\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(13),
               I1 => BUFF_CRC(12),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_572\
           );
      \spi_inst/n262_s836\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(15),
               I1 => BUFF_CRC(14),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_573\
           );
      \spi_inst/n262_s837\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(17),
               I1 => BUFF_CRC(16),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_574\
           );
      \spi_inst/n262_s838\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(19),
               I1 => BUFF_CRC(18),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_575\
           );
      \spi_inst/n262_s839\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(21),
               I1 => BUFF_CRC(20),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_576\
           );
      \spi_inst/n262_s840\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(23),
               I1 => BUFF_CRC(22),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_577\
           );
      \spi_inst/n262_s841\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(25),
               I1 => BUFF_CRC(24),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_578\
           );
      \spi_inst/n262_s842\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(27),
               I1 => BUFF_CRC(26),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_579\
           );
      \spi_inst/n262_s843\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(29),
               I1 => BUFF_CRC(28),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_580\
           );
      \spi_inst/n262_s844\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(31),
               I1 => BUFF_CRC(30),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_581\
           );
      \spi_inst/n262_s845\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(33),
               I1 => BUFF_CRC(32),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_582\
           );
      \spi_inst/n262_s846\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(35),
               I1 => BUFF_CRC(34),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_583\
           );
      \spi_inst/n262_s847\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(37),
               I1 => BUFF_CRC(36),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_584\
           );
      \spi_inst/n262_s848\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(39),
               I1 => BUFF_CRC(38),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_585\
           );
      \spi_inst/n262_s849\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(41),
               I1 => BUFF_CRC(40),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_586\
           );
      \spi_inst/n262_s850\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(43),
               I1 => BUFF_CRC(42),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_587\
           );
      \spi_inst/n262_s851\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(45),
               I1 => BUFF_CRC(44),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_588\
           );
      \spi_inst/n262_s852\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(47),
               I1 => BUFF_CRC(46),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_589\
           );
      \spi_inst/n262_s853\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(49),
               I1 => BUFF_CRC(48),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_590\
           );
      \spi_inst/n262_s854\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(51),
               I1 => BUFF_CRC(50),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_591\
           );
      \spi_inst/n262_s855\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(53),
               I1 => BUFF_CRC(52),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_592\
           );
      \spi_inst/n262_s856\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(55),
               I1 => BUFF_CRC(54),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_593\
           );
      \spi_inst/n262_s857\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(65),
               I1 => BUFF_CRC(64),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_594\
           );
      \spi_inst/n262_s858\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(67),
               I1 => BUFF_CRC(66),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_595\
           );
      \spi_inst/n262_s859\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(69),
               I1 => BUFF_CRC(68),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_596\
           );
      \spi_inst/n262_s860\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(71),
               I1 => BUFF_CRC(70),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_597\
           );
      \spi_inst/n262_s861\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(73),
               I1 => BUFF_CRC(72),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_598\
           );
      \spi_inst/n262_s862\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(75),
               I1 => BUFF_CRC(74),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_599\
           );
      \spi_inst/n262_s863\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(77),
               I1 => BUFF_CRC(76),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_600\
           );
      \spi_inst/n262_s864\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(79),
               I1 => BUFF_CRC(78),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_601\
           );
      \spi_inst/n262_s865\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(81),
               I1 => BUFF_CRC(80),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_602\
           );
      \spi_inst/n262_s866\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(83),
               I1 => BUFF_CRC(82),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_603\
           );
      \spi_inst/n262_s867\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(85),
               I1 => BUFF_CRC(84),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_604\
           );
      \spi_inst/n262_s868\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(87),
               I1 => BUFF_CRC(86),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_605\
           );
      \spi_inst/n262_s869\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(97),
               I1 => BUFF_CRC(96),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_606\
           );
      \spi_inst/n262_s870\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(99),
               I1 => BUFF_CRC(98),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_607\
           );
      \spi_inst/n262_s871\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(101),
               I1 => BUFF_CRC(100),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_608\
           );
      \spi_inst/n262_s872\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(103),
               I1 => BUFF_CRC(102),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_609\
           );
      \spi_inst/n262_s873\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(105),
               I1 => BUFF_CRC(104),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_610\
           );
      \spi_inst/n262_s874\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(107),
               I1 => BUFF_CRC(106),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_611\
           );
      \spi_inst/n262_s875\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(109),
               I1 => BUFF_CRC(108),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_612\
           );
      \spi_inst/n262_s876\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(111),
               I1 => BUFF_CRC(110),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_613\
           );
      \spi_inst/n262_s877\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(113),
               I1 => BUFF_CRC(112),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_614\
           );
      \spi_inst/n262_s878\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(115),
               I1 => BUFF_CRC(114),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_615\
           );
      \spi_inst/n262_s879\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(117),
               I1 => BUFF_CRC(116),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_616\
           );
      \spi_inst/n262_s880\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(119),
               I1 => BUFF_CRC(118),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_617\
           );
      \spi_inst/n262_s881\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(129),
               I1 => BUFF_CRC(128),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_618\
           );
      \spi_inst/n262_s882\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(131),
               I1 => BUFF_CRC(130),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_619\
           );
      \spi_inst/n262_s883\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(133),
               I1 => BUFF_CRC(132),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_620\
           );
      \spi_inst/n262_s884\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(135),
               I1 => BUFF_CRC(134),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_621\
           );
      \spi_inst/n262_s885\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(137),
               I1 => BUFF_CRC(136),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_622\
           );
      \spi_inst/n262_s886\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(139),
               I1 => BUFF_CRC(138),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_623\
           );
      \spi_inst/n262_s887\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(141),
               I1 => BUFF_CRC(140),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_624\
           );
      \spi_inst/n262_s888\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(143),
               I1 => BUFF_CRC(142),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_625\
           );
      \spi_inst/n262_s889\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(145),
               I1 => BUFF_CRC(144),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_626\
           );
      \spi_inst/n262_s890\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(147),
               I1 => BUFF_CRC(146),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_627\
           );
      \spi_inst/n262_s891\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(149),
               I1 => BUFF_CRC(148),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_628\
           );
      \spi_inst/n262_s892\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(151),
               I1 => BUFF_CRC(150),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_629\
           );
      \spi_inst/n262_s893\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(161),
               I1 => BUFF_CRC(160),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_630\
           );
      \spi_inst/n262_s894\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(163),
               I1 => BUFF_CRC(162),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_631\
           );
      \spi_inst/n262_s895\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(165),
               I1 => BUFF_CRC(164),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_632\
           );
      \spi_inst/n262_s896\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(167),
               I1 => BUFF_CRC(166),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_633\
           );
      \spi_inst/n262_s897\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(169),
               I1 => BUFF_CRC(168),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_634\
           );
      \spi_inst/n262_s898\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(171),
               I1 => BUFF_CRC(170),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_635\
           );
      \spi_inst/n262_s899\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(173),
               I1 => BUFF_CRC(172),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_636\
           );
      \spi_inst/n262_s900\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(175),
               I1 => BUFF_CRC(174),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_637\
           );
      \spi_inst/n262_s901\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(177),
               I1 => BUFF_CRC(176),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_638\
           );
      \spi_inst/n262_s902\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(179),
               I1 => BUFF_CRC(178),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_639\
           );
      \spi_inst/n262_s903\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(181),
               I1 => BUFF_CRC(180),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_640\
           );
      \spi_inst/n262_s904\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(183),
               I1 => BUFF_CRC(182),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_641\
           );
      \spi_inst/n262_s905\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(193),
               I1 => BUFF_CRC(192),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_642\
           );
      \spi_inst/n262_s906\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(195),
               I1 => BUFF_CRC(194),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_643\
           );
      \spi_inst/n262_s907\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(197),
               I1 => BUFF_CRC(196),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_644\
           );
      \spi_inst/n262_s908\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(199),
               I1 => BUFF_CRC(198),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_645\
           );
      \spi_inst/n262_s909\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(201),
               I1 => BUFF_CRC(200),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_646\
           );
      \spi_inst/n262_s910\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(203),
               I1 => BUFF_CRC(202),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_647\
           );
      \spi_inst/n262_s911\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(205),
               I1 => BUFF_CRC(204),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_648\
           );
      \spi_inst/n262_s912\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(207),
               I1 => BUFF_CRC(206),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_649\
           );
      \spi_inst/n262_s913\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(209),
               I1 => BUFF_CRC(208),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_650\
           );
      \spi_inst/n262_s914\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(211),
               I1 => BUFF_CRC(210),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_651\
           );
      \spi_inst/n262_s915\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(213),
               I1 => BUFF_CRC(212),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_652\
           );
      \spi_inst/n262_s916\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(215),
               I1 => BUFF_CRC(214),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_653\
           );
      \spi_inst/n262_s917\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(225),
               I1 => BUFF_CRC(224),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_654\
           );
      \spi_inst/n262_s918\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(227),
               I1 => BUFF_CRC(226),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_655\
           );
      \spi_inst/n262_s919\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(229),
               I1 => BUFF_CRC(228),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_656\
           );
      \spi_inst/n262_s920\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(231),
               I1 => BUFF_CRC(230),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_657\
           );
      \spi_inst/n262_s921\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(233),
               I1 => BUFF_CRC(232),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_658\
           );
      \spi_inst/n262_s922\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(235),
               I1 => BUFF_CRC(234),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_659\
           );
      \spi_inst/n262_s923\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(237),
               I1 => BUFF_CRC(236),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_660\
           );
      \spi_inst/n262_s924\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(239),
               I1 => BUFF_CRC(238),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_661\
           );
      \spi_inst/n262_s925\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(241),
               I1 => BUFF_CRC(240),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_662\
           );
      \spi_inst/n262_s926\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(243),
               I1 => BUFF_CRC(242),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_663\
           );
      \spi_inst/n262_s927\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(245),
               I1 => BUFF_CRC(244),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_664\
           );
      \spi_inst/n262_s928\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(247),
               I1 => BUFF_CRC(246),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_665\
           );
      \spi_inst/n262_s929\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(257),
               I1 => BUFF_CRC(256),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_666\
           );
      \spi_inst/n262_s930\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(259),
               I1 => BUFF_CRC(258),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_667\
           );
      \spi_inst/n262_s931\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(261),
               I1 => BUFF_CRC(260),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_668\
           );
      \spi_inst/n262_s932\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(263),
               I1 => BUFF_CRC(262),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_669\
           );
      \spi_inst/n262_s933\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(265),
               I1 => BUFF_CRC(264),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_670\
           );
      \spi_inst/n262_s934\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(267),
               I1 => BUFF_CRC(266),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_671\
           );
      \spi_inst/n262_s935\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(269),
               I1 => BUFF_CRC(268),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_672\
           );
      \spi_inst/n262_s936\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(271),
               I1 => BUFF_CRC(270),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_673\
           );
      \spi_inst/n262_s937\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(273),
               I1 => BUFF_CRC(272),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_674\
           );
      \spi_inst/n262_s938\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(275),
               I1 => BUFF_CRC(274),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_675\
           );
      \spi_inst/n262_s939\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(277),
               I1 => BUFF_CRC(276),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_676\
           );
      \spi_inst/n262_s940\ : LUT3
           generic map (
               INIT => X"CA"
           )
           port map (
               I0 => BUFF_CRC(279),
               I1 => BUFF_CRC(278),
               I2 => \spi_inst/bit_index\(0),
               F => \spi_inst/n262_677\
           );
      \spi_inst/n661_s10\ : LUT3
           generic map (
               INIT => X"43"
           )
           port map (
               I0 => \spi_inst/state\(2),
               I1 => \spi_inst/state\(1),
               I2 => \spi_inst/state\(0),
               F => \spi_inst/n661_15\
           );
      \spi_inst/n663_s5\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/state\(0),
               I1 => \spi_inst/state\(2),
               F => \spi_inst/n663_9\
           );
      \spi_inst/n799_s12\ : LUT3
           generic map (
               INIT => X"F8"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/n799_29\,
               I2 => \spi_inst/n799_19\,
               F => \spi_inst/n799_16\
           );
      \spi_inst/n800_s12\ : LUT4
           generic map (
               INIT => X"0708"
           )
           port map (
               I0 => \spi_inst/state\(0),
               I1 => \spi_inst/n799_17\,
               I2 => \spi_inst/state\(2),
               I3 => \spi_inst/state\(1),
               F => \spi_inst/n800_16\
           );
      \spi_inst/n663_s6\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \spi_inst/EDGE_REG\,
               I1 => \spi_inst/n663_16\,
               F => \spi_inst/n663_11\
           );
      \spi_inst/n647_s12\ : LUT4
           generic map (
               INIT => X"FFF8"
           )
           port map (
               I0 => \spi_inst/n795_16\,
               I1 => \spi_inst/delay_counter\(6),
               I2 => \spi_inst/n801_18\,
               I3 => \spi_inst/n647_17\,
               F => \spi_inst/n647_16\
           );
      \spi_inst/n661_s11\ : LUT4
           generic map (
               INIT => X"FAC0"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/n661_18\,
               I2 => SPI_DONE_Z,
               I3 => \spi_inst/n799_29\,
               F => \spi_inst/n661_17\
           );
      \spi_inst/n597_s14\ : LUT4
           generic map (
               INIT => X"F400"
           )
           port map (
               I0 => \spi_inst/n597_21\,
               I1 => \spi_inst/n597_22\,
               I2 => \spi_inst/n663_16\,
               I3 => \spi_inst/delay_counter\(31),
               F => \spi_inst/n597_20\
           );
      \spi_inst/n599_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n599_19\,
               I2 => \spi_inst/n801_20\,
               I3 => \spi_inst/delay_counter\(30),
               F => \spi_inst/n599_18\
           );
      \spi_inst/n601_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n601_21\,
               I2 => \spi_inst/n801_20\,
               I3 => \spi_inst/delay_counter\(29),
               F => \spi_inst/n601_18\
           );
      \spi_inst/n603_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n603_21\,
               I2 => \spi_inst/n801_20\,
               I3 => \spi_inst/delay_counter\(28),
               F => \spi_inst/n603_18\
           );
      \spi_inst/n605_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n605_19\,
               I2 => \spi_inst/n801_20\,
               I3 => \spi_inst/delay_counter\(27),
               F => \spi_inst/n605_18\
           );
      \spi_inst/n607_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n607_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(26),
               F => \spi_inst/n607_18\
           );
      \spi_inst/n609_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n609_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(25),
               F => \spi_inst/n609_18\
           );
      \spi_inst/n611_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n611_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(24),
               F => \spi_inst/n611_18\
           );
      \spi_inst/n613_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n613_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(23),
               F => \spi_inst/n613_18\
           );
      \spi_inst/n615_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n615_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(22),
               F => \spi_inst/n615_18\
           );
      \spi_inst/n617_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n617_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(21),
               F => \spi_inst/n617_18\
           );
      \spi_inst/n619_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n619_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(20),
               F => \spi_inst/n619_18\
           );
      \spi_inst/n621_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n621_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(19),
               F => \spi_inst/n621_18\
           );
      \spi_inst/n623_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n623_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(18),
               F => \spi_inst/n623_18\
           );
      \spi_inst/n625_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n625_22\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(17),
               F => \spi_inst/n625_18\
           );
      \spi_inst/n627_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n627_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(16),
               F => \spi_inst/n627_18\
           );
      \spi_inst/n629_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n629_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(15),
               F => \spi_inst/n629_18\
           );
      \spi_inst/n631_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n631_21\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(14),
               F => \spi_inst/n631_18\
           );
      \spi_inst/n633_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n633_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(13),
               F => \spi_inst/n633_18\
           );
      \spi_inst/n635_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n635_21\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(12),
               F => \spi_inst/n635_18\
           );
      \spi_inst/n637_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n637_21\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(11),
               F => \spi_inst/n637_18\
           );
      \spi_inst/n639_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n639_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(10),
               F => \spi_inst/n639_18\
           );
      \spi_inst/n641_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n641_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(9),
               F => \spi_inst/n641_18\
           );
      \spi_inst/n643_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n643_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(8),
               F => \spi_inst/n643_18\
           );
      \spi_inst/n645_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n645_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(7),
               F => \spi_inst/n645_18\
           );
      \spi_inst/n651_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n651_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(4),
               F => \spi_inst/n651_18\
           );
      \spi_inst/n653_s13\ : LUT4
           generic map (
               INIT => X"BAC0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n653_19\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(3),
               F => \spi_inst/n653_18\
           );
      \spi_inst/n657_s13\ : LUT4
           generic map (
               INIT => X"A4E0"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/n597_22\,
               I2 => \spi_inst/delay_counter\(1),
               I3 => \spi_inst/n659_23\,
               F => \spi_inst/n657_18\
           );
      \spi_inst/n260_s4\ : LUT2
           generic map (
               INIT => X"9"
           )
           port map (
               I0 => \spi_inst/bit_index\(0),
               I1 => \spi_inst/bit_index\(1),
               F => \spi_inst/n260_10\
           );
      \spi_inst/n258_s4\ : LUT4
           generic map (
               INIT => X"FE01"
           )
           port map (
               I0 => \spi_inst/bit_index\(0),
               I1 => \spi_inst/bit_index\(1),
               I2 => \spi_inst/bit_index\(2),
               I3 => \spi_inst/bit_index\(3),
               F => \spi_inst/n258_10\
           );
      \spi_inst/n257_s4\ : LUT2
           generic map (
               INIT => X"6"
           )
           port map (
               I0 => \spi_inst/bit_index\(4),
               I1 => \spi_inst/n257_11\,
               F => \spi_inst/n257_10\
           );
      \spi_inst/spi_nss_s4\ : LUT4
           generic map (
               INIT => X"2003"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/state\(2),
               I2 => \spi_inst/state\(1),
               I3 => \spi_inst/state\(0),
               F => \spi_inst/spi_nss_6\
           );
      \spi_inst/EDGE_REG_s4\ : LUT4
           generic map (
               INIT => X"0230"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/state\(2),
               I2 => \spi_inst/state\(1),
               I3 => \spi_inst/state\(0),
               F => \spi_inst/EDGE_REG_9\
           );
      \spi_inst/n453_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \spi_inst/bit_index\(9),
               I1 => \spi_inst/n453_6\,
               I2 => \spi_inst/n795_16\,
               F => \spi_inst/n453_5\
           );
      \spi_inst/n452_s1\ : LUT4
           generic map (
               INIT => X"B400"
           )
           port map (
               I0 => \spi_inst/bit_index\(9),
               I1 => \spi_inst/n453_6\,
               I2 => \spi_inst/bit_index\(10),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n452_5\
           );
      \spi_inst/n451_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n453_6\,
               I1 => \spi_inst/n451_6\,
               I2 => \spi_inst/bit_index\(11),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n451_5\
           );
      \spi_inst/n450_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n453_6\,
               I1 => \spi_inst/n450_8\,
               I2 => \spi_inst/bit_index\(12),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n450_5\
           );
      \spi_inst/n449_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \spi_inst/bit_index\(13),
               I1 => \spi_inst/n449_6\,
               I2 => \spi_inst/n795_16\,
               F => \spi_inst/n449_5\
           );
      \spi_inst/n447_s1\ : LUT4
           generic map (
               INIT => X"B400"
           )
           port map (
               I0 => \spi_inst/bit_index\(14),
               I1 => \spi_inst/n448_6\,
               I2 => \spi_inst/bit_index\(15),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n447_5\
           );
      \spi_inst/n446_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n446_6\,
               I1 => \spi_inst/n448_6\,
               I2 => \spi_inst/bit_index\(16),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n446_5\
           );
      \spi_inst/n445_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n448_6\,
               I1 => \spi_inst/n445_8\,
               I2 => \spi_inst/bit_index\(17),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n445_5\
           );
      \spi_inst/n443_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \spi_inst/bit_index\(19),
               I1 => \spi_inst/n443_6\,
               I2 => \spi_inst/n795_16\,
               F => \spi_inst/n443_5\
           );
      \spi_inst/n442_s1\ : LUT4
           generic map (
               INIT => X"B400"
           )
           port map (
               I0 => \spi_inst/bit_index\(19),
               I1 => \spi_inst/n443_6\,
               I2 => \spi_inst/bit_index\(20),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n442_5\
           );
      \spi_inst/n441_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n441_6\,
               I1 => \spi_inst/n443_6\,
               I2 => \spi_inst/bit_index\(21),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n441_5\
           );
      \spi_inst/n440_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n443_6\,
               I1 => \spi_inst/n440_8\,
               I2 => \spi_inst/bit_index\(22),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n440_5\
           );
      \spi_inst/n439_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n439_6\,
               I1 => \spi_inst/n443_6\,
               I2 => \spi_inst/bit_index\(23),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n439_5\
           );
      \spi_inst/n438_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \spi_inst/bit_index\(24),
               I1 => \spi_inst/n438_6\,
               I2 => \spi_inst/n795_16\,
               F => \spi_inst/n438_5\
           );
      \spi_inst/n437_s1\ : LUT4
           generic map (
               INIT => X"B400"
           )
           port map (
               I0 => \spi_inst/bit_index\(24),
               I1 => \spi_inst/n438_6\,
               I2 => \spi_inst/bit_index\(25),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n437_5\
           );
      \spi_inst/n436_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n436_6\,
               I1 => \spi_inst/n438_6\,
               I2 => \spi_inst/bit_index\(26),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n436_5\
           );
      \spi_inst/n435_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n435_8\,
               I1 => \spi_inst/n438_6\,
               I2 => \spi_inst/bit_index\(27),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n435_5\
           );
      \spi_inst/n434_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \spi_inst/bit_index\(28),
               I1 => \spi_inst/n434_6\,
               I2 => \spi_inst/n795_16\,
               F => \spi_inst/n434_5\
           );
      \spi_inst/n433_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \spi_inst/bit_index\(29),
               I1 => \spi_inst/n433_8\,
               I2 => \spi_inst/n795_16\,
               F => \spi_inst/n433_5\
           );
      \spi_inst/n432_s1\ : LUT4
           generic map (
               INIT => X"B400"
           )
           port map (
               I0 => \spi_inst/bit_index\(29),
               I1 => \spi_inst/n433_8\,
               I2 => \spi_inst/bit_index\(30),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n432_5\
           );
      \spi_inst/n431_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n431_6\,
               I1 => \spi_inst/n433_8\,
               I2 => \spi_inst/bit_index\(31),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n431_5\
           );
      \spi_inst/n430_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n430_8\,
               I1 => \spi_inst/n433_8\,
               I2 => \spi_inst/bit_index\(32),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n430_5\
           );
      \spi_inst/n429_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \spi_inst/bit_index\(33),
               I1 => \spi_inst/n429_6\,
               I2 => \spi_inst/n795_16\,
               F => \spi_inst/n429_5\
           );
      \spi_inst/n427_s1\ : LUT4
           generic map (
               INIT => X"B400"
           )
           port map (
               I0 => \spi_inst/bit_index\(34),
               I1 => \spi_inst/n428_6\,
               I2 => \spi_inst/bit_index\(35),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n427_5\
           );
      \spi_inst/n426_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n426_6\,
               I1 => \spi_inst/n428_6\,
               I2 => \spi_inst/bit_index\(36),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n426_5\
           );
      \spi_inst/n425_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n428_6\,
               I1 => \spi_inst/n425_8\,
               I2 => \spi_inst/bit_index\(37),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n425_5\
           );
      \spi_inst/n424_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \spi_inst/bit_index\(38),
               I1 => \spi_inst/n424_10\,
               I2 => \spi_inst/n795_16\,
               F => \spi_inst/n424_5\
           );
      \spi_inst/n422_s1\ : LUT4
           generic map (
               INIT => X"B400"
           )
           port map (
               I0 => \spi_inst/bit_index\(39),
               I1 => \spi_inst/n423_6\,
               I2 => \spi_inst/bit_index\(40),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n422_5\
           );
      \spi_inst/n421_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n423_6\,
               I1 => \spi_inst/n421_6\,
               I2 => \spi_inst/bit_index\(41),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n421_5\
           );
      \spi_inst/n420_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n420_6\,
               I1 => \spi_inst/n424_10\,
               I2 => \spi_inst/bit_index\(42),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n420_5\
           );
      \spi_inst/n419_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \spi_inst/bit_index\(43),
               I1 => \spi_inst/n419_9\,
               I2 => \spi_inst/n795_16\,
               F => \spi_inst/n419_5\
           );
      \spi_inst/n417_s1\ : LUT4
           generic map (
               INIT => X"B400"
           )
           port map (
               I0 => \spi_inst/bit_index\(44),
               I1 => \spi_inst/n418_6\,
               I2 => \spi_inst/bit_index\(45),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n417_5\
           );
      \spi_inst/n416_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n416_6\,
               I1 => \spi_inst/n418_6\,
               I2 => \spi_inst/bit_index\(46),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n416_5\
           );
      \spi_inst/n415_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n415_6\,
               I1 => \spi_inst/n418_6\,
               I2 => \spi_inst/bit_index\(47),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n415_5\
           );
      \spi_inst/n414_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n419_9\,
               I1 => \spi_inst/n414_6\,
               I2 => \spi_inst/bit_index\(48),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n414_5\
           );
      \spi_inst/n413_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \spi_inst/bit_index\(49),
               I1 => \spi_inst/n413_6\,
               I2 => \spi_inst/n795_16\,
               F => \spi_inst/n413_5\
           );
      \spi_inst/n412_s1\ : LUT4
           generic map (
               INIT => X"B400"
           )
           port map (
               I0 => \spi_inst/bit_index\(49),
               I1 => \spi_inst/n413_6\,
               I2 => \spi_inst/bit_index\(50),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n412_5\
           );
      \spi_inst/n411_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n411_6\,
               I1 => \spi_inst/n413_6\,
               I2 => \spi_inst/bit_index\(51),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n411_5\
           );
      \spi_inst/n410_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n410_6\,
               I1 => \spi_inst/n413_6\,
               I2 => \spi_inst/bit_index\(52),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n410_5\
           );
      \spi_inst/n408_s1\ : LUT4
           generic map (
               INIT => X"B400"
           )
           port map (
               I0 => \spi_inst/bit_index\(53),
               I1 => \spi_inst/n409_6\,
               I2 => \spi_inst/bit_index\(54),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n408_5\
           );
      \spi_inst/n407_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n407_6\,
               I1 => \spi_inst/n409_6\,
               I2 => \spi_inst/bit_index\(55),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n407_5\
           );
      \spi_inst/n406_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n406_8\,
               I1 => \spi_inst/n409_6\,
               I2 => \spi_inst/bit_index\(56),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n406_5\
           );
      \spi_inst/n405_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n405_8\,
               I1 => \spi_inst/n409_6\,
               I2 => \spi_inst/bit_index\(57),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n405_5\
           );
      \spi_inst/n404_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \spi_inst/bit_index\(58),
               I1 => \spi_inst/n404_6\,
               I2 => \spi_inst/n795_16\,
               F => \spi_inst/n404_5\
           );
      \spi_inst/n403_s1\ : LUT4
           generic map (
               INIT => X"B400"
           )
           port map (
               I0 => \spi_inst/bit_index\(58),
               I1 => \spi_inst/n404_6\,
               I2 => \spi_inst/bit_index\(59),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n403_5\
           );
      \spi_inst/n402_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n404_6\,
               I1 => \spi_inst/n402_6\,
               I2 => \spi_inst/bit_index\(60),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n402_5\
           );
      \spi_inst/n401_s1\ : LUT3
           generic map (
               INIT => X"60"
           )
           port map (
               I0 => \spi_inst/bit_index\(61),
               I1 => \spi_inst/n401_11\,
               I2 => \spi_inst/n795_16\,
               F => \spi_inst/n401_5\
           );
      \spi_inst/n400_s1\ : LUT4
           generic map (
               INIT => X"B400"
           )
           port map (
               I0 => \spi_inst/bit_index\(61),
               I1 => \spi_inst/n401_11\,
               I2 => \spi_inst/bit_index\(62),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n400_5\
           );
      \spi_inst/n399_s1\ : LUT4
           generic map (
               INIT => X"7800"
           )
           port map (
               I0 => \spi_inst/n404_6\,
               I1 => \spi_inst/n399_6\,
               I2 => \spi_inst/bit_index\(63),
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n399_5\
           );
      \spi_inst/n397_s4\ : LUT4
           generic map (
               INIT => X"F400"
           )
           port map (
               I0 => \spi_inst/n397_10\,
               I1 => \spi_inst/n397_11\,
               I2 => \spi_inst/n397_12\,
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n397_9\
           );
      \spi_inst/n665_s13\ : LUT4
           generic map (
               INIT => X"3001"
           )
           port map (
               I0 => \spi_inst/n665_20\,
               I1 => \spi_inst/state\(2),
               I2 => \spi_inst/state\(1),
               I3 => \spi_inst/state\(0),
               F => \spi_inst/n665_19\
           );
      \spi_inst/n8_s1\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \spi_inst/n8_6\,
               I1 => \spi_inst/n8_7\,
               I2 => \spi_inst/n8_8\,
               I3 => \spi_inst/n8_9\,
               F => \spi_inst/n8_4\
           );
      \spi_inst/n8_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \spi_inst/n8_10\,
               I1 => \spi_inst/n8_11\,
               I2 => \spi_inst/n8_12\,
               I3 => \spi_inst/n8_13\,
               F => \spi_inst/n8_5\
           );
      \spi_inst/n799_s13\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \spi_inst/delay_counter\(31),
               I1 => \spi_inst/n799_20\,
               I2 => \spi_inst/n799_21\,
               I3 => \spi_inst/n799_22\,
               F => \spi_inst/n799_17\
           );
      \spi_inst/n799_s15\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => \spi_inst/state\(0),
               I1 => \spi_inst/state\(1),
               I2 => \spi_inst/n799_23\,
               I3 => \spi_inst/state\(2),
               F => \spi_inst/n799_19\
           );
      \spi_inst/n801_s14\ : LUT4
           generic map (
               INIT => X"CA00"
           )
           port map (
               I0 => \spi_inst/n665_20\,
               I1 => \spi_inst/n663_13\,
               I2 => \spi_inst/state\(1),
               I3 => \spi_inst/n663_9\,
               F => \spi_inst/n801_18\
           );
      \spi_inst/n647_s13\ : LUT4
           generic map (
               INIT => X"B400"
           )
           port map (
               I0 => \spi_inst/delay_counter\(5),
               I1 => \spi_inst/n647_20\,
               I2 => \spi_inst/delay_counter\(6),
               I3 => \spi_inst/n597_22\,
               F => \spi_inst/n647_17\
           );
      \spi_inst/n649_s13\ : LUT4
           generic map (
               INIT => X"453F"
           )
           port map (
               I0 => \spi_inst/n795_16\,
               I1 => \spi_inst/n647_20\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(5),
               F => \spi_inst/n649_17\
           );
      \spi_inst/n655_s13\ : LUT4
           generic map (
               INIT => X"453F"
           )
           port map (
               I0 => \spi_inst/n795_16\,
               I1 => \spi_inst/n655_18\,
               I2 => \spi_inst/n597_22\,
               I3 => \spi_inst/delay_counter\(2),
               F => \spi_inst/n655_17\
           );
      \spi_inst/n661_s12\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => spi_done_reg,
               I1 => \spi_inst/state\(0),
               I2 => \spi_inst/state\(1),
               I3 => \spi_inst/state\(2),
               F => \spi_inst/n661_18\
           );
      \spi_inst/n597_s15\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => \spi_inst/delay_counter\(30),
               I1 => \spi_inst/delay_counter\(29),
               I2 => \spi_inst/delay_counter\(28),
               I3 => \spi_inst/n603_21\,
               F => \spi_inst/n597_21\
           );
      \spi_inst/n597_s16\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \spi_inst/state\(2),
               I1 => \spi_inst/state\(0),
               F => \spi_inst/n597_22\
           );
      \spi_inst/n599_s14\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \spi_inst/delay_counter\(29),
               I1 => \spi_inst/delay_counter\(28),
               I2 => \spi_inst/n603_21\,
               F => \spi_inst/n599_19\
           );
      \spi_inst/n605_s14\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \spi_inst/n799_20\,
               I1 => \spi_inst/n799_21\,
               F => \spi_inst/n605_19\
           );
      \spi_inst/n607_s14\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/n607_24\,
               I2 => \spi_inst/n607_21\,
               I3 => \spi_inst/n607_22\,
               F => \spi_inst/n607_19\
           );
      \spi_inst/n609_s14\ : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/n607_22\,
               I2 => \spi_inst/n609_20\,
               F => \spi_inst/n609_19\
           );
      \spi_inst/n611_s14\ : LUT4
           generic map (
               INIT => X"1000"
           )
           port map (
               I0 => \spi_inst/delay_counter\(23),
               I1 => \spi_inst/n799_17\,
               I2 => \spi_inst/n607_24\,
               I3 => \spi_inst/n607_22\,
               F => \spi_inst/n611_19\
           );
      \spi_inst/n613_s14\ : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/n607_24\,
               I2 => \spi_inst/n607_22\,
               F => \spi_inst/n613_19\
           );
      \spi_inst/n615_s14\ : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/n607_22\,
               I2 => \spi_inst/n615_20\,
               F => \spi_inst/n615_19\
           );
      \spi_inst/n617_s14\ : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/n617_20\,
               I2 => \spi_inst/n607_22\,
               F => \spi_inst/n617_19\
           );
      \spi_inst/n619_s14\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => \spi_inst/delay_counter\(19),
               I1 => \spi_inst/delay_counter\(18),
               I2 => \spi_inst/n799_17\,
               I3 => \spi_inst/n607_22\,
               F => \spi_inst/n619_19\
           );
      \spi_inst/n621_s14\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \spi_inst/delay_counter\(18),
               I1 => \spi_inst/n799_17\,
               I2 => \spi_inst/n607_22\,
               F => \spi_inst/n621_19\
           );
      \spi_inst/n623_s14\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/n607_22\,
               F => \spi_inst/n623_19\
           );
      \spi_inst/n627_s14\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => \spi_inst/delay_counter\(15),
               I1 => \spi_inst/delay_counter\(14),
               I2 => \spi_inst/delay_counter\(13),
               I3 => \spi_inst/n633_19\,
               F => \spi_inst/n627_19\
           );
      \spi_inst/n629_s14\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \spi_inst/delay_counter\(14),
               I1 => \spi_inst/delay_counter\(13),
               I2 => \spi_inst/n633_19\,
               F => \spi_inst/n629_19\
           );
      \spi_inst/n633_s14\ : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/n633_20\,
               I2 => \spi_inst/n633_23\,
               F => \spi_inst/n633_19\
           );
      \spi_inst/n639_s14\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/n633_23\,
               F => \spi_inst/n639_19\
           );
      \spi_inst/n641_s14\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \spi_inst/delay_counter\(8),
               I1 => \spi_inst/delay_counter\(7),
               I2 => \spi_inst/n645_19\,
               F => \spi_inst/n641_19\
           );
      \spi_inst/n643_s14\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \spi_inst/delay_counter\(7),
               I1 => \spi_inst/n645_19\,
               F => \spi_inst/n643_19\
           );
      \spi_inst/n645_s14\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => \spi_inst/delay_counter\(6),
               I1 => \spi_inst/delay_counter\(5),
               I2 => \spi_inst/n799_17\,
               I3 => \spi_inst/n645_20\,
               F => \spi_inst/n645_19\
           );
      \spi_inst/n651_s14\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \spi_inst/delay_counter\(3),
               I1 => \spi_inst/n653_19\,
               F => \spi_inst/n651_19\
           );
      \spi_inst/n653_s14\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/delay_counter\(2),
               I1 => \spi_inst/delay_counter\(1),
               I2 => \spi_inst/delay_counter\(0),
               I3 => \spi_inst/n799_17\,
               F => \spi_inst/n653_19\
           );
      \spi_inst/n259_s5\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/bit_index\(0),
               I1 => \spi_inst/bit_index\(1),
               F => \spi_inst/n259_11\
           );
      \spi_inst/n257_s5\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/bit_index\(0),
               I1 => \spi_inst/bit_index\(1),
               I2 => \spi_inst/bit_index\(2),
               I3 => \spi_inst/bit_index\(3),
               F => \spi_inst/n257_11\
           );
      \spi_inst/n455_s2\ : LUT4
           generic map (
               INIT => X"BF40"
           )
           port map (
               I0 => \spi_inst/bit_index\(6),
               I1 => \spi_inst/n257_11\,
               I2 => \spi_inst/n456_7\,
               I3 => \spi_inst/bit_index\(7),
               F => \spi_inst/n455_6\
           );
      \spi_inst/n453_s2\ : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => \spi_inst/bit_index\(8),
               I1 => \spi_inst/n257_11\,
               I2 => \spi_inst/n453_7\,
               F => \spi_inst/n453_6\
           );
      \spi_inst/n451_s2\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/bit_index\(9),
               I1 => \spi_inst/bit_index\(10),
               F => \spi_inst/n451_6\
           );
      \spi_inst/n449_s2\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \spi_inst/bit_index\(8),
               I1 => \spi_inst/n257_11\,
               I2 => \spi_inst/n453_7\,
               I3 => \spi_inst/n449_7\,
               F => \spi_inst/n449_6\
           );
      \spi_inst/n448_s2\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \spi_inst/bit_index\(13),
               I1 => \spi_inst/n449_6\,
               F => \spi_inst/n448_6\
           );
      \spi_inst/n446_s2\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/bit_index\(14),
               I1 => \spi_inst/bit_index\(15),
               F => \spi_inst/n446_6\
           );
      \spi_inst/n443_s2\ : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => \spi_inst/bit_index\(18),
               I1 => \spi_inst/n449_6\,
               I2 => \spi_inst/n444_7\,
               F => \spi_inst/n443_6\
           );
      \spi_inst/n441_s2\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/bit_index\(19),
               I1 => \spi_inst/bit_index\(20),
               F => \spi_inst/n441_6\
           );
      \spi_inst/n439_s2\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/bit_index\(19),
               I1 => \spi_inst/bit_index\(20),
               I2 => \spi_inst/bit_index\(21),
               I3 => \spi_inst/bit_index\(22),
               F => \spi_inst/n439_6\
           );
      \spi_inst/n438_s2\ : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => \spi_inst/bit_index\(23),
               I1 => \spi_inst/n439_6\,
               I2 => \spi_inst/n443_6\,
               F => \spi_inst/n438_6\
           );
      \spi_inst/n436_s2\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/bit_index\(24),
               I1 => \spi_inst/bit_index\(25),
               F => \spi_inst/n436_6\
           );
      \spi_inst/n434_s2\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \spi_inst/n449_6\,
               I1 => \spi_inst/n444_7\,
               I2 => \spi_inst/n434_10\,
               F => \spi_inst/n434_6\
           );
      \spi_inst/n431_s2\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/bit_index\(29),
               I1 => \spi_inst/bit_index\(30),
               F => \spi_inst/n431_6\
           );
      \spi_inst/n429_s2\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \spi_inst/n449_6\,
               I1 => \spi_inst/n444_7\,
               I2 => \spi_inst/n434_10\,
               I3 => \spi_inst/n429_7\,
               F => \spi_inst/n429_6\
           );
      \spi_inst/n428_s2\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \spi_inst/bit_index\(33),
               I1 => \spi_inst/n429_6\,
               F => \spi_inst/n428_6\
           );
      \spi_inst/n426_s2\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/bit_index\(34),
               I1 => \spi_inst/bit_index\(35),
               F => \spi_inst/n426_6\
           );
      \spi_inst/n423_s2\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \spi_inst/bit_index\(38),
               I1 => \spi_inst/n424_10\,
               F => \spi_inst/n423_6\
           );
      \spi_inst/n421_s2\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/bit_index\(39),
               I1 => \spi_inst/bit_index\(40),
               F => \spi_inst/n421_6\
           );
      \spi_inst/n420_s2\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/bit_index\(38),
               I1 => \spi_inst/bit_index\(39),
               I2 => \spi_inst/bit_index\(40),
               I3 => \spi_inst/bit_index\(41),
               F => \spi_inst/n420_6\
           );
      \spi_inst/n418_s2\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \spi_inst/bit_index\(43),
               I1 => \spi_inst/n419_9\,
               F => \spi_inst/n418_6\
           );
      \spi_inst/n416_s2\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/bit_index\(44),
               I1 => \spi_inst/bit_index\(45),
               F => \spi_inst/n416_6\
           );
      \spi_inst/n415_s2\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/bit_index\(44),
               I1 => \spi_inst/bit_index\(45),
               I2 => \spi_inst/bit_index\(46),
               F => \spi_inst/n415_6\
           );
      \spi_inst/n414_s2\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \spi_inst/bit_index\(43),
               I1 => \spi_inst/bit_index\(47),
               I2 => \spi_inst/n415_6\,
               F => \spi_inst/n414_6\
           );
      \spi_inst/n413_s2\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \spi_inst/n419_9\,
               I1 => \spi_inst/n415_6\,
               I2 => \spi_inst/n413_7\,
               F => \spi_inst/n413_6\
           );
      \spi_inst/n411_s2\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/bit_index\(49),
               I1 => \spi_inst/bit_index\(50),
               F => \spi_inst/n411_6\
           );
      \spi_inst/n410_s2\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/bit_index\(49),
               I1 => \spi_inst/bit_index\(50),
               I2 => \spi_inst/bit_index\(51),
               F => \spi_inst/n410_6\
           );
      \spi_inst/n409_s2\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \spi_inst/n419_9\,
               I1 => \spi_inst/n409_7\,
               F => \spi_inst/n409_6\
           );
      \spi_inst/n407_s2\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/bit_index\(53),
               I1 => \spi_inst/bit_index\(54),
               F => \spi_inst/n407_6\
           );
      \spi_inst/n404_s2\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \spi_inst/n434_6\,
               I1 => \spi_inst/n419_7\,
               I2 => \spi_inst/n404_7\,
               F => \spi_inst/n404_6\
           );
      \spi_inst/n402_s2\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/bit_index\(58),
               I1 => \spi_inst/bit_index\(59),
               F => \spi_inst/n402_6\
           );
      \spi_inst/n399_s2\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \spi_inst/bit_index\(61),
               I1 => \spi_inst/bit_index\(62),
               I2 => \spi_inst/n401_9\,
               F => \spi_inst/n399_6\
           );
      \spi_inst/n397_s5\ : LUT3
           generic map (
               INIT => X"E0"
           )
           port map (
               I0 => \spi_inst/n397_13\,
               I1 => \spi_inst/n397_14\,
               I2 => \spi_inst/n455_6\,
               F => \spi_inst/n397_10\
           );
      \spi_inst/n397_s6\ : LUT4
           generic map (
               INIT => X"004F"
           )
           port map (
               I0 => \spi_inst/n397_15\,
               I1 => \spi_inst/n397_16\,
               I2 => \spi_inst/n397_17\,
               I3 => \spi_inst/n779_19\,
               F => \spi_inst/n397_11\
           );
      \spi_inst/n397_s7\ : LUT4
           generic map (
               INIT => X"5C00"
           )
           port map (
               I0 => \spi_inst/n397_18\,
               I1 => \spi_inst/n262_865\,
               I2 => \spi_inst/n257_10\,
               I3 => \spi_inst/n397_19\,
               F => \spi_inst/n397_12\
           );
      \spi_inst/n785_s13\ : LUT3
           generic map (
               INIT => X"B4"
           )
           port map (
               I0 => \spi_inst/bit_index\(4),
               I1 => \spi_inst/n257_11\,
               I2 => \spi_inst/bit_index\(5),
               F => \spi_inst/n785_19\
           );
      \spi_inst/n779_s13\ : LUT3
           generic map (
               INIT => X"78"
           )
           port map (
               I0 => \spi_inst/n257_11\,
               I1 => \spi_inst/n453_7\,
               I2 => \spi_inst/bit_index\(8),
               F => \spi_inst/n779_19\
           );
      \spi_inst/n665_s14\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => spi_done_reg,
               I1 => SPI_START,
               F => \spi_inst/n665_20\
           );
      \spi_inst/n8_s3\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/spi_div_counter\(20),
               I1 => \spi_inst/spi_div_counter\(21),
               I2 => \spi_inst/spi_div_counter\(22),
               I3 => \spi_inst/spi_div_counter\(23),
               F => \spi_inst/n8_6\
           );
      \spi_inst/n8_s4\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/spi_div_counter\(16),
               I1 => \spi_inst/spi_div_counter\(17),
               I2 => \spi_inst/spi_div_counter\(18),
               I3 => \spi_inst/spi_div_counter\(19),
               F => \spi_inst/n8_7\
           );
      \spi_inst/n8_s5\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/spi_div_counter\(28),
               I1 => \spi_inst/spi_div_counter\(29),
               I2 => \spi_inst/spi_div_counter\(30),
               I3 => \spi_inst/spi_div_counter\(31),
               F => \spi_inst/n8_8\
           );
      \spi_inst/n8_s6\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/spi_div_counter\(24),
               I1 => \spi_inst/spi_div_counter\(25),
               I2 => \spi_inst/spi_div_counter\(26),
               I3 => \spi_inst/spi_div_counter\(27),
               F => \spi_inst/n8_9\
           );
      \spi_inst/n8_s7\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/spi_div_counter\(4),
               I1 => \spi_inst/spi_div_counter\(5),
               I2 => \spi_inst/spi_div_counter\(6),
               I3 => \spi_inst/spi_div_counter\(7),
               F => \spi_inst/n8_10\
           );
      \spi_inst/n8_s8\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \spi_inst/spi_div_counter\(2),
               I1 => \spi_inst/spi_div_counter\(1),
               I2 => \spi_inst/spi_div_counter\(0),
               I3 => \spi_inst/spi_div_counter\(3),
               F => \spi_inst/n8_11\
           );
      \spi_inst/n8_s9\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/spi_div_counter\(12),
               I1 => \spi_inst/spi_div_counter\(13),
               I2 => \spi_inst/spi_div_counter\(14),
               I3 => \spi_inst/spi_div_counter\(15),
               F => \spi_inst/n8_12\
           );
      \spi_inst/n8_s10\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/spi_div_counter\(8),
               I1 => \spi_inst/spi_div_counter\(9),
               I2 => \spi_inst/spi_div_counter\(10),
               I3 => \spi_inst/spi_div_counter\(11),
               F => \spi_inst/n8_13\
           );
      \spi_inst/n799_s16\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \spi_inst/n607_21\,
               I1 => \spi_inst/n799_24\,
               I2 => \spi_inst/n799_25\,
               I3 => \spi_inst/n625_20\,
               F => \spi_inst/n799_20\
           );
      \spi_inst/n799_s17\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \spi_inst/n617_20\,
               I1 => \spi_inst/n799_26\,
               I2 => \spi_inst/n633_20\,
               I3 => \spi_inst/n799_27\,
               F => \spi_inst/n799_21\
           );
      \spi_inst/n799_s18\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/delay_counter\(30),
               I1 => \spi_inst/delay_counter\(29),
               I2 => \spi_inst/delay_counter\(28),
               I3 => \spi_inst/delay_counter\(27),
               F => \spi_inst/n799_22\
           );
      \spi_inst/n799_s19\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => SPI_START,
               I1 => spi_done_reg,
               F => \spi_inst/n799_23\
           );
      \spi_inst/n663_s8\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \spi_inst/n434_6\,
               I1 => \spi_inst/n419_7\,
               I2 => \spi_inst/n404_7\,
               I3 => \spi_inst/n663_14\,
               F => \spi_inst/n663_13\
           );
      \spi_inst/n655_s14\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/delay_counter\(1),
               I1 => \spi_inst/delay_counter\(0),
               I2 => \spi_inst/n799_17\,
               F => \spi_inst/n655_18\
           );
      \spi_inst/n607_s16\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/delay_counter\(25),
               I1 => \spi_inst/delay_counter\(24),
               I2 => \spi_inst/delay_counter\(23),
               F => \spi_inst/n607_21\
           );
      \spi_inst/n607_s17\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \spi_inst/delay_counter\(17),
               I1 => \spi_inst/n625_20\,
               I2 => \spi_inst/n633_20\,
               I3 => \spi_inst/n633_23\,
               F => \spi_inst/n607_22\
           );
      \spi_inst/n609_s15\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \spi_inst/delay_counter\(24),
               I1 => \spi_inst/delay_counter\(23),
               I2 => \spi_inst/n607_24\,
               F => \spi_inst/n609_20\
           );
      \spi_inst/n615_s15\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/delay_counter\(21),
               I1 => \spi_inst/delay_counter\(20),
               I2 => \spi_inst/delay_counter\(19),
               I3 => \spi_inst/delay_counter\(18),
               F => \spi_inst/n615_20\
           );
      \spi_inst/n617_s15\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/delay_counter\(20),
               I1 => \spi_inst/delay_counter\(19),
               I2 => \spi_inst/delay_counter\(18),
               F => \spi_inst/n617_20\
           );
      \spi_inst/n625_s15\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/delay_counter\(16),
               I1 => \spi_inst/delay_counter\(15),
               I2 => \spi_inst/delay_counter\(14),
               I3 => \spi_inst/delay_counter\(13),
               F => \spi_inst/n625_20\
           );
      \spi_inst/n633_s15\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/delay_counter\(12),
               I1 => \spi_inst/delay_counter\(11),
               I2 => \spi_inst/delay_counter\(10),
               F => \spi_inst/n633_20\
           );
      \spi_inst/n645_s15\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \spi_inst/delay_counter\(0),
               I1 => \spi_inst/n799_24\,
               F => \spi_inst/n645_20\
           );
      \spi_inst/n456_s3\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/bit_index\(4),
               I1 => \spi_inst/bit_index\(5),
               F => \spi_inst/n456_7\
           );
      \spi_inst/n453_s3\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/bit_index\(4),
               I1 => \spi_inst/bit_index\(5),
               I2 => \spi_inst/bit_index\(6),
               I3 => \spi_inst/bit_index\(7),
               F => \spi_inst/n453_7\
           );
      \spi_inst/n449_s3\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/bit_index\(9),
               I1 => \spi_inst/bit_index\(10),
               I2 => \spi_inst/bit_index\(11),
               I3 => \spi_inst/bit_index\(12),
               F => \spi_inst/n449_7\
           );
      \spi_inst/n444_s3\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => \spi_inst/bit_index\(13),
               I1 => \spi_inst/bit_index\(16),
               I2 => \spi_inst/bit_index\(17),
               I3 => \spi_inst/n446_6\,
               F => \spi_inst/n444_7\
           );
      \spi_inst/n429_s3\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \spi_inst/bit_index\(28),
               I1 => \spi_inst/n429_8\,
               F => \spi_inst/n429_7\
           );
      \spi_inst/n424_s3\ : LUT4
           generic map (
               INIT => X"1000"
           )
           port map (
               I0 => \spi_inst/bit_index\(28),
               I1 => \spi_inst/bit_index\(33),
               I2 => \spi_inst/n429_8\,
               I3 => \spi_inst/n424_8\,
               F => \spi_inst/n424_7\
           );
      \spi_inst/n419_s3\ : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => \spi_inst/bit_index\(42),
               I1 => \spi_inst/n424_7\,
               I2 => \spi_inst/n420_6\,
               F => \spi_inst/n419_7\
           );
      \spi_inst/n413_s3\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/bit_index\(43),
               I1 => \spi_inst/bit_index\(47),
               I2 => \spi_inst/bit_index\(48),
               F => \spi_inst/n413_7\
           );
      \spi_inst/n409_s3\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \spi_inst/bit_index\(52),
               I1 => \spi_inst/n415_6\,
               I2 => \spi_inst/n413_7\,
               I3 => \spi_inst/n410_6\,
               F => \spi_inst/n409_7\
           );
      \spi_inst/n404_s3\ : LUT4
           generic map (
               INIT => X"1000"
           )
           port map (
               I0 => \spi_inst/bit_index\(56),
               I1 => \spi_inst/bit_index\(57),
               I2 => \spi_inst/n409_7\,
               I3 => \spi_inst/n406_8\,
               F => \spi_inst/n404_7\
           );
      \spi_inst/n397_s8\ : LUT4
           generic map (
               INIT => X"00AC"
           )
           port map (
               I0 => \spi_inst/n397_44\,
               I1 => \spi_inst/n397_42\,
               I2 => \spi_inst/n785_19\,
               I3 => \spi_inst/n456_9\,
               F => \spi_inst/n397_13\
           );
      \spi_inst/n397_s9\ : LUT4
           generic map (
               INIT => X"5030"
           )
           port map (
               I0 => \spi_inst/n397_40\,
               I1 => \spi_inst/n397_38\,
               I2 => \spi_inst/n456_9\,
               I3 => \spi_inst/n785_19\,
               F => \spi_inst/n397_14\
           );
      \spi_inst/n397_s10\ : LUT4
           generic map (
               INIT => X"A030"
           )
           port map (
               I0 => \spi_inst/n397_24\,
               I1 => \spi_inst/n262_851\,
               I2 => \spi_inst/n785_19\,
               I3 => \spi_inst/n257_10\,
               F => \spi_inst/n397_15\
           );
      \spi_inst/n397_s11\ : LUT3
           generic map (
               INIT => X"0E"
           )
           port map (
               I0 => \spi_inst/n785_19\,
               I1 => \spi_inst/n262_867\,
               I2 => \spi_inst/n456_9\,
               F => \spi_inst/n397_16\
           );
      \spi_inst/n397_s12\ : LUT4
           generic map (
               INIT => X"00FD"
           )
           port map (
               I0 => \spi_inst/n456_9\,
               I1 => \spi_inst/n397_25\,
               I2 => \spi_inst/n397_26\,
               I3 => \spi_inst/n455_6\,
               F => \spi_inst/n397_17\
           );
      \spi_inst/n397_s13\ : LUT4
           generic map (
               INIT => X"B0BB"
           )
           port map (
               I0 => \spi_inst/bit_index\(1),
               I1 => \spi_inst/n397_27\,
               I2 => \spi_inst/n258_10\,
               I3 => \spi_inst/n262_845\,
               F => \spi_inst/n397_18\
           );
      \spi_inst/n397_s14\ : LUT4
           generic map (
               INIT => X"0010"
           )
           port map (
               I0 => \spi_inst/bit_index\(6),
               I1 => \spi_inst/bit_index\(7),
               I2 => \spi_inst/n779_19\,
               I3 => \spi_inst/n785_19\,
               F => \spi_inst/n397_19\
           );
      \spi_inst/n799_s20\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/delay_counter\(4),
               I1 => \spi_inst/delay_counter\(3),
               I2 => \spi_inst/delay_counter\(2),
               I3 => \spi_inst/delay_counter\(1),
               F => \spi_inst/n799_24\
           );
      \spi_inst/n799_s21\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/delay_counter\(9),
               I1 => \spi_inst/delay_counter\(8),
               I2 => \spi_inst/delay_counter\(6),
               I3 => \spi_inst/delay_counter\(5),
               F => \spi_inst/n799_25\
           );
      \spi_inst/n799_s22\ : LUT2
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/delay_counter\(22),
               I1 => \spi_inst/delay_counter\(21),
               F => \spi_inst/n799_26\
           );
      \spi_inst/n799_s23\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/delay_counter\(26),
               I1 => \spi_inst/delay_counter\(17),
               I2 => \spi_inst/delay_counter\(7),
               I3 => \spi_inst/delay_counter\(0),
               F => \spi_inst/n799_27\
           );
      \spi_inst/n663_s9\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => \spi_inst/bit_index\(61),
               I1 => \spi_inst/bit_index\(62),
               I2 => \spi_inst/bit_index\(63),
               I3 => \spi_inst/n401_9\,
               F => \spi_inst/n663_14\
           );
      \spi_inst/n434_s4\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/bit_index\(18),
               I1 => \spi_inst/bit_index\(23),
               I2 => \spi_inst/bit_index\(26),
               I3 => \spi_inst/bit_index\(27),
               F => \spi_inst/n434_8\
           );
      \spi_inst/n429_s4\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/bit_index\(29),
               I1 => \spi_inst/bit_index\(30),
               I2 => \spi_inst/bit_index\(31),
               I3 => \spi_inst/bit_index\(32),
               F => \spi_inst/n429_8\
           );
      \spi_inst/n424_s4\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/bit_index\(34),
               I1 => \spi_inst/bit_index\(35),
               I2 => \spi_inst/bit_index\(36),
               I3 => \spi_inst/bit_index\(37),
               F => \spi_inst/n424_8\
           );
      \spi_inst/n397_s19\ : LUT4
           generic map (
               INIT => X"7077"
           )
           port map (
               I0 => \spi_inst/n259_11\,
               I1 => \spi_inst/n397_32\,
               I2 => \spi_inst/n258_10\,
               I3 => \spi_inst/n262_803\,
               F => \spi_inst/n397_24\
           );
      \spi_inst/n397_s20\ : LUT4
           generic map (
               INIT => X"A030"
           )
           port map (
               I0 => \spi_inst/n397_33\,
               I1 => \spi_inst/n262_855\,
               I2 => \spi_inst/n785_19\,
               I3 => \spi_inst/n257_10\,
               F => \spi_inst/n397_25\
           );
      \spi_inst/n397_s21\ : LUT4
           generic map (
               INIT => X"00A3"
           )
           port map (
               I0 => \spi_inst/n397_34\,
               I1 => \spi_inst/n262_853\,
               I2 => \spi_inst/n257_10\,
               I3 => \spi_inst/n785_19\,
               F => \spi_inst/n397_26\
           );
      \spi_inst/n397_s22\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \spi_inst/bit_index\(2),
               I1 => \spi_inst/bit_index\(0),
               I2 => \spi_inst/bit_index\(3),
               I3 => BUFF_CRC(59),
               F => \spi_inst/n397_27\
           );
      \spi_inst/n397_s23\ : LUT4
           generic map (
               INIT => X"7077"
           )
           port map (
               I0 => \spi_inst/bit_index\(1),
               I1 => \spi_inst/n397_27\,
               I2 => \spi_inst/n258_10\,
               I3 => \spi_inst/n262_827\,
               F => \spi_inst/n397_28\
           );
      \spi_inst/n397_s24\ : LUT3
           generic map (
               INIT => X"0B"
           )
           port map (
               I0 => \spi_inst/n258_10\,
               I1 => \spi_inst/n262_821\,
               I2 => \spi_inst/n397_27\,
               F => \spi_inst/n397_29\
           );
      \spi_inst/n397_s25\ : LUT4
           generic map (
               INIT => X"770F"
           )
           port map (
               I0 => \spi_inst/n397_35\,
               I1 => \spi_inst/n397_36\,
               I2 => \spi_inst/n262_839\,
               I3 => \spi_inst/n258_10\,
               F => \spi_inst/n397_30\
           );
      \spi_inst/n397_s26\ : LUT4
           generic map (
               INIT => X"BB0F"
           )
           port map (
               I0 => \spi_inst/n260_10\,
               I1 => \spi_inst/n397_36\,
               I2 => \spi_inst/n262_833\,
               I3 => \spi_inst/n258_10\,
               F => \spi_inst/n397_31\
           );
      \spi_inst/n397_s27\ : LUT3
           generic map (
               INIT => X"80"
           )
           port map (
               I0 => \spi_inst/bit_index\(2),
               I1 => \spi_inst/bit_index\(3),
               I2 => BUFF_CRC(59),
               F => \spi_inst/n397_32\
           );
      \spi_inst/n397_s28\ : LUT4
           generic map (
               INIT => X"770F"
           )
           port map (
               I0 => \spi_inst/bit_index\(1),
               I1 => \spi_inst/n397_36\,
               I2 => \spi_inst/n262_815\,
               I3 => \spi_inst/n258_10\,
               F => \spi_inst/n397_33\
           );
      \spi_inst/n397_s29\ : LUT4
           generic map (
               INIT => X"BB0F"
           )
           port map (
               I0 => \spi_inst/n259_11\,
               I1 => \spi_inst/n397_36\,
               I2 => \spi_inst/n262_809\,
               I3 => \spi_inst/n258_10\,
               F => \spi_inst/n397_34\
           );
      \spi_inst/n397_s30\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \spi_inst/bit_index\(0),
               I1 => \spi_inst/bit_index\(1),
               F => \spi_inst/n397_35\
           );
      \spi_inst/n397_s31\ : LUT2
           generic map (
               INIT => X"4"
           )
           port map (
               I0 => \spi_inst/bit_index\(2),
               I1 => BUFF_CRC(59),
               F => \spi_inst/n397_36\
           );
      \spi_inst/n401_s4\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/bit_index\(60),
               I1 => \spi_inst/bit_index\(58),
               I2 => \spi_inst/bit_index\(59),
               F => \spi_inst/n401_9\
           );
      \spi_inst/n406_s3\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/bit_index\(55),
               I1 => \spi_inst/bit_index\(53),
               I2 => \spi_inst/bit_index\(54),
               F => \spi_inst/n406_8\
           );
      \spi_inst/n425_s3\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/bit_index\(36),
               I1 => \spi_inst/bit_index\(34),
               I2 => \spi_inst/bit_index\(35),
               F => \spi_inst/n425_8\
           );
      \spi_inst/n430_s3\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/bit_index\(31),
               I1 => \spi_inst/bit_index\(29),
               I2 => \spi_inst/bit_index\(30),
               F => \spi_inst/n430_8\
           );
      \spi_inst/n440_s3\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/bit_index\(21),
               I1 => \spi_inst/bit_index\(19),
               I2 => \spi_inst/bit_index\(20),
               F => \spi_inst/n440_8\
           );
      \spi_inst/n424_s5\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \spi_inst/n434_10\,
               I1 => \spi_inst/n449_6\,
               I2 => \spi_inst/n444_7\,
               I3 => \spi_inst/n424_7\,
               F => \spi_inst/n424_10\
           );
      \spi_inst/n444_s4\ : LUT4
           generic map (
               INIT => X"6A00"
           )
           port map (
               I0 => \spi_inst/bit_index\(18),
               I1 => \spi_inst/n449_6\,
               I2 => \spi_inst/n444_7\,
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n444_9\
           );
      \spi_inst/n450_s3\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/bit_index\(11),
               I1 => \spi_inst/bit_index\(9),
               I2 => \spi_inst/bit_index\(10),
               F => \spi_inst/n450_8\
           );
      \spi_inst/n456_s4\ : LUT4
           generic map (
               INIT => X"FD02"
           )
           port map (
               I0 => \spi_inst/n257_11\,
               I1 => \spi_inst/bit_index\(4),
               I2 => \spi_inst/bit_index\(5),
               I3 => \spi_inst/bit_index\(6),
               F => \spi_inst/n456_9\
           );
      \spi_inst/n603_s15\ : LUT3
           generic map (
               INIT => X"40"
           )
           port map (
               I0 => \spi_inst/delay_counter\(27),
               I1 => \spi_inst/n799_20\,
               I2 => \spi_inst/n799_21\,
               F => \spi_inst/n603_21\
           );
      \spi_inst/bit_index_8_s4\ : LUT4
           generic map (
               INIT => X"1F00"
           )
           port map (
               I0 => \spi_inst/EDGE_REG\,
               I1 => \spi_inst/n663_13\,
               I2 => \spi_inst/state\(1),
               I3 => \spi_inst/n663_9\,
               F => \spi_inst/bit_index_8_10\
           );
      \spi_inst/n795_s9\ : LUT4
           generic map (
               INIT => X"A900"
           )
           port map (
               I0 => \spi_inst/bit_index\(0),
               I1 => \spi_inst/EDGE_REG\,
               I2 => \spi_inst/n663_13\,
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n795_14\
           );
      \spi_inst/n607_s18\ : LUT3
           generic map (
               INIT => X"02"
           )
           port map (
               I0 => \spi_inst/n617_20\,
               I1 => \spi_inst/delay_counter\(22),
               I2 => \spi_inst/delay_counter\(21),
               F => \spi_inst/n607_24\
           );
      \spi_inst/n259_s6\ : LUT3
           generic map (
               INIT => X"A9"
           )
           port map (
               I0 => \spi_inst/bit_index\(2),
               I1 => \spi_inst/bit_index\(0),
               I2 => \spi_inst/bit_index\(1),
               F => \spi_inst/n259_13\
           );
      \spi_inst/n419_s4\ : LUT4
           generic map (
               INIT => X"2000"
           )
           port map (
               I0 => \spi_inst/n434_6\,
               I1 => \spi_inst/bit_index\(42),
               I2 => \spi_inst/n424_7\,
               I3 => \spi_inst/n420_6\,
               F => \spi_inst/n419_9\
           );
      \spi_inst/n423_s3\ : LUT4
           generic map (
               INIT => X"9A00"
           )
           port map (
               I0 => \spi_inst/bit_index\(39),
               I1 => \spi_inst/bit_index\(38),
               I2 => \spi_inst/n424_10\,
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n423_8\
           );
      \spi_inst/n434_s5\ : LUT4
           generic map (
               INIT => X"0200"
           )
           port map (
               I0 => \spi_inst/n439_6\,
               I1 => \spi_inst/bit_index\(24),
               I2 => \spi_inst/bit_index\(25),
               I3 => \spi_inst/n434_8\,
               F => \spi_inst/n434_10\
           );
      \spi_inst/n435_s3\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/bit_index\(26),
               I1 => \spi_inst/bit_index\(24),
               I2 => \spi_inst/bit_index\(25),
               F => \spi_inst/n435_8\
           );
      \spi_inst/n445_s3\ : LUT3
           generic map (
               INIT => X"01"
           )
           port map (
               I0 => \spi_inst/bit_index\(16),
               I1 => \spi_inst/bit_index\(14),
               I2 => \spi_inst/bit_index\(15),
               F => \spi_inst/n445_8\
           );
      \spi_inst/n633_s17\ : LUT4
           generic map (
               INIT => X"0400"
           )
           port map (
               I0 => \spi_inst/delay_counter\(7),
               I1 => \spi_inst/n799_25\,
               I2 => \spi_inst/delay_counter\(0),
               I3 => \spi_inst/n799_24\,
               F => \spi_inst/n633_23\
           );
      \spi_inst/n647_s15\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/delay_counter\(0),
               I2 => \spi_inst/n799_24\,
               F => \spi_inst/n647_20\
           );
      \spi_inst/n418_s3\ : LUT4
           generic map (
               INIT => X"9A00"
           )
           port map (
               I0 => \spi_inst/bit_index\(44),
               I1 => \spi_inst/bit_index\(43),
               I2 => \spi_inst/n419_9\,
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n418_8\
           );
      \spi_inst/n428_s3\ : LUT4
           generic map (
               INIT => X"9A00"
           )
           port map (
               I0 => \spi_inst/bit_index\(34),
               I1 => \spi_inst/bit_index\(33),
               I2 => \spi_inst/n429_6\,
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n428_8\
           );
      \spi_inst/n448_s3\ : LUT4
           generic map (
               INIT => X"9A00"
           )
           port map (
               I0 => \spi_inst/bit_index\(14),
               I1 => \spi_inst/bit_index\(13),
               I2 => \spi_inst/n449_6\,
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n448_8\
           );
      \spi_inst/n401_s5\ : LUT4
           generic map (
               INIT => X"8000"
           )
           port map (
               I0 => \spi_inst/n434_6\,
               I1 => \spi_inst/n419_7\,
               I2 => \spi_inst/n404_7\,
               I3 => \spi_inst/n401_9\,
               F => \spi_inst/n401_11\
           );
      \spi_inst/n409_s4\ : LUT4
           generic map (
               INIT => X"6A00"
           )
           port map (
               I0 => \spi_inst/bit_index\(53),
               I1 => \spi_inst/n419_9\,
               I2 => \spi_inst/n409_7\,
               I3 => \spi_inst/n795_16\,
               F => \spi_inst/n409_9\
           );
      \spi_inst/n433_s3\ : LUT4
           generic map (
               INIT => X"4000"
           )
           port map (
               I0 => \spi_inst/bit_index\(28),
               I1 => \spi_inst/n449_6\,
               I2 => \spi_inst/n444_7\,
               I3 => \spi_inst/n434_10\,
               F => \spi_inst/n433_8\
           );
      \spi_inst/n631_s15\ : LUT4
           generic map (
               INIT => X"1000"
           )
           port map (
               I0 => \spi_inst/delay_counter\(13),
               I1 => \spi_inst/n799_17\,
               I2 => \spi_inst/n633_20\,
               I3 => \spi_inst/n633_23\,
               F => \spi_inst/n631_21\
           );
      \spi_inst/n625_s16\ : LUT4
           generic map (
               INIT => X"2000"
           )
           port map (
               I0 => \spi_inst/n625_20\,
               I1 => \spi_inst/n799_17\,
               I2 => \spi_inst/n633_20\,
               I3 => \spi_inst/n633_23\,
               F => \spi_inst/n625_22\
           );
      \spi_inst/n795_s10\ : LUT3
           generic map (
               INIT => X"02"
           )
           port map (
               I0 => \spi_inst/state\(1),
               I1 => \spi_inst/state\(0),
               I2 => \spi_inst/state\(2),
               F => \spi_inst/n795_16\
           );
      \spi_inst/n779_s14\ : LUT4
           generic map (
               INIT => X"000B"
           )
           port map (
               I0 => \spi_inst/n779_19\,
               I1 => \spi_inst/state\(1),
               I2 => \spi_inst/state\(0),
               I3 => \spi_inst/state\(2),
               F => \spi_inst/n779_21\
           );
      \spi_inst/n785_s14\ : LUT4
           generic map (
               INIT => X"000B"
           )
           port map (
               I0 => \spi_inst/n785_19\,
               I1 => \spi_inst/state\(1),
               I2 => \spi_inst/state\(0),
               I3 => \spi_inst/state\(2),
               F => \spi_inst/n785_21\
           );
      \spi_inst/spi_mosi_s4\ : LUT4
           generic map (
               INIT => X"000D"
           )
           port map (
               I0 => \spi_inst/n663_16\,
               I1 => \spi_inst/EDGE_REG\,
               I2 => \spi_inst/state\(0),
               I3 => \spi_inst/state\(2),
               F => \spi_inst/spi_mosi_7\
           );
      \spi_inst/n397_s32\ : LUT4
           generic map (
               INIT => X"C55C"
           )
           port map (
               I0 => \spi_inst/n397_31\,
               I1 => \spi_inst/n262_861\,
               I2 => \spi_inst/bit_index\(4),
               I3 => \spi_inst/n257_11\,
               F => \spi_inst/n397_38\
           );
      \spi_inst/n397_s33\ : LUT4
           generic map (
               INIT => X"C55C"
           )
           port map (
               I0 => \spi_inst/n397_30\,
               I1 => \spi_inst/n262_863\,
               I2 => \spi_inst/bit_index\(4),
               I3 => \spi_inst/n257_11\,
               F => \spi_inst/n397_40\
           );
      \spi_inst/n397_s34\ : LUT4
           generic map (
               INIT => X"3AA3"
           )
           port map (
               I0 => \spi_inst/n397_29\,
               I1 => \spi_inst/n262_857\,
               I2 => \spi_inst/bit_index\(4),
               I3 => \spi_inst/n257_11\,
               F => \spi_inst/n397_42\
           );
      \spi_inst/n397_s35\ : LUT4
           generic map (
               INIT => X"3AA3"
           )
           port map (
               I0 => \spi_inst/n397_28\,
               I1 => \spi_inst/n262_859\,
               I2 => \spi_inst/bit_index\(4),
               I3 => \spi_inst/n257_11\,
               F => \spi_inst/n397_44\
           );
      \spi_inst/n458_s2\ : LUT3
           generic map (
               INIT => X"28"
           )
           port map (
               I0 => \spi_inst/n795_16\,
               I1 => \spi_inst/bit_index\(4),
               I2 => \spi_inst/n257_11\,
               F => \spi_inst/n458_7\
           );
      \spi_inst/n801_s15\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/state\(2),
               I2 => \spi_inst/state\(0),
               F => \spi_inst/n801_20\
           );
      \spi_inst/n799_s24\ : LUT3
           generic map (
               INIT => X"20"
           )
           port map (
               I0 => \spi_inst/state\(1),
               I1 => \spi_inst/state\(2),
               I2 => \spi_inst/state\(0),
               F => \spi_inst/n799_29\
           );
      \spi_inst/n461_s2\ : LUT3
           generic map (
               INIT => X"82"
           )
           port map (
               I0 => \spi_inst/n795_16\,
               I1 => \spi_inst/bit_index\(0),
               I2 => \spi_inst/bit_index\(1),
               F => \spi_inst/n461_7\
           );
      \spi_inst/n8_s11\ : LUT2
           generic map (
               INIT => X"8"
           )
           port map (
               I0 => \spi_inst/n8_4\,
               I1 => \spi_inst/n8_5\,
               F => \spi_inst/n8_15\
           );
      \spi_inst/n659_s15\ : LUT3
           generic map (
               INIT => X"E2"
           )
           port map (
               I0 => \spi_inst/n659_23\,
               I1 => \spi_inst/state\(2),
               I2 => \spi_inst/delay_counter\(0),
               F => \spi_inst/n659_21\
           );
      \spi_inst/n659_s16\ : LUT3
           generic map (
               INIT => X"E4"
           )
           port map (
               I0 => \spi_inst/delay_counter\(0),
               I1 => \spi_inst/n801_20\,
               I2 => \spi_inst/n663_16\,
               F => \spi_inst/n659_23\
           );
      \spi_inst/n649_s17\ : LUT4
           generic map (
               INIT => X"F0BB"
           )
           port map (
               I0 => \spi_inst/n801_18\,
               I1 => \spi_inst/n649_17\,
               I2 => \spi_inst/delay_counter\(5),
               I3 => \spi_inst/state\(2),
               F => \spi_inst/n649_24\
           );
      \spi_inst/n655_s18\ : LUT4
           generic map (
               INIT => X"FB0B"
           )
           port map (
               I0 => \spi_inst/n801_18\,
               I1 => \spi_inst/n655_17\,
               I2 => \spi_inst/state\(2),
               I3 => \spi_inst/delay_counter\(2),
               F => \spi_inst/n655_25\
           );
      \spi_inst/n405_s3\ : LUT4
           generic map (
               INIT => X"0001"
           )
           port map (
               I0 => \spi_inst/bit_index\(56),
               I1 => \spi_inst/bit_index\(55),
               I2 => \spi_inst/bit_index\(53),
               I3 => \spi_inst/bit_index\(54),
               F => \spi_inst/n405_8\
           );
      \spi_inst/n637_s15\ : LUT3
           generic map (
               INIT => X"10"
           )
           port map (
               I0 => \spi_inst/delay_counter\(10),
               I1 => \spi_inst/n799_17\,
               I2 => \spi_inst/n633_23\,
               F => \spi_inst/n637_21\
           );
      \spi_inst/n635_s15\ : LUT4
           generic map (
               INIT => X"0100"
           )
           port map (
               I0 => \spi_inst/delay_counter\(11),
               I1 => \spi_inst/delay_counter\(10),
               I2 => \spi_inst/n799_17\,
               I3 => \spi_inst/n633_23\,
               F => \spi_inst/n635_21\
           );
      \spi_inst/n601_s15\ : LUT4
           generic map (
               INIT => X"1000"
           )
           port map (
               I0 => \spi_inst/delay_counter\(28),
               I1 => \spi_inst/delay_counter\(27),
               I2 => \spi_inst/n799_20\,
               I3 => \spi_inst/n799_21\,
               F => \spi_inst/n601_21\
           );
      \spi_inst/n801_s16\ : LUT4
           generic map (
               INIT => X"FF10"
           )
           port map (
               I0 => \spi_inst/n799_17\,
               I1 => \spi_inst/state\(2),
               I2 => \spi_inst/state\(0),
               I3 => \spi_inst/n801_18\,
               F => \spi_inst/n801_22\
           );
      \spi_inst/n460_s2\ : LUT4
           generic map (
               INIT => X"8882"
           )
           port map (
               I0 => \spi_inst/n795_16\,
               I1 => \spi_inst/bit_index\(2),
               I2 => \spi_inst/bit_index\(0),
               I3 => \spi_inst/bit_index\(1),
               F => \spi_inst/n460_7\
           );
      \spi_inst/n43_s5\ : LUT3
           generic map (
               INIT => X"78"
           )
           port map (
               I0 => \spi_inst/n8_4\,
               I1 => \spi_inst/n8_5\,
               I2 => \spi_inst/clk_spi_internal\,
               F => \spi_inst/n43_11\
           );
      \spi_inst/n459_s2\ : LUT4
           generic map (
               INIT => X"0200"
           )
           port map (
               I0 => \spi_inst/state\(1),
               I1 => \spi_inst/state\(0),
               I2 => \spi_inst/state\(2),
               I3 => \spi_inst/n258_10\,
               F => \spi_inst/n459_7\
           );
      \spi_inst/n456_s5\ : LUT4
           generic map (
               INIT => X"0008"
           )
           port map (
               I0 => \spi_inst/n456_9\,
               I1 => \spi_inst/state\(1),
               I2 => \spi_inst/state\(0),
               I3 => \spi_inst/state\(2),
               F => \spi_inst/n456_11\
           );
      \spi_inst/n455_s3\ : LUT4
           generic map (
               INIT => X"0008"
           )
           port map (
               I0 => \spi_inst/n455_6\,
               I1 => \spi_inst/state\(1),
               I2 => \spi_inst/state\(0),
               I3 => \spi_inst/state\(2),
               F => \spi_inst/n455_8\
           );
      \spi_inst/n663_s10\ : LUT4
           generic map (
               INIT => X"0004"
           )
           port map (
               I0 => \spi_inst/n663_13\,
               I1 => \spi_inst/state\(1),
               I2 => \spi_inst/state\(0),
               I3 => \spi_inst/state\(2),
               F => \spi_inst/n663_16\
           );
      \spi_inst/spi_div_counter_31_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n11_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(31)
           );
      \spi_inst/spi_div_counter_30_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n12_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(30)
           );
      \spi_inst/spi_div_counter_29_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n13_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(29)
           );
      \spi_inst/spi_div_counter_28_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n14_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(28)
           );
      \spi_inst/spi_div_counter_27_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n15_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(27)
           );
      \spi_inst/spi_div_counter_26_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n16_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(26)
           );
      \spi_inst/spi_div_counter_25_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n17_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(25)
           );
      \spi_inst/spi_div_counter_24_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n18_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(24)
           );
      \spi_inst/spi_div_counter_23_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n19_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(23)
           );
      \spi_inst/spi_div_counter_22_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n20_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(22)
           );
      \spi_inst/spi_div_counter_21_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n21_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(21)
           );
      \spi_inst/spi_div_counter_20_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n22_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(20)
           );
      \spi_inst/spi_div_counter_19_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n23_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(19)
           );
      \spi_inst/spi_div_counter_18_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n24_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(18)
           );
      \spi_inst/spi_div_counter_17_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n25_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(17)
           );
      \spi_inst/spi_div_counter_16_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n26_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(16)
           );
      \spi_inst/spi_div_counter_15_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n27_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(15)
           );
      \spi_inst/spi_div_counter_14_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n28_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(14)
           );
      \spi_inst/spi_div_counter_13_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n29_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(13)
           );
      \spi_inst/spi_div_counter_12_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n30_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(12)
           );
      \spi_inst/spi_div_counter_11_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n31_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(11)
           );
      \spi_inst/spi_div_counter_10_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n32_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(10)
           );
      \spi_inst/spi_div_counter_9_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n33_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(9)
           );
      \spi_inst/spi_div_counter_8_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n34_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(8)
           );
      \spi_inst/spi_div_counter_7_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n35_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(7)
           );
      \spi_inst/spi_div_counter_6_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n36_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(6)
           );
      \spi_inst/spi_div_counter_5_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n37_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(5)
           );
      \spi_inst/spi_div_counter_4_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n38_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(4)
           );
      \spi_inst/spi_div_counter_3_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n39_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(3)
           );
      \spi_inst/spi_div_counter_2_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n40_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(2)
           );
      \spi_inst/spi_div_counter_1_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n41_1\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(1)
           );
      \spi_inst/spi_div_counter_0_s0\ : DFFR
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n42_6\,
               CLK => clk_d,
               RESET => \spi_inst/n8_15\,
               Q => \spi_inst/spi_div_counter\(0)
           );
      \spi_inst/state_2_s0\ : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n799_16\,
               CLK => \spi_inst/clk_spi_internal\,
               Q => \spi_inst/state\(2)
           );
      \spi_inst/state_1_s0\ : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n800_16\,
               CLK => \spi_inst/clk_spi_internal\,
               Q => \spi_inst/state\(1)
           );
      \spi_inst/state_0_s0\ : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n801_22\,
               CLK => \spi_inst/clk_spi_internal\,
               Q => \spi_inst/state\(0)
           );
      \spi_inst/delay_counter_31_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n597_20\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(31)
           );
      \spi_inst/delay_counter_30_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n599_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(30)
           );
      \spi_inst/delay_counter_29_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n601_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(29)
           );
      \spi_inst/delay_counter_28_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n603_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(28)
           );
      \spi_inst/delay_counter_27_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n605_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(27)
           );
      \spi_inst/delay_counter_26_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n607_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(26)
           );
      \spi_inst/delay_counter_25_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n609_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(25)
           );
      \spi_inst/delay_counter_24_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n611_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(24)
           );
      \spi_inst/delay_counter_23_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n613_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(23)
           );
      \spi_inst/delay_counter_22_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n615_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(22)
           );
      \spi_inst/delay_counter_21_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n617_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(21)
           );
      \spi_inst/delay_counter_20_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n619_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(20)
           );
      \spi_inst/delay_counter_19_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n621_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(19)
           );
      \spi_inst/delay_counter_18_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n623_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(18)
           );
      \spi_inst/delay_counter_17_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n625_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(17)
           );
      \spi_inst/delay_counter_16_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n627_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(16)
           );
      \spi_inst/delay_counter_15_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n629_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(15)
           );
      \spi_inst/delay_counter_14_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n631_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(14)
           );
      \spi_inst/delay_counter_13_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n633_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(13)
           );
      \spi_inst/delay_counter_12_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n635_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(12)
           );
      \spi_inst/delay_counter_11_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n637_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(11)
           );
      \spi_inst/delay_counter_10_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n639_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(10)
           );
      \spi_inst/delay_counter_9_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n641_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(9)
           );
      \spi_inst/delay_counter_8_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n643_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(8)
           );
      \spi_inst/delay_counter_7_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n645_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(7)
           );
      \spi_inst/delay_counter_6_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n647_16\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(6)
           );
      \spi_inst/delay_counter_4_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n651_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(4)
           );
      \spi_inst/delay_counter_3_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n653_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(3)
           );
      \spi_inst/delay_counter_1_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n657_18\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n597_27\,
               Q => \spi_inst/delay_counter\(1)
           );
      \spi_inst/SPI_DONE_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n661_17\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n661_15\,
               Q => SPI_DONE_Z
           );
      \spi_inst/spi_clk_s1\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n663_11\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n663_9\,
               Q => spi_clk_Z
           );
      \spi_inst/spi_nss_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n665_19\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/spi_nss_6\,
               Q => spi_nss_Z
           );
      \spi_inst/spi_mosi_s1\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n397_9\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/spi_mosi_7\,
               Q => spi_mosi_Z
           );
      \spi_inst/bit_index_63_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n399_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(63)
           );
      \spi_inst/bit_index_62_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n400_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(62)
           );
      \spi_inst/bit_index_61_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n401_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(61)
           );
      \spi_inst/bit_index_60_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n402_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(60)
           );
      \spi_inst/bit_index_59_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n403_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(59)
           );
      \spi_inst/bit_index_58_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n404_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(58)
           );
      \spi_inst/bit_index_57_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n405_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(57)
           );
      \spi_inst/bit_index_56_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n406_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(56)
           );
      \spi_inst/bit_index_55_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n407_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(55)
           );
      \spi_inst/bit_index_54_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n408_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(54)
           );
      \spi_inst/bit_index_53_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n409_9\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(53)
           );
      \spi_inst/bit_index_52_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n410_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(52)
           );
      \spi_inst/bit_index_51_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n411_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(51)
           );
      \spi_inst/bit_index_50_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n412_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(50)
           );
      \spi_inst/bit_index_49_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n413_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(49)
           );
      \spi_inst/bit_index_48_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n414_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(48)
           );
      \spi_inst/bit_index_47_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n415_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(47)
           );
      \spi_inst/bit_index_46_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n416_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(46)
           );
      \spi_inst/bit_index_45_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n417_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(45)
           );
      \spi_inst/bit_index_44_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n418_8\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(44)
           );
      \spi_inst/bit_index_43_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n419_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(43)
           );
      \spi_inst/bit_index_42_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n420_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(42)
           );
      \spi_inst/bit_index_41_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n421_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(41)
           );
      \spi_inst/bit_index_40_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n422_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(40)
           );
      \spi_inst/bit_index_39_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n423_8\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(39)
           );
      \spi_inst/bit_index_38_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n424_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(38)
           );
      \spi_inst/bit_index_37_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n425_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(37)
           );
      \spi_inst/bit_index_36_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n426_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(36)
           );
      \spi_inst/bit_index_35_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n427_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(35)
           );
      \spi_inst/bit_index_34_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n428_8\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(34)
           );
      \spi_inst/bit_index_33_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n429_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(33)
           );
      \spi_inst/bit_index_32_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n430_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(32)
           );
      \spi_inst/bit_index_31_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n431_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(31)
           );
      \spi_inst/bit_index_30_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n432_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(30)
           );
      \spi_inst/bit_index_29_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n433_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(29)
           );
      \spi_inst/bit_index_28_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n434_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(28)
           );
      \spi_inst/bit_index_27_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n435_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(27)
           );
      \spi_inst/bit_index_26_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n436_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(26)
           );
      \spi_inst/bit_index_25_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n437_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(25)
           );
      \spi_inst/bit_index_24_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n438_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(24)
           );
      \spi_inst/bit_index_23_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n439_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(23)
           );
      \spi_inst/bit_index_22_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n440_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(22)
           );
      \spi_inst/bit_index_21_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n441_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(21)
           );
      \spi_inst/bit_index_20_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n442_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(20)
           );
      \spi_inst/bit_index_19_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n443_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(19)
           );
      \spi_inst/bit_index_18_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n444_9\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(18)
           );
      \spi_inst/bit_index_17_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n445_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(17)
           );
      \spi_inst/bit_index_16_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n446_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(16)
           );
      \spi_inst/bit_index_15_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n447_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(15)
           );
      \spi_inst/bit_index_14_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n448_8\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(14)
           );
      \spi_inst/bit_index_13_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n449_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(13)
           );
      \spi_inst/bit_index_12_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n450_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(12)
           );
      \spi_inst/bit_index_11_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n451_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(11)
           );
      \spi_inst/bit_index_10_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n452_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(10)
           );
      \spi_inst/bit_index_9_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n453_5\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(9)
           );
      \spi_inst/bit_index_8_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n779_21\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(8)
           );
      \spi_inst/bit_index_7_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n455_8\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(7)
           );
      \spi_inst/bit_index_6_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n456_11\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(6)
           );
      \spi_inst/bit_index_5_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n785_21\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(5)
           );
      \spi_inst/bit_index_4_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n458_7\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(4)
           );
      \spi_inst/bit_index_3_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n459_7\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(3)
           );
      \spi_inst/bit_index_2_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n460_7\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(2)
           );
      \spi_inst/bit_index_1_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n461_7\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/bit_index_8_10\,
               Q => \spi_inst/bit_index\(1)
           );
      \spi_inst/bit_index_0_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n795_14\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/n663_9\,
               Q => \spi_inst/bit_index\(0)
           );
      \spi_inst/EDGE_REG_s2\ : DFFE
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n663_11\,
               CLK => \spi_inst/clk_spi_internal\,
               CE => \spi_inst/EDGE_REG_9\,
               Q => \spi_inst/EDGE_REG\
           );
      \spi_inst/clk_spi_internal_s2\ : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n43_11\,
               CLK => clk_d,
               Q => \spi_inst/clk_spi_internal\
           );
      \spi_inst/delay_counter_5_s3\ : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n649_24\,
               CLK => \spi_inst/clk_spi_internal\,
               Q => \spi_inst/delay_counter\(5)
           );
      \spi_inst/delay_counter_2_s3\ : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n655_25\,
               CLK => \spi_inst/clk_spi_internal\,
               Q => \spi_inst/delay_counter\(2)
           );
      \spi_inst/delay_counter_0_s3\ : DFF
           generic map (
               INIT => '0'
           )
           port map (
               D => \spi_inst/n659_21\,
               CLK => \spi_inst/clk_spi_internal\,
               Q => \spi_inst/delay_counter\(0)
           );
      \spi_inst/n41_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => \spi_inst/spi_div_counter\(1),
               I1 => \spi_inst/spi_div_counter\(0),
               I3 => GND_0,
               CIN => GND_0,
               COUT => \spi_inst/n41_2\,
               SUM => \spi_inst/n41_1\
           );
      \spi_inst/n40_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(2),
               I3 => GND_0,
               CIN => \spi_inst/n41_2\,
               COUT => \spi_inst/n40_2\,
               SUM => \spi_inst/n40_1\
           );
      \spi_inst/n39_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(3),
               I3 => GND_0,
               CIN => \spi_inst/n40_2\,
               COUT => \spi_inst/n39_2\,
               SUM => \spi_inst/n39_1\
           );
      \spi_inst/n38_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(4),
               I3 => GND_0,
               CIN => \spi_inst/n39_2\,
               COUT => \spi_inst/n38_2\,
               SUM => \spi_inst/n38_1\
           );
      \spi_inst/n37_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(5),
               I3 => GND_0,
               CIN => \spi_inst/n38_2\,
               COUT => \spi_inst/n37_2\,
               SUM => \spi_inst/n37_1\
           );
      \spi_inst/n36_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(6),
               I3 => GND_0,
               CIN => \spi_inst/n37_2\,
               COUT => \spi_inst/n36_2\,
               SUM => \spi_inst/n36_1\
           );
      \spi_inst/n35_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(7),
               I3 => GND_0,
               CIN => \spi_inst/n36_2\,
               COUT => \spi_inst/n35_2\,
               SUM => \spi_inst/n35_1\
           );
      \spi_inst/n34_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(8),
               I3 => GND_0,
               CIN => \spi_inst/n35_2\,
               COUT => \spi_inst/n34_2\,
               SUM => \spi_inst/n34_1\
           );
      \spi_inst/n33_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(9),
               I3 => GND_0,
               CIN => \spi_inst/n34_2\,
               COUT => \spi_inst/n33_2\,
               SUM => \spi_inst/n33_1\
           );
      \spi_inst/n32_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(10),
               I3 => GND_0,
               CIN => \spi_inst/n33_2\,
               COUT => \spi_inst/n32_2\,
               SUM => \spi_inst/n32_1\
           );
      \spi_inst/n31_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(11),
               I3 => GND_0,
               CIN => \spi_inst/n32_2\,
               COUT => \spi_inst/n31_2\,
               SUM => \spi_inst/n31_1\
           );
      \spi_inst/n30_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(12),
               I3 => GND_0,
               CIN => \spi_inst/n31_2\,
               COUT => \spi_inst/n30_2\,
               SUM => \spi_inst/n30_1\
           );
      \spi_inst/n29_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(13),
               I3 => GND_0,
               CIN => \spi_inst/n30_2\,
               COUT => \spi_inst/n29_2\,
               SUM => \spi_inst/n29_1\
           );
      \spi_inst/n28_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(14),
               I3 => GND_0,
               CIN => \spi_inst/n29_2\,
               COUT => \spi_inst/n28_2\,
               SUM => \spi_inst/n28_1\
           );
      \spi_inst/n27_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(15),
               I3 => GND_0,
               CIN => \spi_inst/n28_2\,
               COUT => \spi_inst/n27_2\,
               SUM => \spi_inst/n27_1\
           );
      \spi_inst/n26_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(16),
               I3 => GND_0,
               CIN => \spi_inst/n27_2\,
               COUT => \spi_inst/n26_2\,
               SUM => \spi_inst/n26_1\
           );
      \spi_inst/n25_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(17),
               I3 => GND_0,
               CIN => \spi_inst/n26_2\,
               COUT => \spi_inst/n25_2\,
               SUM => \spi_inst/n25_1\
           );
      \spi_inst/n24_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(18),
               I3 => GND_0,
               CIN => \spi_inst/n25_2\,
               COUT => \spi_inst/n24_2\,
               SUM => \spi_inst/n24_1\
           );
      \spi_inst/n23_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(19),
               I3 => GND_0,
               CIN => \spi_inst/n24_2\,
               COUT => \spi_inst/n23_2\,
               SUM => \spi_inst/n23_1\
           );
      \spi_inst/n22_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(20),
               I3 => GND_0,
               CIN => \spi_inst/n23_2\,
               COUT => \spi_inst/n22_2\,
               SUM => \spi_inst/n22_1\
           );
      \spi_inst/n21_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(21),
               I3 => GND_0,
               CIN => \spi_inst/n22_2\,
               COUT => \spi_inst/n21_2\,
               SUM => \spi_inst/n21_1\
           );
      \spi_inst/n20_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(22),
               I3 => GND_0,
               CIN => \spi_inst/n21_2\,
               COUT => \spi_inst/n20_2\,
               SUM => \spi_inst/n20_1\
           );
      \spi_inst/n19_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(23),
               I3 => GND_0,
               CIN => \spi_inst/n20_2\,
               COUT => \spi_inst/n19_2\,
               SUM => \spi_inst/n19_1\
           );
      \spi_inst/n18_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(24),
               I3 => GND_0,
               CIN => \spi_inst/n19_2\,
               COUT => \spi_inst/n18_2\,
               SUM => \spi_inst/n18_1\
           );
      \spi_inst/n17_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(25),
               I3 => GND_0,
               CIN => \spi_inst/n18_2\,
               COUT => \spi_inst/n17_2\,
               SUM => \spi_inst/n17_1\
           );
      \spi_inst/n16_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(26),
               I3 => GND_0,
               CIN => \spi_inst/n17_2\,
               COUT => \spi_inst/n16_2\,
               SUM => \spi_inst/n16_1\
           );
      \spi_inst/n15_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(27),
               I3 => GND_0,
               CIN => \spi_inst/n16_2\,
               COUT => \spi_inst/n15_2\,
               SUM => \spi_inst/n15_1\
           );
      \spi_inst/n14_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(28),
               I3 => GND_0,
               CIN => \spi_inst/n15_2\,
               COUT => \spi_inst/n14_2\,
               SUM => \spi_inst/n14_1\
           );
      \spi_inst/n13_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(29),
               I3 => GND_0,
               CIN => \spi_inst/n14_2\,
               COUT => \spi_inst/n13_2\,
               SUM => \spi_inst/n13_1\
           );
      \spi_inst/n12_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(30),
               I3 => GND_0,
               CIN => \spi_inst/n13_2\,
               COUT => \spi_inst/n12_2\,
               SUM => \spi_inst/n12_1\
           );
      \spi_inst/n11_s\ : ALU
           generic map (
               ALU_MODE => 0
           )
           port map (
               I0 => GND_0,
               I1 => \spi_inst/spi_div_counter\(31),
               I3 => GND_0,
               CIN => \spi_inst/n12_2\,
               COUT => \spi_inst/n11_0_COUT\,
               SUM => \spi_inst/n11_1\
           );
      \spi_inst/n262_s773\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_566\,
               I1 => \spi_inst/n262_567\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_679\
           );
      \spi_inst/n262_s774\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_568\,
               I1 => \spi_inst/n262_569\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_681\
           );
      \spi_inst/n262_s775\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_570\,
               I1 => \spi_inst/n262_571\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_683\
           );
      \spi_inst/n262_s776\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_572\,
               I1 => \spi_inst/n262_573\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_685\
           );
      \spi_inst/n262_s777\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_574\,
               I1 => \spi_inst/n262_575\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_687\
           );
      \spi_inst/n262_s778\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_576\,
               I1 => \spi_inst/n262_577\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_689\
           );
      \spi_inst/n262_s779\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_578\,
               I1 => \spi_inst/n262_579\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_691\
           );
      \spi_inst/n262_s780\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_580\,
               I1 => \spi_inst/n262_581\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_693\
           );
      \spi_inst/n262_s781\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_582\,
               I1 => \spi_inst/n262_583\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_695\
           );
      \spi_inst/n262_s782\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_584\,
               I1 => \spi_inst/n262_585\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_697\
           );
      \spi_inst/n262_s783\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_586\,
               I1 => \spi_inst/n262_587\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_699\
           );
      \spi_inst/n262_s784\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_588\,
               I1 => \spi_inst/n262_589\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_701\
           );
      \spi_inst/n262_s785\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_590\,
               I1 => \spi_inst/n262_591\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_703\
           );
      \spi_inst/n262_s786\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_592\,
               I1 => \spi_inst/n262_593\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_705\
           );
      \spi_inst/n262_s787\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_594\,
               I1 => \spi_inst/n262_595\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_707\
           );
      \spi_inst/n262_s788\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_596\,
               I1 => \spi_inst/n262_597\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_709\
           );
      \spi_inst/n262_s789\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_598\,
               I1 => \spi_inst/n262_599\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_711\
           );
      \spi_inst/n262_s790\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_600\,
               I1 => \spi_inst/n262_601\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_713\
           );
      \spi_inst/n262_s791\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_602\,
               I1 => \spi_inst/n262_603\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_715\
           );
      \spi_inst/n262_s792\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_604\,
               I1 => \spi_inst/n262_605\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_717\
           );
      \spi_inst/n262_s793\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_606\,
               I1 => \spi_inst/n262_607\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_719\
           );
      \spi_inst/n262_s794\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_608\,
               I1 => \spi_inst/n262_609\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_721\
           );
      \spi_inst/n262_s795\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_610\,
               I1 => \spi_inst/n262_611\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_723\
           );
      \spi_inst/n262_s796\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_612\,
               I1 => \spi_inst/n262_613\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_725\
           );
      \spi_inst/n262_s797\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_614\,
               I1 => \spi_inst/n262_615\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_727\
           );
      \spi_inst/n262_s798\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_616\,
               I1 => \spi_inst/n262_617\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_729\
           );
      \spi_inst/n262_s799\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_618\,
               I1 => \spi_inst/n262_619\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_731\
           );
      \spi_inst/n262_s800\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_620\,
               I1 => \spi_inst/n262_621\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_733\
           );
      \spi_inst/n262_s801\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_622\,
               I1 => \spi_inst/n262_623\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_735\
           );
      \spi_inst/n262_s802\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_624\,
               I1 => \spi_inst/n262_625\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_737\
           );
      \spi_inst/n262_s803\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_626\,
               I1 => \spi_inst/n262_627\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_739\
           );
      \spi_inst/n262_s804\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_628\,
               I1 => \spi_inst/n262_629\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_741\
           );
      \spi_inst/n262_s805\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_630\,
               I1 => \spi_inst/n262_631\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_743\
           );
      \spi_inst/n262_s806\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_632\,
               I1 => \spi_inst/n262_633\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_745\
           );
      \spi_inst/n262_s807\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_634\,
               I1 => \spi_inst/n262_635\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_747\
           );
      \spi_inst/n262_s808\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_636\,
               I1 => \spi_inst/n262_637\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_749\
           );
      \spi_inst/n262_s809\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_638\,
               I1 => \spi_inst/n262_639\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_751\
           );
      \spi_inst/n262_s810\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_640\,
               I1 => \spi_inst/n262_641\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_753\
           );
      \spi_inst/n262_s811\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_642\,
               I1 => \spi_inst/n262_643\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_755\
           );
      \spi_inst/n262_s812\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_644\,
               I1 => \spi_inst/n262_645\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_757\
           );
      \spi_inst/n262_s813\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_646\,
               I1 => \spi_inst/n262_647\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_759\
           );
      \spi_inst/n262_s814\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_648\,
               I1 => \spi_inst/n262_649\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_761\
           );
      \spi_inst/n262_s815\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_650\,
               I1 => \spi_inst/n262_651\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_763\
           );
      \spi_inst/n262_s816\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_652\,
               I1 => \spi_inst/n262_653\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_765\
           );
      \spi_inst/n262_s817\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_654\,
               I1 => \spi_inst/n262_655\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_767\
           );
      \spi_inst/n262_s818\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_656\,
               I1 => \spi_inst/n262_657\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_769\
           );
      \spi_inst/n262_s819\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_658\,
               I1 => \spi_inst/n262_659\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_771\
           );
      \spi_inst/n262_s820\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_660\,
               I1 => \spi_inst/n262_661\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_773\
           );
      \spi_inst/n262_s821\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_662\,
               I1 => \spi_inst/n262_663\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_775\
           );
      \spi_inst/n262_s822\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_664\,
               I1 => \spi_inst/n262_665\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_777\
           );
      \spi_inst/n262_s823\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_666\,
               I1 => \spi_inst/n262_667\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_779\
           );
      \spi_inst/n262_s824\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_668\,
               I1 => \spi_inst/n262_669\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_781\
           );
      \spi_inst/n262_s825\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_670\,
               I1 => \spi_inst/n262_671\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_783\
           );
      \spi_inst/n262_s826\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_672\,
               I1 => \spi_inst/n262_673\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_785\
           );
      \spi_inst/n262_s827\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_674\,
               I1 => \spi_inst/n262_675\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_787\
           );
      \spi_inst/n262_s828\ : MUX2_LUT5
           port map (
               I0 => \spi_inst/n262_676\,
               I1 => \spi_inst/n262_677\,
               S0 => \spi_inst/n260_10\,
               O => \spi_inst/n262_789\
           );
      \spi_inst/n262_s753\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_679\,
               I1 => \spi_inst/n262_681\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_791\
           );
      \spi_inst/n262_s754\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_683\,
               I1 => \spi_inst/n262_685\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_793\
           );
      \spi_inst/n262_s755\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_687\,
               I1 => \spi_inst/n262_689\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_795\
           );
      \spi_inst/n262_s756\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_691\,
               I1 => \spi_inst/n262_693\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_797\
           );
      \spi_inst/n262_s757\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_695\,
               I1 => \spi_inst/n262_697\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_799\
           );
      \spi_inst/n262_s758\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_699\,
               I1 => \spi_inst/n262_701\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_801\
           );
      \spi_inst/n262_s718\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_703\,
               I1 => \spi_inst/n262_705\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_803\
           );
      \spi_inst/n262_s759\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_707\,
               I1 => \spi_inst/n262_709\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_805\
           );
      \spi_inst/n262_s760\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_711\,
               I1 => \spi_inst/n262_713\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_807\
           );
      \spi_inst/n262_s721\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_715\,
               I1 => \spi_inst/n262_717\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_809\
           );
      \spi_inst/n262_s761\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_719\,
               I1 => \spi_inst/n262_721\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_811\
           );
      \spi_inst/n262_s762\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_723\,
               I1 => \spi_inst/n262_725\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_813\
           );
      \spi_inst/n262_s724\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_727\,
               I1 => \spi_inst/n262_729\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_815\
           );
      \spi_inst/n262_s763\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_731\,
               I1 => \spi_inst/n262_733\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_817\
           );
      \spi_inst/n262_s764\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_735\,
               I1 => \spi_inst/n262_737\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_819\
           );
      \spi_inst/n262_s727\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_739\,
               I1 => \spi_inst/n262_741\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_821\
           );
      \spi_inst/n262_s765\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_743\,
               I1 => \spi_inst/n262_745\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_823\
           );
      \spi_inst/n262_s766\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_747\,
               I1 => \spi_inst/n262_749\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_825\
           );
      \spi_inst/n262_s730\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_751\,
               I1 => \spi_inst/n262_753\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_827\
           );
      \spi_inst/n262_s767\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_755\,
               I1 => \spi_inst/n262_757\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_829\
           );
      \spi_inst/n262_s768\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_759\,
               I1 => \spi_inst/n262_761\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_831\
           );
      \spi_inst/n262_s733\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_763\,
               I1 => \spi_inst/n262_765\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_833\
           );
      \spi_inst/n262_s769\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_767\,
               I1 => \spi_inst/n262_769\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_835\
           );
      \spi_inst/n262_s770\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_771\,
               I1 => \spi_inst/n262_773\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_837\
           );
      \spi_inst/n262_s736\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_775\,
               I1 => \spi_inst/n262_777\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_839\
           );
      \spi_inst/n262_s771\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_779\,
               I1 => \spi_inst/n262_781\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_841\
           );
      \spi_inst/n262_s772\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_783\,
               I1 => \spi_inst/n262_785\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_843\
           );
      \spi_inst/n262_s739\ : MUX2_LUT6
           port map (
               I0 => \spi_inst/n262_787\,
               I1 => \spi_inst/n262_789\,
               S0 => \spi_inst/n259_13\,
               O => \spi_inst/n262_845\
           );
      \spi_inst/n262_s751\ : MUX2_LUT7
           port map (
               I0 => \spi_inst/n262_791\,
               I1 => \spi_inst/n262_793\,
               S0 => \spi_inst/n258_10\,
               O => \spi_inst/n262_847\
           );
      \spi_inst/n262_s752\ : MUX2_LUT7
           port map (
               I0 => \spi_inst/n262_795\,
               I1 => \spi_inst/n262_797\,
               S0 => \spi_inst/n258_10\,
               O => \spi_inst/n262_849\
           );
      \spi_inst/n262_s742\ : MUX2_LUT7
           port map (
               I0 => \spi_inst/n262_799\,
               I1 => \spi_inst/n262_801\,
               S0 => \spi_inst/n258_10\,
               O => \spi_inst/n262_851\
           );
      \spi_inst/n262_s743\ : MUX2_LUT7
           port map (
               I0 => \spi_inst/n262_805\,
               I1 => \spi_inst/n262_807\,
               S0 => \spi_inst/n258_10\,
               O => \spi_inst/n262_853\
           );
      \spi_inst/n262_s744\ : MUX2_LUT7
           port map (
               I0 => \spi_inst/n262_811\,
               I1 => \spi_inst/n262_813\,
               S0 => \spi_inst/n258_10\,
               O => \spi_inst/n262_855\
           );
      \spi_inst/n262_s745\ : MUX2_LUT7
           port map (
               I0 => \spi_inst/n262_817\,
               I1 => \spi_inst/n262_819\,
               S0 => \spi_inst/n258_10\,
               O => \spi_inst/n262_857\
           );
      \spi_inst/n262_s746\ : MUX2_LUT7
           port map (
               I0 => \spi_inst/n262_823\,
               I1 => \spi_inst/n262_825\,
               S0 => \spi_inst/n258_10\,
               O => \spi_inst/n262_859\
           );
      \spi_inst/n262_s747\ : MUX2_LUT7
           port map (
               I0 => \spi_inst/n262_829\,
               I1 => \spi_inst/n262_831\,
               S0 => \spi_inst/n258_10\,
               O => \spi_inst/n262_861\
           );
      \spi_inst/n262_s748\ : MUX2_LUT7
           port map (
               I0 => \spi_inst/n262_835\,
               I1 => \spi_inst/n262_837\,
               S0 => \spi_inst/n258_10\,
               O => \spi_inst/n262_863\
           );
      \spi_inst/n262_s749\ : MUX2_LUT7
           port map (
               I0 => \spi_inst/n262_841\,
               I1 => \spi_inst/n262_843\,
               S0 => \spi_inst/n258_10\,
               O => \spi_inst/n262_865\
           );
      \spi_inst/n262_s750\ : MUX2_LUT8
           port map (
               I0 => \spi_inst/n262_847\,
               I1 => \spi_inst/n262_849\,
               S0 => \spi_inst/n257_10\,
               O => \spi_inst/n262_867\
           );
      \spi_inst/n42_s2\ : LUT1
           generic map (
               INIT => X"1"
           )
           port map (
               I0 => \spi_inst/spi_div_counter\(0),
               F => \spi_inst/n42_6\
           );
      \spi_inst/n597_s18\ : INV
           port map (
               I => \spi_inst/state\(2),
               O => \spi_inst/n597_27\
           );
      VCC_cZ : VCC
           port map (
               V => VCC_0
           );
      GND_cZ : GND
           port map (
               G => GND_0
           );
      GSR_0 : GSR
           port map (
               GSRI => VCC_0
           );
end beh;
