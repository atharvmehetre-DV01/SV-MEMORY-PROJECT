interface mem_intrf(input reg clk,res);
bit wr_rd,valid,ready;
bit[`ADDR_WIDTH-1:0]addr;
bit[`WIDTH-1:0]wdata,rdata;
clocking bfm_cb @(posedge clk);
 default input #0 output #1;
 input ready,rdata;
 output wr_rd,addr,wdata,valid;
 endclocking
 clocking mon_cb @(posedge clk);
    default input #1;
    input wr_rd,addr,wdata,valid,rdata,ready;
	endclocking
 endinterface

