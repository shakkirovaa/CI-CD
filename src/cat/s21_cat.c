#include "s21_cat.h"

int main(int argc, char *argv[]) {
  struct flags flugs = {0};
  parser(argc, argv, &flugs);
  if (!flugs.error) {
    output(argc, argv, flugs);
  }
  return 0;
}

void parser(int argc, char *argv[], struct flags *flugs) {
  int option;
  int option_index = 0;
  struct option long_option[] = {{"number-nonblank", 0, NULL, 'b'},
                                 {"number", 0, NULL, 'n'},
                                 {"squeeze-blank", 0, NULL, 's'},
                                 {NULL, 0, NULL, 0}};  //конец списка опций
  while ((option = getopt_long(argc, argv, "+benstETv", long_option,
                               &option_index)) != -1) {
    switch (option) {
      case 'b':
        flugs->b = 1;
        flugs->n = 0;
        break;
      case 'e':
        flugs->e = 1;
        flugs->v = 1;
        break;
      case 'E':
        flugs->e = 1;
        flugs->v = 0;
        break;
      case 'n':
        if (!flugs->b) flugs->n = 1;
        break;
      case 's':
        flugs->s = 1;
        break;
      case 't':
        flugs->t = 1;
        flugs->v = 1;
        break;
      case 'v':
        flugs->v = 1;
        break;
      case 'T':
        flugs->t = 1;
        flugs->v = 0;
        break;
      default:
        flugs->error = 1;
        fprintf(stderr, "Mistake. Terrible mistake.\n");
        break;
    }
  }
}

void output(int argc, char *argv[], struct flags flugs) {
  for (int i = 1; i < argc; i++) {
    if (argv[i][0] != '-') {
      int prev = '\n';
      int prevprev = ' ';
      int lines = 1;
      FILE *f = (fopen(argv[i], "r"));
      char cur = '\0';
      while ((cur = fgetc(f)) != EOF) {
        if (flugs.s && cur == '\n' && prev == '\n' && prevprev == '\n') {
          continue;
        }
        if ((flugs.n) && (prev == '\n')) {
          printf("%6d\t", lines++);
        }
        if ((flugs.b) && (cur != '\n') && (prev == '\n')) {
          printf("%6d\t", lines++);
        }
        if (flugs.t) {
          if (cur == '\t') {
            printf("^I");
            continue;
          }
        }
        if ((flugs.e) && (cur == '\n')) {
          printf("$");
        }
        if (flugs.v) {
          if ((cur < 32) && (cur != '\t') && (cur != '\n')) {
            cur = cur + 64;
            printf("^");
          }
          if ((cur == 127) && (cur != '\t') && (cur != '\n')) {
            cur = cur - 64;
            printf("^");
          }
        }
        fputc(cur, stdout);
        prevprev = prev;
        prev = cur;
      }
      fclose(f);
    }
  }
}
