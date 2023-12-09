/*###################################################################*\
##              Class Name: spi_sequencer                            ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_SEQUENCER_SVH
`define SPI_SEQUENCER_SVH

class spi_sequencer extends uvm_sequencer #(spi_sequence_item);
    `uvm_component_utils(spi_sequencer)

    function new(string name = "spi_sequencer", uvm_component parent);
        super.new(name, parent);
    endfunction :new
endclass :spi_sequencer

`endif