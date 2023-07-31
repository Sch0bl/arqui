
char *busca(const char* str, char c, unsigned l);
int compara(const char* str1, const char* str2, unsigned l);

int fuerza_bruta2(const char *S, const char *s, unsigned lS, unsigned ls) {
  char* dir = (char*)S;
  unsigned l = lS - ls;
  while((dir = busca(dir, *s, l))) {
    l = l - ((unsigned)(dir - S));
    if (compara(s, dir, ls))
      return (int)l;
  }
  return -1;  
}
