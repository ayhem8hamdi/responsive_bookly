import 'package:bookly/core/Errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:dartz/dartz.dart';

abstract class Searchrepo {
  Future<Either<Failure, List<Item>>> fetchSearchedBooks(
      {required String bookName});
}
