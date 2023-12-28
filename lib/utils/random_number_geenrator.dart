import 'dart:math';

int randomNumberGenerator() {
  Random random = Random();
  int randomNumber = random.nextInt(60);

  return randomNumber;
}
