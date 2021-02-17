import 'package:flutter/material.dart';

class UnDefinedView extends StatelessWidget {
  const UnDefinedView({Key key, this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Route for $name is not defined"),
      ),
    );
  }
}
