import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/Errors/failure.dart';

abstract class Searchrepo {
  Future<Either<Failure, List<Item>>> fetchSearchedBooks(
      {required String bookName});

  Future<Either<Failure, List<Item>>> fetchYouMayLikeBooks({
    required VolumeInfo selectedBook,
  });
}
