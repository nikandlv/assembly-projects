lib_source_file = $(shell pwd)/lib/$(lib)/main.asm
target_lib_dir = $(build_dir)/x86/lib/
target_lib_object = $(build_dir)/x86/lib/$(lib).o
program_source_file = $(shell pwd)/program/$(program)/main.asm
program_source_depend = $(shell pwd)/program/$(program)/depend.od
target_program_dir = $(build_dir)/x86/program/$(program)
target_program_object = $(build_dir)/x86/program/$(program)/main.o
target_program_binary = $(build_dir)/x86/program/$(program)/main.bin
define compile_asm
    nasm -f elf32 $1 -o "$2"
endef
define link_object
	ld -m elf_i386 "$1" $(shell echo $(shell cat $(program_source_depend) 2>/dev/null) | sed -e "s/@/$(shell echo $3 | sed 's_/_\\/_g')/g") -o "$2"
endef
define chmod
	chmod +x "$1"
endef
define run
	$1
endef

build:
	@if [ -n "$(lib)" ]; then\
		mkdir -p $(target_lib_dir);\
		$(call compile_asm,$(lib_source_file),$(target_lib_object),$(target_lib_binary));fi
	@if [ -n "$(program)" ]; then\
		for libItem in $(shell cat $(program_source_depend)); do\
		item=`echo $$libItem | sed -e "s/@//g"`;\
		if [ ! -f "$(target_lib_dir)$$item" ]; then\
			libName=`echo $$item | sed -e "s/.o//g"`;\
			echo "building lib:$$libName";\
			cd .. && $(MAKE) build/x86 lib=$$libName;\
		fi;\
	done;fi;	
	@if [ -n "$(program)" ]; then\
		mkdir -p $(target_program_dir);\
		$(call compile_asm,$(program_source_file),$(target_program_object),$(target_program_binary));\
		$(call link_object,$(target_program_object),$(target_program_binary),$(target_lib_dir),$(program_source_depend));fi
run:
	@if [ -n "$(lib)" ]; then\
		mkdir -p $(target_lib_dir);\
		$(call compile_asm,$(lib_source_file),$(target_lib_object),$(target_lib_binary));fi

	@if [ -n "$(program)" ]; then\
		for libItem in $(shell cat $(program_source_depend)); do\
		item=`echo $$libItem | sed -e "s/@//g"`;\
		if [ ! -f "$(target_lib_dir)$$item" ]; then\
			libName=`echo $$item | sed -e "s/.o//g"`;\
			echo "building lib:$$libName";\
			cd .. && $(MAKE) build/x86 lib=$$libName;\
		fi;\
	done;fi;			
	@if [ -n "$(program)" ]; then\
		mkdir -p $(target_program_dir);\
		$(call compile_asm,$(program_source_file),$(target_program_object),$(target_program_binary));\
		$(call link_object,$(target_program_object),$(target_program_binary),$(target_lib_dir),$(program_source_depend));\
		$(call chmod,$(target_program_binary));\
		$(call run,$(target_program_binary));fi	
build_libs:
	@for i in $(PWD)/lib/* ; do\
		all=`echo $$i | sed -e "s/$(shell echo $(PWD)/lib/ | sed 's_/_\\/_g')//g"`;\
		cd .. && $(MAKE) build/x86 lib=$$all;\
	done\

clean:
	echo 1;
