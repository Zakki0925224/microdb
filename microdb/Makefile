SRC_FILES := hello.c stream.c
OBJ_FILES := $(SRC_FILES:.c=.o)
LIB_FILE := libmicrodb.a

CC := gcc
CFLAGS := -Wall -g -std=c11

$(LIB_FILE): $(OBJ_FILES)
	ar rcs $@ $^
	nm $@

%.o: %.c
	$(CC) -c $< -o $@ $(CFLAGS)

clean:
	rm -f $(OBJ_FILES) $(LIB_FILE)

all: $(LIB_FILE)

.PHONY: clean all
