#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>

uint32_t xorwow() {
  static uint32_t x = 123456789, y = 362436069, z = 521288629, w = 88675123,
                  v = 5783321, d = 6615241;
  uint32_t t = (x ^ (x >> 2));
  x = y;
  y = z;
  z = w;
  w = v;
  v = (v ^ (v << 4)) ^ (t ^ (t << 1));
  return (d += 362437) + v;
}

int main(void) {
  size_t i;
  printf("xorwow:");
  printf("  %" PRIu32, xorwow());
  printf("  %" PRIu32, xorwow());
  printf("  %" PRIu32, xorwow());
  printf("  %" PRIu32, xorwow());
  printf("  %" PRIu32, xorwow());
  printf("  %" PRIu32, xorwow());
  printf("\n");

  return 0;
}
