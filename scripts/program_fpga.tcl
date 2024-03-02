# program fpga
open_hw_manager
connect_hw_server

open_hw_target
set_property PROGRAM.FILE ${project_name}.runs/impl_1/top_level.bit [lindex [get_hw_devices] 0]
program_hw_devices [lindex [get_hw_devices] 0]