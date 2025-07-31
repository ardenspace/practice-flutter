import 'package:flutter/material.dart';

class Player {
  String? name;
  Player({required this.name});
}

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;
  List<int> numbers = [];

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  // 완전 리액트랑 비슷하다.
  // state의 개념이 있음 state 없이 그냥 함수를 때려 넣으면 아무것도 안 바뀜
  // 왜? 플러터가 지금 이게 바뀌고 있는 건지 아닌지 감지를 못함 여기서 필요한 게?
  // setState임 ... 짱이지? 이걸 써줘야 플러터가 새로운 데이터가 있다는 걸 알게 되는 거임!

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // 설정 한 번으로 모든 테마를 유지할 수 있다.
        textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.red)),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4FDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text("nothing"),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye_rounded),
              ),
            ],
            // 자 그럼 이 칠드런이 저 제일 대빵 요소에 닿아야만 테마가 작동된다.
            // 이걸 도와주는 게 context임!
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({super.key});

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

  @override
  void initState() {
    // 상태를 초기화하기 위한 메서드
    // 자주 쓰이진 않음
    super.initState();
    print("iniState!"); // build가 시작되기 전에 동작함
  }

  @override
  void dispose() {
    // 위젯트리에서 위젯이 제거될 때에 dispose 메서드가 발생함
    super.dispose();
    print("dispose!");
  }

  @override
  Widget build(BuildContext context) {
    print("build!");
    return Text(
      "My Large Title",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
