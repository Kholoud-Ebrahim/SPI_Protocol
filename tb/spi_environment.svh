/*###################################################################*\
##              Class Name: spi_environment                          ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_ENVIRONMENT_SVH
`define SPI_ENVIRONMENT_SVH

class spi_environment extends uvm_env;
    `uvm_component_utils(spi_environment)

    spi_agent_config        agnt_confg;
    spi_env_config          env_confg;
    spi_agent               agnt;
    spi_scoreboard          scb;
    spi_coverage_collector  cov;
    bit                     scb_exist, cov_exist;

    function new(string name = "spi_environment", uvm_component parent);
        super.new(name, parent);
    endfunction :new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agnt = spi_agent::type_id::create("agnt", this);
        scb  = spi_scoreboard::type_id::create("scb", this);
        cov  = spi_coverage_collector::type_id::create("cov", this);

        if(! uvm_config_db #(spi_env_config)::get(this, "", "spi_env_config", env_confg))
            `uvm_fatal(get_full_name(),"Cannot get SPI Env Config from configuration database!")

        agnt_confg = spi_agent_config::type_id::create("agnt_confg");
        agnt_confg.spi_is_active = env_confg.spi_is_active;
        scb_exist = env_confg.scb_exist;
        cov_exist = env_confg.cov_exist;
        uvm_config_db #(spi_agent_config)::set(this, "*", "spi_agnt_config", agnt_confg);
    endfunction :build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        if(scb_exist == 1) begin
            agnt.mon2agent_port.connect(scb.spi_imp);
        end
        if(cov_exist == 1) begin
            agnt.mon2agent_port.connect(cov.cov_imp);
        end
    endfunction :connect_phase
endclass :spi_environment

`endif