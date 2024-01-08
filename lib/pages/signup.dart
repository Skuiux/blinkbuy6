
import 'package:blinkbuy6/service/database.dart';
import 'package:blinkbuy6/service/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import '../widgets/widget_supports.dart';
import 'bottom_nav.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email="",password="",name="";
  TextEditingController namecontroller= TextEditingController();
  TextEditingController passwordcontroller= TextEditingController();
  TextEditingController mailcontroller= TextEditingController();
  final _formkey = GlobalKey<FormState>();

  registration() async {
    try{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registered Succesfully", style: TextStyle(fontSize: 20.0),),));
      String Id= randomAlphaNumeric(10);
      Map<String, dynamic> addUserInfo={
        "Name": namecontroller.text,
        "Email": mailcontroller.text,
        "Wallet":"0",
        "Id":Id,
      };
      await DatabaseMethods().addUserDetail(addUserInfo, Id);
      await SharedPreferenceHelper().saveUserName(namecontroller.text);
      await SharedPreferenceHelper().saveuserEmail(mailcontroller.text);
      await SharedPreferenceHelper().saveuserWallet('0');
      await SharedPreferenceHelper().saveUserId(Id);
      Navigator.pushReplacement(context , MaterialPageRoute(builder: (context) => const BottomNav()));
    } on FirebaseException catch (e) {
      if(e.code =='weak-password'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password Provide Is To Weak",style:  TextStyle(fontSize: 18.0),),));
      } else if (e.code =='email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.greenAccent,
              content: Text("Account Already Exists",style:  TextStyle(fontSize: 18.0),),
            )
        );

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Add this
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFff5c30),
                      Color(0xFFe74b1a),
                    ]
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only (top:MediaQuery.of(context).size.height/3),
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)
                  )
              ),
              child: const Text(""),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60.0, left: 20.0,right: 20.0),
              child: Column(
                children: [
                  Center(
                      child: Image.asset(
                        "images/logo.jpeg",
                        width: MediaQuery.of(context).size.width/5,
                        fit: BoxFit.cover,
                      )
                  ),
                  const SizedBox(height: 25,),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.only(left: 40.0,right: 20.0, ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/1.5,
                      decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            const SizedBox(height: 30.0,),
                            Text("Sign Up",style: AppWidget.HeadlineTextFieldStyle(),),
                            TextFormField(
                              controller: namecontroller,
                              validator: (value){
                                if (value==null || value.isEmpty){
                                  return 'Please Enter Your Name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                prefixIcon: const Icon(Icons.person_2),
                              ),
                            ),
                            TextFormField(
                              controller: mailcontroller,
                              validator: (value){
                                if (value==null || value.isEmpty){
                                  return 'Please Enter Your Email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                prefixIcon: const Icon(Icons.email_outlined),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            TextFormField(
                              controller: passwordcontroller,
                              validator: (value){
                                if (value==null || value.isEmpty){
                                  return 'Please Enter Your Password';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                prefixIcon: const Icon(Icons.password_outlined),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Container(
                                alignment: Alignment.topRight,
                                child: Text("Forgot Password?",style: AppWidget.LightTextFieldStyle(),)
                            ),
                            const SizedBox(height: 20.0,),
                            GestureDetector(
                              onTap: () async {
                                if(_formkey.currentState!.validate()){
                                  setState((){
                                    email=mailcontroller.text;
                                    name=namecontroller.text;
                                    password=passwordcontroller.text;
                                  });
                                }
                                registration();
                              },
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffff5722),
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:18.0,
                                          fontFamily: 'Poppins1',
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30,),
                            GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LogIn()));
                                },
                                child: Text("Already have a account,Login Here ",style: AppWidget.LightTextFieldStyle(),)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}