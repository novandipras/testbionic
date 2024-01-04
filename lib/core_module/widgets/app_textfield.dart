import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextfield {
  static Widget username({
    TextEditingController? textEditingController,
    required String title,
    String? hint,
    Color? buttonColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: textEditingController,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          decoration: InputDecoration(
            hintText: title,
            fillColor: Colors.white,
            filled: true,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          ),
          validator: (val) {
            if (val != null && val.isEmpty) {
              return 'Masukan Username Dengan Benar';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  static Widget email({
    TextEditingController? textEditingController,
    required String title,
    String? hint,
    Color? buttonColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: textEditingController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          decoration: InputDecoration(
            hintText: title,
            fillColor: Colors.white,
            filled: true,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          ),
          validator: (val) {
            if (!EmailValidator.validate(val!)) {
              return 'Masukan Email Dengan Benar';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  static Widget password(
      {TextEditingController? textEditingController,
      required String title,
      String? hint,
      Color? buttonColor,
      required ValueNotifier<bool> valueNotifierObscureStatus}) {
    ValueNotifier<bool> valueNotifierObscure = valueNotifierObscureStatus;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
            valueListenable: valueNotifierObscure,
            builder:
                (BuildContext context, bool notifierValue, Widget? widget) {
              return TextFormField(
                controller: textEditingController,
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
                obscureText: notifierValue,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      valueNotifierObscure.value = !notifierValue;
                    },
                    child: Icon(
                      notifierValue
                          ? Icons.remove_red_eye_rounded
                          : Icons.remove_red_eye_outlined,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  hintText: title,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                ),
              );
            }),
      ],
    );
  }
}
