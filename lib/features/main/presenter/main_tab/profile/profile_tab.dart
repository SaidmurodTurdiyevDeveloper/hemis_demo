import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hemis_demo/core/navigator/Screens.dart';
import 'package:hemis_demo/core/resource/app_images.dart';
import 'package:hemis_demo/features/main/presenter/main_tab/profile/profile_cubit.dart';

import '../../../../../core/navigator/navigators.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  static const _options = [
    _Option(icon: Icons.settings, label: "Ma'lumotlarni o'zgartirish", screen: Screens.empty),
    _Option(icon: Icons.person, label: 'Profil', screen: Screens.empty),
    _Option(icon: Icons.schedule_rounded, label: 'Semester', screen: Screens.empty),
    _Option(icon: Icons.language, label: "Tilni o'zgartirish", screen: Screens.empty),
    _Option(icon: Icons.dark_mode, label: 'Dizayn', screen: Screens.empty),
    _Option(icon: Icons.info_outline, label: 'Ilova haqida', screen: Screens.empty),
    _Option(icon: Icons.logout_rounded, label: 'Chiqish', screen: Screens.chooseUniversity),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Profil bo‘limi', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600)),
              ),
            ),
            const Divider(height: 1, thickness: .8),

            const _ProfileHeader(),

            const Divider(height: 1, thickness: .8),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: _options.length,
                separatorBuilder: (_, __) => const Divider(indent: 92, thickness: .8, height: 12),
                itemBuilder: (context, i) => _OptionTile(_options[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.network(
                        state.userResponseData?.image ?? '',
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => Image.asset(AppImages.imgUniversityLogo, width: 56, height: 56, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Salom ${state.userResponseData?.firstName ?? "talaba"}!',
                          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Student ID: ${state.userResponseData?.studentIdNumber ?? "-"}',
                          style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      IconButton(icon: const Icon(Icons.notifications_none_rounded, size: 26), onPressed: () {}),
                      Positioned(
                        right: 6,
                        top: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                          decoration: BoxDecoration(color: const Color(0xFFFF3B30), borderRadius: BorderRadius.circular(10)),
                          child: Text('1', style: theme.textTheme.labelSmall?.copyWith(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${state.userResponseData?.fullName ?? "-"}\n'
                  '${state.userResponseData?.university ?? "-"}\n${state.userResponseData?.group?.name ?? "n"}'
                  '-guruh ${state.userResponseData?.level?.name ?? "n"} talabasi\n'
                  'Fakultet: ${state.userResponseData?.faculty?.name ?? "-"}\n'
                  'To`lov shakli: ${state.userResponseData?.paymentForm?.name ?? "-"}',
                  textAlign: TextAlign.start,
                  style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade800, height: 1.3),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

@immutable
class _Option {
  final IconData icon;
  final String label;
  final String screen;

  const _Option({required this.icon, required this.label, required this.screen});
}

class _OptionTile extends StatelessWidget {
  const _OptionTile(this.data);

  final _Option data;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: CircleAvatar(radius: 26, backgroundColor: scheme.primary, child: Icon(data.icon, color: Colors.white)),
      title: Text(data.label),
      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18, color: scheme.primary),
      onTap: () {
        if (data.screen != Screens.login) {
          appRouter.push(data.screen);
        } else {
          appRouter.go(data.screen);
        }
      },
    );
  }
}
