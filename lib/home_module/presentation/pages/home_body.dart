import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novandi/core_module/others/keep_alive_widget.dart';
import 'package:novandi/home_module/presentation/pages/screens/contact_screen.dart';
import 'package:novandi/home_module/presentation/pages/screens/map_screen.dart';
import 'package:novandi/home_module/presentation/bloc/home_bottom_navbar_bloc/home_bottom_navbar_bloc.dart';
import 'package:novandi/home_module/presentation/pages/screens/list_screen.dart';
import 'package:novandi/home_module/presentation/pages/screens/media_screen.dart';
import 'package:novandi/home_module/presentation/pages/screens/search_screen.dart';
import 'package:novandi/home_module/presentation/widgets/home_bottom_navbar.dart';

import 'screens/profile_screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, this.initPage});

  final int? initPage;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  late PageController pageController;
  late List<Widget> listWidget;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.initPage ?? 0);
    BlocProvider.of<HomeBottomNavbarBloc>(context)
        .add(ChangeHomeBottomNavbarEvent(value: widget.initPage ?? 0));
    listWidget = [
      const ListScreen(),
      const MapScreen(),
      const ContactScreen(),
      const MediaScreen(),
      const ProfileScreen(),
      const SearchScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocListener<HomeBottomNavbarBloc, int>(
          listener: (context, state) {
            pageController.jumpToPage(state);
          },
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            pageSnapping: false,
            controller: pageController,
            children: listWidget
                .map((e) => KeepAliveWidget(
                      child: e,
                    ))
                .toList(),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: HomeBottomNavbar(),
        )
      ],
    );
  }
}
