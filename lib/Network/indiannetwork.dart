import 'dart:convert';

import 'package:app1/newsappmodel.dart/indiannewsmodel.dart';
import 'package:http/http.dart';

class Indiannetwork {
  Future<IndiannewsData> getIndiannews({String category}) async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=" +
        category +
        "&apiKey=11b12ddd90c64a6bbdc88008d3fcb708";
    final response = await get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception("Unable to load data");
    } else {
      var jsonData = json.decode(response.body);
      var mappedJsonData = IndiannewsData.fromJson(jsonData);
      return mappedJsonData;
    }
  }
}
