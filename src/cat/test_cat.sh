#!/bin/bash


TEST="test_s21_cat.log"
ORIG="test_cat.log"

fail=0

#TEST 1
echo "TEST 1: Команда cat без опций"

cat tests/1.txt > $ORIG
./s21_cat tests/1.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n" 
    ((fail++))
fi


#TEST 2
echo "TEST 2: Команда cat с опцией -b"

cat -b tests/1.txt > $ORIG
./s21_cat -b tests/1.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n" 
    ((fail++))
fi


#TEST 3
echo "TEST 3: Команда cat с опцией -e"

cat -e tests/test_case_cat.txt > $ORIG
./s21_cat -e tests/test_case_cat.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n" 
    ((fail++))
fi


#TEST 4
echo "TEST 4: Команда cat с опцией -n"

cat -n tests/1.txt > $ORIG
./s21_cat -n tests/1.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n" 
    ((fail++))
fi


#TEST 5
echo "TEST 5: Команда cat с опцией -s"

cat -s tests/1.txt > $ORIG
./s21_cat -s tests/1.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n" 
    ((fail++))
fi


#TEST 6
echo "TEST 6: Команда cat с опцией -v"

cat -v tests/test_case_cat.txt > $ORIG
./s21_cat -v tests/test_case_cat.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n" 
    ((fail++))
fi


#TEST 7
echo "TEST 7: Команда cat с опцией -t"

cat -t tests/test_case_cat.txt > $ORIG
./s21_cat -t tests/test_case_cat.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n" 
    ((fail++))
fi

#TEST 8
echo "TEST 8: Команда cat с опциями -bn"

cat -bn tests/1.txt > $ORIG
./s21_cat -bn tests/1.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n" 
    ((fail++))
fi


#TEST 9
echo "TEST 9: Команда cat с опцией --number"

cat -n tests/1.txt > $ORIG
./s21_cat --number tests/1.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n" 
    ((fail++))
fi


#TEST 10
echo "TEST 10: Команда cat с опцией --number-nonblank"

cat -b tests/1.txt > $ORIG
./s21_cat --number-nonblank tests/1.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n" 
    ((fail++))
fi


#TEST 11
echo "TEST 11: Команда cat с опцией --squeeze-blank"

cat -s tests/1.txt > $ORIG
./s21_cat --squeeze-blank tests/1.txt > $TEST
RES=$(diff -s ${ORIG} ${TEST})

if [[ $? -eq 0 ]]; then
    echo "SUCCESS\n"
   
else
    echo "FAIL\n" 
    ((fail++))
fi


rm $TEST $ORIG

if((fail > 0)); then 
    exit 1 
fi
