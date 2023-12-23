import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardOne extends StatefulWidget {
  const CardOne({super.key,required this.color, required this.heading,});

  final Color color;
  final String heading;
  @override
  State<CardOne> createState() => _CardOneState();
}

class _CardOneState extends State<CardOne> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color:widget.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8)
        ),

        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Expense",style: TextStyle(color: widget.color,fontSize: 15),),
                  Text("₹200",style: TextStyle(color: widget.color,fontSize: 25),)],
              )
              //
            ],
          ),
        ),
      ),
    );
  }
}



class UserCard extends StatefulWidget {
  const UserCard({super.key, required this.userId});
  final String userId;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  final Stream<DocumentSnapshot> _userStream =
  FirebaseFirestore.instance.collection('users').doc(userId).snapshots();

  static String? userId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: _userStream,
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Text("Document does not exist or is empty");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Cards(data: snapshot.data!.data() as Map<String, dynamic>);
      },
    );
  }
}

class Cards extends StatefulWidget {
  const Cards({Key? key, required this.data}) : super(key: key);
  final Map<String, dynamic> data;

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Balance",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "₹ ${widget.data['remainingAmount']}",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 8, right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Colors.white,
            ),
            child: Row(
              children: [
                CardOne(color: Colors.green, heading: '',),
                SizedBox(width: 10,),
                CardOne(color: Colors.orange, heading: '',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
