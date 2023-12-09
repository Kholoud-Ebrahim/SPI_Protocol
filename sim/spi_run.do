# Clean Work Library
if [file exists "work"] {vdel -all}
vlib work

# Compile RTL and TB files
vlog  -f   spi_rtl.f
vlog  -f   spi_tb.f

# Optimizing Design with vopt
vopt spi_top -o top_opt -debugdb  +acc +cover=sbecf+spi(rtl).
# "+cover=sbecft". s = Statement, b = Branch, c = Condition, e = Expression, f = FSM, t = toggle #

# Simulation of a Test
#********************************** 1. TEST 1 ***********************************#
transcript file log/test_1_log.log
vsim top_opt -c -assertdebug -debugDB -fsmdebug -coverage +UVM_TESTNAME=spi_test_1
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
add wave sim:/spi_top/dut/*
run -all
coverage attribute -name TESTNAME -value test_1
coverage save coverage/test_1.ucdb
#********************************** 2. TEST 2 ***********************************#
transcript file log/test_2_log.log
vsim top_opt -c -assertdebug -debugDB -fsmdebug -coverage +UVM_TESTNAME=spi_test_2
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
add wave sim:/spi_top/dut/*
run -all
coverage attribute -name TESTNAME -value test_2
coverage save coverage/test_2.ucdb
#********************************** 3. TEST 3 ***********************************#
transcript file log/test_3_log.log
vsim top_opt -c -assertdebug -debugDB -fsmdebug -coverage +UVM_TESTNAME=spi_test_3
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
add wave sim:/spi_top/dut/*
run -all
coverage attribute -name TESTNAME -value test_3
coverage save coverage/test_3.ucdb


vcover merge  coverage/test_all.ucdb\
              coverage/test_1.ucdb\
              coverage/test_2.ucdb\
              coverage/test_3.ucdb

vcover report coverage/test_all.ucdb  -cvg -details -output coverage/fun_coverage.txt
vcover report coverage/test_all.ucdb  -details -output coverage/code_coverage.txt
vcover report coverage/test_all.ucdb  -details -assert  -output coverage/assertions.txt