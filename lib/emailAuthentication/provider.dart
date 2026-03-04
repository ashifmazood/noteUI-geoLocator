
import 'dart:developer';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_ui/emailAuthentication/user_model.dart';

class AuthProvider extends ChangeNotifier {
final  firebase =  FirebaseFirestore.instance.collection("User");
Future <void> emailSignUP(UserModel user_model) async {
  
  try{
  await FirebaseAuth.instance.
  createUserWithEmailAndPassword(email: user_model.email,password: user_model.password);
  final id = firebase.doc().id;
      final noteRef = firebase.doc(id);
      user_model.userID=id;
      await noteRef.set(user_model.toMap());
  log("SignUP successfully");
  
  }catch (e){
    log('Error while $e');
    
  }
}
Future<void>emailSignin(String email,String password) async {
  try{
    await FirebaseAuth.instance.
    signInWithEmailAndPassword(email:email, password:password);
    log("Login succussfully ");
  }catch (e){
    log("Error While $e");
  }
}

Future<void>logout() async {
  
    await FirebaseAuth.instance.signOut();
    log("Logout succuss fully");
}
}