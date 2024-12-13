module MA(dataR, dataW, addr, mem_ctrl, memR, memW, clk);
	input logic [31:0] addr;
	input logic [31:0] dataW; 
	input bit memR; 
	input bit memW; 
	input bit clk;
	input logic [2:0] mem_ctrl;
	output logic [31:0] dataR; 
	
	logic [11:0] addrInt;
	logic [31:0] dataWInt;
	logic [31:0] dataRInt;
	
	mem_controller ctrl(.dataRI(dataRInt),
						.dataRO(dataR),
						.addrIn(addr),
						.addrOut(addrInt), 
						.dataWI(dataW), 
						.dataWO(dataWInt), 
						.mem_ctrl(mem_ctrl)
					   );
	
	DataMem memory(.addr(addrInt), 
				   .dataW(dataWInt), 
				   .dataR(dataRInt), 
				   .memR(memR), 
				   .memW(memW), 
				   .clk(clk)
				  );
endmodule
	