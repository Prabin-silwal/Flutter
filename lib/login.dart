import 'package:MeroDin/routing_constants.dart';
import 'package:MeroDin/services/auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'package:auth_buttons/auth_buttons.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();

  Future<void> showerror(e) async {}
}

class _LoginState extends State<Login> {
  String _email;
  String _password;
  bool hidepassword = true;
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget _buildEmailTF() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Email',
              style: kLabelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (String newValue) {
                  setState(() {
                    _email = newValue;
                  });
                },
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  hintText: 'Enter your Email',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordTF() {
    return Form(
      key: _formKey1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Password',
            style: kLabelStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: (password) {
                setState(() {
                  _password = password;
                });
              },
              obscureText: hidepassword,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidepassword = !hidepassword;
                      });
                    },
                    icon: Icon(hidepassword
                        ? Icons.visibility_off
                        : Icons.visibility)),
                hintText: 'Enter your Password',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          _formKey.currentState.validate();
          _formKey1.currentState.validate();
          _scaffoldKey.currentState.showSnackBar(new SnackBar(
            duration: new Duration(seconds: 2),
            content: new Row(
              children: <Widget>[
                new CircularProgressIndicator(),
                new Text("  Signing-In...")
              ],
            ),
          ));

          dynamic result = Provider.of<AuthService>(context, listen: false)
              .signin(email: _email.trim(), password: _password.trim());
          if (result == null) {
            // final uid =
            //     await Provider.of(context, listen: false).auth.getCurrentUID();
            Navigator.of(context).pushNamed(MainPageView);
          } else {
            // _scaffoldKey.currentState.showSnackBar(new SnackBar(
            //     content: new Text("Something went Wrong!!"),
            //     backgroundColor: Colors.red));
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _signup() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          _scaffoldKey.currentState.showSnackBar(new SnackBar(
            duration: new Duration(seconds: 1),
            content: new Row(
              children: <Widget>[
                new CircularProgressIndicator(),
                new Text("  Signing-Up...")
              ],
            ),
          ));
          dynamic result = Provider.of<AuthService>(context, listen: false)
              .signup(email: _email, password: _password);
          if (result == null) {
            Navigator.of(context).pushNamed(MainPageView);
          } else {
            // _scaffoldKey.currentState.showSnackBar(new SnackBar(
            //     content: new Text('Try again'), backgroundColor: Colors.red));
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Signup',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x010203),
                      Color(0x0b1f32),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildLoginBtn(),
                      _signup(),
                      _signupwithgoogle(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signupwithgoogle() {
    return Container(
      child: Column(
        children: <Widget>[
          Divider(color: Colors.black),
          SizedBox(height: 10),
          GoogleAuthButton(
            onPressed: () async {
              try {
                // dynamic result =
                Provider.of<AuthService>(context, listen: false)
                    .signInWithGoogle();
              } catch (e) {
                setState(() {
                  _scaffoldKey.currentState.showSnackBar(new SnackBar(
                      content: new Text(e.message),
                      backgroundColor: Colors.red));
                });
              }
            },
            borderRadius: 20,
            style: AuthButtonStyle.secondary,
          )
        ],
      ),
    );
  }
}
