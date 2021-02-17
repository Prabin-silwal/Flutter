import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String uid;
  Map data;
  @override
  Widget build(BuildContext context) {
    getUID();
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('detailinfo')
                .doc('$uid')
                .collection('details')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                print("it has data");
                return Center(
                  child: LinearProgressIndicator(),
                );
              }
              return new ListView(
                children: snapshot.data.docs.map((document) {
                  print('the data is ${snapshot.data.docs}');
                  return Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Text("Category: " + document['category']),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ));
  }

  getUID() {
    final User user = auth.currentUser;
    this.uid = user.uid;
  }

  // Widget _buildList(BuildContext context, DocumentSnapshot document) {
  //   return Container(
  //     child: Center(
  //       child: Row(
  //         children: <Widget>[
  //           Text("hello"),
  //           Text(document['category']),
  //           // Text(documents['amount']),
  //           // Text(documents['date'])
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Stream<QuerySnapshot> getQuery(BuildContext context) async* {
  //   yield* FirebaseFirestore.instance
  //       .collection('detailinfo')
  //       .doc('$uid')
  //       .collection('details')
  //       .snapshots();
  // }
}
