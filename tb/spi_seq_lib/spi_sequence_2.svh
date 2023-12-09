/*###################################################################*\
##              Class Name: spi_sequence_2                           ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_SEQUENCE_2_SVH
`define SPI_SEQUENCE_2_SVH

class spi_sequence_2 extends spi_base_sequence;
    `uvm_object_utils(spi_sequence_2)
    spi_sequence_item  item;

    function new(string name = "spi_sequence_2");
        super.new(name);
    endfunction :new

    task body();
        item = spi_sequence_item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {din_master inside {['h55:'hA9]}; din_slave inside {['h00:'h54]};});
        finish_item(item);
    endtask :body
endclass :spi_sequence_2

`endif