import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register/running_stats.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Mon', 6),
      ChartData('Tue', 11),
      ChartData('Wed', 8),
      ChartData('Thrus', 4),
      ChartData('Fri', 7),
      ChartData('Sat', 3),
      ChartData('Sun', 5)
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Stats',style: TextStyle(),),
        actions: [

        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RunningStats()),
              );
            },
            icon: const Icon(
              size: 40,
              Icons.graphic_eq_outlined,
            ),
            alignment: Alignment.topLeft)
      ],),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 800,
              width: 500,
              decoration: const BoxDecoration(
                image: DecorationImage(image:
                NetworkImage('https://thumbs.dreamstime.com/b/sports-nutrition-fitness-tools-white-wooden-background-top-view-copyspace-sports-nutrition-protein-powder-fitness-tools-155869879.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40,left: 20),
              child: ToggleSwitch(
                minWidth: 250.0,
                minHeight: 55.0,
                cornerRadius: 0.0,
                initialLabelIndex: 0,
                totalSwitches: 3,
                labels: ['Daily', 'Weekly','Monthly'],
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
            ),
            Container(
              //color: Colors.blue,
              height: 100,
              margin: EdgeInsets.only(top: 140,left: 50),
              child: Row(
                children: [
                  Icon(Icons.run_circle_outlined,size: 50,),
                  SizedBox(width: 30,),
                  Text('Weekly Running',style: TextStyle(fontSize: 20),)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 250),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    series: <ChartSeries<ChartData, String>>[
                      // Renders column chart
                      ColumnSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y
                      )
                    ]
                )
            ),
             Container(
               //color: Colors.blue,
               margin: EdgeInsets.only(top: 570),
               height: 180,
               child: Row(
                 children: [],
               ),
             )

          ],
        ),
      )
    );
  }

}
class ChartData{
  ChartData(this.x, this.y);
  final String x;
  final double y;
}