import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Amplify TODO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AmplifyTODO(),
    ),
  );
}

class AmplifyTODO extends StatefulWidget {
  AmplifyTODO({Key key}) : super(key: key);

  @override
  _AmplifyTODOState createState() => _AmplifyTODOState();
}

class _AmplifyTODOState extends State<AmplifyTODO> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
