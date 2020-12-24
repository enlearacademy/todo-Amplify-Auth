import 'package:todo_amplify/screens/email_confirmation_screen.dart';
import 'package:todo_amplify/util/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Email"),
                controller: _emailController,
                validator: (value) =>
                    !validateEmail(value) ? "Email is Invalid" : null,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                controller: _passwordController,
                validator: (value) => value.isEmpty
                    ? "Password is invalid"
                    : value.length < 9
                        ? "Password must contain at least 8 characters"
                        : null,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text("CREATE ACCOUNT"),
                  onPressed: () => _createAccountOnPressed(context),
                  color: Theme.of(context).primaryColor,
                  colorBrightness: Theme.of(context).primaryColorBrightness),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createAccountOnPressed(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      
      // TODO: Implment sign-up process

    }
  }

  void _gotToEmailConfirmationScreen(BuildContext context, String email) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EmailConfirmationScreen(email: email),
      ),
    ); 
  }
}
