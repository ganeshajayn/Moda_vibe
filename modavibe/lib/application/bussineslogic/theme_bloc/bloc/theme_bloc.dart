import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, Themestate> {
  ThemeBloc() : super(Themestate(themeMode: ThemeMode.light)) {
    on<Toggleevent>((event, emit) {
      final newTheme =
          state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      emit(Themestate(themeMode: newTheme));
    });
  }
}
