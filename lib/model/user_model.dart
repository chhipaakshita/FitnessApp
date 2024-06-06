class UserModel {
  String email;
  // List<Company> company;
  String? name  ;
   String? catchPhrase ;

  UserModel({
    required this.email,
    // required this.company
    required this.name,
    required this.catchPhrase
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        // company: json['company'],
        name: json['company']['name'],
        catchPhrase: json['company']['catchPhrase']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'catchPhrase': catchPhrase
    };
  }
}
// class Company{
//   String name;
//   String catchphrase;
//
//   Company({
//     required this.name,
//     required this.catchphrase
// });
//  factory Company.fromJson(Map<String,dynamic> json){
//     return Company(
//      name: 'name',
//       catchphrase: 'catchphrase'
//     );
//   }
// }