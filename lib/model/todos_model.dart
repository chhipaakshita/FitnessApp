
import 'package:json_annotation/json_annotation.dart';
part 'todos_model.g.dart';
@JsonSerializable()
class TodoModel{
  int userId;
  int id;
  String title;

  TodoModel( {
    required this.userId,
    required this.id,
    required this.title,
});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  //Map<String, dynamic> toJson()=> TodoModelToJson(this);

  }
