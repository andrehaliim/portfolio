import 'package:flutter/material.dart';

class ContactUI extends StatelessWidget {
  const ContactUI({super.key});

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
            Text('Contact Me', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.025),),
          ],
        )
    );
  }
}
