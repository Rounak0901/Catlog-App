// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool onLoginPress = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 40.0,
          ),
          Image.asset(
            "assets/images/login1.png",
            fit: BoxFit.cover,
            alignment: Center().alignment,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Welcome $name",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter Username", labelText: "Username"),
                onChanged: (value) {
                  name = value;
                  setState(() {});
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Enter Password", labelText: "Password"),
              ),
            ]),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () async {
              setState(() {
                onLoginPress = true;
              });
              await Future.delayed(Duration(seconds: 1));
              Navigator.pushNamed(context, AppRoutes.homeRoute);
              // Navigator.pushNamed(context, AppRoutes.homeRoute);
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              width: onLoginPress ? 50 : 150,
              height: 40,
              alignment: Alignment.center,
              child: onLoginPress
                  ? Icon(
                      Icons.done,
                      color: Colors.white,
                    )
                  : Text("Login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(onLoginPress ? 50 : 8),
              ),
            ),
          )
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, AppRoutes.homeRoute);
          //     },
          //     child: Text("Login"),
          //     style: TextButton.styleFrom(minimumSize: Size(150, 40)))
        ],
      ),
    ));
  }
}
