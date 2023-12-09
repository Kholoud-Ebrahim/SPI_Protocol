/*###################################################################*\
##              Module Name: spi                                     ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
##              Additional Comments: Modes not implemented           ##
\*###################################################################*/

module spi(mclk, rst, ld_master, ld_slave, rd_master, rd_slave, start, dout_master, din_slave, dout_slave, din_master);
    input mclk, rst;
    input ld_master, ld_slave;
    input rd_master, rd_slave;
    input start;
    input  [7:0] din_master, din_slave;   //from external ip
    output [7:0] dout_master, dout_slave; //to another ip
    wire miso, mosi, cs, sclk;

    spi_master mstr(mclk, rst, ld_master, rd_slave, miso, start, din_master, dout_master, mosi, sclk, cs);  
    spi_slave  slav(sclk, rst, cs, mosi, miso, din_slave, dout_slave, rd_slave, ld_slave);
endmodule :spi