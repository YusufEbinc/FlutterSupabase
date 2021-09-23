class MyBook {
  late String bookName;
  late String summary;
  late DateTime startingDate;
  late DateTime endDate;

  MyBook(
      {required this.bookName,
      required this.endDate,
      required this.startingDate,
      required this.summary});
}
