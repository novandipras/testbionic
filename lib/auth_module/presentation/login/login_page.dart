import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novandi/auth_module/presentation/register/register_page.dart';
import 'package:novandi/core_module/data/local/local_data_source_impl.dart';
import 'package:novandi/core_module/gen/assets.gen.dart';
import 'package:novandi/core_module/others/injection.dart';
import 'package:novandi/core_module/widgets/app_textfield.dart';
import 'package:novandi/core_module/widgets/app_toast.dart';
import 'package:novandi/home_module/presentation/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/loginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();
  ValueNotifier<bool> valueNotifierObscureStatus = ValueNotifier<bool>(true);

  @override
  void dispose() {
    valueNotifierObscureStatus.dispose();
    usernameLoginController.dispose();
    passwordLoginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 130,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Assets.png.header.image(fit: BoxFit.fill),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24, left: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 32,
                ),
                AppTextfield.username(
                    title: 'Username',
                    textEditingController: usernameLoginController,
                    hint: 'Username'),
                const SizedBox(
                  height: 24,
                ),
                AppTextfield.password(
                    title: 'Password',
                    textEditingController: passwordLoginController,
                    valueNotifierObscureStatus: valueNotifierObscureStatus,
                    hint: 'Password'),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {
                        locator<LocalDataSource>().signInAkunLocal(data: {
                          "username": usernameLoginController.value.text,
                          "password": passwordLoginController.value.text
                        }).then((value) {
                          Navigator.popAndPushNamed(
                              context, HomePage.routeName);
                        }).catchError((error) {
                          AppToast.showError(error, context: context);
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        alignment: Alignment.center,
                        child: Text(
                          'Log in',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 24,
                ),
                GoogleAuthButton(
                  style: const AuthButtonStyle(
                    padding: EdgeInsets.all(16),
                    elevation: 0,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterPage.routeName);
                  },
                  child: Text(
                    'Register',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
