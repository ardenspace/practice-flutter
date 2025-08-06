import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({super.key, required this.episode, required this.webtoonId});

  final String webtoonId;
  final WebtoonEpisodeModel episode;

  onButtonTap() async {
    await launchUrlString(
      "https:/comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}",
    );
    // lauchUrl에 왜 await 을 붙이냐면 마우스를 올려볼래? 타입이 Future야 아하 비동기로 해야 하는 군! 알 수 있다.
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              blurRadius: 5.0,
              spreadRadius: 0.0,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                // 단어 때문에 헷갈릴 수 있지만 flutter에서의 row는 무한히 공간을 준다. 그래서 줄이고 싶은 영역을 Expanded나 Flexible 로 감싸야 한다. expanded의 뜻은 가능한 영역을 최대한 확장해서 줘라 ... 라는 뜻인데 그러니까 지금 버튼이 있잖아? 그 버튼 안에서 줄 수 있는 최대치를 얘한테 할당하라는 소리임
                // [ |---최 대 한---| 아이콘 ] 이런 식인 거임
                child: Text(
                  episode.title,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
