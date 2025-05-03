#!/bin/bash

set -e

scp /home/gitlab-runner/builds/hbMYJLmJ/0/students/DO6_CICD.ID_356283/andersly_student.21_school.ru/DO6_CICD-1/src/cat/s21_cat and2@10.10.0.2:/usr/local/bin/
scp /home/gitlab-runner/builds/hbMYJLmJ/0/students/DO6_CICD.ID_356283/andersly_student.21_school.ru/DO6_CICD-1/src/grep/s21_grep and2@10.10.0.2:/usr/local/bin/
ssh and2@10.10.0.2 ls -lah /usr/local/bin
