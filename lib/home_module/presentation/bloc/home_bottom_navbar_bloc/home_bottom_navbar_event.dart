part of 'home_bottom_navbar_bloc.dart';

abstract class HomeBottomNavbarEvent {}

class ChangeHomeBottomNavbarEvent extends HomeBottomNavbarEvent {
  ChangeHomeBottomNavbarEvent({required this.value});

  final int value;
}
