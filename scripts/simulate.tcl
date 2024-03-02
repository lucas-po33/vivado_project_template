proc simulate {tb} {
    set_property top $tb [get_fileset sim_1]
    update_compile_order -fileset sim_1
    launch_simulation
}

proc simulate_all {} {
    set_property runtime -1 [get_fileset sim_1]
    set list_tb [get_files -of_objects [get_fileset sim_1]]

    foreach tb_path $list_tb {
        set tb [string trim [file tail $tb_path] .vhd]
        puts "Simulating $tb"
        simulate $tb
        close_sim
    }
}