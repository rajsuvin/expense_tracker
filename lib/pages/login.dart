import 'package:expense_tracker/pages/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../backendservice/authservice.dart';
import '../screens/dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var isLoader =  false;
  var authServices = AuthServices();

  Future<void> _submit()async{
    if(_formKey.currentState!.validate()){
      setState(() {
        isLoader = true;
      });
      var data = {

        "email": _emailController.text,

        "password":_passwordController.text,
      };
      await authServices.login(data, context);

      setState(() {
        isLoader = false;
      });

      // ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
      //     SnackBar(content: Text('Register succesfully')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address';
                  }

                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }

                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: (){
                  isLoader ? print("Loading"):_submit();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
              }, child: Text("Create an account"))
            ],
          ),
        ),
      ),
    );
  }
}
