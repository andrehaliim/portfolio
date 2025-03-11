import 'package:flutter/material.dart';

class ExperienceUI extends StatelessWidget {
  ExperienceUI({super.key});

  final List<ExperienceModel> frontendItems = [
    ExperienceModel(name: 'Dart', level: 'Experienced'),
    ExperienceModel(name: 'Flutter', level: 'Experienced'),
    ExperienceModel(name: 'Kotlin', level: 'Intermediate'),
    ExperienceModel(name: 'Swift', level: 'Basic'),
    ExperienceModel(name: 'HTML & CSS', level: 'Intermediate'),
    ExperienceModel(name: 'Figma', level: 'Basic'),
  ];

  final List<ExperienceModel> backendItems = [
    ExperienceModel(name: 'PHP', level: 'Intermediate'),
    ExperienceModel(name: 'Laravel', level: 'Intermediate'),
    ExperienceModel(name: 'Javascript', level: 'Basic'),
    ExperienceModel(name: 'SQL', level: 'Intermediate'),
  ];

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Text(
              'Explore my',
              style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),
            ),
            Text(
              'Experience',
              style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.025, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth / 3,
                  height: screenHeight / 3.5,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.white)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Frontend Development',
                        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.015, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Center(
                            child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    mainAxisExtent: screenHeight / 10
                                ),
                                itemCount: frontendItems.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final data = frontendItems[index];
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.verified, color: Colors.white, size: screenWidth * 0.025,),
                                      SizedBox(width: screenWidth * 0.005,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            data.name,
                                            style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01, fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            data.level,
                                            style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                }),
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.025,
                ),
                Container(
                  width: screenWidth / 3,
                  height: screenHeight / 3.5,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.white)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Backend Development',
                        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.015, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Center(
                            child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    mainAxisExtent: screenHeight / 10
                                ),
                                itemCount: backendItems.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final data = backendItems[index];
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.verified, color: Colors.white, size: screenWidth * 0.025,),
                                      SizedBox(width: screenWidth * 0.005,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            data.name,
                                            style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01, fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            data.level,
                                            style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                }),
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class ExperienceModel {
  final String name;
  final String level;

  ExperienceModel({required this.name, required this.level});
}
