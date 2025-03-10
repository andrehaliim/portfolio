import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05,),
            Text('Browse My Recent', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),),
            Text('Projects', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.025, fontWeight: FontWeight.bold),),
            SizedBox(height: screenHeight * 0.1,),
          ],
        )
    );
  }
}
