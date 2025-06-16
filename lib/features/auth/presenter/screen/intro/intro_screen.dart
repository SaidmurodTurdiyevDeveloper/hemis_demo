import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemis_demo/features/auth/presenter/screen/intro/intro_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/navigator/navigators.dart';
import '../../../../../core/resource/strings.dart';
import '../../widget/intro_page.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static const int _pageCount = 3;
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<IntroCubit, IntroState>(
          listener: (context, state) {
            if (state is IntroNext) {
              appRouter.go(state.route);
            }
          },
          child: Column(
            children: [
              Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _pageCount,
                    itemBuilder: (_, index) => IntroPage(index: index),
                  )
              ),

              const SizedBox(height: 24),

              SmoothPageIndicator(
                  controller: _controller,
                  count: _pageCount,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    expansionFactor: 4,
                    activeDotColor: Color(0xFF546CE3),
                    dotColor: Color(0xFF546CE3),
                  )
              ),

              const SizedBox(height: 32),

              _PrimaryButton(
                  label: AppString.next(context),
                  onTap: () {
                    final last = _pageCount - 1;
                    if (_controller.page?.round() == last) {
                      context.read<IntroCubit>().next();
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut
                      );
                    }
                  }
              ),

              const SizedBox(height: 12),

              _SecondaryButton(
                label: AppString.skip(context),
                onTap: () => context.read<IntroCubit>().next()
              ),
              const SizedBox(height: 44)
            ],
          ),
        ),
      ),
    );
  }


}


class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  static const _background = Color(0xFF546CE3);
  static const _size = Size(300, 50);
  static const _radius = 36.0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _background,
        minimumSize: _size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
        ),
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  const _SecondaryButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  static const _color = Color(0xFF546CE3);
  static const _size = Size(300, 50);
  static const _radius = 36.0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: _size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
        ),
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: GoogleFonts.roboto(
          color: _color,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
