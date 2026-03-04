import 'package:flutter/material.dart';
import 'package:note_ui/model%20and%20provider/note_model.dart';
import 'package:note_ui/model%20and%20provider/note_provider.dart';
import 'package:provider/provider.dart';

class NoteShow extends StatefulWidget {
  final NoteModel show;
  const NoteShow({super.key, required this.show});
 
  @override
  State<NoteShow> createState() => _NoteShowState();
}

class _NoteShowState extends State<NoteShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<NoteProvider>(
        builder: (context, state, child) => 
         Padding(
          padding: const EdgeInsets.all(24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.show.heading,style:  TextStyle(color: Colors.grey,fontSize: 40,fontWeight: FontWeight.w700),),
                  InkWell(
                    onTap: () async {
                      await state.delete(widget.show.noteID!);
                     Navigator.pop(context);
                    },
                    child: Icon(Icons.delete,color: Colors.red,size: 30,))
                ],
              ),
              Divider(color: Colors.grey,),
          
              Text(widget.show.texts,style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w300),)
            ],
          ),
        ),
      ),
    );
  }
}