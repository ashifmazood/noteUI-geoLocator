import 'package:flutter/material.dart';
import 'package:note_ui/emailAuthentication/provider.dart';
import 'package:note_ui/model%20and%20provider/note_provider.dart';
import 'package:note_ui/note_adding.dart';
import 'package:note_ui/note_show.dart';
import 'package:note_ui/note_update.dart';
import 'package:provider/provider.dart';

class Notehome extends StatefulWidget {
  const Notehome({super.key});

  @override
  State<Notehome> createState() => _NotehomeState();
}

class _NotehomeState extends State<Notehome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
      
      InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NoteAdding(),));
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.tealAccent),
          child: Icon(Icons.add,color: Colors.amberAccent,)),
      ),
      body: Consumer2<NoteProvider,AuthProvider>(
        builder: (context, state, state2, child) => 
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      await state.getnote();
                    },
                    child: Text('NOTES',style: TextStyle(
                      color: Colors.black,fontSize: 32,fontWeight: FontWeight.w600
                    ),),
                  ),

                  InkWell(
                    onTap: () async {
                      await state2.logout();
                    },
                    child: Icon(Icons.logout,color: Colors.red,size: 30,weight: 5,)),
                  
                ],
              ),
        
              Expanded(
                child: ListView.separated(
                  itemCount: state.Allnotes.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder:(context, index) {
                    final data = state.Allnotes[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NoteShow(show: data,),));
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data.heading,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => NoteUpdate(note: data,),));
                                },
                                child: Icon(Icons.edit,size: 30,))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(height: 3,color: Colors.black,);
                },
                ),
              )

            
            ],
          ),
        ),
      )
    );
  }
}