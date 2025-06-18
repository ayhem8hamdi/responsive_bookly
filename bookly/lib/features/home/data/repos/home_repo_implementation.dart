import 'package:bookly/core/Errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/image_loader_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;
  final ImageLoaderService imageLoader;

  HomeRepoImplementation(this.apiService, this.imageLoader);

  @override
  Future<Either<Failure, List<Item>>> fetchBestSellerBooks() async {
    try {
      var data = await apiService.get(
          endPoint: '?Filtering=free-ebooks&Sorting=newest&q=subject:anime');

      var bookModel = BookModel.fromMap(data);
      var books = bookModel.items ?? [];
      return Right(books);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: '?Filtering=free-ebooks&q=subject:Anime');

      var bookModel = BookModel.fromMap(data);
      var books = bookModel.items ?? [];
      await Future.wait(
        books.where((book) => book.volumeInfo?.imageLinks != null).map(
            (book) => book.volumeInfo!.imageLinks!.processUrls(imageLoader)),
      );

      return Right(books);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
