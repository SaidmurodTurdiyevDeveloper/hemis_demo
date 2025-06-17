import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hemis_demo/core/errors/failure.dart';
import 'package:hemis_demo/core/resource/strings.dart';

import '../../../../../core/navigator/navigators.dart';
import 'login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Text(AppString.hames(context),
                          style: theme.textTheme.headlineMedium?.copyWith(
                              color: const Color(0xFF546CE3),
                              fontWeight: FontWeight.w700
                          )),
                      const SizedBox(height: 4),
                      Text(AppString.enterApp(context), style: theme.textTheme.headlineSmall?.copyWith(
                          color: const Color(0xFF546CE3),
                          fontWeight: FontWeight.w700
                      )),
                      const SizedBox(height: 12),
                      Text(
                          AppString.enterIdAndPass(context),
                          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600])
                      ),

                      const SizedBox(height: 40),
                      _StudentIdField(),
                      const SizedBox(height: 12),
                      _PasswordField(),
                      const SizedBox(height: 8),
                      const _RememberAndForgotRow(),
                      const SizedBox(height: 50),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state.newScreen != null) {
                            appRouter.go(state.newScreen!);
                          } else if (state.error != null) {
                            _showTopSnackBar(context, state.error!);
                          }
                        },
                        builder: (context, state) {
                          return _LoginButton(onTap: () {
                            if (state.studentId
                                .trim()
                                .isEmpty) {
                              context.read<LoginCubit>().studentIdChangedError(AppString.emptyStudentIdError(context));
                            } else if (!RegExp(r'^\d+$').hasMatch(state.studentId.trim())) {
                              context.read<LoginCubit>().studentIdChangedError(AppString.onlyDigitsError(context));
                            } else if (state.password
                                .trim()
                                .isEmpty) {
                              context.read<LoginCubit>().passwordChangedError(AppString.emptyPasswordError(context));
                            } else if (state.password.length < 6) {
                              context.read<LoginCubit>().passwordChangedError(AppString.minPasswordError(context));
                            } else {
                              context.read<LoginCubit>().submit();
                            }
                          },
                            submitting: state.submitting,
                          );
                        },
                      ),
                      const SizedBox(height: 50)
                    ]
                )
            )
        )
    );
  }

  void _showTopSnackBar(BuildContext context, Failure error) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();

    messenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error, color: Colors.white),
            SizedBox(width: 12),
            Text(error.message, style: const TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).size.height - 130
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 6,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

class _StudentIdField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextFormField(
            onChanged: context
                .read<LoginCubit>()
                .studentIdChanged,
            keyboardType: TextInputType.number,
            decoration: _inputDecoration(
                error: state.studentIdError,
                hint: AppString.studentIdHint(context),
                icon: Icons.person_outline
            )
        );
      },
    );
  }
}


class _PasswordField extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextFormField(
            onChanged: context
                .read<LoginCubit>()
                .passwordChanged,
            decoration: _inputDecoration(
                error: state.passwordError,
                hint: AppString.studentPasswordHint(context),
                icon: Icons.lock_outline,
                suffix: IconButton(
                    icon: Icon(
                        state.obscurePassword ? Icons.visibility : Icons.visibility_off
                    ),
                    onPressed: context
                        .read<LoginCubit>()
                        .toggleObscure
                )
            )
        );
      },
    );
  }
}

InputDecoration _inputDecoration({
  required String hint,
  required String? error,
  required IconData icon,
  Widget? suffix,
}) =>
    InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        suffixIcon: suffix,
        errorText: error,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[500]),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFB3B3B3)),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF546CE3), width: 2)
        )
    );

class _RememberAndForgotRow extends StatelessWidget {
  const _RememberAndForgotRow();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (p, c) => p.rememberMe != c.rememberMe,
        builder: (_, state) {
          return Row(
              children: [
                Checkbox(
                  value: state.rememberMe,
                  activeColor: const Color(0xFF546CE3),
                  onChanged: (_) => context.read<LoginCubit>().toggleRememberMe(),
                ),
                Text(AppString.rememberMe(context)),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                        AppString.forgotPassword(context),
                        style: TextStyle(color: Color(0xFF546CE3))
                    )
                )
              ]
          );
        }
    );
  }
}

class _LoginButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool submitting;

  const _LoginButton({ required this.onTap, required this.submitting});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                padding: EdgeInsets.zero
            ),
            child: Ink(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF6A7BFF), Color(0xFF4F68FF)]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(
                    child: submitting
                        ? Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white
                        )
                    )
                        : Text(
                        AppString.login(context),
                        style: const TextStyle(fontSize: 16, color: Colors.white)
                    )
                )
            )
        )
    );
  }
}