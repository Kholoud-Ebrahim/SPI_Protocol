/*###################################################################*\
##              Class Name: spi_coverage_collector                   ##
##              Project Name: spi_protocol                           ##
##              Date:   7/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_COVERAGE_COLLECTOR_SVH
`define SPI_COVERAGE_COLLECTOR_SVH

class spi_coverage_collector extends uvm_subscriber #(spi_sequence_item);
    `uvm_component_utils(spi_coverage_collector)

    uvm_analysis_imp #(spi_sequence_item, spi_coverage_collector) cov_imp;
    spi_sequence_item  item;

    covergroup COVER_DIN_MASTER;
        option.per_instance = 1;
        coverpoint item.din_master {
            bins m_din_low  = {['h00:'h54]};
            bins m_din_mid  = {['h55:'hA9]};
            bins m_din_high = {['hAA:'hFF]};
            bins misc_m_din = default;
        }
    endgroup :COVER_DIN_MASTER

    covergroup COVER_DIN_SLAVE;
        option.per_instance = 1;
        coverpoint item.din_slave {
            bins s_din_low  = {['h00:'h54]};
            bins s_din_mid  = {['h55:'hA9]};
            bins s_din_high = {['hAA:'hFF]};
            bins misc_s_din = default;
        }
    endgroup :COVER_DIN_SLAVE

    covergroup COVER_DOUT_MASTER;
        option.per_instance = 1;
        coverpoint item.dout_master {
            bins m_dout_low  = {['h00:'h54]};
            bins m_dout_mid  = {['h55:'hA9]};
            bins m_dout_high = {['hAA:'hFF]};
            bins misc_m_dout = default;
        }
    endgroup :COVER_DOUT_MASTER

    covergroup COVER_DOUT_SLAVE;
        option.per_instance = 1;
        coverpoint item.dout_slave {
            bins s_dout_low  = {['h00:'h54]};
            bins s_dout_mid  = {['h55:'hA9]};
            bins s_dout_high = {['hAA:'hFF]};
            bins misc_s_dout = default;
        }
    endgroup :COVER_DOUT_SLAVE

    function new(string name = "spi_coverage_collector", uvm_component parent);
        super.new(name, parent);
        COVER_DIN_MASTER  = new();
        COVER_DIN_SLAVE   = new();
        COVER_DOUT_MASTER = new();
        COVER_DOUT_SLAVE  = new();
    endfunction :new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        cov_imp = new("cov_imp", this);
    endfunction :build_phase
    
    function void write(spi_sequence_item  t);
        item = spi_sequence_item::type_id::create("item");
        $cast(item, t);
        COVER_DIN_MASTER.sample();
        COVER_DIN_SLAVE.sample();
        COVER_DOUT_MASTER.sample();
        COVER_DOUT_SLAVE.sample();
    endfunction :write    
endclass :spi_coverage_collector

`endif