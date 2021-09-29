import 'package:flutter/material.dart';
import 'package:flutter_book_app/constant/constant_color.dart';
import 'package:flutter_book_app/core/services/book_service.dart';
import 'package:flutter_book_app/model/book_all_model.dart';
import 'package:flutter_book_app/model/books_list_model.dart';
import 'package:flutter_book_app/views/screen/book_details.dart';
import 'package:flutter_book_app/views/screen/book_screen.dart';
import 'package:flutter_book_app/views/widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SupabaseServices service;

  @override
  void initState() {
    super.initState();
    service = SupabaseServices();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person),
          iconSize: 30,
          color: blackColor,
        ),
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BookPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              color: blackColor,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: const [
                    TextWidget(
                      titleName: 'Trendler',
                      fontSize: 25,
                      fontName: 'Caslon',
                      textColor: blackColor,
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.double_arrow,
                        size: 25,
                        color: blackColor,
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            flex: 3,
            child: FutureBuilder<List<BookList>>(
              future: service.getBooktrend(),
              builder: (context, AsyncSnapshot<List<BookList>> snapshot) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: size.width * .31,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 4),
                                spreadRadius: -6,
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              snapshot.data![index].imageurl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              },
            ),
          ),
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 25, left: 10),
              child: TextWidget(
                titleName: 'Kitaplar',
                fontSize: 25,
                fontName: 'Caslon',
                textColor: blackColor,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: FutureBuilder<List<BookAll>>(
              future: service.getBookAll(),
              builder: (context, AsyncSnapshot<List<BookAll>> snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    if (snapshot.hasData) {
                      return InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookDetailsPage(books: snapshot.data![index]),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: size.height * .17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(1, 10),
                                  blurRadius: 18,
                                  spreadRadius: -10,
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        snapshot.data![index].imageurl)),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width * .06),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                          titleName: snapshot.data![index].name,
                                          fontSize: 20,
                                          fontName: 'Monts',
                                          textColor: blackColor),
                                      TextWidget(
                                          titleName:
                                              snapshot.data![index].author,
                                          fontSize: 15,
                                          fontName: 'Caslon',
                                          textColor: blackColor)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
