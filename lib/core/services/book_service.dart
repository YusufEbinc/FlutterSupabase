import 'package:flutter_book_app/model/book_all_model.dart';
import 'package:flutter_book_app/model/book_model.dart';
import 'package:flutter_book_app/model/books_list_model.dart';

import 'package:supabase/supabase.dart';

class SupabaseServices {
  static const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMjM0Njc3MywiZXhwIjoxOTQ3OTIyNzczfQ.kzqWaD8riSEKM6-6NdLpEiR401qy6VRKbN4Hx5OaBNE';
  static const supabaseUrl = 'https://trnzssjyrmdzaqdjagft.supabase.co';

  final supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);

  Future<List<Book>> getBook() async {
    final response = await supabaseClient.from('Books').select().execute();

    if (response.status == 200) {
      final datalist = response.data! as List;
      return datalist.map((map) => Book.fromJson(map)).toList();
    } else {
      throw Exception('Eror:${response.error}');
    }
  }

  Future<List<BookList>> getBooktrend() async {
    final response = await supabaseClient.from('trendbooks').select().execute();

    if (response.status == 200) {
      final datalist = response.data! as List;
      return datalist.map((map) => BookList.fromJson(map)).toList();
    } else {
      throw Exception('Eror:${response.error}');
    }
  }

  Future<List<BookAll>> getBookAll() async {
    final response = await supabaseClient.from('allbook').select().execute();

    if (response.status == 200) {
      final datalist = response.data! as List;
      return datalist.map((map) => BookAll.fromJson(map)).toList();
    } else {
      throw Exception('Eror:${response.error}');
    }
  }
}
