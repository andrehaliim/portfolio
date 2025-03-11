import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class ProjectsUI extends StatelessWidget {
  const ProjectsUI({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.black,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Text(
              'Browse My Recent',
              style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),
            ),
            Text(
              'Projects',
              style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.025, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.025,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProjectItem(
                  imagePath: 'assets/images/afc1.jpg',
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
                ProjectItem(
                  imagePath: 'assets/images/fika1.jpg',
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
                ProjectItem(
                  imagePath: 'assets/images/gts1.jpg',
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
                ProjectItem(
                  imagePath: 'assets/images/vts1.jpg',
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ],
            )
          ],
        ));
  }
}

class ProjectItem extends StatefulWidget {
  final String imagePath;
  final double screenWidth;
  final double screenHeight;

  const ProjectItem({
    super.key,
    required this.imagePath,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool _isHovered = false;

  void _setHover(bool hovering) {
    setState(() {
      _isHovered = hovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: widget.screenWidth / 6,
            height: widget.screenHeight / 1.5,
            decoration: kBoxDecoration,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),
          if (_isHovered)
            Container(
              margin: EdgeInsets.all(10),
              width: widget.screenWidth / 6,
              height: widget.screenHeight / 1.5,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          if (_isHovered)
            ElevatedButton(
              onPressed: () {
                // Implement detail button action
                print('Detail button clicked for ${widget.imagePath}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: Text('Detail'),
            ),
        ],
      ),
    );
  }
}
