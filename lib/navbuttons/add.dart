import 'package:MeroDin/models/addmoney.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool autovalidate = false;
  String _category;
  double _amount;
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.fromLTRB(50, 20, 0, 20),
        color: Color(0xFFE0E0E0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 100, 50, 0),
              child: TextFormField(
                onChanged: (category) {
                  setState(() {
                    _category = category;
                  });
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.category),
                  hintText: 'Enter your Category',
                  labelText: 'Category',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0, 50, 0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    _amount = double.parse(value);
                  });
                },
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter amount';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.money),
                  hintText: 'Enter amount',
                  labelText: 'Amount',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              width: 200,
              child: RaisedButton(
                elevation: 0.5,
                onPressed: () async {
                  _formKey.currentState.validate();
                  AddMoney addMoney = new AddMoney(_category, _amount);
                  dynamic result = addMoney.addmoney();

                  if (result != null) {
                  } else {}
                },
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.white,
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Color(0xFF527DAA),
                    letterSpacing: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
