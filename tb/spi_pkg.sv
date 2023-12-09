/*###################################################################*\
##              Package Name: spi_pkg                                ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

`ifndef SPI_PKG_SV
`define SPI_PKG_SV

package spi_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    parameter PERIOD = 10;

    `include "spi_sequence_item.svh"
    `include "spi_agent_config.svh"
    `include "spi_sequencer.svh"
    `include "spi_driver.svh"
    `include "spi_monitor.svh"
    `include "spi_agent.svh"

    `include "spi_scoreboard.svh"
    `include "spi_coverage_collector.svh"
    `include "spi_env_config.svh"
    `include "spi_environment.svh"

    `include "spi_base_sequence.svh"
    `include "spi_sequence_1.svh"
    `include "spi_sequence_2.svh"
    `include "spi_sequence_3.svh"

    `include "spi_base_test.svh"
    `include "spi_test_1.svh"
    `include "spi_test_2.svh"
    `include "spi_test_3.svh"
endpackage :spi_pkg

`endif