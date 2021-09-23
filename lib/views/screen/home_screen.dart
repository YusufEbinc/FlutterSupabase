// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* late SupabaseClient client;
  late MyBook mybook;

  var allBook = <MyBook>[];

  get icon => null;

  @override
  void initState() {
    super.initState();
    getAllBook();
    client = SupabaseClient(AppConstant.supabaseUrl, AppConstant.supabaseKey);
  }

  getAllBook() async {
    var result = await client.from('Books').select().execute();

    for (var element in (result.toJson()['data'] as List)) {
      print(element);
      allBook.add(
        MyBook(
          id: element['id'],
          bookName: element['name'],
          author: element['author'],
          startingDate: element['strtdate'],
          endDate: element['fnsdate'],
          summary: element['summary'],
        ),
      );
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add),
      ),
    );
  }
}
