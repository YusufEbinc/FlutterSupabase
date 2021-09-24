import 'package:flutter/material.dart';
import 'package:flutter_book_app/core/services/book_service.dart';
import 'package:flutter_book_app/model/book.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SupabaseServices service;
  late Book? book;
  @override
  void initState() {
    super.initState();
    service = SupabaseServices();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    /* AlertDialog alert = AlertDialog(
      elevation: 0,
      backgroundColor: kBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: const Text("kitap ekleyin"),
      titlePadding: EdgeInsets.only(
          left: size.width * .13,
          top: size.height * .015,
          bottom: size.height * .015),
      actions: [
        TextField(
          onChanged: (bookName) =>  = bookName,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: "kitap adı giriniz",
            hintStyle: const TextStyle(fontSize: 13),
          ),
        ),
        TextField(
          onChanged: (bookName) => mybook.bookName = bookName,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: "yazar adı giriniz",
            hintStyle: const TextStyle(fontSize: 13),
          ),
        ),
        Text('${mybook.startingDate}'),
        IconButton(
          onPressed: () async {
            var dateTime = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)));
            if (dateTime != null) {
              mybook.startingDate = dateTime;
              setState(() {});
            }
          },
          icon: const Icon(Icons.date_range),
        ),
        Text('${mybook.endDate}'),
        IconButton(
            onPressed: () async {
              var dateTime = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)));
              if (dateTime != null) {
                mybook.endDate = dateTime;
                setState(() {});
              }
            },
            icon: const Icon(Icons.date_range)),
        Container(
            margin: EdgeInsets.only(right: size.width * .15),
            width: size.width * 0.4,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                onPrimary: whiteColor,
                primary: kBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('ekle'),
              onPressed: () async {
                var result = await client.from('Books').insert({
                  'name': mybook.bookName,
                  'author': mybook.author,
                });
              },
            )),
      ],
    ); */
    return Scaffold(
      body: FutureBuilder<List<Book>>(
        future: service.getBook(),
        builder: (context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Text(snapshot.data![index].name),
                    Text(snapshot.data![index].author),
                    Text(snapshot.data![index].strtdate.toString()),
                    Text(snapshot.data![index].fnsdate.toString()),
                  ],
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
    );
  }
}




 /* 
 
 
 
 
  ListView(
            children: snapshot.data!
                .map((book) => Column(
                      children: [
                        Text(book.name),
                        Text(book.author),
                        Text(book.strtdate.toString()),
                        Text(book.fnsdate.toString()),
                      ],
                    ))
                .toList(),
          );
 
 
 
 
 
 
 
  showDialog(
              context: context,
              builder: (context) {
                return alert;
              },


              Center(
        child: IconButton(
          onPressed: () {
          
          },
          iconSize: 35,
          icon: const Icon(Icons.add),
          color: Colors.blue,
        ),
      ),
            ); */