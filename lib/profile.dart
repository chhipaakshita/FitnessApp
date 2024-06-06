import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:register/sidebar.dart';
import 'package:register/workout.dart';

import 'notififyservice/notificationsend.dart';
import 'notififyservice/notify_service.dart';
class Homepage extends StatelessWidget{
  // const Homepage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Profile(),
      debugShowCheckedModeBanner: false,
    );
  }
}
// ignore: must_be_immutable
class Profile extends StatefulWidget {
  const Profile({ Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
 final firestore = FirebaseAuth.instance;
User? user = FirebaseAuth.instance.currentUser;
class _ProfileState extends State<Profile> {
  final _form = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String height = '';
  String weight = '';
  String password = '';

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Create Profile'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => SideDrawer()),);
          }, icon: const Icon(Icons.check,), alignment: Alignment.centerLeft)
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Stack(
            children: [
              Container(
                height: 800,
                width: 500,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/abstract-blue.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/profileicon.png'),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
              ),
              Stack(
                // alignment:const Alignment(0.0, 1.0),
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 300, left: 10, right: 10),
                    child: TextFormField(
                      controller: nameController,
                      autofocus: false,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        // fillColor: Colors.blue[100],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6.0),),
                              borderSide: BorderSide(
                                  color: Colors.black, width: 2.0)),
                          filled: true,
                          labelText: 'Name',
                          labelStyle: TextStyle(
                              color: Colors.blue.shade900,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none)
                      ),
                      onChanged:(value){
                        setState((){
                          name = value;
                        });
                      },
                      validator: (text) {
                        if ((text!.length > 5) && text.isNotEmpty) {
                          return "Enter valid name of more then 5 characters!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 380, left: 10, right: 10),
                    child: TextFormField(
                      controller: emailController,
                      autofocus: false,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6.0),),
                              borderSide: BorderSide(
                                  color: Colors.black, width: 2.0)),
                          filled: true,
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.blue.shade900,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none)
                      ),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      validator: (text) {
                        if ((text!.contains('@')) && text.isNotEmpty) {
                          return "Enter a valid email address!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 460, left: 10, right: 10),
                    child: TextFormField(
                      controller: heightController,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        // fillColor: Colors.blue[100],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6.0),),
                              borderSide: BorderSide(
                                  color: Colors.black, width: 2.0)),
                          filled: true,
                          labelText: 'Height',
                          labelStyle: TextStyle(
                              color: Colors.blue.shade900,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none)
                      ),
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 540, left: 10, right: 10),
                    child: TextFormField(
                      controller: weightController,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      decoration:  InputDecoration(
                        // fillColor: Colors.blue[100],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6.0),),
                              borderSide: BorderSide(color: Colors.black, width: 2.0)),
                          filled: true,
                          labelText: 'Weight',
                          labelStyle: TextStyle(
                              color:Colors.blue.shade900,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none)
                      ),
                      onChanged: (value) {
                        setState(() {
                          weight = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 620, left: 10, right: 10),
                    child: TextFormField(
                      controller: passwordController,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      decoration:  InputDecoration(
                        // fillColor: Colors.blue[100],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6.0),),
                              borderSide: BorderSide(
                                  color: Colors.black, width: 2.0)),
                          filled: true,
                          labelText: 'Password',
                          labelStyle:TextStyle(
                              color: Colors.blue.shade900, fontSize: 15, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none)
                      ),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.only(top:720,left: 180),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shadowColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ), onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email, password: password).then((FireBaseUser)=>
                      FirebaseFirestore.instance.collection('registerUser').doc(FireBaseUser.user?.uid).set({
                        'name': nameController.text,
                        'email':emailController.text,
                        'height':heightController.text,
                        'weight':weightController.text,
                        'password':passwordController.text,
                      }).then((FireBaseUser) => {
                        print('success'),
                        print(nameController),
                        Fluttertoast.showToast(msg: "success"),
                      NotificationSend.registerNotification(),
                      Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Workout()), (
                      route) => false)
                      })
                  );
                },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
      // drawer: SideDrawer(),
    );
  }
  // Future createUser({required String name},{required String email},{required String height},
  // {required String weight},{required String password},
  // ) async{
  //  final docUser =FirebaseFirestore.instance.collection('user').doc();
  // }
}

  // static Future<User?> registerUsingEmailPassword( name, email, height, width, pass
  //     {
  //   required String name,
  //   required String email,
  //   required String height,
  //   required String weight,
  //   required String pass,
  // }
  // ) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;
  //   try {
  //     UserCredential userCredential = await auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: pass,
  //     );
  //     // userCollection.document(userCredential).setData({
  //     //   'name': name.toString(),
  //     //   'email':email.toString(),
  //     //   'height':height.toString(),
  //     //   'weight':weight.toString(),
  //     //   'pass':pass.toString(),
  //     // });
  //     user = userCredential.user;
  //
  //     await user!.updateProfile(displayName: name);
  //     await user.reload();
  //     user = auth.currentUser;
  //     Fluttertoast.showToast(msg: "success");
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       Fluttertoast.showToast(msg:'The password provided is too weak.');
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       Fluttertoast.showToast(msg: 'The account already exists for that email.');
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: e.toString());
  //     print(e);
  //   }
  //   return user;
  // }

// }


