// Code your design here
module ram(clk, reset, read, write, address, data, read_data);
  
  input clk, reset, read, write;
  input [31:0] address, data;
  output reg [31:0] read_data;
  
  reg [31:0] RAM [63:0];	// RAM
  integer i;
  
  always @ (posedge clk) begin
    
    if(reset) begin
      for(i = 0; i < 64; i = i + 1) begin
        RAM[i] <= 32'b0;
      end
    end else if(read) begin
      read_data <= RAM[address];
    end else if(write) begin
      RAM[address] <= data;
    end
    
  end
  
endmodule