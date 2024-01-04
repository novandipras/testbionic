import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novandi/core_module/others/injection.dart';
import 'package:novandi/home_module/presentation/bloc/home_bottom_navbar_bloc/home_bottom_navbar_bloc.dart';
import 'package:novandi/home_module/presentation/pages/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    this.initPage,
  });

  static const String routeName = '/HomePage';
  final int? initPage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HomeBottomNavbarBloc>(),
      child: Builder(builder: (context) {
        return HomeBody(initPage: initPage);
      }),
    );
  }
}
