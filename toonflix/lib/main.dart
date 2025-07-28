import 'package:flutter/material.dart';

class Player {
  String? name;

  Player({required this.name});
}

void main() {
  var somda = Player(name: "somda");
  runApp(const App());
}

// 플러터는 위젯을 쌓아 올려 만든다.
// 위젯을 합치는 방식으로 앱을 구성하는데 모든 위젯은 build 메서드를 구현해야 한다.
// 이 위젯을 사용하려면 이 메서드를 구현해라 .. 라는 일종의 걔약인 셈!
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 테마를 꼭 설정해줘야 함. material 스타일로 할 건지, ios 스타일인 cupertino 스타일로 할 건지 .. 커스터마이징 수월하다며? ㅇㅇ 그렇긴 함 근데 기본적으로 베이직이 되는 뼈대는 프로젝트 시작점에서 골라줘야 함. 물론 구글에서 만든 material style이 보기 좋겠지? 마음에 안 든다고 해도 어쩔 수 없고 또 뭔가를 골랐다고 해서 그 디자인이 통용되는 것도 아님 커스터마이징 아주 자유로움
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Hey, Selena",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Welcome back",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 80),
              Text(
                'Total Balance',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                '\$5 194 482',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 50,
                      ),
                      child: Text("Transfer", style: TextStyle(fontSize: 22)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    // Hello, world! 만 치니까 띡 나오긴 했는데 생긴 게 좀 못생겼어 ... 왜냐? flutter는 화면이 scaffold 라는 걸 가져야 한다는 규칙이 있거든! scaffold는 화면의 구조를 뜻하는데 모든 모바일 화면은 scaffold가 필요해. 그래서 위에서처럼 Scaffold를 갖고 와서 text를 뿌려주는 방식을 써야 정상적인 Hello, world!가 나온다.
  }
}
