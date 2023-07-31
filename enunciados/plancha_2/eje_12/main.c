#include <stdio.h>

int fuerza_bruta(const char *S, const char *s, unsigned lS, unsigned ls);

int fuerza_bruta2(const char *S, const char *s, unsigned lS, unsigned ls);

int main (){
  printf("REsu: %d\n", fuerza_bruta("asdfholaasdf", "hola", 12, 4));
  printf("REsu: %d\n", fuerza_bruta2("asdfholaasdf", "hola", 12, 4));
  return 0;
}

