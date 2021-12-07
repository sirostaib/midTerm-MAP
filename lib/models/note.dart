//! Define the model class Note here

class Note {
  String title;
  String content;

  Note({
    this.title = "Note",
    this.content = "Text",
  });

  @override
  toString() {
    return {
      'title': title,
      'content': content,
    }.toString();
  }
}
