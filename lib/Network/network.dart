import 'package:app1/newsappmodel.dart/newsmodel.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Network {
  Future<Newsappmodel> getData({String query}) async {
    String url = "https://newsapi.org/v2/everything?q=" +
        query +
        "&sortBy=publishedAt&apiKey=11b12ddd90c64a6bbdc88008d3fcb708";
    final response = await get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception("unable to load data");
    } else {
      //convert the string data into objects form
      var jsonData = json.decode(response.body);
      //map the data with the class made
      var mappedJson = Newsappmodel.fromJson(jsonData);
      return mappedJson;
    }
  }
}
