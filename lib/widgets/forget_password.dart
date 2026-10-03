import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../views/sign_up.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController otpController = TextEditingController();

  @override
  void dispose () {
    otpController.dispose();
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
                    Text("Forget Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("If you forget your password, then we will send you a Otp on your phone",
                      style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Pinput(
                      controller: otpController,
                      length: 6,
                      separatorBuilder: (index)=> SizedBox(width: 7,),

                      defaultPinTheme: PinTheme(
                          height: 58,
                          width: 58,

                          textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(0xFFE7E3E0),
                              )
                          )

                      ),
                      focusedPinTheme: PinTheme(
                          height: 58,
                          width: 58,

                          textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(0xFFE7E3E0),
                              )
                          )

                      ),
                      submittedPinTheme: PinTheme(
                          height: 58,
                          width: 58,

                          textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(0xFFE7E3E0),
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
                            builder: (context)=>SignUp()));
                      },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 1,
                          shadowColor: Colors.black,
                        ),
                        child: Text("Reset Password",
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
                                text: "Forget password! ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                )
                            ),
                            TextSpan(
                                text: "Back to login",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),


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
