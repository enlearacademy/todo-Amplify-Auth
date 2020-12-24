import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Amplify.Auth.getCurrentUser(),
      builder: (BuildContext context, AsyncSnapshot<AuthUser> snapshot) {
        final currentUser = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            title: Text("Main screen"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("AWS Amplify"),
                Text("User ID ${currentUser?.userId}"),
                Text("User Name ${currentUser?.username}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
