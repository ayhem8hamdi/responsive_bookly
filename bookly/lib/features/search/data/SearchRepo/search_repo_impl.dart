import 'package:bookly/core/Errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/search/data/SearchRepo/searchRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements Searchrepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  @override
  Future<Either<Failure, List<Item>>> fetchSearchedBooks(
      {required String bookName}) async {
    try {
      // Properly encode the user input
      var encodedBookName = Uri.encodeQueryComponent(bookName);

      var data = await apiService.get(
          endPoint: '?q=$encodedBookName&orderBy=relevance&filter=ebooks');

      var bookModel = BookModel.fromMap(data);
      var books = bookModel.items ?? [];

      return Right(books);
    } on DioException catch (e) {
      return Left(Failure.fromException(e));
    } catch (e) {
      return Left(UnknownFailure(
        message: 'Unexpected error: ${e.toString()}',
        code: 'UNKNOWN_ERROR',
      ));
    }
  }
}
