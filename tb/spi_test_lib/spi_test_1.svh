/*###################################################################*\
##              Class Name: spi_test_1                               ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_TEST_1_SVH
`define SPI_TEST_1_SVH

class spi_test_1 extends spi_base_test;
    `uvm_component_utils(spi_test_1)
    spi_sequence_1   seq_1;
    
    function new(string name = "spi_test_1", uvm_component parent);
        super.new(name, parent);
    endfunction :new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        seq_1 = spi_sequence_1::type_id::create("seq_1");
    endfunction :build_phase
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        repeat(20) begin
            seq_1.start(spi_env.agnt.sqr);
        end
        #(PERIOD);
        phase.drop_objection(this);
    endtask :run_phase
endclass :spi_test_1

`endif