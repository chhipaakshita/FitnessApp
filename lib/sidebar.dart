import 'package:flutter/material.dart';
import 'package:register/login.dart';
import 'package:register/workout.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class SideDrawer extends StatefulWidget {
  @override
  State<SideDrawer> createState() => _SideDrawerState();

}

class _SideDrawerState extends State<SideDrawer> {
  void removeShared() async{
    final pref = await SharedPreferences.getInstance();
    pref.remove('userdata');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Profile',
          )),
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://us.123rf.com/450wm/kanawatth/kanawatth1808/kanawatth180800140/112082563-blue-wave-abstract-background-vector-illustration.jpg?ver=6'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                )),
            child: Stack(
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 580),
                              // padding: EdgeInsets.only(top: 10.0),
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://c0.wallpaperflare.com/preview/631/232/1007/shadow-silhouette-outline-person.jpg'),
                                radius: 80.0,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    // Spacer(),
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Container(
                        height: 120,
                        // color: Colors.blueAccent,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(bottom: 580),
                        // margin: EdgeInsets.only(top:20),
                        child: Column(
                          children: [
                            Text(
                              'Simons Aberta',
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Daily Target Statistics',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 250,
                              height: 10,
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  value: 0.7,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.orange),
                                  backgroundColor: Color(0xffD6D6D6),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Height:180cm',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      'Weight:79kg',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),

                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 180),
                  padding: EdgeInsets.only(left: 20),
                  height: 40,
                  width: double.infinity,
                  child: Text(
                    'Fitness Goals',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 220),

                      height: 150,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      padding: EdgeInsets.only(left: 20),
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(top: 10.0),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage('assets/images/run.png'),
                                        radius: 40.0,  ),
                                    ),
                                  ],
                                ),),
                            ],
                          ),
                          Flexible(
                              flex: 2,
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  // margin: EdgeInsets.only(bottom: 220.0,),
                                  height: 50,
                                  width: 100,

                                  child: Column(
                                    children: [
                                      Text('Running',style: TextStyle(fontSize: 10,),),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('5 Times/Weekly',style: TextStyle(fontSize: 10,))
                                    ],
                                  )

                              )),
                          // Spacer(),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: [
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    height: 100,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(top: 10.0,bottom: 40.0),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage('assets/images/muscle.png'),
                                      radius: 40.0,  ),
                                  ))
                            ],
                          ),

                          Flexible(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.centerRight,
                              // margin: EdgeInsets.only(bottom: 220.0,),
                              height: 50,
                              // width: 200,

                              child: Column(
                                children: [
                                  Text('Appointments',textAlign: TextAlign.left,style: TextStyle(fontSize: 10,letterSpacing: 0.9),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('2 Times/Weekly',style: TextStyle(fontSize: 10,),)
                                ],
                              ),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Container(

                  margin: EdgeInsets.only(top: 380),

                  height: 150,
                  width: double.infinity,
                  child:  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  height: 100,
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/cardiovascular.png'),
                                    radius: 40.0,  ),
                                ),
                              ],
                            ),),
                        ],
                      ),
                      Flexible(
                          flex: 2,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              // margin: EdgeInsets.only(bottom: 220.0,),
                              height: 50,
                              width: 100,

                              child: Column(
                                children: [
                                  Text('Cardiovascular',style: TextStyle(fontSize: 10,),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('3 Times/Weekly',style: TextStyle(fontSize: 10,))
                                ],
                              )

                          )),
                      // Spacer(),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          Flexible(
                              flex: 1,
                              child: Container(
                                height: 100,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 10.0,bottom: 40.0),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/food.png'),
                                  radius: 40.0,  ),
                              ))
                        ],
                      ),

                      Flexible(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerRight,
                          // margin: EdgeInsets.only(bottom: 220.0,),
                          height: 50,
                          child: Column(
                            children: [
                              Text('Fooding Tips',textAlign: TextAlign.left,style: TextStyle(fontSize: 10,letterSpacing: 0.9),),
                              SizedBox(
                                height: 10,
                              ),
                              Text('2 Times/Weekly',style: TextStyle(fontSize: 10,),)
                            ],
                          ),),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(top: 540),
                  child: Text('Daily Goals',style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
                Container(
                  height: 150,
                  // color: Colors.pink,
                  margin: EdgeInsets.only(top: 590),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  height: 100,
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: CircleAvatar(

                                    backgroundImage: AssetImage('assets/images/calories.png'),
                                    radius: 35.0,  ),
                                ),
                              ],
                            ),),
                        ],
                      ),
                      Flexible(
                          flex: 2,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              // margin: EdgeInsets.only(bottom: 220.0,),
                              height: 60,
                              width: 100,

                              child: Column(
                                children: [
                                  Text('Calorie',style: TextStyle(fontSize: 14,),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('1075 Kcal/day',style: TextStyle(fontSize: 10,))
                                ],
                              )

                          )),
                      Spacer(),

                      Column(
                        children: [
                          Flexible(
                              flex: 1,
                              child: Container(
                                height: 100,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 10.0,bottom: 40.0),
                                child: CircleAvatar(

                                  backgroundImage: AssetImage('assets/images/footprint.png'),
                                  radius: 35.0,  ),
                              ))
                        ],
                      ),

                      Flexible(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerRight,
                          // margin: EdgeInsets.only(bottom: 220.0,),
                          height: 60,
                          // width: 200,

                          child: Column(
                            children: [
                              Text('Steps',textAlign: TextAlign.left,style: TextStyle(fontSize: 14),),
                              SizedBox(
                                height: 10,
                              ),
                              Text('2 Times/Weekly',style: TextStyle(fontSize: 10,),)
                            ],
                          ),),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Simons Aberta'),
              accountEmail: Text('simon@123gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('S'),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(10, 10.0, 0, 10.0),
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () => {Navigator.of(context).pop()},
            ),
            Divider(),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(10, 10.0, 0, 10.0),
              title: const Text('Notification'),
              leading: const Icon(Icons.notifications),
              trailing: const Icon(Icons.arrow_right),
              onTap: () => {},
            ),
            Divider(),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(10, 10.0, 0, 10.0),
              title: const Text('Workflow'),
              leading: const Icon(Icons.account_tree),
              trailing: const Icon(Icons.arrow_right),
              // onTap: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Workout(key:UniqueKey(),)), (route) => false),

              onTap: (){
              //fetchdata();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Workout()));
              },
            ),
            Divider(),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(10, 10.0, 0, 10.0),
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_right),
              onTap: () => {},
            ),
            Divider(),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(10, 10.0, 0, 10.0),
              title: const Text('LogOut'),
              trailing: const Icon(Icons.arrow_right),
              leading: const Icon(Icons.logout),
              onTap: () { Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Signup()));
              removeShared();


              }
            ),

            const Divider(),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(10, 10.0, 0, 10.0),
              title: const Text('Close'),
              leading: const Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }

}
