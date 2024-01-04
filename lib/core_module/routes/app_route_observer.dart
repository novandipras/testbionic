import 'package:flutter/material.dart';
import 'package:novandi/core_module/routes/page_routes.dart';

class AppRouteObserver extends NavigatorObserver {
  final bool showRouteActionLog;
  final bool showRoutehistoryLog;

  AppRouteObserver({
    this.showRouteActionLog = false,
    this.showRoutehistoryLog = false,
  });

  @override
  void didPop(Route route, Route? previousRoute) {
    pageRoutes.currentRoute = previousRoute?.settings.name;
    pageRoutes.routeHistory.add(pageRoutes.currentRoute);

  }

  @override
  void didPush(Route route, Route? previousRoute) {
    pageRoutes.currentRoute = route.settings.name;
    pageRoutes.routeHistory.add(pageRoutes.currentRoute);

  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    pageRoutes.currentRoute = route.settings.name;
    pageRoutes.routeHistory.add(pageRoutes.currentRoute);

  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    pageRoutes.currentRoute = newRoute?.settings.name;
    pageRoutes.routeHistory.add(pageRoutes.currentRoute);

  }


}
