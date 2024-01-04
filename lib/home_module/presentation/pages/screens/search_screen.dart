import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novandi/core_module/gen/assets.gen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double jarakAtas = 130;

    List listCourse = [
      {"icon": Icons.book, "title": "Ipsum", "count": 43},
      {"icon": Icons.computer, "title": "Lorem", "count": 2},
      {"icon": Icons.code, "title": "Html", "count": 21},
      {"icon": Icons.camera, "title": "Camera", "count": 44},
    ];
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Search Course',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(100)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search_rounded,
                                color: Colors.grey,
                                size: 32,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Search',
                                      style: GoogleFonts.roboto(
                                        color: Colors.grey,
                                        fontSize: 24,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(100)),
                          child: Text('Lorem Ipsum Dolor',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                        Text(
                            """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy""",
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                            """text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.""",
                            style: GoogleFonts.roboto(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            )),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listCourse.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 16),
                              padding: const EdgeInsets.all(24),
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.orange, width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('${listCourse[index]['title']}',
                                            style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontWeight: FontWeight.normal,
                                            )),
                                        Text(
                                            '${listCourse[index]['count']} Course',
                                            style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    listCourse[index]['icon'],
                                    color: Colors.purple,
                                    size: 32,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: jarakAtas,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
