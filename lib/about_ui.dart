import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    String textBio1 = 'I am a dedicated Software Engineer with over 3 years of experience specializing in mobile app development using Flutter for both Android and iOS. While Flutter is my primary tool, I also have experience coding in Kotlin and Swift for native app development.';
    String textBio2 = 'Beyond mobile development, I have contributed to backend development using PHP Laravel and Node.js (JavaScript), collaborating with teams to build robust applications. My ability to adapt quickly allows me to seamlessly switch between frontend and backend tasks, ensuring high-quality solutions in dynamic environments.';
    String textBio3 = 'I am a flexible professional, comfortable working both independently and within a team, always eager to learn new technologies and enhance my skill set.';

    return Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05,),
            Text('Get To Know More', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),),
            Text('About Me', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.025, fontWeight: FontWeight.bold),),
            SizedBox(height: screenHeight * 0.1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 480,
                  height: 480,
                  decoration: kBoxDecoration,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/profile2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.05,),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: screenWidth / 5,
                          height: screenHeight / 5,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.workspace_premium, color: Colors.white, size: screenWidth * 0.025,),
                              Text('Experience', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01, fontWeight: FontWeight.bold),),
                              SizedBox(height: screenHeight * 0.01,),
                              Text('3+ years', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),),
                              Text('Software Engineer', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),),
                            ],
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.025,),
                        Container(
                          width: screenWidth / 5,
                          height: screenHeight / 5,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.school_outlined, color: Colors.white, size: screenWidth * 0.025,),
                              Text('Education', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01, fontWeight: FontWeight.bold),),
                              SizedBox(height: screenHeight * 0.01,),
                              Text('Padjadjaran University', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),),
                              Text('Bachelor of Electrical Engineering', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01, fontStyle: FontStyle.italic,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.025,),
                    Container(
                      width: screenWidth/2,
                      child: Text(textBio1,
                        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025,),
                    Container(
                      width: screenWidth/2,
                      child: Text(textBio2,
                        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025,),
                    Container(
                      width: screenWidth/2,
                      child: Text(textBio3,
                        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        )
    );
  }
}
