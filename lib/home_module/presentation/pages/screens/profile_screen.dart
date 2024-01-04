import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:novandi/core_module/gen/assets.gen.dart';
import 'package:novandi/core_module/others/injection.dart';
import 'package:novandi/home_module/presentation/bloc/profile_bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int totalData = 10;
  List listFilePicker = [];

  @override
  void initState() {
    listFilePicker = List.generate(totalData, (index) => null);
    super.initState();
  }

  void _uploadDocument(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'doc', 'pdf'],
    );

    setState(() {
      listFilePicker[index] = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    double jarakAtas = 130;
    return BlocProvider(
      create: (context) => locator<ProfileBloc>()..add(OnInitProfile()),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: jarakAtas,
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Assets.png.header.image(fit: BoxFit.fill),
                    ),
                  ],
                ),
              ),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, stateProfile) {
                  if (stateProfile.username != null) {
                    return Padding(
                      padding: EdgeInsets.only(top: jarakAtas),
                      child: SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    width: MediaQuery.sizeOf(context).width,
                                    decoration: const BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(16),
                                            topLeft: Radius.circular(16))),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(stateProfile.username ?? '',
                                                style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Text(stateProfile.id ?? '(None)',
                                                style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  ...List.generate(
                                      totalData,
                                      (index) => GestureDetector(
                                            onTap: () {
                                              _uploadDocument(index);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(16),
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              decoration: const BoxDecoration(
                                                color: Colors.purple,
                                              ),
                                              child: Text('Data $index',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.roboto(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  )),
                                            ),
                                          )),
                                  SizedBox(
                                    height: jarakAtas,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("Harap Login Terlebih Dahulu"),
                    );
                  }
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
