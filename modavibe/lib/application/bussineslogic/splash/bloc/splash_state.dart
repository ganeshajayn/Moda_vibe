part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

class Splashloadinstate extends SplashState {}

class Splashloadedstate extends SplashState {}
