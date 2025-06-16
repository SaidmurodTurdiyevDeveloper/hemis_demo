import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hemis_demo/core/navigator/navigators.dart';

import 'core/injection/injection.dart';
import 'core/language/locale_cubit.dart';
import 'core/language/supported_locales.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(HamisApp());
}

class HamisApp extends StatelessWidget {
  const HamisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LocaleCubit(),
        child: const _HamisRoot()
    );
  }
}

class _HamisRoot extends StatelessWidget {
  const _HamisRoot();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter,
              supportedLocales: SupportedLocales.all,
              locale: locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              title: 'Hamis Demo',
              theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true
              )
          );
        }
    );
  }
}
