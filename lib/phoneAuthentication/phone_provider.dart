import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PhoneProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
 String? verification ;
 Future<void> sentOtp(String phonenumber)async {
  await _auth.verifyPhoneNumber(
     phoneNumber: phonenumber,
     timeout: const Duration(seconds: 60),
     verificationCompleted: (PhoneAuthCredential credential) async{
       await _auth.signInWithCredential(credential);
       log("Auto sign-in successful");
     },
     verificationFailed: (FirebaseAuthException e){
      log("verification failed:${e.message}");
     },
     codeSent: (String _verification,int? resendtoken){
      verification = _verification;
      log("OTP sent to $phonenumber");
     },

     codeAutoRetrievalTimeout: (String verifi_cation){
      verification=verifi_cation;
      log("Auto retrievel timeout");
     }
  );
 }

 //verify OTP manually

 Future<User?> verifyOTP(String smsCode)async{
  if(verification == null){
    log("verification ID is null. sent OTP first.");
    return null;
  }
  try{
    final credential = PhoneAuthProvider.credential(
      verificationId: verification!,
      smsCode: smsCode,
    );
    final UserCredential = await _auth.signInWithCredential(credential);
    log("Login success for ${UserCredential.user?.phoneNumber}");
    return UserCredential.user;
  }catch(e){
    log("Invalid OTP: $e");
    return null;
  }
 }


 //sign out 

 Future<void> signOut() async {
  await _auth.signOut();

 }
}