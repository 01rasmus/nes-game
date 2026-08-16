COMPILER_FOLDER := ./cc65
OUTPUT_FOLDER   := ./build
COMPILER 	:= $(COMPILER_FOLDER)/bin/cl65
OUTPUT  	:= $(OUTPUT_FOLDER)/snake.nes
INPUT     	:= ./snake.s
PROCS		:= 16

build: $(OUTPUT)

$(COMPILER):
	cd $(COMPILER_FOLDER) && make -j$(PROCS)

$(OUTPUT): $(COMPILER)
	mkdir -p $(OUTPUT_FOLDER)
	$(COMPILER) -O --verbose --target nes -o $(OUTPUT) $(INPUT)

clean:
	rm -rf $(OUTPUT_FOLDER)
	cd $(COMPILER_FOLDER) && make clean
