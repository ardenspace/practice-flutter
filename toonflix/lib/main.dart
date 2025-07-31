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
  List<int> numbers = [];

  // 완전 리액트랑 비슷하다.
  // state의 개념이 있음 state 없이 그냥 함수를 때려 넣으면 아무것도 안 바뀜
  // 왜? 플러터가 지금 이게 바뀌고 있는 건지 아닌지 감지를 못함 여기서 필요한 게?
  // setState임 ... 짱이지? 이걸 써줘야 플러터가 새로운 데이터가 있다는 걸 알게 되는 거임!
  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4FDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Click Count", style: TextStyle(fontSize: 30)),
              for (var n in numbers) Text('$n'),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(Icons.add_box_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
