import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novandi/core_module/data/local/local_data_source_impl.dart';
import 'package:novandi/core_module/others/injection.dart';
import 'package:novandi/core_module/utils/app_event.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<OnInitProfile>((event, emit) async {
      var dataLogin = await locator<LocalDataSource>().loginAkun;
      emit(ProfileState(
        username: dataLogin?['username'] ?? '',
        address: dataLogin?['address'] ?? '',
        phone: dataLogin?['phone'] ?? '',
        id: dataLogin?['id'] ?? '',
        password: dataLogin?['password'] ?? '',
        image: dataLogin?['image'],
      ));
    });
    on<OnTypingUsername>((event, emit) {
      emit(ProfileState(
        id: state.id,
        password: state.password,
        username: event.value,
        address: state.address,
        phone: state.phone,
        image: state.image,
      ));
      add(SaveToLocal());
    });
    on<OnTypingAddress>((event, emit) {
      emit(ProfileState(
        id: state.id,
        password: state.password,
        username: state.username,
        address: event.value,
        phone: state.phone,
        image: state.image,
      ));
      add(SaveToLocal());
    });
    on<OnTypingPhone>((event, emit) {
      emit(ProfileState(
        id: state.id,
        password: state.password,
        username: state.username,
        address: state.address,
        phone: event.value,
        image: state.image
      ));
      add(SaveToLocal());
    });

    on<OnUploadImage>((event, emit) {
      emit(ProfileState(
        id: state.id,
        password: state.password,
        username: state.username,
        address: state.address,
        phone: state.phone,
        image: event.value
      ));
      add(SaveToLocal());
    });

    on<SaveToLocal>((event, emit) async {
      locator<LocalDataSource>()
          .changeDataItemRegisterAkunLocal(data: state.toJson());
    }, transformer: AppEvent.appDebounce(const Duration(milliseconds: 500)));
  }
}
