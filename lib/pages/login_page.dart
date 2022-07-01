// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool onLoginPress = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        onLoginPress = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, AppRoutes.homeRoute);
      setState(() {
        onLoginPress = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Image.asset(
                  "assets/images/hey.png",
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }

                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (ValueKey) {
                        if (ValueKey!.isEmpty) {
                          return "Password cannnot be empty";
                        } else if (ValueKey.length < 6) {
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () => moveToHome(context),
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                    decoration: BoxDecoration(
                      color: context.theme.buttonColor,
                      borderRadius:
                          BorderRadius.circular(onLoginPress ? 50 : 8),
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
          ),
        ));
  }
}
