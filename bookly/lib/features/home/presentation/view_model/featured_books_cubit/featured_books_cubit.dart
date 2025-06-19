import 'package:bookly/core/Errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/data/repos/home_repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepoImplementation)
      : super(FeaturedBooksInitial());
  final HomeRepoImplementation homeRepoImplementation;

  Future<void> fetchFeauturedBooks() async {
    emit(FeaturedBooksLoading());
    final result = await homeRepoImplementation.fetchFeaturedBooks();

    result.fold(
      (failure) {
        // Log the error if needed
        debugPrint('FeaturedBooks Error: ${failure.message}');
        emit(FeaturedBooksFailed(failure));
      },
      (books) {
        // Verify at least one book has an image
        final hasValidBooks =
            books.any((b) => b.volumeInfo?.getDisplayImageUrl() != null);
        emit(hasValidBooks
            ? FeaturedBooksSucces(books)
            : FeaturedBooksFailed(ImageProcessingFailure(
                message: 'No valid book images found', code: 'NO_IMAGES')));
      },
    );
  }
}
