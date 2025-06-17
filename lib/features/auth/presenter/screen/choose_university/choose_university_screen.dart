import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hemis_demo/core/resource/strings.dart';
import 'package:hemis_demo/features/auth/presenter/screen/choose_university/choose_university_cubit.dart';

import '../../../../../core/navigator/navigators.dart';
import '../../../../../core/resource/app_vectors.dart';

class ChooseUniversityScreen extends StatelessWidget {
  const ChooseUniversityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      floatingActionButton: BlocListener<ChooseUniversityCubit, ChooseUniversityState>(
        listener: (context, state) {
          if (state.openedScreen != null && state.openedScreen?.isNotEmpty==true) {
            appRouter.push(state.openedScreen!);
          }
        },
        child: FloatingActionButton(
          onPressed: () => context.read<ChooseUniversityCubit>().next(),
          shape: const CircleBorder(),
          backgroundColor: const Color(0xFF546CE3),
          child: const Icon(Icons.arrow_forward, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF546CE3)),
                alignment: Alignment.center,
                child: SvgPicture.asset(AppVectors.icBuilding, width: 36, height: 36, fit: BoxFit.contain),
              ),
              const SizedBox(height: 20),

              Text(
                AppString.chooseUniversity(context),
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                AppString.chooseYourUniversity(context),
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              BlocBuilder<ChooseUniversityCubit, ChooseUniversityState>(
                builder: (context, state) {
                  return TextField(
                    onChanged: context
                        .read<ChooseUniversityCubit>()
                        .onQueryChanged,
                    decoration: InputDecoration(
                      hintText: AppString.search(context),
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[100],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(0xFF546CE3),
                          width: 2,
                        ),
                      ),

                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppString.allUniversities(context),
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: Colors.grey[600]),
                ),
              ),
              const SizedBox(height: 8),

              Expanded(
                child: BlocBuilder<ChooseUniversityCubit, ChooseUniversityState>(
                  builder: (context, state) {
                    if (state.filtered.isEmpty) {
                      return Container();
                    }
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: state.filtered.length,
                      separatorBuilder: (_, __) =>
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: const Divider(height: 6, thickness: 1),
                          ),
                      itemBuilder: (_, index) {
                        final uni = state.filtered[index];
                        return InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () => context.read<ChooseUniversityCubit>().selectUniversity(uni),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: state.selected == uni ? const Color(0xFF546CE3) : Colors.transparent,
                                  width: 2
                              ),
                            ),
                            child: Text(
                                uni.name,
                                maxLines: 2,
                                style: theme.textTheme.bodyMedium
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}