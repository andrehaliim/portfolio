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
                  width: screenWidth/4,
                  height: screenHeight/3,
                  decoration: kBoxDecoration,
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
                      child: Text('Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic quis reprehenderit et laborum, rem, dolore eum quod voluptate exercitationem nobis, nihil esse debitis maxime facere minus sint delectus velit in eos quo officiis explicabo deleniti dignissimos. Eligendi illum libero dolorum cum laboriosam corrupti quidem, reiciendis ea magnam? Nulla, impedit fuga!',
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
