import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_ui/model%20and%20provider/note_model.dart';
import 'package:note_ui/model%20and%20provider/note_provider.dart';
import 'package:provider/provider.dart';

class NoteUpdate extends StatefulWidget {
  final NoteModel note;
  const NoteUpdate({super.key, required this.note,});

  @override
  State<NoteUpdate> createState() => _NoteUpdateState();
}

class _NoteUpdateState extends State<NoteUpdate> {
  TextEditingController _headingcontroler =TextEditingController();
  TextEditingController _textcontroler =TextEditingController();
  
  @override
  Widget build(BuildContext context) {
_headingcontroler.text=widget.note.heading;
_textcontroler.text=widget.note.texts;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("update"),),
      body: Consumer<NoteProvider>(
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
                      prefixIcon: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_new,size: 30,color: Colors.white,)),
                      suffixIcon: InkWell(
                        onTap: () async {
                          NoteModel note = NoteModel(
                            heading: _headingcontroler.text,
                           texts: _textcontroler.text,
                            createdAt: Timestamp.now(),
                            noteID: widget.note.noteID
                            );
                            await state.updateNotes(note);
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