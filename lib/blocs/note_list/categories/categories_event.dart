part of 'categories_bloc.dart';

sealed class CategoryListingEvent extends Equatable {
  const CategoryListingEvent();

  @override
  List<Object> get props => [];
}

class SelectCategory extends CategoryListingEvent {
  final NoteCategoryModel category;

  const SelectCategory(this.category);

  @override
  List<Object> get props => [category];
}

class LoadCategories extends CategoryListingEvent {
  const LoadCategories();

  @override
  List<Object> get props => [];
}

class AddNewCategory extends CategoryListingEvent {
  final NoteCategoryModel category;

  const AddNewCategory(this.category);

  @override
  List<Object> get props => [category];
}

class DeleteCategory extends CategoryListingEvent {
  final String categoryId;

  const DeleteCategory(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

class EditCategory extends CategoryListingEvent {
  final NoteCategoryModel category;

  const EditCategory(this.category);

  @override
  List<Object> get props => [category];
}
