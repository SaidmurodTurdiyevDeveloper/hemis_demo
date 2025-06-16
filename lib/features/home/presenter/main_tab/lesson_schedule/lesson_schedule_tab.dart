import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime(2025, 5, 23);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5176FF),
        title: SizedBox(
          height: 56,
          child: Row(
            children: [
              Text('Dars Jadvali', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
              const Spacer(),
              Text('Sen ${today.year}', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF5176FF),
      body: Column(
        children: [
          _CalendarStrip(selected: today),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            weekdayUz[date.weekday - 1],
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(color: isSelected ? const Color(0xFF5176FF) : Colors.white, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            '${date.day}',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: isSelected ? const Color(0xFF5176FF) : Colors.white, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  TODAY LESSONS CARD with timeline
// ─────────────────────────────────────────────────────────────────────────────
class _TodayLessons extends StatelessWidget {
  const _TodayLessons();

  @override
  Widget build(BuildContext context) {
    final items = <Lesson>[
      Lesson(start: '09:00', end: '10:30', title: 'C++ dasturlash tili fani (Zoom)', type: 'Leksiya', status: LessonStatus.attended),
      Lesson(start: '10:30', end: '12:00', title: 'C++ dasturlash tili fani (Zoom)', type: 'Leksiya', status: LessonStatus.missed),
      Lesson(start: '13:00', end: '14:30', title: 'C++ dasturlash tili fani (Zoom)', type: 'Amaliyot', status: LessonStatus.upcoming),
      Lesson(start: '14:30', end: '16:00', title: 'C++ dasturlash tili fani (Zoom)', type: 'Amaliyot', status: LessonStatus.upcoming),
    ];

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bugungi Darslar', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 20),
            ...List.generate(items.length, (index) {
              final lesson = items[index];
              return _LessonTile(lesson: lesson, isFirst: index == 0, isLast: index == items.length - 1);
            }),
          ],
        ),
      ),
    );
  }
}

class _LessonTile extends StatelessWidget {
  const _LessonTile({required this.lesson, this.isFirst = false, this.isLast = false});

  final Lesson lesson;
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
          child: Center(child: Icon(_statusIcon, size: lesson.status == LessonStatus.upcoming ? 8 : 14, color: Colors.white)),
        ),
      ),
      beforeLineStyle: LineStyle(color: _statusColor.withOpacity(0.4), thickness: 2),
      endChild: _LessonCard(lesson: lesson),
    );
  }
}

class _LessonCard extends StatelessWidget {
  const _LessonCard({required this.lesson});

  final Lesson lesson;

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
                  child: Text(lesson.type, style: theme.textTheme.labelSmall?.copyWith(color: const Color(0xFF5667FF), fontWeight: FontWeight.w700)),
                ),
                const SizedBox(width: 12),
                Text('${lesson.start} - ${lesson.end}', style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)),
                const Spacer(),
                Icon(Icons.content_copy_rounded, size: 18, color: Colors.grey[500]),
              ],
            ),
            const SizedBox(height: 6),
            Text(lesson.title, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(
              _statusLabel(lesson.status),
              style: theme.textTheme.labelMedium?.copyWith(color: _statusColor(lesson.status), fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  String _statusLabel(LessonStatus s) {
    switch (s) {
      case LessonStatus.attended:
        return 'Tadbya darsga qatnashdi';
      case LessonStatus.missed:
        return 'Qatnashmadi';
      case LessonStatus.upcoming:
        return 'Tadbya darsga qatnashadi';
    }
  }

  Color _statusColor(LessonStatus s) {
    switch (s) {
      case LessonStatus.attended:
        return const Color(0xFF35B84B);
      case LessonStatus.missed:
        return const Color(0xFFFF5D5D);
      case LessonStatus.upcoming:
        return const Color(0xFF5667FF);
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  MODELS
// ─────────────────────────────────────────────────────────────────────────────
enum LessonStatus { attended, missed, upcoming }

class Lesson {
  final String start;
  final String end;
  final String title;
  final String type;
  final LessonStatus status;

  Lesson({required this.start, required this.end, required this.title, required this.type, required this.status});
}

// ─────────────────────────────────────────────────────────────────────────────
//  BOTTOM NAVIGATION (simple mock)
// ─────────────────────────────────────────────────────────────────────────────
class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 64,
      selectedIndex: selectedIndex,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Asosy'),
        NavigationDestination(icon: Icon(Icons.calendar_month_outlined), label: 'Dars jadvali'),
        NavigationDestination(icon: Icon(Icons.fact_check_outlined), label: 'Fanlar'),
        NavigationDestination(icon: Icon(Icons.favorite_border), label: 'Foydali'),
        NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profil'),
      ],
    );
  }
}
