import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String heading;
  String texts;
  String? noteID;
  Timestamp createdAt;
  NoteModel({required this.heading,required this.texts,this.noteID,required this.createdAt});


  Map<String , dynamic> toMap(){
    return <String , dynamic>{
      "head":heading,
      "text":texts,
      "id":noteID,
      "createdAt":createdAt
    };
  }

  factory NoteModel.fromMap(Map<String , dynamic>map){
    return NoteModel(
      heading: map['head'] as String,
       texts: map ['text'] as String, 
       noteID: map ['id'] != null ? map['id'] as String :null,
       createdAt: map['createdAt'] as Timestamp
       
       );
  }
}