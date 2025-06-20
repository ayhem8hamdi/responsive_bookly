import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bookly/core/Errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/search/data/SearchRepo/search_repo_impl.dart';
import 'package:flutter/material.dart';

part 'search_cubit_state.dart';

class SearchCubitCubit extends Cubit<SearchCubitState> {
  SearchCubitCubit(this.searchRepoImpl) : super(SearchCubitInitial());

  final SearchRepoImpl searchRepoImpl;

  Timer? _debounce;

  static const Duration debounceDuration = Duration(milliseconds: 500);

  Future<void> fetchSearchedBooks({required String bookName}) async {
    _debounce?.cancel();

    _debounce = Timer(debounceDuration, () async {
      if (bookName.trim().isEmpty) {
        emit(SearchCubitInitial());
        return;
      }

      emit(SearchCubitLoading());

      final result =
          await searchRepoImpl.fetchSearchedBooks(bookName: bookName);

      result.fold(
        (failure) {
          debugPrint('Search Error: ${failure.message}');
          emit(SearchCubitFailure(failure));
        },
        (books) {
          final hasValidBooks =
              books.any((b) => b.volumeInfo?.getDisplayImageUrl() != null);

          emit(hasValidBooks
              ? SearchCubitSucces(books)
              : SearchCubitFailure(ImageProcessingFailure(
                  message: 'No valid book images found',
                  code: 'NO_IMAGES',
                )));
        },
      );
    });
  }

  void clearSearch() {
    _debounce?.cancel();
    emit(SearchCubitInitial());
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
