TARGET = bin/dbview
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))
OBJ_DIR = obj
BIN_DIR = bin


run: clean default
	./$(TARGET) -f ./mynewdb.db -n

default: $(TARGET)

clean: 
	rm -f obj/*.o
	rm -f bin/*
	rm -f *.db

$(TARGET): $(OBJ)
	mkdir -p $(BIN_DIR)
	mkdir -p $(OBJ_DIR)
	gcc -o $@ $?

obj/%.o : src/%.c
	gcc -c $< -o $@ -Iinclude

