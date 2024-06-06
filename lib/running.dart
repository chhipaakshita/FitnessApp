import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register/running_stats.dart';
import 'package:register/statistics.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Running extends StatefulWidget {
  const Running({Key? key}) : super(key: key);

  @override
  State<Running> createState() => _RunningState();
}

class _RunningState extends State<Running> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Running'), actions: [
        // IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz),color: Colors.white,),
        IconButton(

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Stats()),
              );
            },
            icon: const Icon(
              size: 40,
              Icons.stacked_line_chart,
            ),
            alignment: Alignment.topLeft)
      ],
      ),
      body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 800,
                width: 450,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/photos/healthy-food-and-fitness-concept-picture-id1159591667?k=20&m=1159591667&s=612x612&w=0&h=PLhqyM0PhKaQrP8oCaFdkl8eURdClza17mqZXVc3Iow='),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                 child: Row(
                    children: [
                      Container(
                        width: 300,
                       // alignment: Alignment.topLeft,

                        child: SfRadialGauge(
                          axes: [
                            RadialAxis(
                                showLabels: false,
                                showTicks: false,
                                startAngle: 270,
                                endAngle: 270,
                                radiusFactor: 0.5,
                                axisLineStyle: const AxisLineStyle(
                                    thicknessUnit: GaugeSizeUnit.factor, thickness: 0.03),
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      angle: 180,
                                      widget: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            '50',
                                            style: TextStyle(
                                                fontFamily: 'Times',
                                                //fontSize: isCardView ? 18 : 22,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.italic),
                                          ),
                                          Text(
                                            ' / 100',
                                            style: TextStyle(
                                                fontFamily: 'Times',
                                                //fontSize: isCardView ? 18 : 22,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ],
                                      )),
                                ],
                                pointers:  <GaugePointer>[
                                  RangePointer(
                                      value: 50,
                                      cornerStyle: CornerStyle.bothCurve,
                                      enableAnimation: true,
                                      animationDuration: 1200,
                                      sizeUnit: GaugeSizeUnit.factor,
                                      gradient: SweepGradient(
                                          colors: <Color>[Color(0xFFC8E6C9), Color(0xFF4DB6AC)],
                                          stops: <double>[0.25, 0.75]),
                                      color: Color(0xFF00A8B5),
                                      width: 0.05),
                                ]),
                          ],
                        ),
                      ),
                      Container(
                        child:  Column(
                          children: [
                            Text('Calories',style: TextStyle(fontSize: 19,color: Colors.black),),
                            SizedBox(height: 10,),
                            Text('27',style: TextStyle(fontSize: 50),),
                            SizedBox(height: 10,),
                            Text('of 160',style: TextStyle(fontSize: 19,color: Colors.black),)
                          ],
                        ),
                      )

                    ],
                  ),

              ),
              Container(
                height: 25,

                margin: EdgeInsets.only(top: 340,left: 30),
               // color: Colors.blue,
               child: Column(
                 children: [
                   Text('Exp',style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 0,),),
                 ],
               ),
              ),
              Container(
                height: 25,
                width: 320,
                margin: EdgeInsets.only(top: 340,left: 70),
                //color: Colors.blue,
                child:ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: LinearProgressIndicator(
                    value: 0.7,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4DB6AC)),
                    backgroundColor: Color(0xffD6D6D6),
                  ),
                ),
              ),
              Container(
                height: 25,
                margin: EdgeInsets.only(top: 340,left: 400),
                //color: Colors.blue,
                child: Column(
                  children: [
                    Text('L10',style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 0,),),
                  ],
                ),
              ),
              Container(
                height: 90,
                width: 450,
                color: Colors.black12,
                margin: EdgeInsets.only(top: 400),
                child: Row(
                  children: [
                    SizedBox(height: 5,width: 10,),
                    Icon(Icons.run_circle_outlined,size: 50,),
                    SizedBox(height: 5,width: 10,),
                    Text('Running',style: TextStyle(fontSize: 19),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,)
                  ],
                ),
              ),
              Container(
                height: 90,
                color: Colors.black12,
                margin: EdgeInsets.only(top: 500),
                child: Row(
                  children: [
                    SizedBox(height: 5,width: 10,),
                    Icon(Icons.watch_later_outlined,size: 50,),
                    SizedBox(height: 5,width: 10,),
                    Text('Time',style: TextStyle(fontSize: 19),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,)
                  ],
                ),
              ),
              Container(
                height: 90,
                color: Colors.black12,
                margin: EdgeInsets.only(top: 600),
                child: Row(
                  children: [
                    SizedBox(height: 5,width: 10,),
                    Icon(Icons.auto_graph_rounded,size: 50,),
                    SizedBox(height: 5,width: 10,),
                    Text('Ranking',style: TextStyle(fontSize: 19),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,)
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 200,
                //color: Colors.black12,
                margin: EdgeInsets.only(top: 710,left: 120),
                child: OutlinedButton(onPressed: () {  },

                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                  ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Start',style: TextStyle(fontSize: 20),)
                      ],
                    )
                ),
              )
            ],
          )
      ),
    );
  }
}
