import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysWebtoonList() async {
    List<WebtoonModel> webtoonInstanceList = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonWebtoonList = jsonDecode(response.body);
      for (var webtoon in jsonWebtoonList) {
        var instance = WebtoonModel.fromJson(webtoon);
        webtoonInstanceList.add(instance);
      }
      return webtoonInstanceList;
    }
    throw Error();
  }
}
