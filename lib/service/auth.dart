import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AuthMethods{
  final FirebaseAuth auth= FirebaseAuth.instance;
    getCurrentUser()async{
      return await auth.currentUser;
    }
    Future SignOut()async{
      await FirebaseAuth.instance.signOut();

    }
    Future deleteuser()async{
      User? user=await FirebaseAuth.instance.currentUser;
      user?.delete();
    }
}