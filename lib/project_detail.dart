import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/project_model.dart';

class ProjectDetail extends StatefulWidget {
  final ProjectModel selectedProject;
  const ProjectDetail({super.key, required this.selectedProject});

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: screenHeight / 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 5,),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: bgTextColor)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: greyTextColor,
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Text(
                      widget.selectedProject.title,
                      style: TextStyle(color: mainTextColor, fontSize: defaultFontSizeMed),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight / 27),
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: containerColor2,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: screenHeight / 1.5,
                            autoPlay: true,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.6,
                            autoPlayInterval: const Duration(seconds: 3)
                          ),
                          items: widget.selectedProject.imageList.map((imagePath) {
                            return Container(
                              width: screenWidth * 0.6,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5)],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Text(
                          widget.selectedProject.description,
                          style: const TextStyle(
                              color: mainTextColor,
                              fontSize: defaultFontSize,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),

                ),
                SizedBox(height: screenHeight / 27),
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: containerColor2,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:  Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Client',
                              style: TextStyle(
                                fontSize: defaultFontSize,
                                color: greyTextColor,
                              ),
                            ),
                            Text('Language',
                              style: TextStyle(
                                  fontSize: defaultFontSize,
                                  color: greyTextColor
                              ),
                            ),
                            Text('Platform',
                              style: TextStyle(
                                  fontSize: defaultFontSize,
                                  color: greyTextColor
                              ),
                            ),
                            Text('Year',
                              style: TextStyle(
                                  fontSize: defaultFontSize,
                                  color: greyTextColor
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.selectedProject.client,
                              style: const TextStyle(
                                  fontSize: defaultFontSize,
                                  color: mainTextColor
                              ),
                            ),
                            Text(widget.selectedProject.language,
                              style: const TextStyle(
                                  fontSize: defaultFontSize,
                                  color: mainTextColor
                              ),
                            ),
                            Text(widget.selectedProject.platform,
                              style: const TextStyle(
                                  fontSize: defaultFontSize,
                                  color: mainTextColor
                              ),
                            ),
                            Text(widget.selectedProject.year,
                              style: const TextStyle(
                                  fontSize: defaultFontSize,
                                  color: mainTextColor
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
