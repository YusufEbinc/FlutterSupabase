class BookAll {
  final int id;
  final String name;
  final String author;
  final String details;
  final String imageurl;

  BookAll(
      {required this.id,
      required this.name,
      required this.author,
      required this.details,
      required this.imageurl});

  factory BookAll.fromJson(Map<String, dynamic> map) {
    return BookAll(
      id: map['id'],
      name: map['name'],
      author: map['author'],
      details: map['details'],
      imageurl: map['imageurl'],
    );
  }
}
