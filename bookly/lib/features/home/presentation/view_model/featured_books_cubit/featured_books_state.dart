part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksFailed extends FeaturedBooksState {
  final Failure failure;

  FeaturedBooksFailed(this.failure);
}

final class FeaturedBooksSucces extends FeaturedBooksState {
  final List<Item> books;

  FeaturedBooksSucces(this.books);
}
