import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_repository/notes_repository.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoryListingBloc
    extends Bloc<CategoryListingEvent, CategoryListingState> {
  final NoteCategoryRepository _noteCategoryRepository;
  CategoryListingBloc({required NoteCategoryRepository noteCategoryRepository})
      : _noteCategoryRepository = noteCategoryRepository,
        super(const CategoryListingState()) {
    on<ChangeCategory>(_categoryChanged);
    on<LoadCategories>(_categoriesLoad);
  }

  void _categoriesLoad(
      LoadCategories event, Emitter<CategoryListingState> emit) async {
    if (state.status == CategoriesStatus.success) return;
    emit(const CategoryListingState(
      status: CategoriesStatus.loading,
      categories: [],
    ));

    var categories = await _noteCategoryRepository.getNoteCategories();

    emit(CategoryListingState(
      status: CategoriesStatus.success,
      categories: categories,
    ));
  }

  void _categoryChanged(
      ChangeCategory event, Emitter<CategoryListingState> emit) async {}
}
