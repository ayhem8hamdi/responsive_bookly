import 'package:bloc/bloc.dart';
import 'package:bookly/core/Errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:meta/meta.dart';

part 'search_cubit_state.dart';

/*class SearchCubitCubit extends Cubit<SearchCubitState> {
  SearchCubitCubit() : super(SearchCubitInitial());
}
class SearchCubit extends Cubit<SearchCubitState> {
  SearchCubit(this.homeRepoImplementation)
      : super(SearchCubitInitial());
  final HomeRepoImplementation homeRepoImplementation;

  Future<void> fetchFeauturedBooks() async {
    emit(FeaturedBooksLoading());
    final result = await homeRepoImplementation.fetchFeaturedBooks();

    result.fold(
      (failure) {
        debugPrint('FeaturedBooks Error: ${failure.message}');
        emit(FeaturedBooksFailed(failure));
      },
      (books) {
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
*/
