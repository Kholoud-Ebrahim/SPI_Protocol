/*###################################################################*\
##              Class Name: spi_sequence_1                           ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_SEQUENCE_1_SVH
`define SPI_SEQUENCE_1_SVH

class spi_sequence_1 extends spi_base_sequence;
    `uvm_object_utils(spi_sequence_1)
    spi_sequence_item  item;

    function new(string name = "spi_sequence_1");
        super.new(name);
    endfunction :new

    task body();
        item = spi_sequence_item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {din_master inside {['h00:'h54]}; din_slave inside {['hAA:'hFF]};});
        finish_item(item);
    endtask :body
endclass :spi_sequence_1

`endif