import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:register/model/user_model.dart';
import 'package:register/query/fetch_data.dart';
import 'package:register/read.dart';
import 'model/image_model.dart';

const String Api_box = "api_data";
class ListViews extends StatefulWidget {
  const ListViews({Key? key}) : super(key: key);

  @override
  State<ListViews> createState() => _ListViewsState();
}
//final text = new Text('Text here', style: new TextStyle(fontSize: 50.0),);

final margin = const EdgeInsets.only(bottom: 10.0, right: 10.0, left: 10.0);

final backColor = Colors.lightGreen;

class _ListViewsState extends State<ListViews> {
  Box? box;
  bool _isLoading=false;
 List<UserModel> myInfo= [];
 List<ImageModel> myImg=[];

 void callImg() async {
   myImg = await FetchData().fetchImageModel();
   // print(myImg.length);
   // print(myImg[1].title);
   // print(myImg[1].url);
 }
  void callUser() async{
    myInfo = await FetchData().fetchUserModel();
    // print(myInfo.length);
    // print(myInfo[2].email);
    // print(myInfo[1].name);
    // print(myInfo[1].catchPhrase);
    //print(myInfo[1].company);
  }
  @override
  void initState()   {
    callImg();
    callUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Exercises'),
      actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Read()));
          }, icon: Icon(Icons.add)),
        IconButton(onPressed: () async {
          // fetchdata();
          FetchData().fetchImageModel();
          FetchData().fetchUserModel();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Refresh()),
          // );
          setState(() {
            _isLoading=true;
          });
          await Future.delayed(const Duration(seconds: 2));
//for demo I had use delayed method. When you integrate use your api //call here.
          setState(() {
            _isLoading=false;
          });
        }, icon: Icon(Icons.refresh_outlined)),

      ],
      ),
      body: SafeArea(//I didnt add appbar. this will add necessary padding for status bar.
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: width /1, // this will give you flexible width not fixed width
                margin: margin, // variable
                color: backColor,// variable
                child: ListView.builder(
                  shrinkWrap: true,
                   itemCount: myInfo.length,
                    itemBuilder: (_,index){
                      return GestureDetector(
                        child:   Card(
                          // margin: EdgeInsets.symmetric(vertical: 2.0,horizontal: 8.0),
                          child: Column(
                            children: [
                              Text('email : ${myInfo[index].email}'),
                              Text('company name : ${myInfo[index].name}') ,
                              Text('name : ${myInfo[index].catchPhrase}') ,
                            ],                        //crossAxisAlignment: CrossAxisAlignment.start,

                          ),

                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: width /1, // this will give you flexible width not fixed width
                margin: margin, //variable
                color: backColor,//variable
                child:GestureDetector(
                  child:   Card(
                    // margin: EdgeInsets.symmetric(vertical: 2.0,horizontal: 8.0),
                    child:ListView.builder(
                      itemCount: myImg.length,
                      itemBuilder: (_,index){
                        return GestureDetector(
                          child: Card(
                            child: Container(

                             // margin: EdgeInsets.only(right: 300),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(

                                        margin:EdgeInsets.only(left: 10),
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(myImg[index].url),
                                        ),
                                      ),
                                      SizedBox(width: 30,),
                                      Container(
                                        width: 330,
                                        child: Text('title : ${myImg[index].title}'),
                                      )
                                    ],
                                  )
                                ],
                              )
                            )
                          ),
                        );
                      })

                  ),
                )
                )
              ),

          ],
        ),
      ),

    );
  }
}
