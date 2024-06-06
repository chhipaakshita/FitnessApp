import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register/running.dart';
class StrengthWorkout extends StatefulWidget {
  const StrengthWorkout({Key? key}) : super(key: key);

  @override
  State<StrengthWorkout> createState() => _StrengthWorkoutState();
}

class _StrengthWorkoutState extends State<StrengthWorkout> {
  int count = 0;
  int wcount = 0;

  void incrementCount(){
    setState((){
      count++;
    });
  }
  void decrementCount(){
    setState((){
      count--;
    });
  }

  void incrementwCount(){
    setState((){
      wcount++;
    });
  }
  void decrementwCount(){
    setState((){
      wcount--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Strength Workout'),
        actions: [
          // IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz),color: Colors.white,),
          IconButton(

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Running()),
                );
              },
              icon: const Icon(
                size: 40,
                Icons.run_circle,
              ),
              alignment: Alignment.topLeft)
        ],
      ),
      body:SingleChildScrollView(
        child: Stack(
            children: [
              Container(
                height: 800,
                width: 500,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://previews.123rf.com/images/ffphoto/ffphoto2002/ffphoto200200017/141966090-fitness-background-with-exercise-plan-notebook.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                //padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
                child: ElevatedButton(
                  onPressed:(){} ,
                  child: Row(
                   // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Text('Chest Press'),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(150),
                padding: EdgeInsets.only(left: 30),
                child: Text('Reps', textAlign: TextAlign.center,style:TextStyle(fontSize: 20) ,),
              ),
              Container(
                  margin: EdgeInsets.only(top: 200,left: 0),
                  child: Container(
                    margin: EdgeInsets.only(left: 70),
                    width: 290,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(onPressed: incrementCount,
                          child: Icon(Icons.add),),
                        Text("${count}"),
                        FloatingActionButton(onPressed: decrementCount,
                          child: Icon(Icons.remove),
                        )
                      ],
                    ),
                  )
              ),
              Container(
                // margin: EdgeInsets.all(250),
                margin: EdgeInsets.only(top: 340),
                padding: EdgeInsets.only(left: 170),
                child: Text('Weight', textAlign: TextAlign.center,style:TextStyle(fontSize: 20) ,),
              ),
              Container(
                  margin: EdgeInsets.only(top: 400,left: 0),
                  child: Container(
                    margin: EdgeInsets.only(left: 70),
                    width: 290,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(onPressed: incrementwCount,
                          child: Icon(Icons.add),),
                        Text("${wcount}"),
                        FloatingActionButton(onPressed: decrementwCount,
                          child: Icon(Icons.remove),
                        )
                      ],
                    ),
                  )
              ),
              Container(
                  height: 50,
                  width: 200,
                  margin: EdgeInsets.only(top:550,left: 110),
                  child: OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                      ),
                      onPressed:(){} ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: [
                          Text('Start')
                        ],
                      )
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 650,left: 10),
                width: 40,
                height: 40,
                //padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
                child: ElevatedButton(
                  onPressed:(){} ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.arrow_back_ios),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 640,left: 65),
                child:  Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: 320,
                  height: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: LinearProgressIndicator(
                      value: 0.7,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                      backgroundColor: Color(0xffD6D6D6),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 650,left: 400),
                width: 40,
                height: 40,
                //padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
                child: ElevatedButton(
                  onPressed:(){} ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),


          ],
                ),
              )

          );



  }
}
