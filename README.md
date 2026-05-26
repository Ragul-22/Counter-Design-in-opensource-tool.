Here the verilog counter design file and sky130 library file and opensource tool script.
step 1: pre-request download the opensource yosys,openroad and klayout tools in any linux system.
step 2: Download this as a zip file and extract it.
step 3: In side the extracted folder open the terminal.
step 4: In terminal type "yosys" and click enter. In that copy and paste the yosys.tcl content and click enter.
step 5: After Successful completion of synthesis process type "exit". -here the yosys synthesis is completed.
step 6: Type "openroad openroad.tcl" in the terminal directly.
step 7: After successful completion of openroad tool in that type "gui::show" - it will open the gui window.
step 8: Openroad flow is completed ,the .def and .odb files are created.
step 9: Open the terminal and type "klayout -rm klayout.py" - it will open the klayout tool with floorplan view.

The Klayout tool takes the output file .def form the openroad.
