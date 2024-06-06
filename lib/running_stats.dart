import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'list.dart';

class RunningStats extends StatefulWidget {
  const RunningStats({Key? key}) : super(key: key);

  @override
  State<RunningStats> createState() => _RunningStatsState();
}

class _RunningStatsState extends State<RunningStats> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Mon', 5),
      ChartData('Tue', 10),
      ChartData('Wed', 20),
      ChartData('Thrus', 15),
      ChartData('fri', 35),
      ChartData('Sat', 25),
      ChartData('Sun', 30)
    ];
    final List<ChartData> Data = [
      ChartData('Mon', 20),
      ChartData('Tue', 40),
      ChartData('Wed', 30),
      ChartData('Thrus', 25),
      ChartData('fri', 45),
      ChartData('Sat', 50),
      ChartData('Sun', 45)
    ];
    return Scaffold(
        appBar: AppBar(title: Text('Runing Stats'),
            actions: [
              // IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz),color: Colors.white,),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListViews()),
                    );
                  },
                  icon: const Icon(
                    size: 40,
                    Icons.list,
                  ),
                  alignment: Alignment.topLeft)
            ]
        ),
        body: Center(

            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries<ChartData, String>>[
                  // Renders line chart
                  LineSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y
                  ),
                  LineSeries<ChartData, String>(
                      dataSource: Data,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y
                  )
                ]
            ),
          ),


    );
  }
}
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
