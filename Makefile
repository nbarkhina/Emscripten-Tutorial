MAKEFLAGS += --no-builtin-rules

CFILES := $(wildcard src/*.c)
FILES := $(patsubst %.c,%.o,$(CFILES))

all: xlstool.html

xlstool.html: $(FILES)
	emcc -o $@ $(FILES) \
	-s EXTRA_EXPORTED_RUNTIME_METHODS="['callMain']" \
    -s EXPORTED_FUNCTIONS="['_main']" \
	-s INVOKE_RUN=0 

%.o : %.c
	emcc -c $< -o $@
	
clean:
	@echo "Cleaning"
	@echo $(FILES)
	rm -rf src/*.o


