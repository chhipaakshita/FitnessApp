import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


class Hfile extends StatefulWidget{
  const Hfile({Key? key}) : super(key: key);
  @override
  State<Hfile> createState() => _HfileState();
}
class _HfileState extends State<Hfile> {
  // final backColor = Colors.pinkAccent;
  late Box box;
  List data = [];
  //  callPost() async {
  //    await openBox();
  //   myPost = await FetchData().getPostsModel();
  //   print(myPost[3].email);
  //   print(myPost[3].name);
  // }
 Future<bool> getPostsModel() async {
    await openBox();
    // final result = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    String url = "https://jsonplaceholder.typicode.com/comments";
    try {
      var response = await http.get(Uri.parse(url));
      final decode = jsonDecode(response.body);
      print('data: ');
      await putData(decode);
    } catch (e) {
      print('no net');
    }
    var myMap = box.toMap().values.toList();
    if (myMap.isEmpty) {
      data.add('empty');
    }
    else{
      data = myMap;
    }
    return Future.value(true);
  }

  Future putData(data) async {
    await box.clear();
    for (var d in data) {
      box.add(d);
    }
  }

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    print(dir);
    box = await Hive.openBox('data');
    // await Hive.openBox<PostsModel>('Api_box');
    // if (Hive.isBoxOpen('Api_box')) {
    //   print('box already open');
    //   //print(myPost.length);
    // }
    // else {
    //   print('in process of making box open');
    //   await Hive.openBox<PostsModel>('Api_box');
    //   print('making box open');
    // }
    // // await FetchData().getPostsModel();
    // //print(myPost.length);
  }

  @override
  void initState()   {
   openBox();
   //  callPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('hive tut'),
      ),
      body:FutureBuilder(
          future: getPostsModel(),
          builder: (ctx,snapshot){
            if (snapshot.hasData){
              if(data.contains('empty')){
                return Text('no data');
              }
              else{
                return Container(
                   child: ListView.builder(
                       itemCount: data.length,
                       itemBuilder: (ctx,index){
                         return Card(
                          child: Column(
                            children: [
                              Text(data[index]['email']),
                              Text(data[index]['name']) ,
                            ],
                          ),
                         );
                       }),

                );
              }
            }
            else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          })
    );
  }
}

