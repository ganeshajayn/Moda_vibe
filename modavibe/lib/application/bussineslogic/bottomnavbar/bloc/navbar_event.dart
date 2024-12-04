part of 'navbar_bloc.dart';

@immutable
sealed class NavbarEvent {}

class Homepressed extends NavbarEvent {}

class Categoriespressed extends NavbarEvent {}

class Cartpressed extends NavbarEvent {}

//class Settingpressed extends NavbarEvent {}
