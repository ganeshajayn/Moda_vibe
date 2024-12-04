part of 'navbar_bloc.dart';

@immutable
sealed class NavbarState {}

final class NavbarInitial extends NavbarState {}

final class Homeselected extends NavbarState {}

final class Categoriesselected extends NavbarState {}

final class Cartselected extends NavbarState {}

//final class Settingselected extends NavbarState {}
