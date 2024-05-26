part of 'categories_bloc.dart';

enum CategoriesStatus { initial, loading, success, fail }

class CategoryListingState extends Equatable {
  final List<NoteCategoryModel> categories;
  final CategoriesStatus status;

  const CategoryListingState(
      {this.categories = const <NoteCategoryModel>[],
      this.status = CategoriesStatus.initial});

  @override
  List<Object> get props => [];
}
