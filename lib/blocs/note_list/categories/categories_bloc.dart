import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notes_repository/notes_repository.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoryListingBloc
    extends Bloc<CategoryListingEvent, CategoryListingState> {
  final NoteCategoryRepository _categoryRepository;

  CategoryListingBloc({required NoteCategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryListingInitial()) {
    on<SelectCategory>(_categorySelected);
    on<LoadCategories>(_categoriesLoad);
    on<AddNewCategory>(_categoryAdded);
    on<DeleteCategory>(_categoryDeleted);
    on<EditCategory>(_categoryEdited);
  }

  void _categoriesLoad(
      LoadCategories event, Emitter<CategoryListingState> emit) async {
    emit(CategoryListingProcess());
    try {
      List<NoteCategoryModel> categories =
          await _categoryRepository.getNoteCategories();
      emit((CategoryListingSuccess(categories: categories)));
    } on FirebaseException catch (e) {
      emit(CategoryListingFailure(message: e.code));
    } catch (e) {
      emit(const CategoryListingFailure());
    }
  }

  void _categorySelected(
      SelectCategory event, Emitter<CategoryListingState> emit) async {
    emit(CategoryListingProcess());
  }

  void _categoryAdded(
      AddNewCategory event, Emitter<CategoryListingState> emit) async {
    emit(CategoryAddProcess());
    try {
      await _categoryRepository.addNoteCategory(event.category);
      emit(CategoryAddSuccess());
    } catch (e) {
      emit(CategoryAddFailure(message: e.toString()));
    }
  }

  void _categoryDeleted(
      DeleteCategory event, Emitter<CategoryListingState> emit) async {
    emit(CategoryDeleteProcess());
    try {
      await _categoryRepository.deleteNoteCategory(event.categoryId);
      emit(CategoryDeleteSuccess(deletedId: event.categoryId));
    } catch (e) {
      emit(CategoryDeleteFailure(message: e.toString()));
    }
  }

  void _categoryEdited(
      EditCategory event, Emitter<CategoryListingState> emit) async {
    emit(CategoryListingProcess());
    try {
      await _categoryRepository.editeNoteCategory(event.category);
      List<NoteCategoryModel> categories =
          await _categoryRepository.getNoteCategories();
      emit(CategoryListingSuccess(categories: categories));
    } catch (e) {
      emit(CategoryAddFailure(message: e.toString()));
    }
  }
}
