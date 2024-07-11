part of 'categories_bloc.dart';

sealed class CategoryListingState extends Equatable {
  const CategoryListingState();

  @override
  List<Object> get props => [];
}

final class CategoryListingInitial extends CategoryListingState {}

class CategoryListingSuccess extends CategoryListingState {
  final List<NoteCategoryModel> categories;
  const CategoryListingSuccess({this.categories = const []});
}

class CategoryListingFailure extends CategoryListingState {
  final String? message;
  const CategoryListingFailure({this.message});
}

class CategoryListingProcess extends CategoryListingState {}
