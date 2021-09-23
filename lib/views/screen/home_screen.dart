import 'package:flutter/material.dart';
import 'package:flutter_book_app/constant/app_constant.dart';
import 'package:flutter_book_app/model/my_book.dart';
import 'package:supabase/supabase.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SupabaseClient client;
  late MyBook mybook;

  var allBook = <MyBook>[];

  @override
  void initState() {
    super.initState();
    getAllBook();
    client = SupabaseClient(AppConstant.supabaseUrl, AppConstant.supabaseKey);
  }

  getAllBook() async {}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('kvmsdlikvmds'),
      ),
    );
  }
}
