import 'package:flutter/material.dart';
import 'package:tracking_pig_behavior/services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;

  Register({ this.toggleView });
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                validator: (val) => val.isNotEmpty ? null : 'Enter an email',  
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (val) => val.length > 6 ? null : 'Enter 6+ character password ',  
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Invalid email';
                      });
                    }
                    else {
                      print('Sign In success');
                    }
                  }
                },
                child: Text('Sign up'),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  widget.toggleView();
                },
                child: Text('Sign In'),
              ),
              SizedBox(height: 20),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}