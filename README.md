# SPI_Protocol : Serial Peripheral Interface Protocol
- It is a serial communication protocol commonly employed to connect low-speed devices.
- It Supports full-duplex communication.
- No need for unique slave addresses.
- It Signals are unidirectional.
- It Offers high-speed data transmission, max speed 10M bps (higher than UART and I2C).
- No start or stop.
- Single master multiple slave.

## SPI Protocol
![spi](https://github.com/Kholoud-Ebrahim/SPI_Protocol/assets/108447715/36f71dde-4c2e-43a9-812a-d93567e78681)

| Signal   |       Abbreviation           |                                                              Description                                                                                             |
|----------|------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| MOSI     | Master Output Slave Input    | it facilitates data transmission from the master to the slave.                                                                                                       |
| MISO     |  Master Input Slave Output   | it enables data transfer from the slave to the master.                                                                                                               |
| SCK/SCLK | Serial Clock                 | it serves as the clock signal for synchronization.                                                                                                                   |
| SS/CS    | Slave Select/Chip Select  	  | it is employed by the master to select a specific slave for communication. Notably, if only one slave is involved, the SS (slave select) wire may not be necessary.  |

## Multiple Slave
1. **Independent slaves:** each slave has a separate cs.
2. **Co-operative slaves:** only one cs signal.
![spi_multie_slave](https://github.com/Kholoud-Ebrahim/SPI_Protocol/assets/108447715/27aa7724-cf4b-447d-89c6-6c096a1b0fde)

## Modes
| Mode   |  `CPOL` Clock Polarity  |                 `CPHA` Clock Phase                          |
|--------|-------------------------|-------------------------------------------------------------|
|   0    |      0  (idle low)      |  0  (sampling at rising edge and shifting at falling edge)  |
|   1    |      0  (idle low)      |  1  (sampling at falling edge and shifting at rising edge)  |
|   2    |      1  (idle high)     |  0  (sampling at rising edge and shifting at falling edge)  |
|   3    |      1  (idle high)     |  1  (sampling at falling edge and shifting at rising edge)  |
