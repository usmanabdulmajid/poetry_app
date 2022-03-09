import 'package:path/path.dart';

class Poetry {
  String title;
  String author;
  List<String> lines;
  String linecount;

  Poetry(
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

  factory Poetry.fromMap(Map<String, dynamic> map) {
    return Poetry(
        title: map['title'],
        author: map['author'],
        lines: map['lines'].split('-'),
        linecount: map['linecount']);
  }

  factory Poetry.fromJson(Map<String, dynamic> json) {
    return Poetry(
      title: json['title'],
      author: json['author'],
      lines: List<String>.from(json['lines']),
      linecount: json['linecount'],
    );
  }
}
