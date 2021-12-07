//! This is file is meant for the first screen, i.e., ListScreen.
//! Parts of the code have been given. Complete the remaining.
//? You can refactor the code if needed

//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:midterm_codebase/models/mock_data.dart';
import 'note_screen.dart';
import '../models/note.dart';

class ListScreen extends StatefulWidget {
  final List<Note> myNote;
  ListScreen(this.myNote);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  var subCheck = true;
  List<bool> buttonCheck = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade200,
            child: Text(
              widget.myNote.length.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: widget.myNote.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemBuilder: (context, index) => ListTile(
          trailing: SizedBox(
            width: 110.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: buttonCheck[index]
                  ? [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.myNote.removeAt(index);
                            buttonCheck.removeAt(index);
                          });
                        },
                      ),
                    ]
                  : [],
            ),
          ),
          title: Text(widget.myNote[index].title),
          subtitle: subCheck ? Text(widget.myNote[index].content) : null,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NoteScreen(
                  currentNote: widget.myNote.elementAt(index), chosen: "view");
            }));
          },
          onLongPress: () {
            setState(() {
              buttonCheck[index] = !buttonCheck[index];
            });
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: subCheck
                  ? Icon(Icons.unfold_less)
                  : Icon(Icons.format_align_justify),
              tooltip: 'Show less. Hide notes content',
              onPressed: () {
                setState(() {
                  subCheck = !subCheck;
                });
              }),
          FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: 'Add a new note',
            onPressed: () {
              setState(() {
                widget.myNote
                    .add(Note(title: "new Note", content: "new note content"));
                buttonCheck.add(false);
              });
            },
          ),
        ],
      ),
    );
  }
}
