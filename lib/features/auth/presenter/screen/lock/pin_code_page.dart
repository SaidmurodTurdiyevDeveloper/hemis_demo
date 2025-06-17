import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemis_demo/core/navigator/Screens.dart';
import 'package:hemis_demo/core/navigator/navigators.dart';
import 'package:hemis_demo/features/auth/presenter/screen/lock/pin_code_cubit.dart';

import '../../../../../core/resource/strings.dart';

class PinCodePage extends StatelessWidget {
  const PinCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PinCodeCubit, PinCodeState>(
      listener: (context, state) {
        if (state.isValid) {
          appRouter.replace(Screens.home);
        }
        if (state.authError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Internet ulanishini tekshiring!'), backgroundColor:
          Colors.black45));
          Future.delayed(Duration(seconds: 1));
          appRouter.go(Screens.login);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                actions: [
                  TextButton(
                    onPressed: () {
                      appRouter.go(Screens.login);
                    },
                    child: Text(AppString.login(context), style: GoogleFonts.roboto(color: Color(0xFF546CE3), fontSize: 18)),
                  ),
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Center(child: Icon(Icons.lock, size: 100, color: Color(0xFF546CE3)))),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Container(
                            margin: EdgeInsets.all(8.0),
                            width: 16.0,
                            height: 16.0,
                            decoration: BoxDecoration(color: index < state.pin.length ? Color(0xFF546CE3) : Colors.grey, shape: BoxShape.circle),
                          );
                        }),
                      ),
                      if (state.errorMessage.isNotEmpty)
                        Padding(padding: const EdgeInsets.only(top: 16.0), child: Text(state.errorMessage, style: TextStyle(color: Colors.red))),
                    ],
                  ),
                  SizedBox(height: 32.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.5),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        String buttonText = index < 9 ? '${index + 1}' : (index == 9 ? 'DEL' : (index == 10 ? '0' : 'RES'));
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF546CE3),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                            ),
                            onPressed: () {
                              if (buttonText == 'DEL') {
                                context.read<PinCodeCubit>().removeLastDigit();
                              } else if (buttonText == 'RES') {
                                context.read<PinCodeCubit>().resetPin();
                              } else if (buttonText.isNotEmpty) {
                                context.read<PinCodeCubit>().addDigit(buttonText);
                              }
                            },
                            child:
                                (buttonText == 'DEL')
                                    ? SizedBox(width: 32.0, height: 32.0, child: Icon(Icons.backspace, color: Colors.white))
                                    : (buttonText == 'RES')
                                    ? SizedBox(width: 32.0, height: 32.0, child: Icon(Icons.replay, color: Colors.white))
                                    : Text(buttonText, style: GoogleFonts.roboto(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 32.0),
                ],
              ),
            ),
            // Display loading indicator at the center
            if (state.isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.3), // Dim background while loading
                  child: Center(child: CircularProgressIndicator(color: Color(0xFF546CE3))),
                ),
              ),
          ],
        );
      },
    );
  }
}
