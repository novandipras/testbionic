import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_picker_widget/media_picker_widget.dart';
import 'package:novandi/core_module/gen/assets.gen.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  List<Media> mediaList = [];

  void openImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return MediaPicker(
          mediaList: mediaList,
          onPicked: (selectedList) {
            setState(() => mediaList = selectedList);
            Navigator.pop(context);
          },
          onCancel: () => Navigator.pop(context),
          mediaCount: MediaCount.multiple,
          mediaType: MediaType.all,
          decoration: PickerDecoration(
            blurStrength: 0,
            scaleAmount: 1,
            counterBuilder: (context, index) {
              if (index == null) return const SizedBox();
              return Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    '$index',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double jarakAtas = 130;
    return Scaffold(
      floatingActionButton: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.1),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => openImagePicker(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: jarakAtas,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery
                        .sizeOf(context)
                        .width,
                    child: Assets.png.header.image(fit: BoxFit.fill),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Media',
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
            SizedBox(
              height: 96,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: List.generate(
                    mediaList.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: mediaList[index].thumbnail == null
                                ? const SizedBox()
                                : Image.memory(
                                    mediaList[index].thumbnail!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
