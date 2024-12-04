import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitial()) {
    on<Homepressed>((event, emit) => emit(Homeselected()));
    on<Categoriespressed>((event, emit) => emit(Categoriesselected()));
    on<Cartpressed>((event, emit) => emit(Cartselected()));
    // on<Settingpressed>((event, emit) => emit(Settingselected()));
  }
}
