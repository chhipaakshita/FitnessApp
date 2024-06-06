import 'dart:convert';
import 'dart:core';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:register/list.dart';
import 'package:register/model/user_model.dart';
import '../model/image_model.dart';
import '../model/posts_model.dart';
import '../model/todos_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import '../user.dart';

class FetchData{
  Future<List<TodoModel>> fetchTodoModel() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/'),
    );
    if (response.statusCode == 200) {
      print('data: ');
      // return [for(final i in jsonDecode(response.body)) TodoModel.fromJson(i)];
      final data = jsonDecode(response.body);

      print(data);
      // List jsonResponse = json.decode(response.body);
      // return jsonResponse.map((data) => new TodoModel.fromJson(data)).toList();
      return data.map<TodoModel>((json) => TodoModel.fromJson(json)).toList();
      // return TodoModel.fromJson(data);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future <List<UserModel>> fetchUserModel() async {
    final res1 = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (res1.statusCode == 200) {
      print('data: ');
      final data = jsonDecode(res1.body) ;
      print(data);
      return data.map<UserModel>((json) => UserModel.fromJson(json)).toList() ;
    } else {
      throw Exception('Failed to load album');
    }
  }
  Future <List<ImageModel>> fetchImageModel() async {
    final res2 = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (res2.statusCode == 200) {
      print('data: ');
      final data = jsonDecode(res2.body) ;
      print(data);
      return data.map<ImageModel>((json) => ImageModel.fromJson(json)).toList() ;
    } else {
      throw Exception('Failed to load album');
    }

  }
  //  getPostsModel() async{
  //   // final http.Response res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
  //   // final data= jsonDecode(res.body);
  //   // return data;
  //
  //   // final posts = Hive.box(Api_box).get('posts',defaultValue: []);
  //   final result = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
  //   //final posts = Hive.box(Api_box).get('posts',defaultValue: []);
  //   //if(posts.isNotEmpty) return posts;
  //     print('data: ');
  //     final data = jsonDecode(result.body) ;
  //     // Hive.box<PostsModel>(Api_box).put('Api_box', data);
  //   await putData(data);
  //     print(data);
  //     return data.map<PostsModel>((json) => PostsModel.fromJson(json)).toList() ;
  //
  // }

}
// var value = <Map<String, dynamic>>[];

// final result = await Future.wait([
// http.get(Uri.parse('https://iptv-org.github.io/api/streams.json')),
// http.get(Uri.parse('https://iptv-org.github.io/api/channels.json')),
// http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/'),)
// ]);
// final result1 = json.decode(result[0].body) as List<dynamic>;
// final result2 = json.decode(result[1].body) as List<dynamic>;
// final result3 = json.decode(result[3].body) as List<dynamic>;
// for(var response in result){
// print(response.statusCode);
// print(result1);
// }