#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <ieee754.h>

#define IS_NEGATIVE(sp) (*(unsigned int*)&sp >> 31)
#define EXPONENT(sp) ((*(unsigned int*)&sp & 0x7f800000) >> 23) 
#define MANTISA(sp) (*(unsigned int*)&sp & 0x007fffff)

void print_bin_rep(int k){
  int n;
  int arg[32];
  int flag = 1;
  for(int i = 0; i < 32; i++){
    n = flag & k; 
    arg[i] = n;
    k = k >> 1;
  }
  for (int i = 32; i > 0; i--){
    if (i % 8 == 0)
      printf(" ");
    printf("%d", arg[i - 1]);
  }
  puts("");
}

void float_print(float f){
  int* fl = (int*) &f;
  int signo = (unsigned int) *fl >> 31;
  int exponente = ((unsigned int)*fl & 0x7f800000) >> 23;
  int mant = (unsigned int) *fl & 0x007fffff;
  printf("signo %d\n", signo);
  printf("exponente %d\n",exponente);
  print_bin_rep(mant);
}

void eje_1(){
  int test;
  puts("a)");
  test = 1 << 31;
  print_bin_rep(test);
  puts("b)");
  test = (1 << 31) | (1 << 15);
  print_bin_rep(test); 
  puts("c)");
  test = -1 & 0xffffff00;
  print_bin_rep(test); 
  puts("d)");
  test = 0xaa | (0xaa << 24);
  print_bin_rep(test); 
  puts("e)");
  test = 5 << 8;
  print_bin_rep(test); 
  puts("f)");
  test = -1 & (~ (1 << 8));
  print_bin_rep(test); 
  puts("g)");
  test = 0 - 1;
  print_bin_rep(test); 
  puts("h)");
  test = 0x80000000 + 0x80000000;
  print_bin_rep(test); 

}

/* ejercicio 2 */
int is_one(long n, int b){
  if ( b > 64 )
    return -1;
  int ret = 1 << b;
  ret = n & ret;
  ret = ret >> b;
  return ret;
}

void eje_2(){
  long p1, p2, p3, p4;
  /* p1 = 023; */
  /* p2 = -1234; */
  /* p3 = ~ 0; */
  /* p4 = 64; */
  printf("lala %d\n", is_one(p1,2));
}

void eje_4(int a, int b, int c){
  printf("Los valores son a = %d, b = %d y c = %d\n", a,b,c);
  a = a ^ b ^ c;
  b = a ^ b ^ c;
  c = a ^ b ^ c;
  a = a ^ b ^ c;
  printf("Los valores son a = %d, b = %d y c = %d\n", a,b,c);
}

int mul_campesino(int a, int b){ 
 if (b == 0)
   return 0;
 if (b == 1)
   return a;
 if (b & 1)
   return a + mul_campesino(a << 1, b >> 1);
 else
   return mul_campesino(a << 1, b >> 1);
}

int myisnan(float fl) {
  return !(EXPONENT(fl) ^ 0xff) && MANTISA(fl);
}
int myisnan2(float fl) {
  if (EXPONENT(fl) == 255)
    return MANTISA(fl);
  return 0;
}

void eje_10() {
  float g = 0.0;
  double f = 6.02252e23;
  int signo = IS_NEGATIVE(f);
  int expo = EXPONENT(f);
  int mant = MANTISA(f);
  printf("%d es le signo\n", signo);
  printf("%d es le exponente\n", expo);
  printf("%d es le mantisa\n", mant);
  printf("f: %f\n", *(float*)&f);
  // ADVERTENCIA: ‘NAN’ es una extensión de GCC.
  if (f == NAN) {
    printf("Es NAN\n");
  }
  if (myisnan2(f)) {
    printf("isNaN dice que sı́\n");
  }
  if (myisnan(f)) {
    printf("isNaN dice que sı́\n");
  }
}

int main(int argc, char* argv[]){
  eje_10();
  return 0;
}
