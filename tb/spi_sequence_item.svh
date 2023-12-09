/*###################################################################*\
##              Class Name: spi_sequence_item                        ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_SEQUENCE_ITEM_SVH
`define SPI_SEQUENCE_ITEM_SVH

class spi_sequence_item extends uvm_sequence_item;
    rand bit [7:0]din_master;
    rand bit [7:0]din_slave;
    bit ld_master, ld_slave;
    bit rd_master, rd_slave;
    bit start;
    bit [7:0] dout_master;
    bit [7:0] dout_slave;

    `uvm_object_utils_begin(spi_sequence_item)
    `uvm_field_int(din_master , UVM_DEFAULT | UVM_BIN)
    `uvm_field_int(din_slave  , UVM_DEFAULT | UVM_BIN)
    `uvm_field_int(ld_master  , UVM_DEFAULT | UVM_BIN)
    `uvm_field_int(ld_slave   , UVM_DEFAULT | UVM_BIN)
    `uvm_field_int(rd_master  , UVM_DEFAULT | UVM_BIN)
    `uvm_field_int(rd_slave   , UVM_DEFAULT | UVM_BIN)
    `uvm_field_int(start      , UVM_DEFAULT | UVM_BIN)
    `uvm_field_int(dout_master, UVM_DEFAULT | UVM_BIN)
    `uvm_field_int(dout_slave , UVM_DEFAULT | UVM_BIN)
    `uvm_object_utils_end

    function new(string name = "spi_sequence_item");
        super.new(name);
    endfunction :new
endclass :spi_sequence_item

`endif