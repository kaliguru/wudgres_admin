import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wudgres_admin_final/Utils/Image_Constrants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =  TextEditingController();
  final TextEditingController _passwordController =  TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

              image: DecorationImage(image: AssetImage(ImageConstrants.BACKGROUND),fit: BoxFit.cover)
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(

                width: MediaQuery.of(context).size.width/3,
                height: MediaQuery.of(context).size.height,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // SizedBox(height: 50),
                    Container
                      (child: Image.asset(ImageConstrants.APPLOGO,width: 300,height: 200,)),
                    // SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5.0
                          )]
                        ),
                        height: MediaQuery.of(context).size.height/2,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 20,),
                            Center(child: Text("Login",style: TextStyle(fontSize: 30,fontFamily: 'GilroyM'),)),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  label: Text('Email'),
                                    hintStyle:TextStyle(fontFamily: 'GilroyM'),
                                    labelStyle:  TextStyle(fontFamily: 'GilroyM'),
                                  prefixIcon: Icon(CupertinoIcons.mail),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    label: Text('Password'),
                                    hintStyle:TextStyle(fontFamily: 'GilroyM'),
                                    labelStyle:  TextStyle(fontFamily: 'GilroyM'),
                                    prefixIcon: Icon(CupertinoIcons.shield),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: (){},
                                child: Text("Forget Password",style: TextStyle(fontFamily: 'GilroyM'),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: ()
                                {

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.brown,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,

                                  child: Center(child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: 'GilroyM'),)),
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
              Container(
                width: MediaQuery.of(context).size.width/1.5,
                height: MediaQuery.of(context).size.height,

              )
            ],
          ),
        ),
      ),
    );
  }
}
