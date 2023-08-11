#include <stdio.h>

int solve(float, float, float, float, float, float, float*, float*);

int main(){
  float x, y;

  if (solve(1, 0, 1.5, 0, 1, 1.7, &x, &y)){
    printf("No hay solución.\n");
    return 0;
  }

  printf("X = %f, y = %f \n", x, y);
  return 0;
}
