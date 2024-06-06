import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'hfile.dart';
class Learn extends StatefulWidget {
  const Learn({Key? key}) : super(key: key);

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {

  String data = ' ';
  fetchFileData() async{
    String response = await rootBundle.loadString('assets/files/story.txt');
    setState((){
      data = response;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchFileData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(title: Text('Story'),
      actions: [
        IconButton(onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Hfile()));
        }, icon: Icon(Icons.data_object))
      ],
      )

      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(data,),
            )
        ),
      )
    );
  }
}
