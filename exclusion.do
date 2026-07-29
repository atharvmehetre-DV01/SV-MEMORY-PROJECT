coverage exclude -src mem_gen.sv -code s -line 14-55
coverage exclude -scope /tb -togglenode res
coverage exclude -scope /tb/pif -togglenode rdata res
coverage exclude -scope /tb/dut -togglenode i rdata
