import 'package:flutter/material.dart';
import 'package:flutter_book_app/constant/constant_color.dart';
import 'package:flutter_book_app/model/trend_books.dart';
import 'package:flutter_book_app/views/widgets/text_widget.dart';

class BookDetailsPage extends StatelessWidget {
  final TrendBook books;

  const BookDetailsPage({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.shade300,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * .07),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          books.imageurl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * .03,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.chevron_left),
                    iconSize: 32,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: whiteColor,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidegt(
                            titleName: books.author,
                            fontSize: 20,
                            fontName: 'Caslon',
                            textColor: blackColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidegt(
                            titleName: books.name,
                            fontSize: 20,
                            fontName: 'Monts',
                            textColor: blackColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidegt(
                            titleName: books.details,
                            fontSize: 15,
                            fontName: 'Caslon',
                            textColor: blackColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
