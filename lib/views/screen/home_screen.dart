import 'package:flutter/material.dart';
import 'package:flutter_book_app/constant/constant_color.dart';
import 'package:flutter_book_app/core/services/book_service.dart';
import 'package:flutter_book_app/model/book.dart';
import 'package:flutter_book_app/views/widgets/text_widget.dart';
import 'package:supabase/supabase.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

    AlertDialog alert = AlertDialog(
      elevation: 0,
      backgroundColor: kBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      // ignore: avoid_unnecessary_containers
      title: Row(
        children: const [
          TextWidegt(
              titleName: 'Kitap Ekleyin',
              fontSize: 20,
              fontName: 'Caslon',
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
              primary: kBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text('Ekle'),
            onPressed: () {
              addBook();
            },
          ),
        ),
      ],
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              child: FutureBuilder<List<Book>>(
                future: service.getBook(),
                builder: (context, AsyncSnapshot<List<Book>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            height: size.height * .2,
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
                                        fontSize: 25,
                                        fontName: 'Monts',
                                        textColor: blackColor,
                                      ),
                                      SizedBox(
                                        height: size.height * .010,
                                      ),
                                      TextWidegt(
                                        titleName: snapshot.data![index].author
                                            .toUpperCase(),
                                        fontSize: 20,
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
                                              fontSize: 20,
                                              fontName: 'Monts',
                                              textColor: blackColor,
                                            ),
                                            SizedBox(
                                              width: size.width * .15,
                                            ),
                                            TextWidegt(
                                              titleName:
                                                  'Gün: ${snapshot.data![index].day.toString()}',
                                              fontSize: 20,
                                              fontName: 'Monts',
                                              textColor: blackColor,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: IconButton(
                                      onPressed: () async {
                                        // ignore: avoid_print

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
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ),
                                ],
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
            Positioned(
              bottom: 10,
              left: size.height * .25,
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return alert;
                        });
                  },
                  icon: const Icon(Icons.add),
                  iconSize: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> addBook() async {
    final response = await supabaseClient.from('Books').insert({
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
    // ignore: avoid_print
    print(response.error!.message);
  }
}
