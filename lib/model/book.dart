class Book {
  late int id;
  late String name;
  late String author;
  late int page;
  late int day;

  Book(
      {required this.id,
      required this.name,
      required this.author,
      required this.page,
      required this.day});

  factory Book.fromJson(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      name: map['name'],
      author: map['author'],
      page: map['page'],
      day: map['day'],
    );
  }
}
