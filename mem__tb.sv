 


module tb;
mem_env env;

reg clk,res;
//dut instance
mem_intrf pif(clk,res);
memory dut (.clk(pif.clk),
           .res(pif.res),
		   .wr_rd(pif.wr_rd),
		   .addr(pif.addr),
		   .wdata(pif.wdata),
		   .rdata(pif.rdata),
		   .valid(pif.valid),
		   .ready(pif.ready));
always #5 clk=~clk;
//env
  initial begin
    clk=0;
    res=1;
    repeat(2)@(posedge clk);
    res=0;
	//$value$plusargs("test_name=%0s",mem_common::test_name);
	//$value$plusargs("N=%0d",mem_common::N);
    env=new();
	 env.run();
  end
   initial begin
  #50;
  wait (mem_common::gen_count==mem_common::bfm_count);
   #50;
   if (mem_common::matchings!=0 && mem_common::mismatchings==0) begin
  	 $display("test passed");
  	 $display("matchings=%0d,mismatchings=%0d",mem_common::matchings,mem_common::mismatchings);
  	 end
  	 else begin
  	 $display("test failed");
  	 $display("matchings=%0d,mismatchings=%0d",mem_common::matchings,mem_common::mismatchings);
  $finish;
   end
   end

 
  //initial begin
  	//$dumpfile("dump.vcd");
	//$dumpvars(0,tb);
 //end
endmodule


