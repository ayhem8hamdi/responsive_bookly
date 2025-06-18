import 'package:bloc/bloc.dart';
import 'package:bookly/core/Errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/data/repos/home_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepoImplementation)
      : super(FeaturedBooksInitial());
  final HomeRepoImplementation homeRepoImplementation;

  Future<void> fetchFeauturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepoImplementation.fetchFeaturedBooks();
    result.fold((failure) => emit(FeaturedBooksFailed(failure)),
        (books) => emit(FeaturedBooksSucces(books)));
  }
}
