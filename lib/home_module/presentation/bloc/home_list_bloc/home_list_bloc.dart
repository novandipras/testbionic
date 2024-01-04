import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novandi/core_module/utils/app_enum.dart';
import 'package:novandi/home_module/data/model/photos_response_model.dart';
import 'package:novandi/home_module/domain/usecases/home_usecase.dart';

part 'home_list_event.dart';

part 'home_list_state.dart';

class HomeListBloc extends Bloc<HomeListEvent, HomeListState> {
  final HomeUsecase homeUsecase;

  HomeListBloc(this.homeUsecase) : super(HomeListState.initial()) {
    on<DeleteItem>((event, emit) {
      emit(HomeListState(
          state: state.state,
          listData: state.listData
              ?.where((element) => element.id != event.photosResponseData.id)
              .toList()));
    });
    on<OnDownloadList>((event, emit) async {
      emit(
          HomeListState(state: RequestState.loading, listData: state.listData));

      var result = await homeUsecase.downloadListDataHome();

      result.fold((left) {
        emit(
            HomeListState(state: RequestState.error, listData: state.listData));
      }, (right) {
        emit(HomeListState(
            state: RequestState.loaded,
            listData: [...?state.listData, ...right]));
      });

    });
  }
}
