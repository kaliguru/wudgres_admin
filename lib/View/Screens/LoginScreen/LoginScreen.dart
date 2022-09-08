import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wudgres_admin_final/Utils/Image_Constrants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wudgres_admin_final/View/Screens/LoginScreen/HomeScreen.dart';

import '../../../Utils/show_error_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String? validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  signIn() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((user) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (c) => const HomeScreen()),
          (route) => false);
    }).catchError(
      (e) {
        showErrorDialog(context, e.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage(ImageConstrants.BACKGROUND),
                  fit: BoxFit.cover)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Form(
                    key: formKey,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height,
                      // color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // SizedBox(height: 50),
                          Container(
                              child: Image.asset(
                            ImageConstrants.APPLOGO,
                            width: 300,
                            height: 200,
                          )),
                          // SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54, blurRadius: 5.0)
                                  ]),
                              height: MediaQuery.of(context).size.height / 2,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                      child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 30, fontFamily: 'GilroyM'),
                                  )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: _emailController,
                                      validator: (value) => value!.isEmpty
                                          ? 'Email is required'
                                          : validateEmail(value.trim()),
                                      onChanged: (value) {
                                        _emailController =
                                            value as TextEditingController;
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        label: Text('Email'),
                                        hintStyle:
                                            TextStyle(fontFamily: 'GilroyM'),
                                        labelStyle:
                                            TextStyle(fontFamily: 'GilroyM'),
                                        prefixIcon: Icon(CupertinoIcons.mail),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      validator: (value) => value!.isEmpty
                                          ? 'Password is required'
                                          : null,
                                      onChanged: (value) {
                                        _passwordController =
                                            value as TextEditingController;
                                      },
                                      decoration: InputDecoration(
                                          hintText: 'Password',
                                          label: Text('Password'),
                                          hintStyle:
                                              TextStyle(fontFamily: 'GilroyM'),
                                          labelStyle:
                                              TextStyle(fontFamily: 'GilroyM'),
                                          prefixIcon:
                                              Icon(CupertinoIcons.shield),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Forget Password",
                                        style: TextStyle(fontFamily: 'GilroyM'),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        if (checkFields()) {
                                          signIn();
                                        }

                                        //print('pressed sign');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.brown,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: Center(
                                            child: Text(
                                          "Login",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontFamily: 'GilroyM'),
                                        )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
