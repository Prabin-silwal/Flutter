import 'package:MeroDin/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String uid;
  Map data;
  @override
  Widget build(BuildContext context) {
    getUID();
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('detailinfo')
                // .doc('$uid')
                // .collection('details')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                print("it has data");
                return ListView(
                  children: snapshot.data.docs.map((document) {
                    print('in list view');
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Text("Category: "),
                      ),
                    );
                  }).toList(),
                );
              }

              return Center(
                child: Text('loading'),
              );
            },
          ),
        ));
  }

  getUID() {
    final User user = auth.currentUser;
    this.uid = user.uid;
  }
}
