/*###################################################################*\
##              Class Name: spi_scoreboard                           ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_SCOREBOARD_SVH
`define SPI_SCOREBOARD_SVH

class spi_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(spi_scoreboard)

    uvm_analysis_imp #(spi_sequence_item, spi_scoreboard) spi_imp;

    function new(string name = "spi_scoreboard", uvm_component parent);
        super.new(name, parent);
    endfunction :new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        spi_imp = new("spi_imp", this);
    endfunction :build_phase

    function void write(spi_sequence_item tr);
        if(tr.din_master == tr.dout_slave)
            `uvm_info("PASSED_M2S", $sformatf("data_in_master = %8b eq data_out_slave = %8b", tr.din_master, tr.dout_slave),UVM_LOW)
        else
            `uvm_error("FAILED_M2S", $sformatf("data_in_master = %8b not eq data_out_slave = %8b", tr.din_master, tr.dout_slave))

        if(tr.din_slave == tr.dout_master)
            `uvm_info("PASSED_S2M", $sformatf("data_in_slave = %8b eq data_out_master = %8b", tr.din_slave, tr.dout_master),UVM_LOW)
        else
            `uvm_error("FAILED_S2M", $sformatf("data_in_slave = %8b not eq data_out_master = %8b", tr.din_slave, tr.dout_master))
    endfunction :write
endclass :spi_scoreboard

`endif