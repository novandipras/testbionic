import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novandi/auth_module/presentation/login/login_page.dart';
import 'package:novandi/auth_module/presentation/register/register_page.dart';
import 'package:novandi/core_module/others/injection.dart';
import 'package:novandi/core_module/pages/splash_screen_page.dart';
import 'package:novandi/core_module/pages/welcoming_page.dart';
import 'package:novandi/home_module/presentation/pages/home_page.dart';

PageRoutes pageRoutes = locator<PageRoutes>();

class PageRoutes {
  PageRoutes();

  String? currentRoute;
  final routeHistory = <String?>[];

  MaterialPageRoute onGenerateRoute(RouteSettings routeSettings) {
    return CustomPageRoute(
      settings: routeSettings,
      currentRoute: currentRoute,
      builder: (_) => _getPageRoute(routeSettings),
    );
  }

  Widget _getPageRoute(RouteSettings routeSettings) {
    try {
      switch (routeSettings.name) {
        case HomePage.routeName:
          return const HomePage();

        case WelcomingPage.routeName:
          return const WelcomingPage();

        case LoginPage.routeName:
          return const LoginPage();

        case RegisterPage.routeName:
          return const RegisterPage();

        case SplashScreenPage.routeName:
          return const SplashScreenPage();

        default:
          return Container(
            color: Colors.blue,
          );
      }
    } catch (e) {
      return UnderMaintenancePage(
        message: e.toString(),
      );
    }
  }
}

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({
    required super.builder,
    required this.settings,
    this.currentRoute,
  });

  final String? currentRoute;

  @override
  final RouteSettings settings;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: animation.drive(
        Tween(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(
          CurveTween(curve: Curves.ease),
        ),
      ),
      child: child,
    );
  }

  @override
  Duration get transitionDuration {
    return const Duration(milliseconds: 300);
  }
}

class UnderMaintenancePage extends StatelessWidget {
  const UnderMaintenancePage({super.key, this.message});

  final dynamic message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            children: [
              Text(
                'Halaman ini masih dalam perbaikan',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
