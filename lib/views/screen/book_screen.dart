// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_book_app/constant/constant_color.dart';
import 'package:flutter_book_app/core/services/book_service.dart';
import 'package:flutter_book_app/model/book.dart';

import 'package:flutter_book_app/views/widgets/showdialog.dart';

import 'package:flutter_book_app/views/widgets/text_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:supabase/supabase.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  TextEditingController name = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController page = TextEditingController();
  TextEditingController day = TextEditingController();

  late SupabaseServices service;
  final supabaseClient = SupabaseClient(
      SupabaseServices.supabaseUrl, SupabaseServices.supabaseKey);

  @override
  void initState() {
    super.initState();

    service = SupabaseServices();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
/////////////////////  ALERT DİALOG  ///////////////
    AlertDialog alert = AlertDialog(
      elevation: 0,
      backgroundColor: kBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: Row(
        children: const [
          TextWidegt(
              titleName: 'Kitap Ekleyin',
              fontSize: 20,
              fontName: 'Monts',
              textColor: blackColor),
        ],
      ),
      titlePadding: EdgeInsets.only(
          left: size.width * .13,
          top: size.height * .015,
          bottom: size.height * .015),
      actions: [
        TextField(
          controller: name,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: "Kitap adı giriniz",
            hintStyle: const TextStyle(fontSize: 13),
          ),
        ),
        TextField(
          controller: author,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: "Yazar adı giriniz",
            hintStyle: const TextStyle(fontSize: 13),
          ),
        ),
        TextField(
          controller: page,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: "Sayfa Sayısını Giriniz",
            hintStyle: const TextStyle(fontSize: 13),
          ),
        ),
        TextField(
          controller: day,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: "Kaç Günde Okudunuz",
            hintStyle: const TextStyle(fontSize: 13),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: size.width * .15),
          width: size.width * 0.4,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              onPrimary: blackColor,
              primary: whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const TextWidegt(
                titleName: 'Ekle',
                fontSize: 20,
                fontName: 'Monts',
                textColor: blackColor),
            onPressed: () {
              addBook();
            },
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: size.width * .15),
          child: const TextWidegt(
            titleName: 'Kitaplarım',
            fontSize: 20,
            fontName: 'Monts',
            textColor: blackColor,
          ),
        ),
        backgroundColor: kBackground,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: FutureBuilder<List<Book>>(
              future: service.getBook(),
              builder: (context, AsyncSnapshot<List<Book>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Slidable(
                        actionPane: const SlidableDrawerActionPane(),
                        actionExtentRatio: 0.3,
                        secondaryActions: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              width: 25,
                              height: size.height * .17,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () async {
                                    await supabaseClient
                                        .from('Books')
                                        .delete()
                                        .eq('id', snapshot.data![index].id)
                                        .execute();

                                    snapshot.data!.remove(snapshot.data!
                                        .firstWhere((element) =>
                                            element.id ==
                                            snapshot.data![index].id));
                                    setState(() {});
                                  },
                                  iconSize: 25,
                                  icon: const Icon(Icons.delete),
                                ),
                              ),
                            ),
                          )
                        ],
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            height: size.height * .17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kBackground,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      TextWidegt(
                                        titleName: snapshot.data![index].name,
                                        fontSize: 23,
                                        fontName: 'Monts',
                                        textColor: blackColor,
                                      ),
                                      SizedBox(
                                        height: size.height * .010,
                                      ),
                                      TextWidegt(
                                        titleName: snapshot.data![index].author
                                            .toUpperCase(),
                                        fontSize: 18,
                                        fontName: 'Caslon',
                                        textColor: blackColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 13),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextWidegt(
                                              titleName:
                                                  'Sayfa: ${snapshot.data![index].page.toString()}',
                                              fontSize: 17,
                                              fontName: 'Monts',
                                              textColor: blackColor,
                                            ),
                                            SizedBox(
                                              width: size.width * .15,
                                            ),
                                            TextWidegt(
                                              titleName:
                                                  'Gün: ${snapshot.data![index].day.toString()}',
                                              fontSize: 17,
                                              fontName: 'Monts',
                                              textColor: blackColor,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Expanded(flex: 1, child: ShowDialog(alert: alert)),
        ],
      ),
    );
  }

  Future<void> addBook() async {
    try {
      /*    final response = */ await supabaseClient.from('Books').insert({
        'name': name.text,
        'author': author.text,
        'page': page.text,
        'day': day.text,
      }).execute();
      name.text = '';
      author.text = '';
      page.text = '';
      day.text = '';
      setState(() {});
    } catch (e) {
      throw Exception(e);
    }
  }
}
