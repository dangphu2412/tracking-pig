import 'package:flutter/material.dart';
import 'package:tracking_pig_behavior/services/auth.dart';
import 'package:tracking_pig_behavior/services/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;

  SignIn({ this.toggleView });
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextStyle fontFam = TextStyle(
    fontFamily: 'Open Sans',
    color: Colors.white,
  );

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return (loading)? Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white12,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 60),
              Image.asset(
                'assets/images/sign-in-bg.png',
                height: 80,
                width: double.infinity,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment(-1,1),
                heightFactor: 1.5,
                child: Text(
                  'Sign in',
                  style: fontFam.copyWith(
                    fontSize: 32,
                  ) ,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                style: fontFam,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: fontFam,
                  hintText: 'abc@gmail.com',
                  hintStyle: fontFam,
                ),
                validator: (val) => val.isNotEmpty ? null : 'Enter an email',
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: fontFam,
                  hintText: '123456',
                  hintStyle: fontFam,
                ),
                validator: (val) => val.length > 6 ? null : 'Enter 6+ character password ',
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.fromLTRB(70, 15, 70, 15),
                
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        loading = false;
                        error = 'Invalid email';
                      });
                    }
                    else {
                      print('Sign in successfully');
                    }
                  }
                },
                child: Text('Sign In'),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  widget.toggleView();
                },
                child: Text('Register'),
              ),
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