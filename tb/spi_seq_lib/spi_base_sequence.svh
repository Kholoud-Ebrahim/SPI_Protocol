/*###################################################################*\
##              Class Name: spi_base_sequence                        ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_BASE_SEQUENCE_SVH
`define SPI_BASE_SEQUENCE_SVH

class spi_base_sequence extends uvm_sequence #(spi_sequence_item);
    `uvm_object_utils(spi_base_sequence)
    spi_sequence_item  item;

    function new(string name = "spi_base_sequence");
        super.new(name);
    endfunction :new

    task body();
        item = spi_sequence_item::type_id::create("item");
        start_item(item);
        assert(item.randomize());
        finish_item(item);
    endtask :body
endclass :spi_base_sequence

`endif

