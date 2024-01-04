import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:novandi/core_module/data/local/local_data_source_impl.dart';
import 'package:novandi/core_module/others/injection.dart';
import 'package:novandi/core_module/pages/welcoming_page.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  static const routeName = '/splashScreenPage';

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network(
        'https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png',
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      durationInSeconds: 3,
      // futureNavigator: locator<LocalDataSource>().isLoginNavigator(),
      navigator: WelcomingPage.routeName,
    );
  }
}
