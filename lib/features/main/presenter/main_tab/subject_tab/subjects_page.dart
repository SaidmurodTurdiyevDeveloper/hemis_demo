import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hemis_demo/features/main/presenter/main_tab/subject_tab/subjects_cubit.dart';
import '../../../../../core/navigator/Screens.dart';
import '../../../../../core/navigator/navigators.dart';
import '../../../data/model/response/student_subjects_with_result.dart';
import '../../widget/empty_widget.dart';
import '../../widget/semester_drop_down.dart';

class Subject {
  final String title;
  final String meta; // "Tayyor | 128 soat | 4 kredit"
  final int score;
  final int maxScore;
  final Color color; // progress + status rang
  final String statusLabel; // "Umumiy ball", "Yopiq", va h.k.

  const Subject({
    required this.title,
    required this.meta,
    required this.score,
    required this.maxScore,
    required this.color,
    required this.statusLabel,
  });
}

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocBuilder<SubjectsCubit, SubjectsState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.fromLTRB(20, 12, 20, 4), child: Text('Fanlar', style: theme.textTheme.headlineSmall)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400, width: .7), borderRadius: BorderRadius.circular(8)),
                        child: SemesterDropdown(
                          selected: 1,
                          onSelect: (v) {
                            context.read<SubjectsCubit>().getSubjectSemester(v);
                          },
                        ),
                      ),
                      const Spacer(),
                      Text('2024‑2025', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),

                const SizedBox(height: 8),
                const Divider(height: 1),

                Expanded(
                  child:
                      state.subjects.isEmpty
                          ? Center(
                            child: EmptyState(
                              icon: Icons.access_time_filled,
                              title: "${state.semester}-semesterda fanlar mavjud emas",
                              subtitle: "Fanlarni listini default ma`lumotlar orqali ko`rishingiz mumkin",
                              actionLabel: "Ko`rish",
                              onActionPressed: context.read<SubjectsCubit>().getSubjects,
                            ),
                          )
                          : ListView.separated(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            itemCount: state.subjects.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 12),
                            itemBuilder: (context, i) => _SubjectCard(state.subjects[i]),
                          ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SubjectCard extends StatelessWidget {
  const _SubjectCard(this.data);

  final StudentSubjectWithResultData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = (data.overallScore?.grade ?? 0) / (data.overallScore?.maxBall ?? 1);
    final color = progressColor(progress);
    final label = progressLabel(progress);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: (){appRouter.push(Screens.empty);},
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14), side: BorderSide(color: Colors.grey.shade300, width: .8)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 12, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data.curriculumSubject?.subject?.name ?? "unknown",
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Icon(Icons.chevron_right_rounded),
                  ],
                ),
                const SizedBox(height: 4),

                Text(
                  "${data.curriculumSubject?.subject?.name ?? "unknown"} | ${data.curriculumSubject?.totalAcload?.toString() ?? "-"} soat | ${data.curriculumSubject?.credit?.toString() ?? "-"} kredit",
                  style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      '${data.overallScore?.grade}/${data.overallScore?.maxBall}',
                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: color),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: progress.clamp(0.0, 1.0),
                          minHeight: 4,
                          backgroundColor: color.withOpacity(.15),
                          valueColor: AlwaysStoppedAnimation<Color>(color),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    Text('Umumiy ball', style: theme.textTheme.labelSmall?.copyWith(color: Colors.grey.shade600)),
                    const Spacer(),
                    Text(label, style: theme.textTheme.labelSmall?.copyWith(color: color)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color progressColor(double percent) {
    assert(percent >= 0 && percent <= 100, 'percent must be 0‑100');

    if (percent == 0) return Colors.blue; // maxsus holat
    if (percent >= 0.85) return Colors.green;
    if (percent >= 0.70) return Colors.blue;
    if (percent >= 0.60) return Colors.amber; // sariq
    return Colors.red;
  }

  String progressLabel(double percent) {
    assert(percent >= 0 && percent <= 100, '');

    if (percent == 0) return 'Boshlanmagan';
    if (percent >= 0.85) return "A'lo";
    if (percent >= 0.70) return 'Yaxshi';
    if (percent >= 0.60) return 'O‘rtacha';
    return 'Qoniqarsiz';
  }
}
