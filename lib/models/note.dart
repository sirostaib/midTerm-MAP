//! Define the model class Note here

class Note {
  String title;
  String content;

  Note({
    this.title,
    this.content,
  });

  update(Note ta) {
    this.title = ta.title;
    this.content = ta.content;
  }
}
