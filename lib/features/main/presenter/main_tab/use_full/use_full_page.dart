import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/navigator/Screens.dart';
import '../../../../../core/navigator/navigators.dart';

class UseFullPage extends StatelessWidget {
  final List<Map<String, String>> sections = [
    {'title': 'Talaba ID', 'icon': 'person'},
    {'title': 'Zoom', 'icon': 'videocam'},
    {'title': 'Davomat', 'icon': 'event'},
    {'title': 'O\'quvchilar', 'icon': 'group'},
    {'title': 'Ma\'lumotnoma', 'icon': 'description'},
    {'title': 'Shartnomalar', 'icon': 'assignment'},
    {'title': 'Talaba haqida', 'icon': 'info'},
    {'title': 'Nazorat jadvali', 'icon': 'schedule'},
    {'title': 'Kontrakt to\'lov', 'icon': 'payment'},
    {'title': 'Kutubxona', 'icon': 'library_books'},
    {'title': 'Buyurtmalar', 'icon': 'shopping_cart'},
    {'title': 'Diplom', 'icon': 'school'},
  ];

  UseFullPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foydali Bo'limlar", style: GoogleFonts.roboto(color: Color(0xFF5176FF), fontSize: 24, fontWeight: FontWeight.w700)),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        itemCount: sections.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 3.5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final section = sections[index];
          return InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {appRouter.push(Screens.empty);},
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_iconsMap[section['icon']]!, size: 40, color: Color(0xFF5176FF)),
                  SizedBox(height: 8),
                  Text(section['title']!, textAlign: TextAlign.center),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

final Map<String, IconData> _iconsMap = {
  'person': Icons.person,
  'videocam': Icons.videocam,
  'event': Icons.event,
  'group': Icons.group,
  'description': Icons.description,
  'assignment': Icons.assignment,
  'info': Icons.info,
  'schedule': Icons.schedule,
  'payment': Icons.payment,
  'library_books': Icons.library_books,
  'shopping_cart': Icons.shopping_cart,
  'school': Icons.school,
};
