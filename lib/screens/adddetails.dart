import 'package:expense_tracker/screens/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Adddetails extends StatefulWidget {
  const Adddetails({super.key});

  @override
  State<Adddetails> createState() => _AdddetailsState();
}

class _AdddetailsState extends State<Adddetails> {

  var type = "Expense";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var isLoader = false;
  var validator = Validator();

  Future<void>_submit()async{
    if(_formKey.currentState!.validate()){
      setState(() {
         isLoader = true;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator.isEmpty,
              decoration: InputDecoration(
                labelText: 'Purpose'
              ),
            ),
                SizedBox(height: 15,),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator.isEmpty,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Amount'
              ),
            ),
            SizedBox(height: 15,),
            DropdownButtonFormField(
                value: 'Expense',
                items: [
              DropdownMenuItem(child: Text("Expense"),value: 'Expense',),
              DropdownMenuItem(child: Text("Income"),value: 'Income',),
            ], onChanged: (value){
                  if(value!= null){
                    setState(() {
                      type = value;
                    });
                  }
            }),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              if(isLoader == false){
                _submit();
              }

            }, child:
            isLoader ? Center(child: CircularProgressIndicator()):
            Text("Add"))
      
      
          ],
        ),
      ),
    );
  }
}
