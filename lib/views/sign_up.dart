import 'package:daraz/views/product_list_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'log_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late TapGestureRecognizer _loginRecognizer = TapGestureRecognizer();
  @override
  void initState() {
    super.initState();
    _loginRecognizer.onTap = () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(
          builder: (context)=>LogIn()));

    };

  }
  @override
  void dispose () {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    _loginRecognizer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,

          centerTitle: true,
          title: Text("Daraz Website",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: nameController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Your Name",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 10,
                                vertical: 2
                            ),
                            child: Icon(Icons.drive_file_rename_outline),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              )
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )
                          )



                      ),

                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: emailController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 10,
                                vertical: 2
                            ),
                            child: Icon(Icons.email_outlined),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              )
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )
                          )



                      ),

                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 10,
                                vertical: 2
                            ),
                            child: Icon(Icons.password),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              )
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )
                          )



                      ),

                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(
                            builder: (context)=>ProductListScreen()));
                      },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 1,
                          shadowColor: Colors.black,
                        ),
                        child: Text("Sign in Now",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Center(
                      child: RichText(text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Already have an Account! ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                )
                            ),
                            TextSpan(
                                text: "Log In",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                                recognizer: _loginRecognizer

                            )
                          ]
                      )
                      ),
                    )


                  ],
                ),),
            ))
    );
  }
}
