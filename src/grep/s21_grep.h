#ifndef S21_GREP_H
#define S21_GREP_H

#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <string.h>

#define SIZESTR 1024

struct flags {
  int e;
  int i;
  int v;
  int c;
  int l;
  int n;
  int h;
  int s;
  int f;
  int o;
  char patternStr[SIZESTR];
  int patterCount;
  int error;
};

void function_e(struct flags *flugs, char *optarg);
void function_f(struct flags *flugs, char *optarg);
void parser(int argc, char *argv[], struct flags *flugs);
void output(int argc, char *argv[], struct flags flugs);

#endif  // S21_GREP_H
