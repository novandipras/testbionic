import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novandi/auth_module/presentation/login/login_page.dart';
import 'package:novandi/core_module/gen/assets.gen.dart';
import 'package:novandi/home_module/presentation/pages/home_page.dart';

class WelcomingPage extends StatelessWidget {
  const WelcomingPage({super.key});

  static const routeName = '/welcomingPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAF49C1),
      body: Stack(
        children: [
          SizedBox(
              child: Assets.svg.welcomingBg.svg(
                  fit: BoxFit.fill,
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width)),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Education',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 42,),
                SizedBox(
                  height: 140,
                  child: Assets.png.book.image(
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Text(
                      'Education refers to the process of acquiring knowledge, skills, values, and attitudes.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.normal)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, HomePage.routeName);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Text('START',
                        style: GoogleFonts.roboto(
                            color: const Color(0xFFAF49C1),
                            fontSize: 32,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LoginPage.routeName);
                  },
                  child: Text('Login',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
