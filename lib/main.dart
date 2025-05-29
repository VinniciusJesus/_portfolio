import 'package:flutter/material.dart';

import 'features/about/about_page.dart';
import 'features/contact/contact_section.dart';
import 'features/footer/footer.dart';
import 'features/projects/projects_page.dart';
import 'features/skills/skills_section.dart';
import 'features/welcome/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfólio Marcos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF69d2e7),
        fontFamily: 'ChakraPetch',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactsKey = GlobalKey();

  void _scrollToProjects() {
    final ctx = _projectsKey.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic, // animação mais suave e elegante
      );
    }
  }

  void _scrollToContact() {
    final ctx = _contactsKey.currentContext;
    Scrollable.ensureVisible(
      ctx!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            WelcomeSection(onScrollToProjects: _scrollToProjects),
            AboutSection(onScrollToContact: _scrollToContact),
            const SkillsSection(),
            ProjectsSection(key: _projectsKey),
            ContactSection(key: _contactsKey),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
