import 'package:flutter/cupertino.dart';
import 'package:time_do/models/note.dart';

class NoteOperation extends ChangeNotifier{
  // ignore: deprecated_member_use
  List<Note> _notes = [];

  List<Note> get getNotes{
    return _notes;
  }

  NoteOperation(){
    addNewNotes('First Note', 'Hello, This is first note...', false, '02/03/2022');
  }

  void addNewNotes(String title, String description, bool isImportant, String createdDate){
      Note note=Note(title: title, description: description, isImportant: isImportant, dateCreate: createdDate);
      _notes.add(note);
      notifyListeners();
  }
}