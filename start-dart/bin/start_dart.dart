import 'package:start_dart/start_dart.dart' as start_dart;
import 'package:start_dart/functions.dart' as functions;

void main(List<String> arguments) {
  // dart 는 무조건 main을 실행한다. index or app 이랑 같은 거임
  // 세미클론을 자동으로 달아주지 않으니 내가 꼭 달아줘야 함
  // 이유? 세미콜론을 일부러 사용하지 않을 때가 있기 때문
  print('Hello world: ${start_dart.calculate()}!');

  // 변수? var or 타입 명시
  // 함수나 메소드 내에 지역 변수를 선언할 때에는 var
  // 클래스나 property 선언할 때에는 type 명시
  String name = "dasom";
  name = "1";
  print(name);

  // dynamic = it could be anything
  // 타입이 명시된 게 아니므로 사용을 권장하진 않지만 어쩔 수 없이 써야할 때도 있다. 그러므로 알아두는 게 좋음
  dynamic age;
  print(age);

  // 변경할 수 없는 상수는?
  // final
  final job = "dev";
  final String firstName = "DASOM"; // 이런 식으로도 가능

  // null safety?
  bool isEmpty(String? string) => string == null || string.isEmpty;
  isEmpty(null);
  // 이러면 당연히 error가 나겠지?
  // dart 에서는 null이 굉장히 유용하다.
  // null도 될 수 있다는 걸 알려주려면? 타입 뒤에 ? 를 넣어주면 된다.
  // fetching Data (api) 일 때 유용하게 쓰인다.

  // late?
  // 변수를 만드는데 데이터 없이 만들 수 있는 형태
  // 어떤 데이터가 올지 모른다면 이 기능이 굉장히 유용할 수 있다.
  late final String title;
  // do something
  title = "This is Something";

  // const는?
  // 상수임 그런데 더 중요한 기능이 있음
  // 리액트의 const는 final 이랑 더 가까움
  // dart의 const는? compile-time을 아는 값이라 할 수 있음
  const API = '컴파일할 때 알고 있는 값';
  // 예를 들어 사용자가 입력하는 값 < 이런 건 final 이 되겠지?
  // const는 앱을 빌드할 때 이미 우리가 알고 있는 값 like const max_allowed_price;

  // 특이한 점이 var 을 가능한 한 많이 쓰도록 권장된대
  // 타입을 사용하는 방식은 class의 property를 쓸 때 권장

  // num?
  // num은 int가 될 수도 있고 double이 될 수도 있음

  // List 라는 형태
  List<int> numbers = [1, 2, 3, 4];
  numbers.add(33); // 여기는 number 만을 추가할 수 있는 것임
  print(numbers.first);
  print(numbers.last);

  // collection if
  var giveMeFive = true;
  var nums = [1, 2, 3, 4, if (giveMeFive) 5]; // 댑악 정말 편리한 기능
  print(nums);

  // String interpolation
  var myName = "dasom";
  var myAge = 30;
  var greeting = 'Hi, this is $myName! Say hello. She is ${myAge - 10}.';
  // 그냥 변수를 사용하고 싶은 거면 중괄호 ㄴㄴ
  // 무언가를 계산하고 싶다면 계산할 내용을 중괄호에 붙여주면 됨
  // '', "" 상관 없이 쓸 수 있다!
  print(greeting);

  // collection for
  var oldFriends = ['dasom', 'heeri'];
  var newFriends = [
    'hongbi',
    'ziso',
    "sun-a",
    for (var friend in oldFriends)
      "❤️ $friend", // oldFriends에 newFriends를 넣고 싶다면?
  ];
  print(newFriends);

  // map
  var player = {'name': 'nico', 'xp': 19.99, 'superpower': false};
  Map<int, bool> player2 = {1: true, 2: false, 3: true};
  // 이런 형태도 가능하다
  Map<List<int>, bool> player3 = {
    [1, 2, 3, 5]: true,
  };
  List<Map<String, Object>> players = [
    {
      'name': 'dasom',
      'xp': 199999, // value가 Object 형태면 값이 아무거나 올 수 있다.
    },
  ];

  // Sets
  // set 안에 들어 있는 모든 요소는 유니크하다.
  Set<int> number4 = {1, 2, 3, 4};
  number4.add(1);
  number4.add(1);
  number4.add(1);
  number4.add(1);
  print(
    number4,
  ); // 결과값 {1, 2, 3, 4} 1을 많이 추가했지만 값이 하나만 나온다. set = 시퀀스 있음 그래서 모든 요소가 유니크해야 한다. 정말 유용한 기능이겠다.

  // function
  start_dart.sayHello("dasom");
  print(start_dart.sayHelloToString("dasom"));
  print(start_dart.isTheSameWithSayHelloToString("dasom"));

  // named parameters
  print(start_dart.sayHello2("dasom", 31, "Republic of korea"));
  // 인자를 보내주는 건 좋지만 인자들이 뭘 뜻하는지를 전혀 알지 못함.
  // 이럴 때 쓰는 게? named parameters
  // 인자의 순서를 기억하는 게 아니라
  print(start_dart.sayHello3(age: 20, country: "Republic of korea - -  -"));
  // 이렇게 순서에 관계없이 이름을 지정해서 인자로 보내줄 수 있다.
  print(start_dart.sayHello4(name: "me", age: 33, country: "korea"));
  // [type? ]
  print(start_dart.sayHello5("dasom", 30));

  // < - - import functions
  print(functions.capitalizeName("dasom"));
  print(functions.capitalizeNameNull(null));
  print(functions.capitalizeNameNullShorter(null));

  // ?? 의 쓰임
  String? yourName;
  yourName ??= "SOMDA";

  // typedef
  print(functions.reverseListOfNumbers([1, 2, 3]));
}
