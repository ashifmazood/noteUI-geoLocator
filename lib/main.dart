
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_ui/emailAuthentication/provider.dart' hide AuthProvider;
import 'package:note_ui/firebase_options.dart';
import 'package:note_ui/geo_location/geo_home_screen.dart';
import 'package:note_ui/geo_location/geo_provider.dart';
import 'package:note_ui/googleAuthentication/googleAuth_provider.dart';
import 'package:note_ui/googleAuthentication/googleSign_screen.dart';
import 'package:note_ui/model%20and%20provider/note_provider.dart';
import 'package:note_ui/phoneAuthentication/phoneScreen.dart';
import 'package:note_ui/phoneAuthentication/phone_provider.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (context) => NoteProvider() ,),
       //ChangeNotifierProvider(create: (context) => AuthProvider(),),
       ChangeNotifierProvider(create: (context) => GoogleauthProvider(),),
       ChangeNotifierProvider(create: (context) => PhoneProvider(),),
       ChangeNotifierProvider(create: (context) => Locationprovider(),),
      ],
      child: MaterialApp(
        
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        debugShowCheckedModeBanner: false,
        home: LocationHomeScreen()
      ),
    );
  }
}

