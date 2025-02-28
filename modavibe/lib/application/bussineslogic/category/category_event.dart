part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class Fetchcategories extends CategoryEvent {
  final int id;
  Fetchcategories(this.id);
}
