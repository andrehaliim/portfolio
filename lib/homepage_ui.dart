import 'package:flutter/material.dart';
import 'package:portfolio/about_ui.dart';
import 'package:portfolio/contact_ui.dart';
import 'package:portfolio/navbar.dart';
import 'package:portfolio/projects_ui.dart';
import 'package:portfolio/welcome_ui.dart';

class HomePageUI extends StatefulWidget {
  const HomePageUI({super.key});

  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  final ScrollController _scrollController = ScrollController();

  void _scrollTo(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: NavBar(
        onHomePressed: () => _scrollTo(0),
        onAboutPressed: () => _scrollTo(screenHeight),
        onProjectsPressed: () => _scrollTo(screenHeight * 2),
        onContactPressed: () => _scrollTo(screenHeight * 3),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(height: screenHeight, child: WelcomeUI()),
            SizedBox(height: screenHeight, child: AboutUI()),
            SizedBox(height: screenHeight, child: ProjectsUI()),
            SizedBox(height: screenHeight, child: ContactUI()),
          ],
        ),
      ),
    );
  }
}
