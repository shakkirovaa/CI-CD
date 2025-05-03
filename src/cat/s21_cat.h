#ifndef S21_CAT_H
#define S21_CAT_H

#include <getopt.h>
#include <stdio.h>
#include <string.h>

struct flags {
  int b;
  int e;
  int n;
  int s;
  int t;
  int v;
  int error;
};

void parser(int argc, char *argv[], struct flags *flugs);
void output(int argc, char *argv[], struct flags flugs);

#endif  // S21_CAT_H