import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:modavibe/Data/api/categoryrepo/categoryrepo.dart';
import 'package:modavibe/Model/category_model/categorymodel.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final Categoryrepository categoryrepository;
  CategoryBloc(this.categoryrepository) : super(CategoryInitial()) {
    on<Fetchcategories>((event, emit) async {
      emit(CategoryLoading());
      try {
        final categories = await categoryrepository.fetchcategorybyId(event.id);
        emit(CategoryLoaded(categories));
      } catch (e) {
        emit(CategoryError(e.toString()));
      }
    });
  }
}
