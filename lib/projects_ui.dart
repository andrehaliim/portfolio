import 'package:flutter/material.dart';
import 'package:portfolio/navbar.dart';

class ProjectsUI extends StatefulWidget {
  const ProjectsUI({super.key});

  @override
  State<ProjectsUI> createState() => _ProjectsUIState();
}

class _ProjectsUIState extends State<ProjectsUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      backgroundColor: Colors.pink,
    );
  }
}
