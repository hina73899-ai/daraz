import 'package:daraz/views/product_list_screen.dart';
import 'package:daraz/views/sign_up.dart';
import 'package:daraz/widgets/forget_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late TapGestureRecognizer _signupRecognizer = TapGestureRecognizer();
  @override
  void initState() {
    super.initState();
    _signupRecognizer.onTap = () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(
          builder: (context)=>SignUp()));

    };

  }
  @override
  void dispose () {
    emailController.dispose();
    passwordController.dispose();
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
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )),
      ),
      body: Padding(padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Log In",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: emailController,
              obscureText: false,
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
              obscureText: false,
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
            SizedBox(height:10),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(

                      context, MaterialPageRoute(builder: (context) => ForgetPassword()));

                },
                child: Text("Forget Password",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
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
                child: Text("Enter Your Detail",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: RichText(text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Don't have an Account! ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        )
                    ),
                    TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        recognizer: _signupRecognizer

                    )
                  ]
              )
              ),
            )


          ],
        ),),
    );
  }
}
