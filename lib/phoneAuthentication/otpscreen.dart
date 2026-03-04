import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

// class Otpscreen extends StatefulWidget {
//   const Otpscreen({super.key});

//   @override
//   State<Otpscreen> createState() => _OtpscreenState();
// }

// class _OtpscreenState extends State<Otpscreen> {

//   GlobalKey<FormState> formkey = GlobalKey<FormState>();

// String validPin = "1234";

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: _buildUI() ,
//     );
//   }

//   Widget _buildUI(){
//         return SafeArea(
//             child: SizedBox.expand(
//                 child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                     Column(

//                         children: [
//                             _hesdingText(),
//                             SizedBox(
//                                 height: 20,
//                             ),
//                             _subheadingText(),
//                              SizedBox(
//                                 height: 20,
//                             ),
//                              _numberText()
//                         ],
//                     ),
//                      _pinInputForm(),
                     
//                        _resendCodeLink(),
//                     ],
//                     ),
//                     )
//                     );
//   }
//           Widget _hesdingText(){
//             return const Text(
//             "Verification",style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.w600
//             ),);
//           }

//           Widget _subheadingText(){
//              return const Text(
//             "Enter the code sent to the number",style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.black38
//             ),);
//           }

//           Widget _numberText(){
//               return const Text(
//             "+91 72325 36542",style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
                
//             ),);
//           }
//           Widget _resendCodeLink(){
//             return Text(
                
//                 "Didn't get the code.\nResend Code",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w200,
//                     fontSize: 15,
//                     color: Theme.of(context).colorScheme.primary
//                 ),
//             );
//           }

//           Widget _pinInputForm(){
//             return Form(
//               key: formkey,
//               child:Column(
//                 children: [
//                     Pinput(
//                       validator: (value) {
//                         return value == validPin ? null : "Pin is incorrect";
//                       },
//                       onCompleted: (pin){
//                         print("Success :$pin");
//                       },
//                       errorBuilder: (errorText, pin){
//                         return Padding(padding: EdgeInsets.symmetric(vertical: 10.0,),
//                         child: Center(child: Text(errorText ?? "",
//                         style: TextStyle(color: Colors.red),
//                         ),),
//                         );

//                       },
//                     ),
//                     TextButton(onPressed: () {
//                       formkey.currentState!.validate();
//                     }, child: const Text("Validate")
//                     )
//                 ],
//             ) );
//           }
// }