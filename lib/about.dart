import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    String textBio1 = 'I am a dedicated Software Engineer with over 3 years of experience specializing in mobile app development using Flutter for both Android and iOS. While Flutter is my primary tool, I also have experience coding in Kotlin and Swift for native app development.';
    String textBio2 = 'Beyond mobile development, I have contributed to backend development using PHP Laravel and Node.js (JavaScript), collaborating with teams to build robust applications. My ability to adapt quickly allows me to seamlessly switch between frontend and backend tasks, ensuring high-quality solutions in dynamic environments.';
    String textBio3 = 'I am a flexible professional, comfortable working both independently and within a team, always eager to learn new technologies and enhance my skill set.';
    final size = MediaQuery.of(context).size;
    //final screenWidth = size.width;
    final screenHeight = size.height;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: containerColor2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight / 27),
          const Row(
            children: [
              Icon(Icons.circle, color: greyTextColor, size: 16,),
              SizedBox(width: 5),
              Text(
                'About',
                style: TextStyle(
                    color: mainTextColor,
                    fontSize: defaultFontSizeMed
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight / 27),
          const Text(
            "It's Me Andre",
            style: TextStyle(
                color: mainTextColor,
                fontSize: defaultFontSizeBig,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            textBio1,
            style: const TextStyle(
                color: mainTextColor,
                fontSize: defaultFontSize
            ),
          ),
          SizedBox(height: screenHeight / 27),
          Container(
            height: screenHeight / 2,
            color: containerColor2,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/profile2.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight / 27),
          Text(
            textBio2,
            style: const TextStyle(
                color: mainTextColor,
                fontSize: defaultFontSize
            ),
          ),
          Text(
            textBio3,
            style: const TextStyle(
                color: mainTextColor,
                fontSize: defaultFontSize
            ),
          ),
        ],
      ),
    );
  }
}