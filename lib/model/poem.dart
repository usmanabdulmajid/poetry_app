import 'package:path/path.dart';

class Poem {
  String title;
  String author;
  List<String> lines;
  String linecount;

  Poem(
      {required this.title,
      required this.author,
      required this.lines,
      required this.linecount});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'lines': lines.join('-'),
      'linecount': linecount,
    };
  }

  factory Poem.fromMap(Map<String, dynamic> map) {
    return Poem(
        title: map['title'],
        author: map['author'],
        lines: map['lines'].split('-'),
        linecount: map['linecount']);
  }

  factory Poem.fromJson(Map<String, dynamic> json) {
    return Poem(
      title: json['title'],
      author: json['author'],
      lines: List<String>.from(json['lines']),
      linecount: json['linecount'],
    );
  }
}
