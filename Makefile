SRC_FILES := ./tests/hello.c
OBJ_FILES := $(SRC_FILES:.c=.o)
OUT_FILE := test

CC := gcc
CFLAGS := -O2 -Wall -g -std=c11

LD := gcc
#LDFLAGS := -static -z norelro

LIB_DIR := ./microdb
LIB := -L$(LIB_DIR) -lmicrodb -lc

$(OUT_FILE): $(OBJ_FILES)
	make -C $(LIB_DIR)
	$(LD) $(OBJ_FILES) $(LIB) -o $@

%.o: %.c
	$(CC) -c $< -o $@ $(CFLAGS)

clean:
	rm -f $(OUT_FILE) $(OBJ_FILES)

all: $(OUT_FILE)

.PHONY: clean all
