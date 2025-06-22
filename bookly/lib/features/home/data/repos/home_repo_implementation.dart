import 'package:bookly/core/Errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/image_loader_service.dart';
import 'package:bookly/core/utils/image_processor.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;
  final ImageProcessor imageProcessor;

  HomeRepoImplementation(this.apiService, ImageLoaderService imageLoader)
      : imageProcessor = ImageProcessor(imageLoader);

  @override
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: '?Filtering=free-ebooks&q=subject:Anime',
      );

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

  @override
  Future<Either<Failure, List<Item>>> fetchBestSellerBooks() async {
    try {
      List<String> popularCategories = [
        'fiction',
        'business',
        'self-help',
        'technology',
        'history',
        'science',
        'romance',
        'mystery',
      ];

      List<Item> allBooks = [];

      for (var category in popularCategories) {
        var data = await apiService.get(
          endPoint:
              '?q=subject:$category&filter=free-ebooks&orderBy=relevance&maxResults=10',
        );

        var bookModel = BookModel.fromMap(data);
        var books = bookModel.items ?? [];

        // Avoid duplicates
        allBooks.addAll(
            books.where((book) => !allBooks.any((b) => b.id == book.id)));

        if (allBooks.length >= 40) {
          // Get enough books, but not excessive
          break;
        }
      }

      return Right(allBooks);
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
