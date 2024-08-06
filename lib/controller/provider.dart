import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machine_test/model/model.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel> news = [];  // a list to store the data
  bool hasMore = true; // Tracking if more data is available
  int offset = 0;
  final int limit = 20;
  final imgUrl = Uri.parse('https://kumudam.com/'); // base url

  Future<void> fetchData() async {
    if (!hasMore) return;
    final url = Uri.parse(
        'https://news.kumudam.com/api/posts/?limit=$limit&offset=$offset&order=id&orderType=desc');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> data = jsonData;
        if (data.isEmpty) {
          hasMore = false; // No more data to fetch
        } else {
          offset += limit;
          news.addAll(data.map((item) => NewsModel.fromJson(item)).toList());
        }
        notifyListeners();
      } else {
        throw Exception('Failed to load News');
      }
    } catch (error) {
      rethrow;
    }
  }


  
}
