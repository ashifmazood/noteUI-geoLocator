import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_ui/model%20and%20provider/note_model.dart';

class NoteProvider extends ChangeNotifier {
  final firebase = FirebaseFirestore.instance.collection("note");
  List<NoteModel> Allnotes =[];
   int total =0;
  Future<void> addnote (NoteModel note_model) async {
    try{
      final id = firebase.doc().id;
      final noteRef = firebase.doc(id);
      note_model.noteID=id;
      await noteRef.set(note_model.toMap());
      log("note added sussusfully with id ${id}");

    }catch (e){
      log('error while adding note ${e}');
    }
  }

  Future<void>getnote() async {
    try{
    Allnotes.clear();
    final doc_collection = await firebase.get();
    final notes =doc_collection.docs.map((doc){
      final data = doc.data();
      return NoteModel.fromMap(data);
    }
    ).toList();
    Allnotes.addAll(notes);
    log("getted${notes.length}notes");
     notifyListeners();
  }catch (e){
    log("Error while getting notes ${e}");
  }

  }

  Future <void> delete (String noteID) async {
    try{
      await firebase.doc(noteID).delete();
      log("deleted ${noteID}");
      getnote();

    }catch (e){
      log("error ${e.toString()}");
    }
  }

  Future<void> updateNotes(NoteModel note_model) async {
    try{
      log("update note...");
      await firebase.doc(note_model.noteID).update(note_model.toMap());
      log("Note updated successfully: ${note_model.noteID}");
    }catch(e){
      log('Error while updating note:$e');
    }
  }
}