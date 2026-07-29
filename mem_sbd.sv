class mem_sbd;
mem_tx tx;
int arr[int];////-----assosiative array
task run();
//$display ("scoreboard functionality will be happened");
  forever begin
 mem_common::mon2sbd.get(tx);
 //tx.print("mem_sbd");
     if(tx.wr_rd==1)arr[tx.addr]=tx.wdata;
     else begin
	  if(tx.rdata==arr[tx.addr])mem_common::matchings++;
	  else mem_common::mismatchings++;
	  end
  end
endtask
endclass
