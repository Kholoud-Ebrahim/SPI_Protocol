/*###################################################################*\
##              Class Name: spi_agent_config                         ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_AGENT_CONFIG_SVH
`define SPI_AGENT_CONFIG_SVH

class spi_agent_config extends uvm_object;
    `uvm_object_utils(spi_agent_config)

    uvm_active_passive_enum   spi_is_active;

    function new(string name = "spi_agent_config");
        super.new(name);
    endfunction :new
endclass :spi_agent_config

`endif