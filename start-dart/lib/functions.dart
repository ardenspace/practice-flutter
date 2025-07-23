import 'package:start_dart/start_dart.dart';

String capitalizeName(String name) => name.toUpperCase();
// 인자에 null을 넣고 싶은 경우에는?
String capitalizeNameNull(String? name) =>
    name != null ? name.toUpperCase() : "SOMDA";
// 더 짧게도 가능
// 왼쪽 항이 null이면 "SOMDA"를 return 해라
String capitalizeNameNullShorter(String? name) =>
    name?.toUpperCase() ?? "SOMDA";

// typedef
typedef ListOfInts = List<int>; // 이렇게 타입 지정을 하고 나면
// List<int> reverseListOfNumbers(List<int> list) {
//   var reversed = list.reversed;
//   return reversed.toList();
// }
// 👆🏻 함수를 👇🏻 이렇게 수정할 수 있음
ListOfInts reverseListOfNumbers(ListOfInts list) {
  var reversed = list.reversed;
  return reversed.toList();
  // toList를 꼭 붙이는 이유? 인자로 list를 보내주지만 reversed 로 데이터 요소를 역순으로 바꿀 때 itarable<T>로 데이터 형태가 변함 이 함수는 List<int>를 변환해야 한다고 앞에서 정의를 해주었으므로 itarable<T> 이 형태를 다시 리스트 형태로 바꿔줘야 함. 따라서 toList를 쓰는 것!
}

// typedef 는 간단한 형태의 데이터를 활용할 때 쓰인다
// 그럼 구조화된 데이터 형태를 사용하려면 어떻게 해야할까?
// class의 활용이 여기서 나온다.

// *** class ***
// 초대 클래스
// class Player {
//   String name = 'somda Lee';
//   int xp = 1500;

//   void sayHello() {
//     print(
//       "Hi, my name is $name",
//     ); // 바로 이렇게 쓸 수 있음 다른 데에서는 this.~~ 이런 식으로 쓰이지만! 물론 this를 써도 되긴 하지만 권장 사항은 ㄴㄴ
//   }
// }

// player name과 xp를 전달 받아서 늘 새로운 player를 나오게 하고 싶다면?
// 2대 클래스
class Player {
  late final String name;
  late int xp;

  // constructor method 클래스랑 이름 똑같게!
  Player(String name, int xp) {
    this.name = name;
    this.xp = xp;
  }

  void sayHello() {
    print("Hi, my name is $name");
  }
}

// 흠 근데 이건 좀 반복적이지 않음? 이미 타입이 있는데 또 반복적으로 쓰고 하는 부분들이 너무 ... 효율적이지 못한데?

// 클래스 2를 줄여보자
// 클래스 3
class ShorterPlayer {
  final String name;
  int xp;

  // constructor method 클래스랑 이름 똑같게!
  ShorterPlayer(this.name, this.xp);

  void sayHello() {
    print("Hi, my name is $name");
  }
}

// 근데 만약 여기서 class가 엄청 커지면 어떡해?
// 클래스 4
class TeamPlayer {
  final String name;
  int xp;
  String team;
  int age;

  // TeamPlayer(this.name, this.xp, this.team, this.age);
  // 이 모든 걸 순서를 맞춰야한단 점이야... 이게 만약 10개, 100개, 1000개가 되면?
  // 순서 어케 외워요 ; ; ;

  // 해결법: named constructor parameter
  // 함수랑 똑같이 쓸 수 있음
  TeamPlayer({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  // 근데 만약에 다른 건 다 같은데 blue팀의 xp는 0인 플레이어와
  // red팀의 xp는 0인 플레이어를 만들고 싶다면 어떡할까?
  // 클래스 5 : named constructor
  // 여기서 클론: 의 의미? player 객체를 초기화하겠다고 선언하는 것과 같다.
  TeamPlayer.createBluePlayer({required String name, required int age})
    : this.age = age,
      this.name = name,
      this.team = "blue",
      this.xp = 0;

  TeamPlayer.createRedPlayer(String name, int age)
    : this.age = age,
      this.name = name,
      this.team = 'red',
      this.xp = 0;
}

// Recap Class
class BigPlayer {
  final String name;
  int xp;
  String team;

  BigPlayer.fromJson(Map<String, dynamic> playerJson)
    : name = playerJson['name'],
      xp = playerJson['xp'],
      team = playerJson['team'];

  void sayHello() {
    print("Hi, my name is $name");
  }
}

// 개발자들의 typo 실수를 줄여주는 기능도 있다!
// Enums!
// 컬러 정의할 때에도 많이 쓴다.
// class 6
enum Team { red, blue } // 심지어 "" 처리를 안 해도 됨

enum XPLevel { beginner, medium, pro }

class EnumsPlayer {
  String name;
  XPLevel xp;
  Team team; // 이렇게 정의해주면 됨 ... 짱이다

  EnumsPlayer({required this.name, required this.xp, required this.team});

  void sayHello() {
    print("Hi, my name is $name");
  }
}

void main2() {
  var player = ShorterPlayer("somda", 15000);
  print(player.xp);
  player.sayHello();

  var player2 = ShorterPlayer("som", 1000);
  player2.sayHello();

  // positional / too many arguments
  var player3 = TeamPlayer(name: "som", xp: 1000, team: "blue", age: 20);

  // 클래스 5
  var bluePlayer = TeamPlayer.createBluePlayer(name: "blueLee", age: 25);
  var redPlayer = TeamPlayer.createRedPlayer("somda", 20);

  var apiData = [
    {"name": "somda", "team": "purple", "xp": 0},
    {"name": "hyeono", "team": "purple", "xp": 0},
    {"name": "dasom", "team": "purple", "xp": 0},
  ];

  apiData.forEach((playerJson) {
    var player = BigPlayer.fromJson(playerJson);
    player.sayHello();
  });

  // 클래스 6
  // 미리 정의해놨으니 아주 간편하게 고를 수 있고 실수도 확실하게 줄일 수 있다.
  var enumPlayer = EnumsPlayer(
    name: "somda",
    xp: XPLevel.beginner,
    team: Team.blue,
  );
}
