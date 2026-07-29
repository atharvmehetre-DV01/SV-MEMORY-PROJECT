class mem_mon;
virtual mem_intrf vif;
mem_tx tx;
  task run();
   // $display ("monitor functionality will be happended");
   vif=tb.pif;
   forever begin
   @(vif.mon_cb);
 if (vif.mon_cb.valid==1 && vif.mon_cb.ready==1)begin
    // @(vif.mon_cb);
     tx=new();
     tx.wr_rd=vif.mon_cb.wr_rd;
     tx.addr=vif.mon_cb.addr;
     if(vif.mon_cb.wr_rd==1)begin
      tx.wdata=vif.mon_cb.wdata;
	  tx.rdata=0;
     end
     else begin
      tx.wdata=0;
     @(vif.mon_cb);
     tx.rdata=vif.mon_cb.rdata;
    end
	mem_common::mon2cov.put(tx);
	mem_common::mon2sbd.put(tx);
    tx.print("mem_mon");
    end    
 end
 endtask
endclass




