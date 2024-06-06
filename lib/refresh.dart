// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:register/query/fetch_data.dart';
//
// import 'model/todos_model.dart';
//
// class Refresh extends StatefulWidget {
//   const Refresh({Key? key}) : super(key: key);
//   @override
//   State<Refresh> createState() => _RefreshState();
// }
// class _RefreshState extends State<Refresh> {
//   late Future<List<TodoModel>> futureTodo;
//   @override
//   void initState() {
//     super.initState();
//     futureTodo = fetchTodoModel();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Refresh'),),
//       body: Container(
//         child: FutureBuilder<List<TodoModel>>(
//           future:futureTodo,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Text(snapshot.data!.title);
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }
//             // By default, show a loading spinner.
//             return const CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }
