import 'package:bookly/core/Errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:bookly/features/search/data/SearchRepo/searchRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchRepoImpl implements Searchrepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Item>>> fetchSearchedBooks(
      {required String bookName}) async {
    try {
      var encodedBookName = Uri.encodeQueryComponent(bookName);

      var data = await apiService.get(
        endPoint: '?Filtering=free-ebooks&q=subject:$encodedBookName',
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
  Future<Either<Failure, List<Item>>> fetchYouMayLikeBooks({
    required VolumeInfo selectedBook,
  }) async {
    try {
      List<Item> books = [];

      if (selectedBook.categories != null &&
          selectedBook.categories!.isNotEmpty) {
        var category = selectedBook.categories!.first;
        var query = 'subject:${Uri.encodeQueryComponent(category)}';
        books = await _fetchBooksByQuery(query);
        if (books.isNotEmpty) return Right(books);
      }

      if (selectedBook.title != null && selectedBook.title!.isNotEmpty) {
        var query = 'intitle:${Uri.encodeQueryComponent(selectedBook.title!)}';
        books = await _fetchBooksByQuery(query);
        if (books.isNotEmpty) return Right(books);
      }

      if (selectedBook.publisher != null &&
          selectedBook.publisher!.isNotEmpty) {
        var query =
            'inpublisher:${Uri.encodeQueryComponent(selectedBook.publisher!)}';
        books = await _fetchBooksByQuery(query);
        if (books.isNotEmpty) return Right(books);
      }

      return Left(UnknownFailure(
        message: 'No books found for related searches',
        code: 'NO_BOOKS_FOUND',
      ));
    } on DioException catch (e) {
      return Left(Failure.fromException(e));
    } catch (e) {
      return Left(UnknownFailure(
        message: 'Unexpected error: ${e.toString()}',
        code: 'UNKNOWN_ERROR',
      ));
    }
  }

  Future<List<Item>> _fetchBooksByQuery(String query) async {
    try {
      final endpoint = '?q=$query&orderBy=relevance&maxResults=20';
      final data = await apiService.get(endPoint: endpoint);

      final bookModel = BookModel.fromMap(data);
      final books = bookModel.items ?? [];

      debugPrint('Query: $query -> Found: ${books.length} books');
      return books;
    } catch (e) {
      debugPrint('Query Failed: $query -> Error: $e');
      return [];
    }
  }
}
