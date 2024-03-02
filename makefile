clean:
	@rm -rf build/.* build/* 2> /dev/null || true
	@rm -f top_level.xsa 2> /dev/null || true

distclean: clean
	@cd ip/ && rm -rf $$(ls --hide=*.xci) 2> /dev/null
	@cd bd/ && rm -rf $$(ls --hide=*.bd) 2> /dev/null
	rm -rf vitis/.* vitis/* 2> /dev/null

.PHONY: clean distclean