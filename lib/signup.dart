import 'package:MeroDin/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mainpage.dart';

class Signup extends StatefulWidget {
  @override
  _Signup createState() => _Signup();
}

class _Signup extends State<Signup> {
  // final AuthService _auth = AuthService();
  String username = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isAutovalidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'MeroDin',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  // Container(
                  //     alignment: Alignment.center,
                  //     padding: EdgeInsets.all(10),
                  //     child: Text(
                  //       'Sign Up',
                  //       style: TextStyle(fontSize: 20),
                  //     )),
                  Container(
                    padding: EdgeInsets.all(40),
                    child: TextFormField(
                      onChanged: (val) {
                        setstate() => username = val;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'UserName',
                          prefixIcon: Icon(Icons.people),
                          hintText: 'Enter your username',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 40),
                    child: TextFormField(
                      onChanged: (val) {
                        setstate() => password = val;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Enter your password',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28))),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        height: 32,
                        width: 200,
                        child: InkWell(
                          onTap: () {
                            Provider.of<AuthService>(context, listen: false)
                                .signup(
                                    email: username.trim(), password: password);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 70, top: 0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                gradient: LinearGradient(
                                    colors: [Color(0x76b583), Color(0x77ab56)]),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 20,
                                      color: Colors.green,
                                      offset: Offset(3, 2))
                                ],
                                border: Border.all(
                                  color: Colors.black,

                                  // width: 12,
                                )),
                            child: Text("Sign Up",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Text('Does not have account?'),
                      FlatButton(
                        textColor: Colors.green,
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ))
                ],
              )),
        ));
  }

  void checksignup(BuildContext context) {
    setState(() {});
    if (_formKey.currentState.validate()) {
      database();
    } else {
      setState(() {
        this.isAutovalidate = true;
      });
    }
  }

  Future<void> database() async {
    // check in database
    // dynamic result = await _auth.register(username,password);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => Mainpage()));
  }
}
