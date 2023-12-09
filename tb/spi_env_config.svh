/*###################################################################*\
##              Class Name: spi_env_config                         ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_ENV_CONFIG_SVH
`define SPI_ENV_CONFIG_SVH

class spi_env_config extends uvm_object;
    `uvm_object_utils(spi_env_config)

    uvm_active_passive_enum   spi_is_active;
    bit                       scb_exist, cov_exist;
    
    function new(string name = "spi_env_config");
        super.new(name);
    endfunction :new
endclass :spi_env_config

`endif