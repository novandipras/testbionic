import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novandi/core_module/data/local/local_data_source_impl.dart';
import 'package:novandi/core_module/others/injection.dart';
import 'package:novandi/core_module/widgets/app_widget.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);
  @override
  final Size preferredSize; // default is 56.0

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        title: FutureBuilder(
            future: locator<LocalDataSource>().loginAkun,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Welcome, ${snapshot.data?['username']}',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ));
              } else {
                return Text('Welcome',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ));
              }
            }),
        actions: [
          AppWidget.logoutIcon(context: context),
        ]);
  }
}
