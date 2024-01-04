import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarCustom {
  static PreferredSizeWidget basic({
    String? title,
    List<Widget>? actionLists,
    Widget? leading,
    bool hideBackbutton = true,
  }) {
    return AppBar(
      automaticallyImplyLeading: !hideBackbutton,
      backgroundColor: Colors.white,
      elevation: 0.2,
      leading: leading,
      title: Text(
        title ?? '',
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [...?actionLists],
    );
  }
}
