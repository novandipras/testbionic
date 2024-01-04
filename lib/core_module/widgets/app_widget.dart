import 'package:flutter/material.dart';
import 'package:novandi/auth_module/presentation/login/login_page.dart';
import 'package:novandi/core_module/data/local/local_data_source_impl.dart';
import 'package:novandi/core_module/others/injection.dart';
import 'package:novandi/core_module/widgets/app_toast.dart';

class AppWidget {
  static Widget logoutIcon({
    required BuildContext context,
  }) {
    return IconButton(
      onPressed: () {
        locator<LocalDataSource>().logOutAkun().then((value) {
          Navigator.pushReplacementNamed(context, LoginPage.routeName);
        }).catchError((error) {
          AppToast.showError(error, context: context);
        });
      },
      icon: const Icon(
        Icons.logout_rounded,
        color: Colors.white,
      ),
    );
  }
}
