import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_ui/phoneAuthentication/phone_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String number;

  const OtpScreen({super.key, required this.number});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
 final TextEditingController _otpcontroller=TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final PhoneProvider _phoneProvider=PhoneProvider();
 // final String validPin = "1234";

  //String enteredPin = "";
  Future<void> verifyOTP() async { 
     
     User? user = await _phoneProvider.verifyOTP(_otpcontroller.text.trim()); 
    
  
     if (user != null) { 
       ScaffoldMessenger.of(context) 
           .showSnackBar(const SnackBar(content: Text(' Login Successful!'))); 
       // Navigate to home screen 
     } else { 
       ScaffoldMessenger.of(context) 
           .showSnackBar(const SnackBar(content: Text(' Invalid OTP'))); 
     } 
   }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: SafeArea(
        child:   Consumer<PhoneProvider>(
                  builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Top Text Section
                Column(
                  children: [
                    const Text(
                      "Verification",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Enter the code sent to the number",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.black38,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.number,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
        
                /// Pin Input Section
                
                     Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Pinput(
                            controller: _otpcontroller,
                            length: 4,
                            // onChanged: (value) {
                            //   enteredPin = value;
                            // },
                            // validator: (value) {
                            //   return value == validPin
                            //       ? null
                            //       : "Pin is incorrect";
                            // },
                            onCompleted: (pin) {
                              log("Entered PIN: $pin");
                            },
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () async {
                              
                            
                              if (_formKey.currentState!.validate()) {
                              await verifyOTP();
                              }
                            },
                            child: const Text("Validate"),
                          ),
                        ],
                      ),
                    ),
                
        
                /// Resend Section
                Text(
                  "Didn't get the code?\nResend Code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          );
            },
                ),
        ),
      ),
    );
  }
}