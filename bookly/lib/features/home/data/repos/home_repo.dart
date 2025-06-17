import 'package:bookly/features/home/data/models/book_model/book_model/book_model.dart';

abstract class HomeRepo {
  Future<List<BookModel?>> fetchBestSellerBooks();
  Future<List<BookModel?>> fetchFeaturedBooks();
}
