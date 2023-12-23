import 'package:expense_tracker/screens/details.dart';
import 'package:expense_tracker/screens/navbarscreens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/login.dart';
import 'homepage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});


  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var isLogout =  false;
  logOut() async {
    setState(() {
      isLogout = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));

    setState(() {
      isLogout = false;
    });
  }

  int currentIndex = 0;
  var pageView = [
    Homepage(),
    Detailspage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [IconButton(onPressed: (){logOut();}, icon: isLogout? CircularProgressIndicator():
      //   Icon(Icons.exit_to_app))],
      // ),
      bottomNavigationBar: Navbaritems(selectedIndex: currentIndex,onDestinationSelected: (int value){
        setState(() {
          currentIndex = value;
        });
      },
      ),
    body: pageView[currentIndex],

    );
  }
}
