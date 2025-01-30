import 'package:flutter/material.dart';
import 'package:portfolio/navbar.dart';

class ContactUI extends StatefulWidget {
  const ContactUI({super.key});

  @override
  State<ContactUI> createState() => _ContactUIState();
}

class _ContactUIState extends State<ContactUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      backgroundColor: Colors.blue,
    );
  }
}
