/*###################################################################*\
##              Class Name: spi_test_2                               ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_TEST_2_SVH
`define SPI_TEST_2_SVH

class spi_test_2 extends spi_base_test;
    `uvm_component_utils(spi_test_2)
    spi_sequence_2   seq_2;
    
    function new(string name = "spi_test_2", uvm_component parent);
        super.new(name, parent);
    endfunction :new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        seq_2 = spi_sequence_2::type_id::create("seq_2");
    endfunction :build_phase
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        repeat(20) begin
            seq_2.start(spi_env.agnt.sqr);
        end
        #(PERIOD);
        phase.drop_objection(this);
    endtask :run_phase
endclass :spi_test_2

`endif