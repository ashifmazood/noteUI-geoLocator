import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_ui/model%20and%20provider/note_model.dart';
import 'package:note_ui/model%20and%20provider/note_provider.dart';
import 'package:note_ui/noteHome.dart';
import 'package:provider/provider.dart';

class NoteAdding extends StatefulWidget {
  const NoteAdding({super.key});

  @override
  State<NoteAdding> createState() => _NoteAddingState();
}

class _NoteAddingState extends State<NoteAdding> {
  TextEditingController _headingcontroler =TextEditingController();
  TextEditingController _textcontroler =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer <NoteProvider>(
        builder: (context, state, child) => 
         SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width*0.9,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 40,color:Colors.white,
                      
                    ),
                    decoration: InputDecoration(
                      hintText: 'Heading',
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: InkWell(
                        onTap: () async {
                          if (_headingcontroler.text.isNotEmpty && _textcontroler.text.isNotEmpty){
                            NoteModel note = NoteModel(
                              heading: _headingcontroler.text,
                               texts: _textcontroler.text,
                                createdAt: Timestamp.now()
                                );
                                await state.addnote(note); 
                          }
                          _headingcontroler.clear();
                          _textcontroler.clear();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Notehome(),));
                        },
                        child: Icon(Icons.check,color:Colors.amber,size: 50,))
                    ),
                    controller: _headingcontroler,
                    
                  ),
                ),
                SizedBox(height: 10,),
          
                SizedBox(
                  height:  MediaQuery.of(context).size.height*0.9,
                  width: MediaQuery.of(context).size.width*0.9,
                  child: TextFormField(
                    style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w300),
                  controller: _textcontroler,
                  maxLines: 100,
                    ),
                  )
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}