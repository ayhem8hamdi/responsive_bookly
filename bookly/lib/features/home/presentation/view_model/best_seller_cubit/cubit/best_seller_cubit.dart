import 'package:bloc/bloc.dart';
import 'package:bookly/core/Errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/data/repos/home_repo_implementation.dart';
import 'package:meta/meta.dart';
part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.homeRepoImplementation) : super(BestSellerInitial());
  final HomeRepoImplementation homeRepoImplementation;

  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerLoading());
    var result = await homeRepoImplementation.fetchFeaturedBooks();
    result.fold((failure) => emit(BestSellerFailed(failure)),
        (books) => emit(BestSellerSucces(books)));
  }
}
