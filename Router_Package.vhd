--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
 use ieee.math_real.all;

package Router_Package is
  function Header_gen(Packet_length, source, destination, packet_id: integer ) return std_logic_vector ;
  function Body_gen(Packet_length, Data: integer ) return std_logic_vector ;
  function Tail_gen(Packet_length, Data: integer ) return std_logic_vector ;
  procedure gen_packet(Packet_length, source, destination, packet_id: in integer; signal DCTS: in std_logic; signal RTS: out std_logic; signal port_in: out std_logic_vector);
  procedure get_packet(DATA_WIDTH: in integer; signal CTS: out std_logic; signal DRTS: in std_logic; signal port_in: in std_logic_vector);
end Router_Package;




package body Router_Package is
constant Header_type : std_logic_vector := "001";
constant Body_type : std_logic_vector := "010";
constant Tail_type : std_logic_vector := "100";

function Header_gen(Packet_length, source, destination, packet_id: integer)
              return std_logic_vector is
variable Header_flit: std_logic_vector (31 downto 0);
begin
Header_flit := Header_type &  std_logic_vector(to_unsigned(Packet_length, 12)) & std_logic_vector(to_unsigned(destination, 4)) & 
	 		   std_logic_vector(to_unsigned(source, 4))  & std_logic_vector(to_unsigned(packet_id, 8)) & '0';
return Header_flit;
end Header_gen;


function Body_gen(Packet_length, Data: integer)
              return std_logic_vector is
variable Body_flit: std_logic_vector (31 downto 0);
begin
Body_flit := Body_type &  std_logic_vector(to_unsigned(Data, 28)) & '0';
return Body_flit;
end Body_gen;


function Tail_gen(Packet_length, Data: integer)
              return std_logic_vector is
variable Tail_flit: std_logic_vector (31 downto 0);
begin
Tail_flit := Tail_type &  std_logic_vector(to_unsigned(Data, 28)) & '0';
return Tail_flit;
end Tail_gen;

procedure gen_packet(Packet_length, source, destination, packet_id: in integer; signal DCTS: in std_logic; signal RTS: out std_logic; signal port_in: out std_logic_vector) is

	variable seed1 :positive ;
    variable seed2 :positive ;
    variable rand : real ;
   begin
	port_in <= Header_gen(Packet_length, source, destination, packet_id);
	RTS <= '1';
	while (DCTS = '0') loop
		wait for 1 ns;
	end loop; 
	for I in 0 to Packet_length-2 loop 
		uniform(seed1, seed2, rand);
		port_in <= Body_gen(Packet_length, integer(rand*1000.0));
		wait for 1 ns;
		while (DCTS = '0') loop
			wait for 1 ns;
		end loop;
	end loop;
	port_in <= Tail_gen(Packet_length, 200);
	wait for 1 ns;
	RTS <= '0';
end gen_packet;

procedure get_packet(DATA_WIDTH: in integer; signal CTS: out std_logic; signal DRTS: in std_logic; signal port_in: in std_logic_vector) is
   begin
   wait until port_in(DATA_WIDTH-1 downto DATA_WIDTH-3) = "001";
   while (port_in(DATA_WIDTH-1 downto DATA_WIDTH-3) /= "100") loop
		while (DRTS = '0') loop
			wait for 1 ns;
		end loop; 
		CTS <= '1';
		wait for 1 ns;
		CTS <= '0';
   end loop;
end get_packet;

end Router_Package;

