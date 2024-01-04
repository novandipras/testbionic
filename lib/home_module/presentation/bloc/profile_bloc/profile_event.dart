part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class OnInitProfile extends ProfileEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SaveToLocal extends ProfileEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}



class OnTypingUsername extends ProfileEvent {
  const OnTypingUsername({this.value});

  final String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}
class OnTypingAddress extends ProfileEvent {
  const OnTypingAddress({this.value});

  final String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}
class OnTypingPhone extends ProfileEvent {
  const OnTypingPhone({this.value});

  final String? value;

  @override
  List<Object?> get props => [
    value,
  ];
}
class OnUploadImage extends ProfileEvent {
  const OnUploadImage({this.value});

  final Uint8List? value;

  @override
  List<Object?> get props => [
    value,
  ];
}
