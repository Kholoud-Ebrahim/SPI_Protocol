/*###################################################################*\
##              Class Name: spi_base_test                            ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_BASE_TEST_SVH
`define SPI_BASE_TEST_SVH

class spi_base_test extends uvm_test;
    `uvm_component_utils(spi_base_test)
    spi_environment             spi_env;
    spi_env_config              env_confg;
    uvm_active_passive_enum     is_active;
    bit                         scb_exist_tst, cov_exist_tst;

    function new(string name = "spi_base_test", uvm_component parent);
        super.new(name, parent);
    endfunction :new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        spi_env = spi_environment::type_id::create("spi_env", this);
        env_confg = spi_env_config::type_id::create("env_confg");
    
        is_active  = UVM_ACTIVE;
        env_confg.spi_is_active = is_active;
        scb_exist_tst = 1;
        env_confg.scb_exist = scb_exist_tst;
        cov_exist_tst = 1;
        env_confg.cov_exist = cov_exist_tst;
    
        uvm_config_db #(spi_env_config)::set(this, "*", "spi_env_config", env_confg);
    endfunction :build_phase

    //Printing the heirarchy of the TB components
    function void end_of_elaboration_phase(uvm_phase phase);	
        uvm_top.print_topology();
    endfunction :end_of_elaboration_phase
endclass :spi_base_test
`endif