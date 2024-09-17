import 'package:flutter/material.dart';
import 'package:health_care_app/screens/auth/login.dart';
import 'package:health_care_app/screens/base.dart';
import 'package:health_care_app/widgets/custom_button.dart';
import 'package:health_care_app/widgets/custom_input.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Register',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              CustomInputField(hintText: 'Email'),
              SizedBox(height: 10),
              CustomInputField(hintText: 'Password', obscureText: true),
              SizedBox(height: 10),
              CustomInputField(hintText: 'Confirm Password', obscureText: true),
              SizedBox(height: 20),
              CustomButton(
                text: 'Register',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BaseScreen()),
                  );
                },
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
