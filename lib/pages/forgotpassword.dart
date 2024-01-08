import 'package:blinkbuy6/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mailcontroller=new TextEditingController();


  String email="";
  final _formkey=GlobalKey<FormState>();
  resetPassword()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Reset Email as been Send!", style: TextStyle(fontSize: 18.0),),));
    }
    on FirebaseAuthException catch(e){
      if(e.code=="user not found"){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No User Found for This Email", style: TextStyle(fontSize: 18.0),),));

    }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(child: Column(children: [
        SizedBox(height: 60.0,),
        Container(
          alignment: Alignment.topCenter,
          child: Text(
            'Password Recovery',style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
        SizedBox(height: 60.0,),
        Container(
          alignment: Alignment.topCenter,
          child: Text(
            'Enter Your Email',style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold
          ),
          ),
        ),
        Expanded(child: Form(
          key: _formkey,
          child: Padding(padding: EdgeInsets.only(left: 10.0),child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border:Border.all(color: Colors.white70,width: 20.0),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                controller: mailcontroller,
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return'Please Enter Your Email';
                  }
                  return null;
                },
                style:TextStyle(color:Colors.white),
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 18.0,color: Colors.white),
                  prefixIcon: Icon(Icons.person,color:Colors.white70,size:30.0
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 30.0,),
            SizedBox(height: 50.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont Have An Account?',style:TextStyle(fontSize: 18.0,color: Colors.white)),
                SizedBox(width: 5.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                  },
                  child: Text('Create New Account',style: TextStyle(color: Color.fromARGB(250, 186, 186, 6),
                      fontSize: 20.0,fontWeight: FontWeight.bold
                  ) ,),
                )

              ],
            ),

            
            
                  GestureDetector(
                    onTap: (){
                      if(_formkey.currentState!.validate()){
                        setState(() {
                          email=mailcontroller.text;

                        });
                        resetPassword();
                      }
                    },
                    child: Container(
                      width: 140,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text('Send Email',style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                ],
              ),
            ),



        ),),

      ],),),
    );
  }
}
