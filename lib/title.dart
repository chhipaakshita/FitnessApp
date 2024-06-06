import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register/model/todos_model.dart';
class TitleDemo extends StatefulWidget {
  final String itemHolder ;
  const TitleDemo( {Key? key,  required this.itemHolder, }) : super(key: key);

  @override
  State<TitleDemo> createState() => _TitleDemoState();
}

class _TitleDemoState extends State<TitleDemo> {

  @override
  void initState()   {
    // print('getting data');
    // print(widget.itemHolder);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Title from Api') ,),

      body: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(top:20,left: 30),
        height: 100,
        child:Card(
          child: Column(
            children: [
            Text('title : ${widget.itemHolder}'),
            ],
          )
        )
      ),
    );
  }
  // Widget getTitle(int i){
  //   return GestureDetector(
  //     child:   Card(
  //       // margin: EdgeInsets.symmetric(vertical: 2.0,horizontal: 8.0),
  //       child: Column(
  //
  //         //crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           ListTile(
  //             title: Text('id : ${myData[i].title}'),
  //             //subtitle:  Text('title : ${myData[i].title}'),
  //           )
  //
  //         ],
  //       ),
  //     ),
  //     // onTap: () {
  //     //   Navigator.push(
  //     //     context,
  //     //     MaterialPageRoute(builder: (context) => Titles()),
  //     //   );
  //     // },
  //
  //   );
  // }
}
