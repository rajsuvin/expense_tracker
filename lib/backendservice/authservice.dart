import 'package:expense_tracker/screens/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'db.dart';

class AuthServices{
  var db = Db();
  createUser(data, context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:data['email'],
        password: data['password'],
      );
      await db.addUser(data, context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
    }
     catch (e) {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Signup failed"),
          content: Text(e.toString()),
        );
      });
    }
}

login(data, context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email:data['email'],
      password: data['password'],
    );
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
  }
  catch (e) {
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Login error"),
        content: Text(e.toString()),
      );
    });
  }
}
}