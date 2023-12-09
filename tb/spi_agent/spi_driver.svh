/*###################################################################*\
##              Class Name: spi_driver                               ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_DRIVER_SVH
`define SPI_DRIVER_SVH

class spi_driver extends uvm_driver #(spi_sequence_item);
    `uvm_component_utils(spi_driver)

    virtual spi_interface   drv_vif;
    spi_sequence_item       drv_item;

    function new(string name = "spi_driver", uvm_component parent);
        super.new(name, parent);
    endfunction :new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(! uvm_config_db #(virtual spi_interface)::get(this, "", "spi_vif", drv_vif))
            `uvm_fatal(get_full_name(),"Cannot get SPI Virtual interface from configuration database!")
    endfunction :build_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        forever begin
            wait(drv_vif.rst);
            seq_item_port.get_next_item(drv_item);
            drive(drv_item);
            seq_item_port.item_done();
        end
    endtask :run_phase

    task drive(spi_sequence_item  item);
        // Load Master:
        // @(posedge drv_vif.mclk);
        @(negedge drv_vif.mclk);
        #(PERIOD/2.0 - PERIOD/20.0);
        drv_vif.start      <= 1;
        drv_vif.ld_master  <= 1;
        drv_vif.ld_slave   <= 1;
        drv_vif.din_master <= item.din_master;
        drv_vif.din_slave  <= item.din_slave;

        // Shifting:
        @(negedge drv_vif.mclk);
        #(PERIOD/2.0 - PERIOD/20.0);
        drv_vif.ld_master <= 0;
        drv_vif.ld_slave  <= 0;
        drv_vif.rd_master <= 0;
        drv_vif.rd_slave  <= 0;

        repeat(8) begin
            @(posedge drv_vif.mclk);
        end
        @(posedge drv_vif.mclk);
        #(PERIOD/2.0 - PERIOD/20.0);
        drv_vif.rd_slave  <= 1;

        @(posedge drv_vif.mclk);
        #(PERIOD/2.0 - PERIOD/20.0);
        drv_vif.rd_master <= 1;

        repeat(1) begin
            @(negedge drv_vif.mclk);
            #(PERIOD/2.0 - PERIOD/20.0);
        end
    endtask :drive
endclass :spi_driver

`endif