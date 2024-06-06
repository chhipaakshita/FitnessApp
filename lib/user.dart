class Users{
  String email;
  String password;

 Users( this.email,  this.password);

  //convert json to object
  Users.fromJson(Map<String , dynamic> json) : email = json['email'] , password = json['password'] ;

  //convert obj to string
  Map<String , dynamic> toJson()=>{
    'email': email,
    'password': password
  };
}