// Single Port RAM module design

module single_port_ram #(parameter width=8,depth=64)(
  input [width-1:0] data, //input data
  input [$clog2(depth)-1:0] addr, //address
  input we, //write enable
  input clk, //clk
  output reg [width-1:0] q //output data
);
  
  reg [width-1:0] ram [depth-1:0]; //8*64 bit ram
  reg [$clog2(depth)-1:0] addr_reg; //address register
 
  always @ (posedge clk)
    begin
      if(we)
        ram[addr] <= data;
      else
        addr_reg <= addr; 
    end

 always @(posedge clk)
  q <= ram[addr_reg];
  
endmodule