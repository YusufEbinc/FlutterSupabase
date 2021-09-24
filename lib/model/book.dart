class Book {
  late String name;
  late String author;
  late DateTime strtdate;
  late DateTime fnsdate;

  Book(
      {required this.name,
      required this.author,
      required this.strtdate,
      required this.fnsdate});

  factory Book.fromJson(Map<String, dynamic> map) {
    return Book(
      name: map['name'],
      author: map['author'],
      strtdate: DateTime.parse(map['strtdate']),
      fnsdate: DateTime.parse(map['fnsdate']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['author'] = author;
    data['strtdate'] = strtdate;
    data['fnsdate'] = fnsdate;
    return data;
  }
}
