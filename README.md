#### Assembly Projects
this is just a repo for things i try in assembly
currently using `x86 linux`
also had some fun linking and scripting the `depend.od`
it will compile all the libs the program requests
#### Compile
thanks to `makefile`s you can do alot of thing fast</br>
`make build/x86/libs` will build all the libs</br>
`make build/x86 lib=<libName>` will build the `<libName>` library</br>
`make build/x86 program=<programName>` will build `<programName>` and its dependencies</br>
`make run/x86 program=<programName>` will build `<programName>` and its dependencies and run it !</br>

#### Dependency Injection
`depend.od` file inside the program folder should contain all the libs the program needs</br>
they will be Auto-Linked to the program

#### Example
`make run/x86 program=hello` which uses a lib called `print`
