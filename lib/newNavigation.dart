import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/constants.dart';
import 'dart:html' as html;

class NavigationBarDesktop extends StatefulWidget {
  final Function(int) onTap;
  const NavigationBarDesktop({super.key, required this.onTap});

  @override
  State<NavigationBarDesktop> createState() => _NavigationBarDesktopState();
}

class _NavigationBarDesktopState extends State<NavigationBarDesktop> {
  bool isHoverCV = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final screenWidth = size.width;
    final screenHeight = size.height;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: screenHeight / 12,
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: bgTextColor)
        ),
        child: Row(
          children: [
            GestureDetector(onTap: () {widget.onTap(0);},child: const NavigationIcon(iconButton: Icons.home_outlined, iconText: 'Home')),
            GestureDetector(onTap: () {widget.onTap(1);},child: const NavigationIcon(iconButton: Icons.person_outline, iconText: 'About')),
            GestureDetector(onTap: () {widget.onTap(2);},child: const NavigationIcon(iconButton: Icons.build_circle_outlined, iconText: 'Project')),
            GestureDetector(onTap: () {widget.onTap(4);},child: const NavigationIcon(iconButton: Icons.workspace_premium_outlined, iconText: 'Skills')),
            GestureDetector(onTap: () {widget.onTap(3);},child: const NavigationIcon(iconButton: Icons.mail_outline, iconText: 'Contact')),
            //const NavigationIcon(iconButton: Icons.work_outline, iconText: 'Experience'),
            const Spacer(),
            MouseRegion(
              onEnter: (_) => setState(() => isHoverCV = true),
              onExit: (_) => setState(() => isHoverCV = false),
              child: GestureDetector(
                onTap: _downloadPdf,
                child: AnimatedContainer(
                  height: screenHeight/20,
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: isHoverCV
                        ? [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 0,
                        offset: const Offset(0, 0),
                      )
                    ]
                        : [],
                  ),
                  alignment: Alignment.center,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.download_outlined, color: mainTextColor, size: 16,),
                      SizedBox(width: 5),
                      Text(
                        'Download CV',
                        style: TextStyle(
                          color: mainTextColor,
                          fontSize: defaultFontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _downloadPdf() async {
    try {
      ByteData bytes = await rootBundle.load('assets/docs/curriculumvitae.pdf');
      Uint8List pdfBytes = bytes.buffer.asUint8List();

      final blob = html.Blob([pdfBytes]);

      final url = html.Url.createObjectUrlFromBlob(blob);

      html.AnchorElement(href: url)
        ..setAttribute("download", "Andre Curriculum Vitae.pdf")
        ..click();

      html.Url.revokeObjectUrl(url);
    } catch (e) {
      debugPrint('Error downloading PDF: $e');
    }
  }
}

class NavigatorBarMobile extends StatefulWidget {
  const NavigatorBarMobile({super.key});

  @override
  State<NavigatorBarMobile> createState() => _NavigatorBarMobileState();
}

class _NavigatorBarMobileState extends State<NavigatorBarMobile> {
  bool isHoverCV = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final screenWidth = size.width;
    final screenHeight = size.height;
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: screenHeight / 12,
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: bgTextColor)
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu, color: mainTextColor),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            const Spacer(),
            const Spacer(),
            MouseRegion(
              onEnter: (_) => setState(() => isHoverCV = true),
              onExit: (_) => setState(() => isHoverCV = false),
              child: AnimatedContainer(
                height: screenHeight/20,
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: isHoverCV
                      ? [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 0,
                      offset: const Offset(0, 0),
                    )
                  ]
                      : [],
                ),
                alignment: Alignment.center,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.download_outlined, color: mainTextColor, size: 16,),
                    SizedBox(width: 5),
                    Text(
                      'Download CV',
                      style: TextStyle(
                        color: mainTextColor,
                        fontSize: defaultFontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationIcon extends StatefulWidget {
  final IconData iconButton;
  final String iconText;

  const NavigationIcon({super.key, required this.iconButton, required this.iconText});

  @override
  _NavigationIconState createState() => _NavigationIconState();
}

class _NavigationIconState extends State<NavigationIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      margin: const EdgeInsets.only(top: 10),
      message: widget.iconText,
      decoration: BoxDecoration(
        color: bgTextColor,
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(color: Colors.white),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: _isHovered ? bgTextColor : containerColor,
              shape: BoxShape.circle
          ),
          alignment: Alignment.center,
          child: Icon(
            widget.iconButton,
            color: _isHovered ? mainTextColor : bgTextColor,
            size: 32,
          ),
        ),
      ),
    );
  }
}