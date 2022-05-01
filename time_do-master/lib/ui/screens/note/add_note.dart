import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:time_do/models/notedb.dart';
import 'package:time_do/models/notes_operation.dart';

import '../../../db/db_note.dart';
import '../../theme.dart';


class AddNote extends StatefulWidget {
  const AddNote({ Key? key }) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  bool isImportant=false;
  int important=1;
  String? title;
  String? description;
  DateTime dateTime = DateTime.now();
   String? YYYY_MM_DD='';
   
    TextEditingController _titleTextController = TextEditingController();
    TextEditingController _contentTextController = TextEditingController();

    void handleTitleTextChange() {
        setState(() {
            title = _titleTextController.text.trim();
        });
    }

    void handleNoteTextChange() {
        setState(() {
            description = _contentTextController.text.trim();
        });
    }

    @override
    void initState() {
        super.initState();
        YYYY_MM_DD = dateTime.toIso8601String().split('T').first;
        _titleTextController.addListener(handleTitleTextChange);
        _contentTextController.addListener(handleNoteTextChange);
    }

    Future<void> _insertNote(NoteDB note) async {
  NotesDatabase notesDb = NotesDatabase();
  await notesDb.initDatabase();
  int result = await notesDb.insertNote(note);
  await notesDb.closeDatabase();
}

    @override
    void dispose() {
        _titleTextController.dispose();
        _contentTextController.dispose();
        super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),
      actions: [
                       Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          onPressed: (){
                            Share.share('${title ?? ''}\n${description ?? ''}',subject: description ?? '');
                          }, 
                          icon: Icon(Icons.share,color: Colors.black,)
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          onPressed: (){
                            setState(() {
                              isImportant=!isImportant;
                              important==false ? 1:0;
                            });
                          }, 
                          icon: Icon(isImportant==true? Icons.star : Icons.star_border,color: isImportant==true?Colors.purple:Colors.black,size: 30,)
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: FlatButton(
                          child:Text(
                          "Done",
                          style: TextStyle(
                            
                              color:  Colors.black ,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                        ),
                        onPressed: ()async{
                           NoteDB noteObj = NoteDB(
        title: title, 
        description: description, 
        important: important,
        createDate: YYYY_MM_DD
    );
    try {
        await _insertNote(noteObj);
        print('Data added successfully');
    } catch (e) {
        print('Error inserting row');
    } finally {
        Navigator.pop(context);
        return;
    }

                          Provider.of<NoteOperation>(context,listen: false).addNewNotes(title ?? '', description ?? '', isImportant, YYYY_MM_DD ?? '');
                          Navigator.pop(context);
                        },
                          ),
                      ),
                   
      ],
                     
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleTextController,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(0),
                counter: null,
                counterText: "",
                hintText: 'Enter Title',
                hintStyle: Themes().taskTileHeadingTextStyle,
              ),
              style: Themes().taskTileHeadingTextStyle,
              onChanged: (value){
                title=value;
              },
            ),
             Expanded(
               child: Container(
                 height: double.infinity,
                 child: TextField(
                   controller: _contentTextController,
                    minLines: null,
                    maxLines: null, 
                    expands: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  counter: null,
                  counterText: "",
                    hintText: 'Enter description',
                    hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                  ),
                  style: TextStyle(color: Colors.black,fontSize: 20),
                  onChanged: (value){
                    description=value;
                  },
                           ),
               ),
             )
         
          ],
        ),
      ),
      
    );
 
  }
}