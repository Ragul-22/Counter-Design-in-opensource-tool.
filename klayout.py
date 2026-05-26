import pya

app = pya.Application.instance()
win = app.main_window()

def_file  = "counter_layout.def"
tlef_file = "sky130_fd_sc_hd.tlef"
gds_file  = "sky130_fd_sc_hd.gds"

load_opts = pya.LoadLayoutOptions()
load_opts.lefdef_config.lef_files = [tlef_file]
load_opts.lefdef_config.macro_resolution_mode = 1

cv = win.load_layout(def_file, load_opts, 0)
ly = cv.layout()
ly.read(gds_file)
