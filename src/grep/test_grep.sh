#!/bin/bash


TEST="test_s21_grep.log"
ORIG="test_grep.log"

fail=0

# TEST 1
echo "TEST 1: Команда grep c опцией -e"
grep -e lol2 -e lol3 tests/1.txt > $ORIG
./s21_grep -e lol2 -e lol3 tests/1.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n"
    ((fail++))
fi


# TEST 2
echo "TEST 2: Команда grep c опцией -i"
grep -i LOLkil tests/1.txt > $ORIG
./s21_grep -i LOLkil tests/1.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n"
    ((fail++))
fi

# TEST 3
echo "TEST 3: Команда grep c опцией -v"
grep -v lol2 tests/1.txt > $ORIG
./s21_grep -v lol2 tests/1.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n"
    ((fail++))
fi


# TEST 4
echo "TEST 4: Команда grep c опцией -c 1 файл"
grep -c lol2 tests/1.txt > $ORIG
./s21_grep -c lol2 tests/1.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n"
    ((fail++))
fi

# TEST 5
echo "TEST 5: Команда grep c опцией -c несколько файлов"
grep -c lol2 tests/1.txt tests/2.txt tests/4.txt > $ORIG
./s21_grep -c lol2 tests/1.txt tests/2.txt tests/4.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n"
    ((fail++))
fi

# TEST 6
echo "TEST 6: Команда grep c опцией -l"
grep -l lol2 tests/1.txt tests/2.txt tests/4.txt > $ORIG
./s21_grep -l lol2 tests/1.txt tests/2.txt tests/4.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n"
    ((fail++))
fi

# TEST 7
echo "TEST 7: Команда grep c опцией -n"
grep -n lol2 tests/1.txt > $ORIG
./s21_grep -n lol2 tests/1.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n"
    ((fail++))
fi

# TEST 8
echo "TEST 8: Команда grep c опцией -h"
grep -h lol2 tests/1.txt tests/2.txt > $ORIG
./s21_grep -h lol2 tests/1.txt tests/2.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n"
    ((fail++))
fi

# TEST 9
echo "TEST 9: Команда grep c опцией -s"
grep -s lol2 tests/3.txt > $ORIG
./s21_grep -s lol2 tests/3.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n"
    ((fail++))
fi

# TEST 10
echo "TEST 10: Команда grep c опцией -f"
grep -f tests/1.txt tests/4.txt > $ORIG
./s21_grep -f tests/1.txt tests/4.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n"
    ((fail++))
fi

# # TEST 11
# echo "TEST 11: Команда grep c опцией -o"
# grep -o lol2 tests/1.txt > $ORIG
# ./s21_grep -o lol2 tests/1.txt > $TEST
# RES=$(diff -s ${ORIG} ${TEST})

# if [[ $? -eq 0 ]]; then
#     echo "SUCCESS\n"
   
# else
#     echo "FAIL\n"
    
# fi

rm $TEST $ORIG

if((fail > 0)); then 
    exit 1 
fi