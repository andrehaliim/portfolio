import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavItem(title: "Home", route: '/'),
          SizedBox(width: 20),
          NavItem(title: "Projects", route: '/projects'),
          SizedBox(width: 20),
          NavItem(title: "Contact", route: '/contact'),
        ],
      ),
    );
  }
  Size get preferredSize => const Size.fromHeight(60);
}

class NavItem extends StatelessWidget {
  final String title;
  final String route;

  const NavItem({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(route),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}