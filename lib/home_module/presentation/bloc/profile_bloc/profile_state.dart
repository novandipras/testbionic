part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.username,
    this.phone,
    this.address,
    this.id,
    this.password,
    this.image,
  });

  final String? username;
  final String? phone;
  final String? address;
  final String? id;
  final String? password;
  final Uint8List? image;

  factory ProfileState.initial() {
    return const ProfileState();
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "phone": phone,
        "address": address,
        "image": image,
      };

  @override
  List<Object?> get props => [
        username,
        phone,
        address,
        id,
        password,
        image,
      ];
}
