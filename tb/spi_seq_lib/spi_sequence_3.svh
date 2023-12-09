/*###################################################################*\
##              Class Name: spi_sequence_3                           ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_SEQUENCE_3_SVH
`define SPI_SEQUENCE_3_SVH

class spi_sequence_3 extends spi_base_sequence;
    `uvm_object_utils(spi_sequence_3)
    spi_sequence_item  item;

    function new(string name = "spi_sequence_3");
        super.new(name);
    endfunction :new

    task body();
        item = spi_sequence_item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {din_master inside {['hAA:'hFF]}; din_slave inside {['h55:'hA9]};});
        finish_item(item);
    endtask :body
endclass :spi_sequence_3

`endif