import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/modelclass.dart';
import 'package:http/http.dart' as http;

class MyController with ChangeNotifier {
  Model mymodel = Model();
  Map<String, dynamic> decodeData = {};
  bool isloading = false;

  fetchData() async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=604580e027e14c8d9fe56f738068e266");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
      mymodel = Model.fromJson(decodeData);
      notifyListeners();
    } else {
      print("api failed");
    }
  }
}
