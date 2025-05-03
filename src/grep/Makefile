FLAGS = -Wall -Werror -Wextra -std=c11

all: clean s21_grep

s21_grep: 
	gcc $(FLAGS) s21_grep.c -o s21_grep

clean:
	rm -rf s21_grep

test: clean s21_grep
	sh test_grep.sh

style:
	cp ../../materials/linters/.clang-format ../../src/grep/.clang-format
	clang-format -style=Google -n *.c *.h
	rm .clang-format

format:
	cp ../../materials/linters/.clang-format ../../src/grep/.clang-format
	clang-format -style=Google -i *.c *.h
	rm .clang-format
