import 'package:start_dart/start_dart.dart' as start_dart;

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
}
