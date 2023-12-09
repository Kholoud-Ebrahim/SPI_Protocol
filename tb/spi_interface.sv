/*###################################################################*\
##              Interface Name: spi_interface                        ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_INTERFACE_SV
`define SPI_INTERFACE_SV

interface spi_interface(input bit mclk, rst);
    logic [7:0]din_master;
    logic [7:0]din_slave;
    logic ld_master, ld_slave;
    logic rd_master, rd_slave;
    logic start;
    logic [7:0] dout_master;
    logic [7:0] dout_slave;
endinterface :spi_interface

`endif