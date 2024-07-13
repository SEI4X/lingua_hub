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

// MARK: - Add new category

class CategoryAddProcess extends CategoryListingState {}

class CategoryAddSuccess extends CategoryListingState {}

class CategoryAddFailure extends CategoryListingState {
  final String? message;
  const CategoryAddFailure({this.message});
}

// MARK: - Delete category

class CategoryDeleteProcess extends CategoryListingState {}

class CategoryDeleteSuccess extends CategoryListingState {
  final String? deletedId;
  const CategoryDeleteSuccess({this.deletedId});
}

class CategoryDeleteFailure extends CategoryListingState {
  final String? message;
  const CategoryDeleteFailure({this.message});
}

// MARK: - Editing category

class CategoryEditProcess extends CategoryListingState {}

class CategoryEditSuccess extends CategoryListingState {
  final String? deletedId;
  const CategoryEditSuccess({this.deletedId});
}

class CategoryEditFailure extends CategoryListingState {
  final String? message;
  const CategoryEditFailure({this.message});
}
