import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/contact_ui.dart';
import 'package:portfolio/homepage_ui.dart';
import 'package:portfolio/projects_ui.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePageUI(),
    ),
    GoRoute(
      path: '/projects',
      builder: (context, state) => const ProjectsUI(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactUI(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
