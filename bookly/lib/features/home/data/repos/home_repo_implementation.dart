import 'package:bookly/core/Errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<Item>>> fetchBestSellerBooks() async {
    try {
      var data = await apiService.get(
          endPoint: '?Filtering=free-ebooks&Sorting=newest&q=subject:anime');

      var bookModel = BookModel.fromMap(data);

      var books = bookModel.items ?? [];

      return Right(books);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
/*
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }*/
}
