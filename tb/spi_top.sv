/*###################################################################*\
##              Module Name: spi_top                                 ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/
`timescale 1ns/100ps
import uvm_pkg::*;
import spi_pkg::*;

module spi_top;
    bit clk, rst;

    spi_interface   intf(.mclk(clk), .rst(rst));
    spi             dut (.mclk(intf.mclk), 
                         .rst(intf.rst), 
                         .ld_master(intf.ld_master), 
                         .ld_slave(intf.ld_slave), 
                         .rd_master(intf.rd_master), 
                         .rd_slave(intf.rd_slave), 
                         .start(intf.start), 
                         .dout_master(intf.dout_master), 
                         .din_slave(intf.din_slave), 
                         .dout_slave(intf.dout_slave), 
                         .din_master(intf.din_master)
                    );
                    
    initial begin
        uvm_config_db #(virtual spi_interface)::set(null, "*", "spi_vif", intf);
        run_test();
    end
    initial begin
        rst = 0;
        #(PERIOD*2);
        rst = 1;
    end
    
    initial begin
        $timeformat(-9, 0, "ns", 16);
        clk = 0;
        forever begin
            #(PERIOD/2) clk = !clk;
        end
    end
endmodule :spi_top