/*###################################################################*\
##              Module Name: spi_master                              ##
##              Project Name: spi_protocol                           ##
##              Date:   9/12/2023                                    ##
##              Author: Kholoud Ebrahim Darwseh                      ##
\*###################################################################*/

module spi_master(mclk, rst, load, read, miso, start, data_in, data_out, mosi, sclk, cs);
    input mclk, rst, load, miso, start, read;
    input [7:0] data_in;
    output[7:0] data_out;
    output reg mosi, cs;
    output sclk;

    integer count;
    reg [7:0] shift_reg;
    reg [7:0] data_out_reg;

    assign data_out = read? data_out_reg:8'h00;
    assign sclk = mclk;

    always @(posedge sclk,negedge rst)
    if(!rst) begin
        shift_reg    <= 0;
        cs           <= 0;
        mosi         <= 0;
        data_out_reg <= 0;
    end
    else begin
        if(start) begin 
            if(load) begin
                shift_reg <= data_in;
                count     <= 0;
            end
            else if(read) begin
                data_out_reg<=shift_reg;
            end
            else if(count<=8)begin
                shift_reg <= {miso,shift_reg[7:1]};
                mosi      <= shift_reg[0];
                count     <= count+1;
            end
        end
    end
endmodule :spi_master