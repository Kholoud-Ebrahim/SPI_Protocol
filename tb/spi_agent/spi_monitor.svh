/*###################################################################*\
##              Class Name: spi_monitor                              ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_MONITOR_SVH
`define SPI_MONITOR_SVH

class spi_monitor extends uvm_monitor;
    `uvm_component_utils(spi_monitor)

    virtual spi_interface   mon_vif;
    spi_sequence_item       mon_item;
    uvm_analysis_port #(spi_sequence_item) mon_port;

    function new(string name = "spi_monitor", uvm_component parent);
        super.new(name, parent);
    endfunction :new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mon_item = spi_sequence_item::type_id::create("mon_item");
        mon_port = new("mon_port", this);
        if(! uvm_config_db #(virtual spi_interface)::get(this, "", "spi_vif", mon_vif))
            `uvm_fatal(get_full_name(),"Cannot get SPI Virtual interface from configuration database!")
    endfunction :build_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        wait(mon_vif.rst && mon_vif.start);
        forever begin
            wait(mon_vif.ld_master == 1 && mon_vif.ld_slave == 1);
            mon_item.din_master = mon_vif.din_master;
            mon_item.din_slave  = mon_vif.din_slave;
            mon_item.print();

            wait(mon_vif.ld_master==0 && mon_vif.ld_slave==0);
            repeat(8) begin
                @(posedge mon_vif.mclk);
            end
            fork
                begin
                    wait(mon_vif.rd_master == 1);
                        @(negedge mon_vif.mclk);
                        #(PERIOD/20.0);
                    mon_item.dout_master = mon_vif.dout_master;
                end
                begin
                    wait(mon_vif.rd_slave == 1);
                    @(posedge mon_vif.mclk);
                    #(PERIOD/20.0);
                    mon_item.dout_slave  = mon_vif.dout_slave;
                end
            join  
            mon_port.write(mon_item);
        end
    endtask :run_phase
endclass :spi_monitor

`endif