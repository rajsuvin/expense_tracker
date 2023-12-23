import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detailscard extends StatefulWidget {
  const Detailscard({super.key});

  @override
  State<Detailscard> createState() => _DetailscardState();
}

class _DetailscardState extends State<Detailscard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Recent activities",style: TextStyle(color: Colors.black,fontSize: 20,
                      fontWeight: FontWeight.w700),)
                ],
              ),
              ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:3,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,10),
                          color: Colors.grey.withOpacity(0.09),
                            blurRadius: 10.0,
                          spreadRadius: 4.0
                        )
                      ]
                    ),
                    child: ListTile(
                    title: Row(
                    children:[
                      Expanded(child: Text("Car rent")),
                      Spacer(),
                      Text("₹ 500",style: TextStyle(color: Colors.lightGreen),)
                                 ]
                    ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("23 dec 2:45 PM",style: TextStyle(color: Colors.blueGrey),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        );


  }
}
