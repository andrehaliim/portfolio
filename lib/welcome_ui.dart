import 'package:flutter/material.dart';

class WelcomeUI extends StatelessWidget {
  const WelcomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/profile.png',
                width: screenWidth * 0.5,
                height: screenWidth * 0.5,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hello! It's Me", style: TextStyle(fontSize: screenWidth * 0.02, color: Colors.white),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Andre ', style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold, color: Colors.white),),
                    Text('Haliim', style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("And i'm a ", style: TextStyle(fontSize: screenWidth * 0.02, color: Colors.white),),
                    Text('Software Engineer', style: TextStyle(fontSize: screenWidth * 0.02, color: Colors.blue[400], fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02,),
                TextButton(
                    onPressed: (){},
                    style: ButtonStyle(
                        shape: WidgetStateProperty.resolveWith((state) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: Colors.white))),
                        padding: WidgetStateProperty.resolveWith((state) => EdgeInsets.all(10))
                    ),
                    child: Text(
                      'Download CV',
                      style: TextStyle(fontSize: screenWidth * 0.015, color: Colors.white),
                    )),
              ],
            ),
          ),
        ],
      );
  }
}
