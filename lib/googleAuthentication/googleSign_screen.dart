import 'package:flutter/material.dart';
import 'package:note_ui/googleAuthentication/googleAuth_provider.dart';
import 'package:provider/provider.dart';

class GooglesignScreen extends StatefulWidget {
  const GooglesignScreen({super.key});

  @override
  State<GooglesignScreen> createState() => _GooglesignScreenState();
}

class _GooglesignScreenState extends State<GooglesignScreen> {
  TextEditingController _usernamecontroller =TextEditingController();
  TextEditingController _emailIDcontroller =TextEditingController();
  TextEditingController _paswordcontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleauthProvider>(
      builder: (context, state, child) => 
       Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(child: Text("Sign up",style: TextStyle(color: Colors.black,fontSize: 50),)),
                SizedBox(height:50 ,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "user name",
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                  ),
                  controller: _usernamecontroller,
                ),
      
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
                  controller: _paswordcontroller,
                ),
                  
      
                  InkWell(
                    onTap: state.signInWithGoogle,
                    child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRopEuepRQpQX7E7k4ftXmCZYypzsBuFi-g8gymb9WaAQ&s",height: 30,)),
                
                  
                   SizedBox(height:50 ,),
                InkWell(
                  onTap: () {
            
                    // state.emailSignUP(UserModel(email: _emailIDcontroller.text, password: _paswordcontroller.text,
                    //  name: _usernamecontroller.text,  createdAt: Timestamp.now()));
                    // _emailIDcontroller.clear();
                    // _paswordcontroller.clear();
                    // _usernamecontroller.clear();
      
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Signin(),));
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey),
                    child: Text("SignUp",style: TextStyle(fontSize: 30,color: Colors.black),),
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