import 'dart:math';

extension RandomExtension on Random {
  int nextIntBetween(int min, int max) {
    return min + this.nextInt(max - min);
  }
}
void main(List<String> args) {
  
}