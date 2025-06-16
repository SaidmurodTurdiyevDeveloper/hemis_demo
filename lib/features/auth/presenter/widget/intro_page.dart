import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemis_demo/core/resource/app_images.dart';
import 'package:hemis_demo/core/resource/strings.dart';

class IntroPage extends StatelessWidget {
  final int index;

  const IntroPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final image = getImage();
    final title = getTitle(context);
    final description = getDescription(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(padding: const EdgeInsets.all(8.0), child: Image.asset(image, fit: BoxFit.contain)),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, textAlign: TextAlign.center, style: GoogleFonts.roboto(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(color: const Color(0xFFB3B3B3), fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  String getImage() {
    switch (index) {
      case 0:
        return AppImages.imgFirst;
      case 1:
        return AppImages.imgSecond;
      default:
        return AppImages.imgThird;
    }
  }

  String getTitle(BuildContext context) {
    switch (index) {
      case 0:
        return AppString.introFirst(context);
      case 1:
        return AppString.introSecond(context);
      default:
        return AppString.introThird(context);
    }
  }

  String getDescription(BuildContext context) {
    switch (index) {
      case 0:
        return AppString.introFirstDescription(context);
      case 1:
        return AppString.introSecondDescription(context);
      default:
        return AppString.introThirdDescription(context);
    }
  }
}
