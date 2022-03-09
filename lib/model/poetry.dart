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

  factory Poetry.fromJson(Map<String, dynamic> json) {
    return Poetry(
      title: json['title'],
      author: json['author'],
      lines: List<String>.from(json['lines']),
      linecount: json['linecount'],
    );
  }
}
