
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:register/profile.dart';
import 'package:register/sidebar.dart';
import 'package:register/workout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

late final String finalEmail;
class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

   Future checkShared() async{
    final prefs = await SharedPreferences.getInstance();
    final get_user_data = prefs.getString('userdata');
    print(get_user_data);
    if(get_user_data != null){
      Navigator.of(context).push( MaterialPageRoute(builder: (context)=>SideDrawer()));
    }
    else{
      Navigator.of(context).push( MaterialPageRoute(builder: (context)=>Signup()));
    }
  }
  void checkSharedawait() async{
    await checkShared();
  }

  @override
  void initState() {
    // TODO: implement initState
    checkSharedawait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                height: 500,
                width: 500,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://coldspringharbor.librarycalendar.com/sites/default/files/2021-09/fitness.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
          ),
                 Container(
                     alignment: Alignment.center,
                     margin: EdgeInsets.only(top: 530),
                   child: Column(
                     children: [
                       Text('Loose a Lil !! Live a Long !!!',style: TextStyle(fontSize: 23,color: Colors.blueGrey,),)
                     ],
                   )
                 ),
                 Container(
                   alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 600),
                     child:     ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape:  StadiumBorder(),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> Signup()), (route) => false);
                              // Navigator.pushNamed(context, 'login_screen');
                            }, child: Text('Log In'),
                          ),
                 ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 650),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape:  StadiumBorder(),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> Profile()), (route) => false);
                              }, child: Text('Register'),
                            ),
                          )

              ]),
                          )


    );
  }
}