// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:register/query/fetch_data.dart';
//
// class Comment extends StatefulWidget {
//   const Comment({Key? key}) : super(key: key);
//
//   @override
//   State<Comment> createState() => _CommentState();
// }
//
// class _CommentState extends State<Comment> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(title: Text('data'),) ,
//       body: FutureBuilder(
//           future: FetchData().fetchCommentModel(),
//           builder: (context,snapshot  ){
//               print(snapshot.data);
//               return ListView.builder(
//                   itemCount: snapshot.data?.length,
//                   itemBuilder: (_,index){
//
//               })
//
//           }),
//     );
//   }
// }
