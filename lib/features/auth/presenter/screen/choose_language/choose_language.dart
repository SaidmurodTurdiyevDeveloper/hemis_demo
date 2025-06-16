import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemis_demo/core/navigator/Screens.dart';
import 'package:hemis_demo/core/resource/strings.dart';

import '../../../../../core/language/language.dart';
import '../../../../../core/navigator/navigators.dart';
import '../../../../../core/resource/app_vectors.dart';
import '../../widget/choose_language_item.dart';
import 'choose_language_cubit.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<ChooseLanguageCubit, ChooseLanguageState>(
        listener: (context, state) {
          if (state is ChooseLanguageNext) {
            appRouter.push(Screens.intro);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF546CE3)),
              alignment: Alignment.center,
              child: SvgPicture.asset(AppVectors.icChooseLanguage, width: 36, height: 36, fit: BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                AppString.chooseLanguage(context),
                style: GoogleFonts.roboto(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                AppString.chooseLanguageContinue(context),
                style: GoogleFonts.roboto(color: Color(0xFFB3B3B3), fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            const Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 40, left: 18, right: 18), child: ChooseLanguageItem(language: Language.uz)),
                Padding(padding: EdgeInsets.only(top: 18, left: 18, right: 18), child: ChooseLanguageItem(language: Language.uzCyrl)),
                Padding(padding: EdgeInsets.only(top: 18, left: 18, right: 18), child: ChooseLanguageItem(language: Language.ru)),
                Padding(padding: EdgeInsets.only(top: 18, left: 18, right: 18), child: ChooseLanguageItem(language: Language.en)),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF546CE3),
                  minimumSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
                ),
                onPressed: () => context.read<ChooseLanguageCubit>().next(),
                child: Text(AppString.next(context), style: GoogleFonts.roboto(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
