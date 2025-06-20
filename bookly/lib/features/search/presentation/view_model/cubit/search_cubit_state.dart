part of 'search_cubit_cubit.dart';

@immutable
sealed class SearchCubitState {}

final class SearchCubitInitial extends SearchCubitState {}

final class SearchCubitLoading extends SearchCubitState {}

final class SearchCubitFailure extends SearchCubitState {
  final Failure failure;

  SearchCubitFailure(this.failure);
}

final class SearchCubitSucces extends SearchCubitState {
  final List<Item> books;

  SearchCubitSucces(this.books);
}
