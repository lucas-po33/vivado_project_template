# synth
update_compile_order -fileset sources_1
launch_runs synth_1 -jobs 4
wait_on_runs synth_1

# implementation
launch_runs impl_1 -jobs 4
wait_on_runs impl_1

# write bitstream
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_runs impl_1