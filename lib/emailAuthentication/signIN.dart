import 'package:flutter/material.dart';
import 'package:note_ui/emailAuthentication/provider.dart';
import 'package:note_ui/noteHome.dart';
import 'package:provider/provider.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override

  TextEditingController _emailIDcontroller =TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, state, child) => 
       Scaffold(
      body:   Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(child: Text("Sign In",style: TextStyle(color: Colors.black,fontSize: 50),)),
                  SizedBox(height:50 ,),
        
                   TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email ID",
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                    ),
                    controller: _emailIDcontroller,
                  ),
                    
                   TextFormField(
                    decoration: InputDecoration(
                      hintText: "password",
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                    ),
                    controller: _passwordcontroller,
                  ),
                    
                     SizedBox(height:100 ,),
                  InkWell(
                    onTap: () {
                      state.emailSignin(
                        
                        _emailIDcontroller.text,
                         _passwordcontroller.text);
                      _emailIDcontroller.clear();
                      _passwordcontroller.clear();
                      
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Notehome(),));
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey),
                      child: Center(child: Text("SignIN",style: TextStyle(fontSize: 20,color: Colors.black),)),
                    ),
                  ),
                  SizedBox(height:50 ,),
                ],
                    
                    
                
              ),
      ),
      ),
    );
  }
}