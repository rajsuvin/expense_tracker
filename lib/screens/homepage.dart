import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/screens/detailscard.dart';
import 'package:expense_tracker/screens/usercards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adddetails.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  form(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Adddetails(),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        form(context);
      },
      child: Icon(Icons.add),
      ),
      
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Hello",style: TextStyle(fontSize: 20,color: Colors.white,
            fontWeight: FontWeight.bold),),
      ),
      body: Container(
        width: double.infinity,
          // color: Colors.red,
          child: Column(
            children: [
              UserCard(userId: '',),
              Detailscard(),
            ],
          )
      ),
    );
  }
}


// class CardOne extends StatefulWidget {
//   const CardOne({super.key,required this.color, required this.heading,});
//
// final Color color;
// final String heading;
//   @override
//   State<CardOne> createState() => _CardOneState();
// }
//
// class _CardOneState extends State<CardOne> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//           color:widget.color.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(8)
//         ),
//
//         child: Padding(
//           padding: const EdgeInsets.all(7),
//           child: Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Expense",style: TextStyle(color: widget.color,fontSize: 15),),
//                   Text("₹200",style: TextStyle(color: widget.color,fontSize: 25),)],
//               )
//               //
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class UserCard extends StatefulWidget {
//   const UserCard({super.key, required this.userId});
//   final String userId;
//
//   @override
//   State<UserCard> createState() => _UserCardState();
// }
//
// class _UserCardState extends State<UserCard> {
//   // final String userId;
//   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }
//         if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
//           return Text("Document does not exist or is empty");
//         }
//
//         var data = snapshot.data!.docs as Map<String, dynamic>;
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }
//
//         return Cards(data: data,);
//       },
//     );
//
//   }
// }
//
// class Cards extends StatefulWidget {
//   const Cards({Key? key, required this.data}) : super(key: key);
// final Map data;
//   @override
//   State<Cards> createState() => _CardsState();
// }
//
// class _CardsState extends State<Cards> {
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       color: Colors.red,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Balance",style: TextStyle(fontSize: 25,color: Colors.white,
//                     fontWeight: FontWeight.bold)),
//                 Text("₹ ${widget.data['remainingAmount']}",
//                     style: TextStyle(fontSize: 40,color: Colors.white,
//                     fontWeight: FontWeight.bold)),
//               ],
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.only(top: 10,bottom: 10,left: 8,right: 8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
//                   topRight: Radius.circular(15) ),
//               color: Colors.white,
//             ),
//             child: Row(
//               children: [
//                 CardOne(color: Colors.green, heading: '',),
//                 SizedBox(width: 10,),
//                 CardOne(color: Colors.orange, heading: '',),
//
//               ],
//             ),
//           )
//
//         ],
//       ),
//     );
//   }
// }
