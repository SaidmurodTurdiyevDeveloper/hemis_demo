import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../data/model/response/student_lesson_schedule.dart';
import '../../widget/empty_widget.dart';
import 'lesson_schedule_cubit.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5176FF),
        title: SizedBox(
          height: 56,
          child: Row(
            children: [
              Text('Dars Jadvali', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
              const Spacer(),
              BlocBuilder<LessonScheduleCubit, LessonScheduleState>(
                builder: (context, state) {
                  return Text('${getUzbekMonthName(state.today.month)} ${state.today.year}', style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white, fontWeight:
                  FontWeight
                      .w600));
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF5176FF),
      body: Column(
        children: [
          BlocBuilder<LessonScheduleCubit, LessonScheduleState>(
            builder: (context, state) {
              return _CalendarStrip(selected: state.selected);
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 4))],
              ),
              child: CustomScrollView(slivers: [const _TodayLessons()]),
            ),
          ),
        ],
      ),
    );
  }
}
String getUzbekMonthName(int month) {
  const uzbekMonths = [
    'Yanvar',
    'Fevral',
    'Mart',
    'Aprel',
    'May',
    'Iyun',
    'Iyul',
    'Avgust',
    'Sentabr',
    'Oktabr',
    'Noyabr',
    'Dekabr',
  ];

  if (month < 1 || month > 12) return 'Nomaʼlum oy';
  return uzbekMonths[month - 1];
}

class _CalendarStrip extends StatelessWidget {
  final DateTime selected;

  const _CalendarStrip({required this.selected});

  @override
  Widget build(BuildContext context) {
    final startOfWeek = selected.subtract(Duration(days: selected.weekday - 1));

    return SizedBox(
      height: 86,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < 7; i++)
            if (startOfWeek.add(Duration(days: i)).day == selected.day)
              _DayChip(date: startOfWeek.add(Duration(days: i)), isSelected: true)
            else
              _DayChip(date: startOfWeek.add(Duration(days: i)), isSelected: false),
        ],
      ),
    );
  }
}

class _DayChip extends StatelessWidget {
  const _DayChip({required this.date, required this.isSelected});

  final DateTime date;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final weekdayUz = ['Dush', 'Sesh', 'Chor', 'Pay', 'Juma', 'Shan', 'Yak'];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 80,
      width: 44,
      decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          context.read<LessonScheduleCubit>().selectDay(date);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weekdayUz[date.weekday - 1],
              style: Theme
                  .of(
                context,
              )
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: isSelected ? const Color(0xFF5176FF) : Colors.white, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              '${date.day}',
              style: Theme
                  .of(
                context,
              )
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: isSelected ? const Color(0xFF5176FF) : Colors.white, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}


class _TodayLessons extends StatelessWidget {
  const _TodayLessons();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<LessonScheduleCubit, LessonScheduleState>(
          builder: (context, state) {
            Widget body;

            if (state.isLoading) {
              body = Padding(
                padding: const EdgeInsets.all(32.0),
                child: const Center(child: CircularProgressIndicator(color: Color(0xFF5176FF),)),
              );
            } else if (state.lesson.isEmpty) {
              body = EmptyState(
                icon: Icons.hourglass_empty,
                title: "${state.selected.day} kuni dars jadvali mavjud emas",
                subtitle: "Dars jadvalini default ma`lumotlar orqali ko`rishingiz mumkin",
                actionLabel: "Ko`rish",
                onActionPressed: context.read<LessonScheduleCubit>().getSubjects,
              );
            } else {
              body = Column(
                children: List.generate(state.lesson.length, (index) {
                  final lesson = state.lesson[index];
                  return _LessonTile(
                    lesson: lesson,
                    isFirst: index == 0,
                    isLast: index == state.lesson.length - 1,
                  );
                }),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Darslar',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700) ??
                      const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                body, // ← Expanded YO‘Q!
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LessonTile extends StatelessWidget {
  const _LessonTile({required this.lesson, this.isFirst = false, this.isLast = false});

  final StudentScheduleData lesson;
  final bool isFirst;
  final bool isLast;

  Color get _statusColor {
    switch (lesson.status) {
      case LessonStatus.attended:
        return const Color(0xFF35B84B);
      case LessonStatus.missed:
        return const Color(0xFFFF5D5D);
      case LessonStatus.upcoming:
        return const Color(0xFF5667FF);
      default:
        return Color(0xFF5667FF);
    }
  }

  IconData get _statusIcon {
    switch (lesson.status) {
      case LessonStatus.attended:
        return Icons.check;
      case LessonStatus.missed:
        return Icons.error_outline;
      case LessonStatus.upcoming:
        return Icons.circle;
      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      axis: TimelineAxis.vertical,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 28,
        height: 28,
        indicator: Container(
          decoration: BoxDecoration(color: _statusColor, shape: BoxShape.circle),
          child: Center(child: Icon(_statusIcon, size: 14, color: Colors.white)),
        ),
      ),
      beforeLineStyle: LineStyle(color: _statusColor.withOpacity(0.4), thickness: 2),
      endChild: _LessonCard(lesson: lesson),
    );
  }
}

class _LessonCard extends StatelessWidget {
  const _LessonCard({required this.lesson});

  final StudentScheduleData lesson;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 18),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: const Color(0xFFF6F7FF), borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: const Color(0xFFEBEDF9), borderRadius: BorderRadius.circular(6)),
                  child: Text(lesson.faculty?.structureType?.name ?? "", style: theme.textTheme.labelSmall?.copyWith(color: const Color(0xFF5667FF),
                      fontWeight: FontWeight
                          .w700)),
                ),
                const SizedBox(width: 12),
                Text('${lesson.lessonPair?.startTime} - ${lesson.lessonPair?.endTime}', style: theme.textTheme.bodySmall?.copyWith(fontWeight:
                FontWeight
                    .w600)),
                const Spacer(),
                Icon(Icons.commit_outlined, size: 18, color: Colors.grey[500]),
              ],
            ),
            const SizedBox(height: 6),
            Text(lesson.subject?.name ?? "", style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(
              _statusLabel(lesson.status),
              style: theme.textTheme.labelMedium?.copyWith(color: _statusColor(lesson.status), fontWeight: FontWeight.w700),
            ),
          ],
        ),
      )
    );
  }

  String _statusLabel(LessonStatus? s) {
    switch (s) {
      case LessonStatus.attended:
        return 'Talaba darsga qatnashdi';
      case LessonStatus.missed:
        return 'Qatnashmadi';
      case LessonStatus.upcoming:
        return 'Talaba darsga qatnashdi';
      default:
        return 'Talaba darsga qatnashdi';
    }
  }

  Color _statusColor(LessonStatus? s) {
    switch (s) {
      case LessonStatus.attended:
        return const Color(0xFF35B84B);
      case LessonStatus.missed:
        return const Color(0xFFFF5D5D);
      case LessonStatus.upcoming:
        return const Color(0xFF5667FF);
      default:
        return const Color(0xFF5667FF);
    }
  }
}


enum LessonStatus { attended, missed, upcoming }


