import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novandi/auth_module/presentation/login/login_page.dart';
import 'package:novandi/core_module/data/local/local_data_source_impl.dart';
import 'package:novandi/core_module/gen/assets.gen.dart';
import 'package:novandi/core_module/others/injection.dart';
import 'package:novandi/core_module/widgets/app_textfield.dart';
import 'package:novandi/core_module/widgets/app_toast.dart';
import 'package:uuid/uuid.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const routeName = '/registerPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameRegisterController =
      TextEditingController();
  final TextEditingController passwordRegisterController =
      TextEditingController();
  final TextEditingController emailRegisterController = TextEditingController();
  ValueNotifier<bool> valueNotifierObscureStatus = ValueNotifier<bool>(true);

  bool check = true;

  @override
  void dispose() {
    valueNotifierObscureStatus.dispose();
    usernameRegisterController.dispose();
    passwordRegisterController.dispose();
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
                    'Register',
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
            padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextfield.username(
                      title: 'Username',
                      textEditingController: usernameRegisterController),
                  const SizedBox(
                    height: 24,
                  ),
                  AppTextfield.email(
                    title: 'Email',
                    textEditingController: emailRegisterController,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AppTextfield.password(
                    title: 'Password',
                    textEditingController: passwordRegisterController,
                    valueNotifierObscureStatus: valueNotifierObscureStatus,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: check,
                              onChanged: (val) {
                                setState(() {
                                  check = val!;
                                });
                              },
                              checkColor: Colors.white,
                              activeColor: Colors.purple,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Remember',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'Lorem Ipsum?',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {
                        locator<LocalDataSource>().registerAkunLocal(data: {
                          "id": const Uuid().v4(),
                          "username": usernameRegisterController.value.text,
                          "email": emailRegisterController.value.text,
                          "password": passwordRegisterController.value.text,
                          "phone": null,
                          "address": null,
                          "image": null
                        }).then((value) {
                          Navigator.popAndPushNamed(
                              context, LoginPage.routeName);
                        }).catchError((error) {
                          AppToast.showError(error, context: context);
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        alignment: Alignment.center,
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).height * 0.1,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LoginPage.routeName);
                  },
                  child: Text(
                    'Log In',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                  'New Password',
                  style: GoogleFonts.poppins(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
