#### Assembly Projects
this is just a repo for things i try in assembly
currently using `x86 linux`
also had some fun linking and scripting the `depend.od`
it will compile all the libs the program requests
#### Compile
thanks to `makefile`s you can do alot of thing fast
`make build/x86/libs` will build all the libs
`make build/x86 lib=<libName>` will build the `<libName>` library
`make build/x86 program=<programName>` will build `<programName>` and its dependencies
`make run/x86 program=<programName>` will build `<programName>` and its dependencies and run it !