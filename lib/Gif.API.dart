import 'dart:convert';
import 'package:http/http.dart' as http;

class Gif {
  final String url;

  Gif({required this.url});

  factory Gif.fromJson(dynamic json) {
    return Gif(
      url: json['url'] as String);
    //['data']['data[0]']['images']['original']['url']
  }

  static List<Gif> gifFromShaphot(List snapshot) {
    return snapshot.map((data) {
      return Gif.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Gig {url: $url}';
  }
}

class GifApi {
  static Future<List<Gif>> getGif(_search) async {

      var uri = Uri.http('api.giphy.com', '/v1/gifs/search', {
        'api_key': 'UcWK8U8aTC4JRwULhLUkjHhWFfilmJsW',
        'bundle': 'sticker_layering',
        'q': '$_search',
        'limit': '20'
      });
      if (_search == '' || _search == null){
        uri = Uri.http('api.giphy.com', '/v1/gifs/trending', {
          'api_key': 'UcWK8U8aTC4JRwULhLUkjHhWFfilmJsW',
          'bundle': 'sticker_layering',
          'rating': 'G',
          'limit': '20'
        });}
    final response = await http.get(uri);

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['data']) {
      _temp.add(i['images']['original']);
    }

    return Gif.gifFromShaphot(_temp);
  }
}
