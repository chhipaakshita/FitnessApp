class PostsModel{
  int id;
  String email;
  String name;

  PostsModel({
    required this.id,
   required this.email,
   required this.name
});
  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      id: json['id'],
        email: json['email'],
        // company: json['company'],
        name: json['name'],

    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'email': email,
      'name': name,
    };
  }
}