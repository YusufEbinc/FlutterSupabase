class BookList {
  final int id;
  final String name;
  final String author;
  final String details;
  final String imageurl;

  BookList(
      {required this.id,
      required this.name,
      required this.author,
      required this.details,
      required this.imageurl});

  factory BookList.fromJson(Map<String, dynamic> map) {
    return BookList(
      id: map['id'],
      name: map['name'],
      author: map['author'],
      details: map['details'],
      imageurl: map['imageurl'],
    );
  }
}
