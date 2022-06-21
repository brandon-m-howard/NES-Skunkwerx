mkdir bin
mkdir obj
ca65 src/main.asm -o obj/main.o --debug-info
ld65 obj/main.o -o bin/main.nes -t nes --dbgfile bin/main.dbg
fceux bin/main.nes