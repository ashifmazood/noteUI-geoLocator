import 'package:flutter/material.dart';
import 'package:note_ui/phoneAuthentication/otp_screen2.dart';
import 'package:note_ui/phoneAuthentication/otpscreen.dart';
import 'package:note_ui/phoneAuthentication/phone_provider.dart';
import 'package:provider/provider.dart';

class Phonescreen extends StatefulWidget {
  const Phonescreen({super.key});

  @override
  State<Phonescreen> createState() => _PhonescreenState();
}

class _PhonescreenState extends State<Phonescreen> {
     final PhoneProvider _phoneProvider=PhoneProvider();

  TextEditingController _phonecontroller =TextEditingController();
  void sendOTP() async { 
     String phone = '+91${_phonecontroller.text.trim()}'; 
    
     await _phoneProvider.sentOtp(phone); 
 setState(() {
   
 });
  
     Navigator.push( 
       context, 
       MaterialPageRoute(builder: (_) => OtpScreen(number: phone) )
     ); 
   }
  @override
  Widget build(BuildContext context) {
    return Consumer<PhoneProvider> (
      builder: (context, state, child) => 
       Scaffold(
        appBar: AppBar(title: Text("Phone Number",style: TextStyle(color: Colors.black,fontSize: 30),),),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
      
              SizedBox(height: 100,),
             TextFormField(
                        decoration: InputDecoration(
                          hintText: "enter your number",
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                        ),
                        controller: _phonecontroller,
                        keyboardType: TextInputType.number,
                      ),
          
                    SizedBox(height: 100,),
                      InkWell(
                        onTap: () async {
                          sendOTP();
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.deepOrange),
                          child: Center(child: Text("Get OTP",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),)),
                        ),
                      )
            ]
          ),
        ),
      ),
    );
  }
}