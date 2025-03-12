import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class ProjectsUI extends StatelessWidget {
  ProjectsUI({super.key});

  final String titleAFC = 'AutoFleet Capital';
  final String titleFIKA = 'FIKA';
  final String titleGTS = 'Gold Trading System (GTS)';
  final String titleVTS = 'Vehicle Tracking System (VTS)';

  final List<String> afcImage = [
    'assets/images/afc/afc1.jpg',
    'assets/images/afc/afc2.jpg',
    'assets/images/afc/afc3.jpg',
    'assets/images/afc/afc4.jpg',
    'assets/images/afc/afc5.jpg',
    'assets/images/afc/afc6.jpg',
  ];
  final List<String> fikaImage = [
    'assets/images/fika/fika1.jpg',
    'assets/images/fika/fika2.jpg',
    'assets/images/fika/fika3.jpg',
    'assets/images/fika/fika4.jpg',
    'assets/images/fika/fika5.jpg',
    'assets/images/fika/fika6.jpg',
  ];
  final List<String> gtsImage = [
    'assets/images/gts/gts1.jpg',
    'assets/images/gts/gts2.jpg',
    'assets/images/gts/gts3.jpg',
    'assets/images/gts/gts4.jpg',
    'assets/images/gts/gts5.jpg',
    'assets/images/gts/gts6.jpg',
  ];
  final List<String> vtsImage = [
    'assets/images/vts/vts1.jpg',
    'assets/images/vts/vts2.jpg',
    'assets/images/vts/vts3.jpg',
    'assets/images/vts/vts4.jpg',
    'assets/images/vts/vts5.jpg',
    'assets/images/vts/vts6.jpg',
  ];

  final String descriptionAFC = 'This application is designed to streamline the auction process for AutoFleet Capital customers,'
      ' enabling seamless transactions from start to finish.'
      ' Users can check auction stock, place bids, monitor auction progress,'
      ' and even recommend vehicles for auction to other users within the platform.';

  final String descriptionFIKA = 'This application streamlines the inspection process for both field operations and on-site conditions.'
      ' Utilizing a questionnaire-based method, administrators can create customized questions related to field activities,'
      ' which are then completed by designated users. In the event of any issues encountered during the questionnaire submission,'
      ' users can report them directly through the "Issue" section. These reports are immediately visible to administrators for'
      ' further review and follow-up actions from the central office. Additionally, the application provides comprehensive reporting'
      ' features, enabling administrators to monitor and evaluate the questionnaire results submitted by each staff member.';

  final String descriptionGTS = 'This application serves as a tool to streamline gold sales transactions for field sales representatives.'
      ' By utilizing a synchronization system with the server and storing product data in the applications local database,'
      ' sales personnel can operate the application offline, ensuring seamless transactions even in areas with limited or no network'
      ' coverage. The transactions facilitated by the app include gold sales and payments, which can be made either with gold or cash.'
      ' Additionally, the application features comprehensive reporting capabilities, allowing management to monitor and evaluate the'
      ' sales performance of each representative.';

  final String descriptionVTS = 'This application is designed to monitor the delivery transactions of a vehicles from one'
      ' location to another. It works in synergy with tracking devices installed on each vehicle, with real-time location data'
      ' recorded by the server and displayed within the application. The app also features a barcode scanning function, enabling'
      ' users to easily register trackers and vehicles for location monitoring, ensuring a more efficient and streamlined process.';

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
                Column(
                  children: [
                    ProjectItem(
                      imagePath: 'assets/images/afc/afc1.jpg',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      imageTitle: titleAFC,
                      imageDescription: descriptionAFC,
                      imageList: afcImage,
                    ),
                    Text(
                      titleAFC,
                      style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.05,),
                Column(
                  children: [
                    ProjectItem(
                      imagePath: 'assets/images/fika/fika1.jpg',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      imageTitle: titleFIKA,
                      imageDescription: descriptionFIKA,
                      imageList: fikaImage,
                    ),
                    Text(
                      titleFIKA,
                      style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.05,),
                Column(
                  children: [
                    ProjectItem(
                      imagePath: 'assets/images/gts/gts1.jpg',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      imageTitle: titleGTS,
                      imageDescription: descriptionGTS,
                      imageList: gtsImage,
                    ),
                    Text(
                      titleGTS,
                      style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.05,),
                Column(
                  children: [
                    ProjectItem(
                      imagePath: 'assets/images/vts/vts1.jpg',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      imageTitle: titleVTS,
                      imageDescription: descriptionVTS,
                      imageList: vtsImage,
                    ),
                    Text(
                      titleVTS,
                      style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),
                    ),
                  ],
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
  final String imageDescription;
  final List<String> imageList;

  const ProjectItem({
    super.key,
    required this.imagePath,
    required this.screenWidth,
    required this.screenHeight,
    required this.imageTitle,
    required this.imageDescription,
    required this.imageList,
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
              onPressed: () => _showCustomDialog(context, widget.imageTitle, widget.imageList, widget.imageDescription),
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
                Spacer(),
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
