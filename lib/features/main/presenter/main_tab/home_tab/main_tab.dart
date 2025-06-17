import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../core/navigator/Screens.dart';
import '../../../../../core/navigator/navigators.dart';
import '../../../../../core/resource/app_images.dart';
import '../../../data/model/response/student_subject_tasks_response.dart';
import '../../widget/empty_widget.dart';
import '../../widget/semester_drop_down.dart';
import 'home_cubit.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Row(
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
                            errorBuilder: (context, error, stackTrace) => Image.asset(
                              AppImages.imgUniversityLogo,
                              width: 56,
                              height: 56,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Salom ${state.userResponseData?.firstName ?? "User"}!', style: theme.textTheme.titleMedium),
                            Text(
                              'Student ID: ${state.userResponseData?.studentIdNumber ?? "-"}',
                              style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                      IconButton(icon: const Icon(Icons.notifications_none_rounded), onPressed: () {
                        appRouter.push(Screens.empty);
                      }),
                    ],
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(18, 12, 20, 8),
                        sliver: SliverToBoxAdapter(child: Text('Semestr topshiriqlari statusi', style: theme.textTheme.titleMedium)),
                      ),
                      SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 12), sliver: SliverToBoxAdapter(child: _SemesterStatusRow())),
                      state.tasks.isNotEmpty
                          ? SliverPadding(padding: const EdgeInsets.fromLTRB(12, 32, 12, 0), sliver: SliverToBoxAdapter(child: _MasteryRow()))
                          : SliverPadding(padding: const EdgeInsets.fromLTRB(12, 10, 12, 0), sliver: SliverToBoxAdapter(child: SizedBox(height: 10))),

                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 8),
                        sliver: SliverToBoxAdapter(
                          child: Row(
                            children: [
                              Text('Topshiriqlar', style: theme.textTheme.titleMedium),
                              const Spacer(),
                              SemesterDropdown(selected: state.semester, onSelect: context.read<HomeCubit>().getTasks),
                            ],
                          ),
                        ),
                      ),
                      state.tasks.isEmpty
                          ? SliverToBoxAdapter(
                            child: EmptyState(
                              icon: Icons.hourglass_empty,
                              title: "${state.semester}-semester da topshiriqlar mavjud emas",
                              subtitle: "Topshiriqlar listi ko`rinishini default ma`lumotlar bilan to`ldirish orqali ko`rishingiz mumkin",
                              actionLabel: "Ko`rish",
                              onActionPressed: context.read<HomeCubit>().getDefTasks,
                            ),
                          )
                          : SliverList(
                            delegate: SliverChildBuilderDelegate((context, index) {
                              final task = state.tasks[index];
                              return buildStudentTaskItem(context, task);
                            }, childCount: state.tasks.length),
                          ),
                      const SliverToBoxAdapter(child: SizedBox(height: 32)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MasteryRow extends StatelessWidget {
  const _MasteryRow({super.key});

  static const _items = [
    (label: 'Maʼlumotlar tahlil', percent: 0.75, color: Colors.green),
    (label: 'Dasturlash C++ I', percent: 0.55, color: Colors.blue),
    (label: 'Ekologiya', percent: 0.65, color: Colors.teal),
    (label: 'Operatsion tizimlar', percent: 0.37, color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return _ProgressCircle(label: item.label, percent: item.percent, color: item.color);
        },
        separatorBuilder: (_, __) => const SizedBox(width: 24), // Elementlar orasidagi bo‘sh joy
      ),
    );
  }
}

class _ProgressCircle extends StatelessWidget {
  const _ProgressCircle({required this.label, required this.percent, required this.color});

  final String label;
  final double percent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 36,
          lineWidth: 6,
          percent: percent,
          center: Text('${(percent * 100).round()}%'),
          progressColor: color,
          backgroundColor: color.withOpacity(0.15),
          animation: true,
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 70,
          child: Text(label, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis, maxLines: 2),
        ),
      ],
    );
  }
}

class _SemesterStatusRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget statusChip(int count, String label, Color color, IconData icon) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Icon(icon, color: color),
              const SizedBox(height: 4),
              Text('$count ta', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: color, fontWeight: FontWeight.w700)),
              Text(label, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      );
    }

    return Row(
      children: [
        statusChip(0, 'Tasdiqmlanmoqda', const Color(0xFF6C5CE7), Icons.loop_rounded),
        const SizedBox(width: 8),
        statusChip(0, 'Bajarilgan', const Color(0xFF00B894), Icons.check_circle_rounded),
        const SizedBox(width: 8),
        statusChip(0, 'Bajarilmagan', const Color(0xFFFF7675), Icons.cancel_rounded),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: color,
      labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}

Widget buildStudentTaskItem(BuildContext context, StudentSubjectTasksData taskData) {
  final String title = taskData.name ?? "Noma'lum topshiriq";
  final String subject = taskData.employee?.name ?? "O'qituvchi noma'lum";
  final String date = formatDate(taskData.deadline);
  final String chipLabel = taskData.taskStatus?.name ?? "Holat noma'lum";
  final Color chipColor = Colors.indigo.withAlpha(200); // Statik, kerak bo‘lsa dinamik qiling

  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(

      contentPadding: const EdgeInsets.fromLTRB(16, 8, 12, 8),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subject),
          const SizedBox(height: 4),
          Row(
            children: [
              _StatusChip(label: chipLabel, color: chipColor),
              const SizedBox(width: 8),
              Text(date, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {
        appRouter.push(Screens.empty);
      },
    ),
  );
}

String formatDate(int? timestamp) {
  if (timestamp == null) return "Noma'lum sana";
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('dd.MM.yyyy • HH:mm').format(date);
}
