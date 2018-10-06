MAKEFLAGS += --no-print-directory
build_dir = $(shell pwd)/build
mkdir_build = $(shell mkdir build)
clean = $(shell rm -rf build)
.PHONY: build/x86
build/x86:
		@cd x86 && $(MAKE) build build_dir=$(build_dir)
build/x86/libs:
		@cd x86 && $(MAKE) build_libs build_dir=$(build_dir)		
run/x86:
		@cd x86 && $(MAKE) run build_dir=$(build_dir)		
clean/x86:
		@cd x86 && $(MAKE) clean	build_dir=$(build_dir)
clean/all:
		@$(clean)		
