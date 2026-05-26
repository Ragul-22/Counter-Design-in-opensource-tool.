# ── Technology files ───────────────────────────
read_lef sky130_fd_sc_hd.tlef
read_lef sky130_fd_sc_hd_merged.lef

read_liberty sky130_fd_sc_hd__tt_025C_1v80.lib


read_verilog counter_netlist.v
link_design counter

# 10ns clock = 100 MHz
create_clock -name clk -period 10 [get_ports clk]

# Input delay
set_input_delay 1 -clock clk [all_inputs]

# Output delay
set_output_delay 1 -clock clk [all_outputs]

# Clock uncertainty
set_clock_uncertainty 0.2 [get_clocks clk]


# ---------------------------------------------------------

# ── Floorplan: die 1000x1000, core 100..900 ───
initialize_floorplan -die_area "0 0 1000 1000" -core_area "100 100 900 900" -site unithd

# ── Routing tracks (important for DRC-clean route) ──
make_tracks met1 -x_offset 0.23 -x_pitch 0.46 -y_offset 0.17 -y_pitch 0.34
make_tracks met2 -x_offset 0.23 -x_pitch 0.46 -y_offset 0.23 -y_pitch 0.46
make_tracks met3 -x_offset 0.34 -x_pitch 0.68 -y_offset 0.34 -y_pitch 0.68
make_tracks met4 -x_offset 0.46 -x_pitch 0.92 -y_offset 0.46 -y_pitch 0.92
make_tracks met5 -x_offset 1.70 -x_pitch 3.40 -y_offset 1.70 -y_pitch 3.40

place_pins -hor_layers met3 -ver_layers met2
global_placement
detailed_placement
check_placement
estimate_parasitics -placement

# ── STA reports ────────────────────────────────
puts "\n========== SETUP TIMING ==========\n"
report_checks -path_delay max
puts "\n========== HOLD TIMING ==========\n"
report_checks -path_delay min
puts "\n========== WORST SLACK ==========\n"
report_worst_slack
puts "\n========== TOTAL NEGATIVE SLACK ==========\n"
report_tns
puts "\n========== CLOCK SKEW ==========\n"
report_clock_skew
puts "\n========== AREA REPORT ==========\n"
report_design_area

write_def counter_layout.def
write_db counter_design.odb
