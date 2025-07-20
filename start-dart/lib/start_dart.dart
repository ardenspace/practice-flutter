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

// positional parameters
String sayHello2(String name, int age, String country) {
  return "Hello $name, you are $age, and you came from $country";
}

// 이렇게 사용하면 name, age, country 가 null 일 수 있는데 어떻게 할 거임?
// 무슨 말이냐면 sayHello3(age: 20) 유저가 값을 이렇게 줄 수도 있잖아

// 1. 첫 번째 해결책: 디폴트 값 부여
String sayHello3({
  String name = 'dasom',
  int age = 20,
  String country = "korea",
}) {
  return "Hello $name, you are $age, and you came from $country";
}
// String sayHello3({String name = 'suna', int age = 20, String country = "korea"}) {
//   return "Hello $name, you are $age, and you came from $country";
// } 디폴트 값이 지정돼 있으니 sayHello3() 이렇게 함수를 불러오는 것도 가능

// 2. 두 번째 해결책: required
String sayHello4({required String name, required age, required country}) {
  return "Hello $name, you are $age, and you came from $country";
}

// 3. 세 번째 해결책: optional positional parameter
// 근데 이미 디폴트 값을 주는 게 있는데 왜 굳이 저렇게 쓰지?
// 저건 함수를 실행할 때 print(start_dart.sayHello3(age: 20, country: "Republic of korea")); 이런 식으로 꼭 키값과 함께 줘야 한다.
// 이 방식은 순서만 지키고 인자값만 보내줘도 되는 데에서 차이가 있다.
String sayHello5(String name, int age, [String? country = 'korea']) =>
    'Hello, this is $name, she is $age years old from $country';
