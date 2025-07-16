int calculate() {
  print("HEllo!");
  return 6 * 7;
}

// function
// void: 아무것도 return 하지 않는다
void sayHello(String name) {
  print("Hello $name nice to meet you!");
}

// 만약 print 말고 대신 return을 한다? 그럼 에러가 남.
String sayHelloToString(String name) {
  return "Hello $name nice to meet you! ☺️👍";
}

// =
// 이런 식으로 코드가 한 줄 때 fat arrow function을 쓰면 됨
// 1.
String isTheSameWithSayHelloToString(name) =>
    "Hello $name nice to meet you! 🏃🏻🏃🏻";
// 2.
num plus(num a, num b) => a + b;
