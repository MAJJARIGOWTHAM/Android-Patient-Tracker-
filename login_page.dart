import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/auth_controller.dart';
import 'package:loginpage/signup_page.dart';
import 'package:get/get.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h*0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "img/Login page.webp"
                ),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello!",
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "Sign into your account",
                  style: TextStyle(
                      fontSize: 20,
                    color:Colors.grey[500]
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1, 1),
                        color:Colors.grey.withOpacity(0.5)
                      )
                    ]
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email, color:Colors.deepOrangeAccent),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0
                        )
                      ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0
                            )
                        ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color:Colors.grey.withOpacity(0.5)
                        )
                      ]
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password, color:Colors.deepOrangeAccent),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0
                            )
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(child: Container(),),
                    Text(
                      "Forgot the password",
                      style: TextStyle(
                          fontSize: 20,
                          color:Colors.grey[500]
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
          SizedBox(height: 70,),
          GestureDetector(
            onTap: (){
              AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
            },
            child: Container(
              width: w*0.5,
              height: h*0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage(
                          "img/op.png"
                      ),
                      fit: BoxFit.cover
                  )
              ),
              child:Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    color:Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height:w*0.2),
          RichText(text: TextSpan(
            text:"Don\'t have an account?",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 20
            ),
            children: [
              TextSpan(
                  text:" Create",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage())
              )
            ]
          )
          )
        ],
      ),
    );
  }
}
