class MyBook {
  late int id;
  late String bookName;
  late String author;
  late String summary;
  late DateTime startingDate;
  late DateTime endDate;

  MyBook(
      {required this.bookName,
      required this.endDate,
      required this.startingDate,
      required this.summary,
      required this.id,
      required this.author});
}
