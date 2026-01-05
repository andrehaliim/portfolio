import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetail extends StatefulWidget {
  final ProjectModel selectedProject;
  const ProjectDetail({super.key, required this.selectedProject});

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  bool _isHovered = false;

  Future<void> _launchProjectUrl() async {
    // 1. Check if the link is not empty before parsing.
    if (widget.selectedProject.link.isEmpty) {
      debugPrint("URL is empty, cannot launch.");
      // Optionally show a message to the user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No download link available for this project.')),
        );
      }
      return;
    }
    final Uri url = Uri.parse(widget.selectedProject.link);

    // 2. Use a launch mode that opens the browser.
    // This is crucial for file downloads to work reliably.
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      // 3. Implement user-friendly error handling instead of throwing an exception.
      debugPrint('Could not launch $url');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: Could not open the link: $url')),
        );
      }
    }
  }

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
                    const Icon(
                      Icons.circle,
                      color: greyTextColor,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.selectedProject.title,
                      style: const TextStyle(color: mainTextColor, fontSize: defaultFontSizeMed),
                    ),
                    const Spacer(),
                    Visibility(
                        visible: widget.selectedProject.link.isNotEmpty,
                        child: MouseRegion(
                          onEnter: (_) => setState(() => _isHovered = true),
                          onExit: (_) => setState(() => _isHovered = false),
                          child: GestureDetector(
                            onTap: _launchProjectUrl,
                            child: Icon(Icons.download, color: _isHovered ? mainTextColor : bgTextColor,
                              size: 32,),
                          ),
                        )
                    )
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
                            height: screenHeight / 1.2,
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
