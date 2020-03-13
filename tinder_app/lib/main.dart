import 'dart:convert';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tinderapp/get-api.dart';
import 'package:tinderapp/model/name.dart';
import 'package:tinderapp/model/user.dart';
import 'package:tinderapp/model/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ProfileAvatar(),
      ),
    );
  }
}

class ProfileAvatar extends StatefulWidget {
  @override
  _ProfileAvatarState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  GetApi api = new GetApi(url: "https://randomuser.me/api/0.4/?99");
  User user;
  Future<User> getUser() async{
    User user = await api.fetchUser();
    print(user.name.title);
    print(user.picture);
    return user;
  }


  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 5, vsync: this);
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/image.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(20.0, 75.0, 20.0, 50.0),
        height: 1000.0,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                      ),
                      color: Colors.grey[200],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Theme.of(context).hintColor),
                        left: BorderSide(color: Theme.of(context).hintColor)),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0)),
                      color: Colors.white,
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 150.0),
                      width: 400.0,
                      child: Column(
                        children: <Widget>[
                          tabBarView(context),
                          SizedBox(height: 15.0,),
                          tabBar(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 50.0, 0, 0),
                padding: const EdgeInsets.all(2.0),
                decoration: new BoxDecoration(
                  color: Colors.grey[400], // border color
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/image.jpg"),
                    radius: 65.0,
                  ),
                  backgroundColor: Colors.white,
                  radius: 75.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 75.0),
      child: new TabBar(controller: _controller,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.green, width: 4.0,),
            insets: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 40.0),
          ),
          unselectedLabelColor: Colors.grey[400],
          labelColor: Colors.green,
          indicatorColor: Colors.green,
          tabs: [
        new Tab(
          icon: const Icon(Icons.language,),
        ),
        new Tab(
          icon: const Icon(Icons.calendar_today, ),
        ),
        new Tab(
          icon: const Icon(Icons.map,),
        ),
        new Tab(
          icon: const Icon(Icons.phone,),
        ),
        new Tab(
          icon: const Icon(
            Icons.lock,
          ),
        ),
      ]),
    );
  }

  Widget tabBarView(BuildContext context){
    return Container(
      height: 76.0,
      child: new TabBarView(
        controller: _controller,
        children: <Widget>[
          new Column(
            children: <Widget>[
              Text(
                "My address is",
                style: TextStyle(fontSize: 25.0),
              ),
              Text(
                "4661 Auburn Ave 1",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 40.0),
              ),
            ],
          ),
          new Column(
            children: <Widget>[
              Text(
                "My address is",
                style: TextStyle(fontSize: 25.0),
              ),
              Text(
                "4661 Auburn Ave 2",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 40.0),
              ),
            ],
          ),
          new Column(
            children: <Widget>[
              Text(
                "My address is",
                style: TextStyle(fontSize: 25.0),
              ),
              Text(
                "4661 Auburn Ave 3",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 40.0),
              ),
            ],
          ),
          new Column(
            children: <Widget>[
              Text(
                "My address is",
                style: TextStyle(fontSize: 25.0),
              ),
              Text(
                "4661 Auburn Ave 4",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 40.0),
              ),
            ],
          ),
          new Column(
            children: <Widget>[
              Text(
                "My address is",
                style: TextStyle(fontSize: 25.0),
              ),
              Text(
                "4661 Auburn Ave 5",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 40.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

