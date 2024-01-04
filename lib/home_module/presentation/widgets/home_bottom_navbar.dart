import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novandi/auth_module/presentation/login/login_page.dart';
import 'package:novandi/home_module/presentation/bloc/home_bottom_navbar_bloc/home_bottom_navbar_bloc.dart';

class HomeBottomNavbar extends StatelessWidget {
  const HomeBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    double tinggiNavBar = 110;
    double tinggiBackground = 64;

    List<Widget> items = [
      const ItemNavbar(
        index: 0,
        icon: Icon(
          Icons.person,
          color: Colors.grey,
        ),
      ),
      const ItemNavbar(
        index: 1,
        icon: Icon(
          Icons.map,
          color: Colors.grey,
        ),
      ),
      const ItemNavbar(
        index: 2,
        icon: Icon(
          Icons.contact_phone,
          color: Colors.grey,
        ),
      ),
      const ItemNavbar(
        index: 3,
        icon: Icon(
          Icons.perm_media,
          color: Colors.grey,
        ),
      ),
      const ItemNavbar(
        index: 4,
        icon: Icon(
          Icons.dataset_rounded,
          color: Colors.grey,
        ),
      ),
    ];

    return SizedBox(
      height: tinggiNavBar,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: tinggiBackground,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 0.1,
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...items,
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemNavbar extends StatelessWidget {
  const ItemNavbar({
    super.key,
    this.icon,
    required this.index,
  });

  final Widget? icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(index == 0 ){
         Navigator.pushNamed(context, LoginPage.routeName);
        }
        BlocProvider.of<HomeBottomNavbarBloc>(context)
            .add(ChangeHomeBottomNavbarEvent(value: index));
      },
      child: Container(
          width: 60,
          height: 70,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              icon ??
                  const Icon(
                    Icons.add_box_rounded,
                    color: Colors.white,
                  ),
              const Spacer(),
            ],
          )),
    );
  }
}
