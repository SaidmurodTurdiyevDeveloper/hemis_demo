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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.newScreen != null) {
              appRouter.go(state.newScreen!);
            } else if (state.error != null) {
              _showTopSnackBar(context, state.error!);
            }
          },
          child: SafeArea(
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
                        Form(
                            key: _formKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: Column(
                                children: [
                                  _StudentIdField(),
                                  const SizedBox(height: 12),
                                  _PasswordField(),
                                ]
                            )),
                        const SizedBox(height: 8),
                        const _RememberAndForgotRow(),
                        const SizedBox(height: 50),
                        _LoginButton(_formKey),
                        const SizedBox(height: 50)
                      ]
                  )
              )
          ),
        )
    );
  }

  void _showTopSnackBar(BuildContext context, Failure error) {
    final topPadding = MediaQuery
        .of(context)
        .padding
        .top;

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.fromLTRB(
            16,
            kToolbarHeight + topPadding + 8,
            16,
            0,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 6,
          duration: const Duration(seconds: 3),
        )
    );
  }
}

class _StudentIdField extends StatelessWidget {
  const _StudentIdField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (p, c) => p.studentId != c.studentId,
        builder: (_, state) {
          return TextFormField(
              onChanged: context
                  .read<LoginCubit>()
                  .studentIdChanged,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value
                    .trim()
                    .isEmpty) {
                  return AppString.emptyStudentIdError(context);
                }
                if (!RegExp(r'^\d+$').hasMatch(value.trim())) {
                  return AppString.onlyDigitsError(context);
                }
                return null;
              },
              decoration: _inputDecoration(
                  hint: AppString.studentIdHint(context),
                  icon: Icons.person_outline
              )
          );
        }
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (p, c) =>
        p.password != c.password || p.obscurePassword != c.obscurePassword,
        builder: (_, state) {
          return TextFormField(
              obscureText: state.obscurePassword,
              onChanged: context
                  .read<LoginCubit>()
                  .passwordChanged,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppString.emptyPasswordError(context);
                }
                if (value.length < 6) {
                  return AppString.minPasswordError(context);
                }
                return null;
              },
              decoration: _inputDecoration(
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
        }
    );
  }
}

InputDecoration _inputDecoration({
  required String hint,
  required IconData icon,
  Widget? suffix,
}) =>
    InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        suffixIcon: suffix,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[500]),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFB3B3B3)),
        ),
        focusedBorder: const UnderlineInputBorder(
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
  final GlobalKey<FormState> _formKey;

  const _LoginButton(this._formKey);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (p, c) =>
        p.isValid != c.isValid || p.submitting != c.submitting,
        builder: (_, state) {
          return SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: state.isValid && !state.submitting
                      ? () {
                    _formKey.currentState?.validate();
                    context.read<LoginCubit>().submit();
                  } : () => _formKey.currentState?.validate(),
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
                          child: state.submitting
                              ? const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white
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
    );
  }
}