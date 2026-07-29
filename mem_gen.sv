class mem_gen;
mem_tx tx,temp,tempQ[$];
  task run();
    // $display ("generator functionality");
  case(mem_common::test_name)
  "1WR":begin
  mem_common::gen_count=1;
    tx=new();
    assert (tx.randomize() with{tx.wr_rd==1'b1;})
    tx.print ("mem_gen");
    mem_common::gen2bfm.put(tx);
  end
   "5WR":begin
   mem_common::gen_count=5;

   repeat(5)begin
    tx=new();
   assert (tx.randomize() with{tx.wr_rd==1'b1;})
    tx.print ("mem_gen");
	temp=new tx;
    mem_common::gen2bfm.put(temp);
  end
end
 "1WR_1RD":begin
  mem_common::gen_count=2;
 //write tx
 tx=new();
assert (tx.randomize()with{tx.wr_rd==1'b1;})
 tx.print("mem_gen_wr_ tx");
 mem_common::gen2bfm.put(tx);
 //read tx
 temp=new tx;
 tx=new();
assert( tx.randomize() with{tx.wr_rd==1'b0;tx.addr==temp.addr;tx.wdata==0;})
 tx.print("mem_gen_rx tx");
 mem_common::gen2bfm.put(tx);
 end
 "5WR_5RD":begin
  mem_common::gen_count=10;
 tx=new();
 repeat(5)begin
 //write tx
   assert (tx.randomize()with{tx.wr_rd==1'b1;})
   tx.print("mem_gen_wr_tx");
   temp=new tx;
   tempQ.push_back(temp);
   mem_common::gen2bfm.put(temp);
 end
 //read tx
 repeat(5)begin
   temp=tempQ.pop_front();
   tx=new();
  assert(tx.randomize()with{tx.wr_rd==1'b0;tx.addr==temp.addr;tx.wdata==0;})
   tx.print("mem_gen_rx_tx");
   mem_common::gen2bfm.put(tx);
 end
end 
"NWR_NRD":begin
 mem_common::gen_count=2*mem_common::N;
 tx=new();
 repeat(mem_common::N)begin
 //write tx
   assert (tx.randomize()with{tx.wr_rd==1'b1;})
   tx.print("mem_gen_wr_tx");
   temp=new tx;
   tempQ.push_back(temp);
   mem_common::gen2bfm.put(temp);
 end
 //read tx
 repeat(mem_common::N)begin
   temp=tempQ.pop_front();
   tx=new();
   assert (tx.randomize()with{tx.wr_rd==1'b0;tx.addr==temp.addr;tx.wdata==1'b0;})
   tx.print("mem_gen_rx_tx");
   mem_common::gen2bfm.put(tx);
 end
end
endcase
 endtask
endclass

