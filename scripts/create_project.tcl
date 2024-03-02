# config
set scripts ../scripts/
set rtl ../rtl/
set constraints ../constraints/
set output ../output/
set tb ../tb/
set ip ../ip/
set bd ../bd/

set project_name project
set part xc7s50csga324-1

if [file exists ${project_name}.xpr] {
    open_project $project_name
} else {
    create_project -part $part $project_name

    # add sources
    add_files -quiet -fileset sources_1 [file normalize [glob -nocomplain ${rtl}*.vhd]]
    set_property file_type {VHDL 2008} [get_files *.vhd]
    add_files -quiet -fileset sources_1 [file normalize [glob -nocomplain ${rtl}*.v]]

    # add sim
    add_files -quiet -fileset sim_1 [file normalize [glob -nocomplain ${tb}*.vhd]]
    set_property file_type {VHDL 2008} [get_files *.vhd]
    add_files -quiet -fileset sim_1 [file normalize [glob -nocomplain ${tb}*.v]]

    # add constraints
    add_files -quiet -fileset constrs_1 [file normalize [glob -nocomplain ${constraints}*.xdc]]

    # add ips
    add_files -quiet -fileset sources_1 [file normalize [glob -nocomplain ${ip}*.xci]]
    generate_target all [get_files [file normalize [glob -nocomplain ${ip}*.xci]]]

    # add bd
    add_files -quiet -fileset sources_1 [file normalize [glob -nocomplain ${bd}*.bd]]
    generate_target all [get_files [file normalize [glob -nocomplain ${bd}*.bd]]]
    make_wrapper -files [get_files ../bd/design_1.bd] -top
    add_files -norecurse ../bd/bd.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v
    update_compile_order -fileset sources_1
}