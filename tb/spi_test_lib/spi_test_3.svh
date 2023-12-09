/*###################################################################*\
##              Class Name: spi_test_3                               ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_TEST_3_SVH
`define SPI_TEST_3_SVH

class spi_test_3 extends spi_base_test;
    `uvm_component_utils(spi_test_3)
    spi_sequence_3   seq_3;
    
    function new(string name = "spi_test_3", uvm_component parent);
        super.new(name, parent);
    endfunction :new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        seq_3 = spi_sequence_3::type_id::create("seq_3");
    endfunction :build_phase
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        repeat(20) begin
            seq_3.start(spi_env.agnt.sqr);
        end
        #(PERIOD);
        phase.drop_objection(this);
    endtask :run_phase
endclass :spi_test_3

`endif