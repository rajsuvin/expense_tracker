
import 'package:expense_tracker/pages/signin.dart';
import 'package:expense_tracker/screens/dashboard.dart';
import 'package:expense_tracker/screens/navbarscreens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options:FirebaseOptions(
       apiKey: "AIzaSyAHt909v-wmfRN-s2G91V2ht3onQb220kY",
       appId: "1:63217766737:android:e7b7e5b7e123d188808370",
       messagingSenderId: "63217766737",
       projectId: "expense-tracker-a7fb9"
   )
 );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final int selectedIndex = 0;
    final ValueChanged<int> onDestinationSelected = (index) {

    };
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense tracker',
      builder: (context,child){
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Dashboard() ,
    );
  }
}
