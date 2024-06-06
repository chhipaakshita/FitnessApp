import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:register/list.dart';
import 'package:register/model/todos_model.dart';
import 'package:register/query/fetch_data.dart';
import 'package:register/strength_workout.dart';
import 'package:register/title.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Workout extends StatefulWidget {

  // const Workout({required Key key}) : super(key: key);
  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  bool _isLoading=false;
 List<TodoModel> myData = [];
  void calldata() async{
    myData = (await FetchData().fetchTodoModel())  ;
    // print(myData[1].id);
    // print(myData[1].title);
    print(myData.length);

  }
  @override
  void initState()   {
    calldata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Workout',
          ),
          actions: [
            // IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz),color: Colors.white,),
            IconButton(

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StrengthWorkout()),
                  );
                },
                icon: const Icon(
                  Icons.workspaces,
                ),
                alignment: Alignment.topLeft),
            IconButton(onPressed: () async {
              // fetchdata();
              FetchData().fetchTodoModel();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Refresh()),
              // );
              setState(() {
                _isLoading=true;
              });
              await Future.delayed(const Duration(seconds: 5));
//for demo I had use delayed method. When you integrate use your api //call here.
              setState(() {
                _isLoading=false;
              });
            }, icon: Icon(Icons.refresh_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child:Stack(
            children: [
              // Container(
              //   height: 900,
              //   width: 500,
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(image: NetworkImage('https://thumbs.dreamstime.com/b/diet-healthy-food-lifestyle-health-concept-sport-exercise-equipment-workout-and-gym-background-nutrition-detox-salad-213533452.jpg'),
              //       fit: BoxFit.cover,
              //       colorFilter:  ColorFilter.mode(Colors.grey, BlendMode.softLight),
              //
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 20,left: 20),
              //   child: ToggleSwitch(
              //     minWidth: 250.0,
              //     minHeight: 55.0,
              //     cornerRadius: 0.0,
              //     initialLabelIndex: 0,
              //     totalSwitches: 2,
              //     labels: ['History', 'Log Sports'],
              //     onToggle: (index) {
              //       print('switched to: $index');
              //     },
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 80.0),
              //   child: Divider(
              //     // thickness: 3,
              //     color: Color.fromARGB(255, 104, 94, 6),
              //   ),
              // ),
              // Container(margin: EdgeInsets.only(top: 100.0,left: 13),
              //   child:Container(
              //     child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           Text('Session',),
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Text('Reps Full Body',style: TextStyle(fontSize: 20,color: Colors.black),),
              //           Spacer(),
              //           Icon(
              //             Icons.arrow_forward_ios,
              //           )
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Text('8 min, 90kcal')
              //         ],
              //       ),
              //     ],
              //   ),
              //   )
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 200.0),
              //   child: Divider(
              //     // thickness: 3,
              //     color: Color.fromARGB(255, 104, 94, 6),
              //   ),
              // ),
              // Container(margin: EdgeInsets.only(top: 220,left: 13),
              //   child:Column(
              //     children: [
              //       Row(
              //         children: [
              //           Text('Session',),
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Text('Hard Stop Legs,Core',style: TextStyle(fontSize: 20,color: Colors.black),),
              //           Spacer(),
              //           Icon(
              //             Icons.arrow_forward_ios,
              //           )
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Text('8 min, 90kcal')
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 320.0),
              //   child: Divider(
              //     // thickness: 3,
              //     color: Color.fromARGB(255, 104, 94, 6),
              //   ),
              // ),
              // Container(margin: EdgeInsets.only(top: 340.0,left: 13),
              //   child:Column(
              //     children: [
              //       Row(
              //         children: [
              //           Text('Session',),
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Text('Paleo Run Full Body',style: TextStyle(fontSize: 20,color: Colors.black),),
              //           Spacer(),
              //           Icon(
              //             Icons.arrow_forward_ios,
              //           )
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Text('8 min, 90kcal')
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 440.0),
              //   child: Divider(
              //     // thickness: 3,
              //     color: Color.fromARGB(255, 104, 94, 6),
              //   ),
              // ),
              // Container(margin: EdgeInsets.only(top: 455.0,left: 13),
              //   child:Column(
              //     children: [
              //       Row(
              //         children: [
              //           Text('Session',),
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Text('Bench Press',style: TextStyle(fontSize: 20,color: Colors.black),),
              //           Spacer(),
              //           Icon(
              //             Icons.arrow_forward_ios,
              //           )
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Text('8 min, 90kcal')
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 555.0),
              //   child: Divider(
              //     // thickness: 3,
              //     color: Color.fromARGB(255, 104, 94, 6),
              //   ),
              // ),
              // Container(margin: EdgeInsets.only(top: 569.0,left: 13),
              //   child:Column(
              //     children: [
              //       Row(
              //         children: [
              //           Text('Session',),
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Text('Biceps and Back',style: TextStyle(fontSize: 20,color: Colors.black),),
              //           Spacer(),
              //           Icon(
              //             Icons.arrow_forward_ios,
              //           )
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Text('8 min, 90kcal')
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 665.0),
              //   child: Divider(
              //     // thickness: 3,
              //     color: Color.fromARGB(255, 104, 94, 6),
              //   ),
              // ),
              // Container(margin: EdgeInsets.only(top: 680.0,left: 13),
              //   child:Column(
              //     children: [
              //       Row(
              //         children: [
              //           Text('Session',),
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Text('Time Interval',style: TextStyle(fontSize: 20,color: Colors.black),),
              //           Spacer(),
              //           Icon(
              //             Icons.arrow_forward_ios,
              //           )
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Text('8 min, 90kcal')
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 780.0),
              //   child: Divider(
              //     // thickness: 3,
              //     color: Color.fromARGB(255, 104, 94, 6),
              //   ),
              // ),
              Container(
                height:  MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                    shrinkWrap: true,
                  itemCount:myData.length,
                  itemBuilder: (_,index){
                      return getRow(index);
                   // return Container(
                   //
                   //   // margin: EdgeInsets.symmetric(vertical: 2.0,horizontal: 8.0),
                   //   child: Card(
                   //     elevation: 10.0,
                   //     child: ListTile(
                   //          title: Text('id : ${myData[index].id}'),
                   //          subtitle: Text('title : ${myData[index].title}'),
                   //     ),
                   //   ),
                   // );
                  }
                ),
              ),
            ],
          )
        ));
  }
  Widget getRow(int i){
    return GestureDetector(
      child:   Card(
      // margin: EdgeInsets.symmetric(vertical: 2.0,horizontal: 8.0),
      child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
             title: Text('id : ${myData[i].id}'),
            //subtitle:  Text('title : ${myData[i].title}'),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> TitleDemo(itemHolder: myData[i].title)));
      },
    );
  }
   // Future<void> fetchdata() async {
   //
   //   showDialog(
   //     // The user CANNOT close this dialog  by pressing outsite it
   //       barrierDismissible: false,
   //       context: context,
   //       builder: (_)
   //       {
   //         return Dialog(
   //           // The background color
   //           backgroundColor: Colors.white,
   //           child: Padding(
   //             padding: const EdgeInsets.symmetric(vertical: 20),
   //             child: Column(
   //               mainAxisSize: MainAxisSize.min,
   //               children: const [
   //                 // The loading indicator
   //                 CircularProgressIndicator(),
   //                 SizedBox(
   //                   height: 15,
   //                 ),
   //                 // Some text
   //                 Text('Loading...')
   //               ],
   //             ),
   //           ),
   //         );
   //       });
   //   await Future.delayed(const Duration(seconds: 3));
   // }
}
