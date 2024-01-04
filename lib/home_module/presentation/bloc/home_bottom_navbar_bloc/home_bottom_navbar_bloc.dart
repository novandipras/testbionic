
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_bottom_navbar_event.dart';

class HomeBottomNavbarBloc extends Bloc<HomeBottomNavbarEvent, int> {
  HomeBottomNavbarBloc() : super(0) {
    on<ChangeHomeBottomNavbarEvent>((event, emit) {
      emit(event.value);
    });
  }
}
