import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/post_model.dart';

class PostRepository {
  final String url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "User-Agent": "Flutter-App"
      },
    );

    print("STATUS: ${response.statusCode}");

    if (response.statusCode == 200) {
      List list = json.decode(response.body);
      return list.map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch posts: ${response.statusCode}");
    }
  }


  Future<PostModel> fetchPostDetail(int id) async {
    final response = await http.get(
      Uri.parse("$url/$id"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "User-Agent": "Flutter-App"
      },
    );
  //  final response = await http.get(Uri.parse("$url/$id"));

    if (response.statusCode == 200) {
      return PostModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to fetch post detail");
    }
  }

  Future<void> saveToLocal(List<PostModel> posts) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = jsonEncode(posts.map((e) => e.toJson()).toList());
    await prefs.setString("posts", data);
  }

  Future<List<PostModel>> getFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString("posts");

    if (data != null) {
      List list = jsonDecode(data);
      return list.map((e) => PostModel.fromJson(e)).toList();
    }
    return [];
  }
}
