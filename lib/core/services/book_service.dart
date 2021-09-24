import 'package:flutter_book_app/model/book.dart';

import 'package:supabase/supabase.dart';

class SupabaseServices {
  static const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMjM0Njc3MywiZXhwIjoxOTQ3OTIyNzczfQ.kzqWaD8riSEKM6-6NdLpEiR401qy6VRKbN4Hx5OaBNE';
  static const supabaseUrl = 'https://trnzssjyrmdzaqdjagft.supabase.co';

  final supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);

  Future<List<Book>> getBook() async {
    final response = await supabaseClient
        .from('Books')
        .select()
        .order('name', ascending: true)
        .execute();

    if (response.status == 200) {
      final datalist = response.data! as List;
      return datalist.map((map) => Book.fromJson(map)).toList();
    } else {
      throw Exception('Eror:${response.error}');
    }
  }
}



/* 
 final result = await supabaseClient.from('Books').select().execute();

    if (result.status == 200) {
     var bookList = <Book>[];

      for (var element in (response.data as List)) {
        Book book = Book.fromJson(element);
        bookList.add(book);
      }
      return bookList;
    } else {
      throw Exception('eror :${result.error}');
    }
  } 
  
  
  
  
  
   final datalist = response.data! as List;
      return datalist.map((map) => Book.fromJson(map)).toList();
  
  
  
  
  
  
  
  */