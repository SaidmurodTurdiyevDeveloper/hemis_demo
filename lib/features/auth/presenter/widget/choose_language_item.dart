import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemis_demo/core/resource/app_vectors.dart';
import 'package:hemis_demo/core/resource/strings.dart';

import '../../../../core/language/language.dart';
import '../../../../core/language/locale_cubit.dart';
import '../screen/choose_language/choose_language_cubit.dart';

class ChooseLanguageItem extends StatelessWidget {
  final Language language;

  const ChooseLanguageItem({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    final name = getLanguageName(language);
    final bottom = getLanguageBottom(language, context);
    final image = getImage(language);
    final isSelected = context.select<ChooseLanguageCubit, bool>(
      (cubit) => switch (cubit.state) {
        ChooseLanguageSelected s => s.language == language,
        _ => false,
      },
    );
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: isSelected ? const Color(0xFF546CE3) : const Color(0xFFB3B3B3), width: 1),
      ),
      onTap: () {
        context.read<ChooseLanguageCubit>().changeLanguage(language);
        context.read<LocaleCubit>().change(language);
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      leading: SvgPicture.asset(image, width: 36, height: 30),
      title: Text(name, style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
      subtitle: Text(bottom, style: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black)),
      trailing: isSelected ? const Icon(Icons.check, color: Color(0xFF546CE3)) : null,
    );
  }

  String getLanguageName(Language language) {
    switch (language) {
      case Language.uz:
        return AppString.uzbek;
      case Language.uzCyrl:
        return AppString.uzbekCyrl;
      case Language.ru:
        return AppString.russian;
      case Language.en:
        return AppString.english;
    }
  }

  String getLanguageBottom(Language language, BuildContext context) {
    switch (language) {
      case Language.uz:
        return AppString.uzb(context);
      case Language.uzCyrl:
        return AppString.uzbCyrl(context);
      case Language.ru:
        return AppString.rus(context);
      case Language.en:
        return AppString.eng(context);
    }
  }

  String getImage(Language language) {
    switch (language) {
      case Language.uz:
        return AppVectors.icLanguageUzb;
      case Language.uzCyrl:
        return AppVectors.icLanguageUzb;
      case Language.ru:
        return AppVectors.icLanguageRussian;
      case Language.en:
        return AppVectors.icLanguageEnglish;
    }
  }
}
