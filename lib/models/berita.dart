class Berita {
  int? id;
  String title;
  String content;

  Berita({this.id, required this.title, required this.content});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }

  static Berita fromMap(Map<String, dynamic> map) {
    return Berita(
      id: map['id'],
      title: map['title'],
      content: map['content'],
    );
  }
}
