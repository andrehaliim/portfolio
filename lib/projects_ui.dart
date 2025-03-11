import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class ProjectsUI extends StatelessWidget {
  ProjectsUI({super.key});

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
                  imageTitle: 'AutoFleet Capital Mobile App',
                ),
                ProjectItem(
                  imagePath: 'assets/images/fika1.jpg',
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  imageTitle: 'FIKA Mobile App',
                ),
                ProjectItem(
                  imagePath: 'assets/images/gts1.jpg',
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  imageTitle: 'Gold Trading System',
                ),
                ProjectItem(
                  imagePath: 'assets/images/vts1.jpg',
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  imageTitle: 'Vehicle Tracking System',
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
  final String imageTitle;

  const ProjectItem({
    super.key,
    required this.imagePath,
    required this.screenWidth,
    required this.screenHeight,
    required this.imageTitle,
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

  final List<String> afcImage = [
    'assets/images/afc1.jpg',
    'assets/images/fika1.jpg',
    'assets/images/gts1.jpg',
    'assets/images/vts1.jpg',
  ];

  String descriptionAFC = 'This application is designed to streamline the auction process for AutoFleet Capital customers,'
      ' enabling seamless transactions from start to finish.'
      ' Users can check auction stock, place bids, monitor auction progress,'
      ' and even recommend vehicles for auction to other users within the platform.';

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
              onPressed: () => _showCustomDialog(context, widget.imageTitle, afcImage, descriptionAFC),
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

  void _showCustomDialog(BuildContext context, String title, List<String> imageList, String description) {
    showDialog(
      context: context,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;
        return Dialog(
          child: Container(
            width: screenSize.width * 0.5,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 10),
                CarouselSlider(
                  options: CarouselOptions(
                    height: screenSize.height * 0.5,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: false,
                    viewportFraction: 0.3,
                  ),
                  items: imageList.map((imagePath) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      width: screenSize.width / 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
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
                  description,
                  style: TextStyle(color: Colors.black, fontSize: screenSize.width * 0.01),
                ),
                SizedBox(height: screenSize.height / 15,),
                Text(
                  'Platform : Android & iOS',
                  style: TextStyle(color: Colors.black, fontSize: screenSize.width * 0.01),
                ),
                Center(
                  child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ButtonStyle(
                          shape: WidgetStateProperty.resolveWith((state) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: Colors.black))),
                          backgroundColor: WidgetStateProperty.resolveWith((state) => Colors.black),
                          padding: WidgetStateProperty.resolveWith((state) => EdgeInsets.all(10))
                      ),
                      child: Text(
                        'Close',
                        style: TextStyle(fontSize: screenSize.width * 0.015, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
