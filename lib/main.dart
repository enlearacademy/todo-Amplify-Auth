import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_amplify/amplifyconfiguration.dart';

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
  bool _amplifyConfigured = false;
  Amplify _amplifyInstance = Amplify();

  Future<void> _configureAmplify() async {
    try {
      AmplifyAuthCognito auth = AmplifyAuthCognito();
      _amplifyInstance.addPlugin(
        authPlugins: [auth],
      );
      await _amplifyInstance.configure(amplifyconfig);

      setState(() => _amplifyConfigured = true);
    } catch (e) {
      print(e);
      setState(() => _amplifyConfigured = false);
    }
    setState(() => _amplifyConfigured = true);
  }

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
