import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:register/profile.dart';
import 'package:register/sidebar.dart';
import 'package:register/workout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:register/user.dart';
class Signup extends StatelessWidget{
  // const Signup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: 'Splash Screen',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home:  Sign(),
        debugShowCheckedModeBanner: false
    );
  }
}
@immutable


class Sign extends StatefulWidget {

  const Sign({Key? key}) : super(key: key);

  @override
  State<Sign> createState() => _SignState();
}
 final auth = FirebaseAuth.instance;
// final firestore = FirebaseAuth.instance;
class _SignState extends State<Sign> with InputValidationMixin{
    late String email ;
    late String password ;
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    @override
  void initState() {
      // TODO: implement initState
      super.initState();
    }
    save() async{
      Users user = Users (email,password);
      print('login user: ');
      print(user.email);
//array=>json encode
      final userdata = json.encode({
        'email': user.email,
        'password':user.password,
      });
      print(userdata);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userdata', userdata);
    }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true
        ,title:const Text('Fitness App',),),
      body: Form(
        key: formkey,
        child: Container(
           decoration: const BoxDecoration(
               image: DecorationImage(
                 image: NetworkImage('https://i.pinimg.com/originals/02/2c/1d/022c1d6b8c6afaedf92b92bef3b5ecd2.jpg'),
                 fit: BoxFit.cover,
                 colorFilter: ColorFilter.mode(Colors.black45,BlendMode.darken),
               )
           ),
           // height: 300,
           padding: const EdgeInsets.all(30.0),
           child: ListView(
             children: <Widget>[
               Container(
                 padding: const EdgeInsets.only(top: 150,left: 10,right: 10,bottom: 30),
                 child: TextFormField(
                   // controller: nameController,
                   keyboardType: TextInputType.name,
                   decoration:  InputDecoration(
                       focusedErrorBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.white, width: 20),
                       ),
                       icon: Icon(
                         (Icons.mail),
                         color: Colors.black,
                         size: 25.0,
                       ),
                       labelText: 'UserName',
                       labelStyle: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.w400,
                         fontSize: 20,
                       )
                   ),
                   onChanged:(value){
                     setState((){
                       email = value;
                     });
                   },
                   validator: (email) {
                     if (isEmailValid(email!)) return null;
                     else
                       return 'Enter a valid email address';
                   },
                 ),
               ),

               Container(
                 padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                 child: TextFormField(
                   obscureText: true,
                   keyboardType: TextInputType.number,
                   // controller: passwordController,
                   decoration: const InputDecoration(
                       focusedErrorBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.white, width: 20),
                       ),

                       icon: Icon(
                         (Icons.lock),
                         color: Colors.black,
                         size: 25.0,
                       ),
                       labelText: 'Password',
                       labelStyle: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.w400,
                         fontSize: 20,
                       )
                   ),
                   onChanged:(value){
                     setState((){
                       password = value;
                     });
                   },
                   validator: (password) {
                     if (isPasswordValid(password!)) {
                       return null;
                     }
                     else {
                       return 'Enter a valid password';
                     }
                   },
  ),
               ),
               SizedBox(height: 40),
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   elevation: 5,
                   shadowColor: Colors.blueGrey,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(8),
                   ),
                   minimumSize: Size(50, 50) ,),
                 onPressed: () async {
                   await auth.signInWithEmailAndPassword(
                       email: email, password: password).then((FireBaseUser) {
                     Navigator.of(context).pushAndRemoveUntil(
                         MaterialPageRoute(builder: (context) =>
                             SideDrawer()), (route) => false);
                     Fluttertoast.showToast(msg: "success");
                     save();
                   }
                   ).catchError((e) => print(e));
                   if (formkey.currentState!.validate()) {
                     formkey.currentState!.save();
                     // use the email provided here
                   };

                  
                   }, child: Text('log In'),
               ),
               TextButton(
                 onPressed: () {
                   //forgot password screen
                 },
                 child: Text('Forgot Password?',style: TextStyle(color: Colors.white,fontWeight:FontWeight.w800,

                 ),),

               ),
               Divider(
                 // thickness: 3,
                 color: Color.fromARGB(255, 104, 94, 6),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text('Don\'t have an account?', style: TextStyle(fontSize: 15,color: Colors.white)),
                   TextButton(
                     child: Text(
                       'Signup',
                       style: TextStyle(fontSize: 15,color: Colors.white,fontWeight:FontWeight.w600),
                     ),
                     onPressed: () {
                       //signup screen
                       Navigator.push(context,MaterialPageRoute(builder: (context) => Profile()) );
                     },
                   )
                 ],
               ),


             ],
           )
       ),)



    );
  }

}

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 8;

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}
