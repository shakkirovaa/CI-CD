FLAGS = -Wall -Werror -Wextra -std=c11

all: clean s21_cat

s21_cat: 
	gcc $(FLAGS) s21_cat.c -o s21_cat

clean:
	rm -rf s21_cat

test: clean s21_cat
	sh test_cat.sh

style:
	cp ../../materials/linters/.clang-format ../../src/cat/.clang-format
	clang-format -style=Google -n *.c *.h
	rm .clang-format

format:
	cp ../../materials/linters/.clang-format ../../src/cat/.clang-format
	clang-format -style=Google -i *.c *.h
	rm .clang-format