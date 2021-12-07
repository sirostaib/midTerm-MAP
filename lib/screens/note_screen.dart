//! This is file is meant for the second screen, i.e., NoteScreen.
//! Parts of the code have been given. Complete the remaining.
//? You can refactor the code if needed

import 'package:flutter/material.dart';

import '../models/note.dart';

class NoteScreen extends StatelessWidget {
  Note currentNote;
  //Note initNote;
  String chosen;
  NoteScreen({this.currentNote, this.chosen});
  //NoteScreen.copy(this.currentNote, this.chosen, {String chosen});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: chosen == "view" ? Text("View Note") : Text("Edit Note"),
        actions: [
          chosen != "view"
              ? IconButton(
                  icon: Icon(
                    Icons.check_circle,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context, currentNote);
                  })
              : Text(""),
          IconButton(
              icon: Icon(
                Icons.cancel_sharp,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context, null);
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: currentNote.title,
              enabled: chosen == "view" ? false : true,
              decoration: InputDecoration(
                hintText: 'Type the title here',
              ),
              onChanged: (value) {
                currentNote.title = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: TextFormField(
                  enabled: chosen == "view" ? false : true,
                  initialValue: currentNote.content,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: 'Type the description',
                  ),
                  onChanged: (value) {
                    currentNote.content = value;
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
