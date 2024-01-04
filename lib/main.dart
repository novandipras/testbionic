import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:novandi/core_module/data/local/hive_box/login_akun_box/login_akun_box.dart';
import 'package:novandi/core_module/data/local/hive_box/registered_akun_box/registered_akun_box.dart';
import 'package:novandi/core_module/others/injection.dart';
import 'package:novandi/core_module/pages/splash_screen_page.dart';
import 'package:novandi/core_module/routes/app_route_observer.dart';
import 'package:novandi/core_module/routes/page_routes.dart';
import 'package:novandi/core_module/utils/app_route_observer.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    initInjector();
    await initializeDateFormatting('id_ID');
    final directory = await getTemporaryDirectory();

    Hive
      ..init(directory.path)
      ..registerAdapter(RegisteredAkunBoxAdapter())
      ..registerAdapter(LoginAkunBoxAdapter());

    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    ).whenComplete(
          () => runApp(const MyApp()),
    );
  }, (error, stackTrace) {
    log('main error');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreenPage.routeName,
      navigatorObservers: [
        routeObserver,
        AppRouteObserver(showRoutehistoryLog: true),
      ],
      onGenerateRoute: pageRoutes.onGenerateRoute,
    );
  }
}
