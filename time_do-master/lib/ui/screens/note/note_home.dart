import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:provider/provider.dart';
import 'package:time_do/models/notes_operation.dart';
import 'package:time_do/ui/screens/note/add_note.dart';

import '../../../models/note.dart';
import '../../theme.dart';

class NoteHome extends StatefulWidget {
  const NoteHome({ Key? key }) : super(key: key);

  @override
  State<NoteHome> createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Note',style: Themes().homeScreenHeadingTextStyle),
        elevation: 0,
        backgroundColor: Colors.white,
        actions:[IconButton(icon:Icon(Icons.add),
          color: Colors.black,onPressed: () => Get.to(() => AddNote(),
            transition: Transition.downToUp,
            duration: Duration(milliseconds: 500)),)]
        ),
      
      body: Consumer<NoteOperation>(
        builder:(context,NoteOperation data, child) {
          return ListView.builder(
            itemCount: data.getNotes.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                 direction: DismissDirection.endToStart,
                           onDismissed: (direction) {
                          // Remove the item from the data source.
                          setState(() {
                              data.getNotes.removeAt(index);
                          });
                           },
                         background: Container(
                           height: 100,
                            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: MediaQuery.of(context).orientation == Orientation.portrait ? 10 : 0),
                           alignment: Alignment.centerRight,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(12),
                             color: Colors.red
                           ),
                           child: Padding(
                             padding: const EdgeInsets.only(right: 20),
                             child: Icon(Icons.delete,color: Colors.white,size: 35,),
                           ),
                         ),
                         
                child: AnimationConfiguration.staggeredList(
                      position: index,
                      duration: Duration(milliseconds: 500 + index * 20),
                      child: SlideAnimation(
                        horizontalOffset: 400.0,
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: MediaQuery.of(context).orientation == Orientation.portrait ? 10 : 0), 
                            child:  NotesCard(note: data.getNotes[index],),
                            ),
                          ),
                      ),
                    ),
              );
            
          });
        })
         
    );
 
  }
}

class NotesCard extends StatelessWidget {
  final Note? note;

  const NotesCard({ Key? key ,this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            // margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            // padding: EdgeInsets.symmetric(horizontal: 10,vertical: MediaQuery.of(context).orientation == Orientation.portrait ? 20 : 0),
            height: 90,
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10,left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                            note?.dateCreate ?? '',
                            style: TextStyle(color: Colors.purple,fontSize: 12),
                          ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    
                      Flexible(
                        child: Container(
                          child: Text(
                            note?.title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Themes().taskTileHeadingTextStyle,
                          ),
                        ),
                      ),
                         Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child:  Icon(note?.isImportant==true? Icons.star : Icons.star_border,color: note?.isImportant==true?Colors.purple:Colors.black,size: 30,)
                          
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Flexible(
                    child: Container(
                      child: Text(
                        note?.description ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black,fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}