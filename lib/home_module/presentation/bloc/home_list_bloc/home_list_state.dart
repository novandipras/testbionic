part of 'home_list_bloc.dart';

class HomeListState extends Equatable {
  const HomeListState({
    this.listData,
    this.state,
  });

  final List<PhotosResponseData>? listData;
  final RequestState? state;

  factory HomeListState.initial() {
    return const HomeListState(
      listData: null,
      state: null,
    );
  }

  @override
  List<Object?> get props => [
        listData,
        state,
      ];
}
