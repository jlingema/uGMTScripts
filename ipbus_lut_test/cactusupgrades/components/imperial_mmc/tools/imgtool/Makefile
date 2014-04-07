CC=gcc
CFLAGS=-g -Wall -DSTANDALONE -Wno-format
INCLUDES=-Iinclude
LDFLAGS=
LIBS=
OBJS=obj/imgtool.o obj/avr32_sfwfs.o obj/avr32_sha1.o
TARGET=bin/imgtool

default: $(TARGET)

$(TARGET): $(OBJS)
	mkdir -p bin
	$(CC) $(LDFLAGS) $(INCLUDES) -o $(TARGET) $(OBJS) $(LIBS)

obj/%.o: src/common/%.c
	mkdir -p obj
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<

.PHONY: clean
clean:
	rm -rf bin obj

