#include <stdio.h>

void sum(float* a, float*b, int len);
void sum_pack(float* a, float*b, int len);

int main(){
  float a[6] = {1.1 , 2.2, 3.3, 4.4, 5.5 , 6.6};
  float b[6] = {1.1 , 2.2, 3.3, 4.4, 5.5 , 6.6};

  sum(a,b,6);

  for(int i = 0; i < 6; i++)
    printf("%f ", a[i]);
  puts("");

  sum_pack(a,b,6);

  for(int i = 0; i < 6; i++)
    printf("%f ", a[i]);
  puts("");
  return 0; 
}
