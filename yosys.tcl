read_verilog counter.v
hierarchy -check -top counter   # set top module, check for missing cells
proc                            # translate always blocks to processes (flops/latches)
opt                             # simple optimizations (const propagation, dead code)
fsm                             # extract and optimize finite state machines
opt                             # re-optimize after FSM encoding
memory                          # infer memories (RAM/ROM) from arrays
opt                             # optimizations after memory inference
techmap                         # map internal Yosys cells to generic tech cells
opt                             # final optimizations before technology mapping
dfflibmap -liberty sky130_fd_sc_hd__tt_025C_1v80.lib  # map flip‑flops to library
abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib          # map combinational logic to standard cells
clean                           # remove unused cells/wires
stat -liberty sky130_fd_sc_hd__tt_025C_1v80.lib      # report area, cell count
write_verilog counter_netlist.v   # output gate‑level netlist
