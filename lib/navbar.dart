import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget
{
  final VoidCallback onHomePressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onContactPressed;

  const NavBar({
    super.key,
    required this.onHomePressed,
    required this.onProjectsPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        'Portfolio.',
        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.025),
      ),
      actions: [
        NavItem(title: "Home", onPressed: onHomePressed),
        SizedBox(width: screenWidth * 0.02),
        NavItem(title: "Projects", onPressed: onProjectsPressed),
        SizedBox(width: screenWidth * 0.02),
        NavItem(title: "Contact", onPressed: onContactPressed),
        SizedBox(width: screenWidth * 0.05),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
class NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const NavItem({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.02,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}