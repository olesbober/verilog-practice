// Code your testbench here
module ram_tb;

  reg clk, reset, read, write;
  reg [31:0] address, data;
  wire [31:0] read_data;
  
  ram RAM(.clk(clk), .reset(reset), .read(read), .write(write), .address(address),
          .data(data), .read_data(read_data));
  
  always begin // generate clock
    clk <= 1;
    #5;
    clk <= 0;
    #5;
  end
  
  initial begin
    reset = 1;
    #10;
    reset = 0;
    write = 1;
    address = 0;
    data = 32'hf;
    #10;
    display;
    read = 1;
    write = 0;
    #10;
    display;
    $stop;
    
  end
  
  task display;
    $display("clk:%0h reset:%0h read:%0h write:%0h address:%0h data:%0h read_data:%0h",
             clk, reset, read, write, address, data, read_data);
  endtask
  
endmodule