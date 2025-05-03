#include "s21_grep.h"

int main(int argc, char *argv[]) {
  if (argc > 1) {
    struct flags flugs = {0};
    parser(argc, argv, &flugs);
    if (!flugs.error) output(argc, argv, flugs);
  }
  return 0;
}

void parser(int argc, char *argv[], struct flags *flugs) {
  char optString = 0;
  while ((optString = getopt_long(argc, argv, "e:ivclnhsf:o", 0, 0)) != -1) {
    switch (optString) {
      case 'e':
        flugs->e = 1;
        function_e(flugs, optarg);
        break;
      case 'i':
        flugs->i = 1;
        break;
      case 'v':
        flugs->v = 1;
        break;
      case 'c':
        flugs->c = 1;
        break;
      case 'l':
        flugs->l = 1;
        break;
      case 'n':
        flugs->n = 1;
        break;
      case 'h':
        flugs->h = 1;
        break;
      case 's':
        flugs->s = 1;
        break;
      case 'f':
        flugs->f = 1;
        function_f(flugs, optarg);
        break;
      case 'o':
        flugs->o = 1;
        break;
      default:
        flugs->error = 1;
        fprintf(stderr, "Mistake. Terrible mistake.\n");
        break;
    }
  }
  if (!flugs->e && !flugs->f) {
    strcat(flugs->patternStr, argv[optind]);
    optind++;
  }
}

void function_e(struct flags *flugs, char *optarg) {
  if (flugs->patterCount) strcat(flugs->patternStr, "|");
  strcat(flugs->patternStr, optarg);
  flugs->patterCount++;
}

void function_f(struct flags *flugs, char *optarg) {
  FILE *fregPattern = fopen(optarg, "r");
  if (fregPattern == NULL) {
    flugs->error = 1;
    fprintf(stderr, "grep: %s: No such file or directory\n", optarg);
  } else {
    char f_fileStr[SIZESTR] = {0};
    while (fgets(f_fileStr, SIZESTR, fregPattern) != NULL) {
      if (flugs->patterCount) strcat(flugs->patternStr, "|");
      if (f_fileStr[0] == '\n')
        strcat(flugs->patternStr, ".");
      else {
        if (f_fileStr[strlen(f_fileStr) - 1] == '\n')
          f_fileStr[strlen(f_fileStr) - 1] = '\0';  //удаляем все переносы строк
        strcat(flugs->patternStr, f_fileStr);
      }
      flugs->patterCount++;
    }
    fclose(fregPattern);
  }
}

void output(int argc, char *argv[], struct flags flugs) {
  for (int i = optind; i < argc; i++) {
    FILE *fileName = fopen(argv[i], "r");
    if (fileName == NULL) {
      if (!flugs.s)
        fprintf(stderr, "grep: %s: No such file or directory\n", argv[i]);
    } else {
      regex_t regexStruct = {0};
      regmatch_t matchesStruct = {0};
      int regcompParam = REG_EXTENDED;
      if (flugs.i) regcompParam = REG_EXTENDED | REG_ICASE;
      regcomp(&regexStruct, flugs.patternStr, regcompParam);
      char fileStr[SIZESTR] = {0};
      int numStr = 1;
      int coincCount = 0;
      while (fgets(fileStr, SIZESTR, fileName) != NULL) {
        int result = regexec(&regexStruct, fileStr, 1, &matchesStruct, 0);
        if (fileStr[strlen(fileStr) - 1] == '\n')
          fileStr[strlen(fileStr) - 1] = '\0';
        if (flugs.v) result = !result;  //если не существовал существует
        if (!result) {
          if (!flugs.c && !flugs.l) {
            if (argc - optind > 1 && !flugs.h) printf("%s:", argv[i]);
            if (flugs.n) printf("%d:", numStr);
            printf("%s\n", fileStr);
          }
          coincCount++;
        }
        numStr++;
      }
      if (flugs.c) {
        if (argc - optind > 1 && !flugs.h) printf("%s:", argv[i]);
        printf("%d\n", coincCount);
      }
      if (flugs.l && coincCount) printf("%s\n", argv[i]);
      regfree(&regexStruct);
      fclose(fileName);
    }
  }
}