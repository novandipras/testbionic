part of 'home_list_bloc.dart';

abstract class HomeListEvent extends Equatable {
  const HomeListEvent();
}

class OnDownloadList extends HomeListEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class DeleteItem extends HomeListEvent {
  const DeleteItem({required this.photosResponseData});

  final PhotosResponseData photosResponseData;

  @override
  List<Object?> get props => [
        photosResponseData,
      ];
}
