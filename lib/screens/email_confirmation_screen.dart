import 'package:todo_amplify/screens/main_screen.dart';
import 'package:flutter/material.dart';

class EmailConfirmationScreen extends StatelessWidget {
  final String email;

  EmailConfirmationScreen({
    Key key,
    @required this.email,
  }) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _confirmationCodeController =
      TextEditingController();

  final _formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Confirm your email"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              Text(
                "An email confirmation code is sent to $email. Please type the code to confirm your email.",
                style: Theme.of(context).textTheme.headline6,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _confirmationCodeController,
                decoration: InputDecoration(labelText: "Confirmation Code"),
                validator: (value) => value.length != 6
                    ? "The confirmation code is invalid"
                    : null,
              ),
              RaisedButton(
                onPressed: () => _submitCode(context),
                child: Text("CONFIRM"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitCode(BuildContext context) async {
    if(_formKey.currentState.validate()){
      final confirmationCode = _confirmationCodeController.text;
      // TODO: Submit the code to Amplify
    }
  }

  void _gotoMainScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => MainScreen()));
  }
}
