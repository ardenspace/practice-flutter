import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/sevices/api_service.dart';

// 1.
// 기본으로 쓰는 방식은 이렇다.
// react 쓰는 거랑 똑같음 state를 정의하고 useEffect로 api get 정보를 가져오고 setState로 넣어주고
// 그런데 사실 이 방식이 ... 굉장히 귀찮긴 하다 할 게 너무 많잖아 isLoading도 따로 만들어줘야 하고
// class HomeScreen extends StatefulWidget {...
// List<WebtoonModel> webtoons = [];
// bool isLoading = true;
// void waitForWebtoons() async {
//   webtoons = await ApiService.getTodaysWebtoonList();
//   isLoading = false;
//   setState(() {});
// }

// @override
// void initState() {
//   super.initState();
//   waitForWebtoons();
// }

// 근데 이걸 플러터에서는 줄일 수 있다는데 . . ?!

// 2.
// 실제로 플러터에서는 state를 많이 안 쓴다고 한다. 최대한 사용 ㄴㄴ
// state를 아예 안 쓰는 widget와 framework가 많다고 한다.
// 그럼 어떻게 쓰는가?
// statefulWidget도 안 쓴다 statelessWidget ㄱㄱ

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysWebtoonList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 2,
        centerTitle: true,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
      body: FutureBuilder(
        // 이것 덕분에 1번을 쓰지 않아도 되고 statelessWidget을 사용할 수 있는 것임
        future: webtoons,
        builder: (context, futureRes) {
          if (futureRes.hasData) {
            // ListView : 정말 너무 좋은 기능
            // 리스트를 띄우는 데 최적화된 widget
            // itemBuilder 기능 덕분에 화면에 보이는 부분만 데이터가 그때 그때 렌더링 됨 ... 혁신 ...
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: futureRes.data!.length,
              itemBuilder: (context, index) {
                var webtoon = futureRes.data![index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
