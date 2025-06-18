part of 'best_seller_cubit.dart';

@immutable
sealed class BestSellerState {}

final class BestSellerInitial extends BestSellerState {}

final class BestSellerLoading extends BestSellerState {}

final class BestSellerFailed extends BestSellerState {
  final Failure failure;
  BestSellerFailed(this.failure);
}

final class BestSellerSucces extends BestSellerState {
  final List<Item> books;

  BestSellerSucces(this.books);
}
