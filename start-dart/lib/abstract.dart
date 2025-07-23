// 추상화 클래스는 다른 클래스들이 어떤 청사진을 가져야 하는지 정의해주므로 유용하다.
// 추상화 클래스 안에 있는 메서드를 쓰도록 강제한다.
abstract class Human {
  void walk(); // Human이라는 추상화 클래스는 walk 이라는 메소드를 갖는다.
}

class Player extends Human {
  String name;
  int xp;
  String team;

  // Human에서 왔는데 안에 정의된 메서드를 안 쓰면 에러가 난다.
  // Player 안에서 Human.walk을 사용해보자.
  void walk() {
    print("I'm walking");
  }

  Player({required this.name, required this.xp, required this.team});
}

//
// 상속
class Person {
  final String name;
  Person(this.name);

  void sayHello() {
    print("Hi my name is $name");
  }
}

enum Team { red, blue }

// player는 결국 person이니까 person을 상속한다고 하면?
class TeamPlayer extends Person {
  final Team team;

  TeamPlayer({required this.team, required String name}) : super(name);
  // super 라는 키워드를 통해 부모 클래스와 상호 작용 가능

  // 근데 만약 상속받은 함수를 커스터마이징 해주고 싶으면?
  // 뒤에 뭐 하나를 더 추가하고 싶다면?
  @override
  void sayHello() {
    super.sayHello(); // 와 ... 이게 이런 뜻이구나 상속 받은 함수를 먼저 쓰고
    print("and I play for $team"); // 내가 발동하고 싶은 함수 추가 ...
  }
}

void main3() {
  Player(name: "somda", xp: 2000, team: "pink");

  var teamPlayer = TeamPlayer(team: Team.blue, name: "somda");
  teamPlayer.sayHello();
}
