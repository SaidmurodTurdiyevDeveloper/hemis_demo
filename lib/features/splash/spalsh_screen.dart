import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemis_demo/features/splash/splash_cubit.dart';

import '../../core/language/locale_cubit.dart';
import '../../core/navigator/navigators.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        SplashCubit()
          ..openScreen(),
        child: BlocListener<SplashCubit, SplashState>(
            listener: (context, state) {
              if (state is SplashChangeLocale) {
                context.read<LocaleCubit>().change(state.locale);
              }
              if (state is SplashOpenScreen) {
                appRouter.replace(state.screen);
              }
            },
            child: Scaffold(
                backgroundColor: Color(0xFF344FD5),
                body: Center(child: Text('Hamis Demo',
                    style: GoogleFonts.roboto(color: Colors.white,
                        fontSize: 28, fontWeight: FontWeight.bold))))));
  }
}
