/*###################################################################*\
##              Class Name: spi_agent                              ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_AGENT_SVH
`define SPI_AGENT_SVH

class spi_agent extends uvm_agent;
    `uvm_component_utils(spi_agent)

    spi_agent_config         agent_confg;
    uvm_active_passive_enum  is_active;
    spi_sequencer     sqr;
    spi_driver        drv;
    spi_monitor       mon;

    uvm_analysis_port #(spi_sequence_item) mon2agent_port;

    function new(string name = "spi_agent", uvm_component parent);
        super.new(name, parent);
    endfunction :new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mon2agent_port = new("mon2agent_port", this);

        if(! uvm_config_db #(spi_agent_config)::get(this, "", "spi_agnt_config", agent_confg))
            `uvm_fatal(get_full_name(),"Cannot get SPI Agent Config from configuration database!")
    
        is_active = agent_confg.spi_is_active;

        if(is_active == 1) begin
            sqr = spi_sequencer::type_id::create("sqr", this);
            drv = spi_driver::type_id::create("drv", this);
        end
        mon = spi_monitor::type_id::create("mon", this);
    endfunction :build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        if(is_active == 1) begin
            drv.seq_item_port.connect(sqr.seq_item_export);
        end
        mon.mon_port.connect(this.mon2agent_port);
    endfunction :connect_phase
endclass :spi_agent

`endif