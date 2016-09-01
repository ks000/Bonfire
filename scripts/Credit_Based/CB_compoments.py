# Copyright (C) 2016 Siavoosh Payandeh Azad


def declare_components(noc_file, add_parity, add_FI, add_SHMU, add_lv, network_dime, fi_addres_width):
    if add_parity:
        noc_file.write("-- Declaring router component\n")
        noc_file.write("component router_credit_based_parity is\n")
        noc_file.write("  generic (\n")
        noc_file.write("        DATA_WIDTH: integer := 32; \n")
        noc_file.write("        current_address : integer := 0;\n")
        noc_file.write("        Rxy_rst : integer := 60;\n")
        noc_file.write("        Cx_rst : integer := 10;\n")
        noc_file.write("        NoC_size: integer := 4\n")
        noc_file.write("    );\n")
        noc_file.write("    port (\n")
        noc_file.write("    reset, clk: in std_logic; \n\n")
        noc_file.write("    RX_N, RX_E, RX_W, RX_S, RX_L : in std_logic_vector (DATA_WIDTH-1 downto 0); \n")
        noc_file.write("    credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L: in std_logic;\n")
        noc_file.write("    valid_in_N, valid_in_E, valid_in_W, valid_in_S, valid_in_L : in std_logic;\n\n")
        noc_file.write("    valid_out_N, valid_out_E, valid_out_W, valid_out_S, valid_out_L : out std_logic;\n")
        noc_file.write("    credit_out_N, credit_out_E, credit_out_W, credit_out_S, credit_out_L: out std_logic;\n\n")
        noc_file.write("    TX_N, TX_E, TX_W, TX_S, TX_L: out std_logic_vector (DATA_WIDTH-1 downto 0);\n")
        noc_file.write("    faulty_packet_N, faulty_packet_E, faulty_packet_W, faulty_packet_S, "
                       "faulty_packet_L:out std_logic;\n")
        noc_file.write("    healthy_packet_N, healthy_packet_E, healthy_packet_W, healthy_packet_S, "
                       "healthy_packet_L:out std_logic\n")
        noc_file.write("    ); \n")
        noc_file.write("end component; \n")
    else:
        noc_file.write("component router_credit_based is\n")
        noc_file.write("  generic (\n")
        noc_file.write("        DATA_WIDTH: integer := 32; \n")
        noc_file.write("        current_address : integer := 0;\n")
        noc_file.write("        Rxy_rst : integer := 60;\n")
        noc_file.write("        Cx_rst : integer := 10;\n")
        noc_file.write("        NoC_size: integer := 4\n")
        noc_file.write("    );\n")
        noc_file.write("    port (\n")
        noc_file.write("    reset, clk: in std_logic; \n\n")
        noc_file.write("    RX_N, RX_E, RX_W, RX_S, RX_L : in std_logic_vector (DATA_WIDTH-1 downto 0); \n")
        noc_file.write("    credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L: in std_logic;\n")
        noc_file.write("    valid_in_N, valid_in_E, valid_in_W, valid_in_S, valid_in_L : in std_logic;\n\n")
        noc_file.write("    valid_out_N, valid_out_E, valid_out_W, valid_out_S, valid_out_L : out std_logic;\n")
        noc_file.write("    credit_out_N, credit_out_E, credit_out_W, credit_out_S, credit_out_L: out std_logic;\n\n")
        noc_file.write("    TX_N, TX_E, TX_W, TX_S, TX_L: out std_logic_vector (DATA_WIDTH-1 downto 0)\n")
        noc_file.write("    ); \n")
        noc_file.write("end component; \n")

    noc_file.write("\n\n")

    if add_lv:
        noc_file.write("entity router_LV is")
        noc_file.write("	generic (")
        noc_file.write("        DATA_WIDTH: integer := 11;")
        noc_file.write("        current_address : integer := 0;")
        noc_file.write("        Rxy_rst : integer := 60;")
        noc_file.write("        Cx_rst : integer := 10;")
        noc_file.write("        NoC_size: integer := 4")
        noc_file.write("    );")
        noc_file.write("    port (")
        noc_file.write("    reset, clk: in std_logic;")
        noc_file.write("")
        noc_file.write("    RX_N, RX_E, RX_W, RX_S, RX_L : in std_logic_vector (DATA_WIDTH-1 downto 0); ")
        noc_file.write("")
        noc_file.write("    credit_in_N, credit_in_E, credit_in_W, credit_in_S, credit_in_L: in std_logic;")
        noc_file.write("    valid_in_N, valid_in_E, valid_in_W, valid_in_S, valid_in_L : in std_logic;")
        noc_file.write("")
        noc_file.write("    valid_out_N, valid_out_E, valid_out_W, valid_out_S, valid_out_L : out std_logic;")
        noc_file.write("    credit_out_N, credit_out_E, credit_out_W, credit_out_S, credit_out_L: out std_logic;")
        noc_file.write("")
        noc_file.write("    TX_N, TX_E, TX_W, TX_S, TX_L: out std_logic_vector (DATA_WIDTH-1 downto 0)")
        noc_file.write("    ); ")
        noc_file.write("end router_LV;")

    noc_file.write("\n\n")

    if add_FI:
        noc_file.write("component fault_injector is \n")
        noc_file.write("  generic(DATA_WIDTH : integer := 32);\n")
        noc_file.write("  port(\n")
        noc_file.write("    data_in: in std_logic_vector (DATA_WIDTH-1 downto 0);\n")
        noc_file.write("    address: in std_logic_vector("+str(fi_addres_width-1)+" downto 0);\n")
        noc_file.write("    sta_0: in std_logic;\n")
        noc_file.write("    sta_1: in std_logic;\n")
        noc_file.write("    data_out: out std_logic_vector (DATA_WIDTH-1 downto 0)\n")
        noc_file.write("    );\n")
        noc_file.write("end component;\n")

    noc_file.write("\n\n")

    if add_SHMU:
        noc_file.write("component SHMU is\n")
        noc_file.write("generic (\n")
        noc_file.write("    router_fault_info_width: integer := 5;\n")
        noc_file.write("    network_size: integer := 2\n")
        noc_file.write(" );\n")
        noc_file.write("port (  reset: in  std_logic;\n")
        noc_file.write("        clk: in  std_logic;\n")
        string_to_print = ""
        for i in range(0, network_dime**2):
            string_to_print += "        faulty_packet_N_"+str(i)+", healthy_packet_N_"+str(i) +\
                               ", faulty_packet_E_"+str(i)+", healthy_packet_E_"+str(i)+", faulty_packet_W_" +\
                               str(i)+", healthy_packet_W_"+str(i)+", faulty_packet_S_"+str(i) +\
                               ", healthy_packet_S_"+str(i)+", faulty_packet_L_"+str(i)+", healthy_packet_L_" +\
                               str(i)+": in std_logic;\n"
        noc_file.write(string_to_print[0: len(string_to_print)-2])
        noc_file.write("        );\n")
        noc_file.write("end component;\n")
