vlog list.svh
vopt tb +cover=fcbest -o NWR_NRD
vsim -coverage NWR_NRD +test_name=NWR_NRD +N=20
coverage save -onexit NWR_NRD.ucdb
do exclusion.do
add wave -r sim:/tb/pif/*
run -all
