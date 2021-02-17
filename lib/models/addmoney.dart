import 'package:MeroDin/navbuttons/homepage.dart';
import 'package:MeroDin/routing_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class AddMoney {
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
  final detaillist = FirebaseFirestore.instance;
  String category;
  double amount;
  String uid;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String getUID() {
    final User user = auth.currentUser;
    this.uid = user.uid;
  }

  AddMoney(this.category, this.amount);

  Future addmoney() async {
    try {
      getUID();
      await detaillist
          .collection("detailinfo ")
          .doc('$uid')
          .collection('details')
          .add({'category': '$category', 'amount': '$amount', 'date': '$now'});
      Fluttertoast.showToast(
        msg: "Saved",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );

      return 'success';
    } catch (e) {
      Fluttertoast.showToast(
        msg: "${e.message}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }

    // print("the category is $category");
    // print('The user id is:$uid');
    // print("the date of today is $now");
    // print("the category is $amount");
  }
}
