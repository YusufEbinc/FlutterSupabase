class TrendBook {
  final int id;
  final String name;
  final String author;
  final String details;
  final String imageurl;

  TrendBook(
      {required this.id,
      required this.name,
      required this.author,
      required this.details,
      required this.imageurl});

  factory TrendBook.fromJson(Map<String, dynamic> map) {
    return TrendBook(
      id: map['id'],
      name: map['name'],
      author: map['author'],
      details: map['details'],
      imageurl: map['imageurl'],
    );
  }
}
