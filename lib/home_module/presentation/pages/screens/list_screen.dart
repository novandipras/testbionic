import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novandi/core_module/gen/assets.gen.dart';
import 'package:novandi/home_module/presentation/bloc/home_bottom_navbar_bloc/home_bottom_navbar_bloc.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: BlocProvider.of<HomeBottomNavbarBloc>(context),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 130,
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Assets.png.header.image(fit: BoxFit.fill),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
