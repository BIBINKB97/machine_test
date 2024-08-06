import 'package:flutter/material.dart'; 
import 'dart:convert'; 
import 'package:http/http.dart' as http;
import 'package:machine_test/model/api_model.dart';


class NewsProvider extends ChangeNotifier {
  List<NewsModel> news = []; 
  final imgUrl = Uri.parse('https://kumudam.com/');
 
  Future<void> fetchNews() async {
    final url = Uri.parse('https://news.kumudam.com/api/posts/?limit=20&offset=0&order=id&orderType=desc');  
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> data = jsonData;
        news = data.map((item) => NewsModel.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load News');
      }
    } catch (error) {      
      rethrow;  
    } 
  }
}
