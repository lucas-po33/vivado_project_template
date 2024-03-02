# Vivado project template

Use it by sourcing the scripts in `scripts/` from `build/`.

```
cd build/
```

Generate the hardware platform .xsa
```
vivado -mode tcl -source ../scripts/all.tcl
```

Generate the project and open it with the gui
```
vivado -source ../scripts/create_project.tcl
```
