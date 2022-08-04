import 'dart:math';

String generateQuotes() {
  Random random = new Random();
  int randomNumber = random.nextInt(quotesList.length - 1);
  String ret = "...";
  // Future.delayed(Duration.zero, () {
  ret = quotesList[randomNumber];
  // });
  // print(ret);
  return ret;
}

var quotesList = [
  "....",
  "Sit-back\nand\nrelax",
  "Clear your mind for a moment",
  "Sometimes, the most productive thing that you can do is to step outside and do nothing... ",
  "Take\nyour\ntime",
  "Don't worry...",
  "A day without a nap is like a cupcake without frosting",
  "Protect\nyour\nPeace",
  "Disconnect\nto\nConnect",
  "Breathe in\nBreathe  out\nRepeat",
  "<3",
];
