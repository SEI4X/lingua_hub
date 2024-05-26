part of 'categories_bloc.dart';

sealed class CategoryListingEvent extends Equatable {
  const CategoryListingEvent();

  @override
  List<Object> get props => [];
}

class ChangeCategory extends CategoryListingEvent {
  final NoteCategoryModel category;

  const ChangeCategory(this.category);

  @override
  List<Object> get props => [category];
}

class LoadCategories extends CategoryListingEvent {
  const LoadCategories();

  @override
  List<Object> get props => [];
}

// class AddCategory extends CategoryListingEvent {
//   final NoteCategoryModel category;

//   const AddCategory(this.category);

//     @override
//   List<Object> get props => [category];
// }
