#########################################
# Copyright (C) 2016 Project Bonfire    #
#                                       #
# This file is automatically generated! #
#             DO NOT EDIT!              #
#########################################

vlib work

# Include files and compile them
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/mlite_pack.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/flit_tracker.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/Arbiter_in_one_hot_checkers.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/Arbiter_in_one_hot_with_checkers.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/Arbiter_out_one_hot_pseudo_checkers.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/arbiter_out_one_hot_with_checkers.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/allocator_credit_counter_logic_pseudo_checkers.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/allocator_logic_pseudo_checkers.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/allocator_with_checkers.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/counter_threshold.vhd"

# Added by Behrad for checkers outputs classification (for now only for E2N turn fault)
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/checkers_counter_threshold.vhd"
# Added by Behrad

vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/FIFO_one_hot_credit_based_packet_drop_classifier_support_checkers.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/Cx_Reconf_pseudo_checkers.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/Rxy_Reconf_pseudo_checkers.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/LBDR_packet_drop_routing_part_pseudo_checkers.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/LBDR_packet_drop_with_checkers.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/NI.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/xbar.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/Router_32_bit_credit_based_packet_drop_classifier_SHMU_will_full_set_of_checkers.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/TB_Package_32_bit_credit_based_NI.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/network_2x2_packet_drop_SHMU_credit_based.vhd"
vcom "/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/IMMORTAL_Chip_2017/With_checkers/network_2x2_NI_Test_packet_drop_Rand_SHMU_credit_based_tb.vhd"

# Start the simulation
vsim work.tb_network_2x2

# Draw waves
do wave_2x2.do
# Run the simulation
# run 11000 ns
do fault_inject.do
