import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/selectedProject.dart';

class Projects extends StatefulWidget {
  final void Function(SelectedProject) onSave;

  const Projects({super.key, required this.onSave});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  List<bool> isHoverProjects = [false, false, false, false];
  late List<SelectedProject> listProject;

  @override
    void initState() {
    listProject = [
      SelectedProject(
          title: 'Autofleet Capital',
          subtitle: 'A streamlined platform for buying and selling cars',
          year: '2023',
          platform: 'Android, iOS',
          client: 'ATNZ',
          language: 'Dart, Flutter',
          logo: 'assets/images/afc/logo.png',
          imageList: afcImage,
          description: descriptionAFC
      ),
      SelectedProject(
          title: 'FIKA',
          subtitle: 'Smart questionnaire tool for quick and accurate assessments',
          year: '2024',
          platform: 'Android, iOS',
          client: 'Infonet Global Tech',
          language: 'Dart, Flutter',
          logo: 'assets/images/fika/logo.png',
          imageList: fikaImage,
          description: descriptionFIKA
      ),
      SelectedProject(
          title: 'Gold Trading System',
          subtitle: 'A secure and efficient solution for gold trading',
          year: '2025',
          platform: 'Android, iOS',
          client: 'Pt. Jaya Mulia Permata',
          language: 'Dart, Flutter',
          logo: 'assets/images/gts/logo.png',
          imageList: gtsImage,
          description: descriptionGTS
      ),
      SelectedProject(
          title: 'Vehicle Tracking System',
          subtitle: 'Smart questionnaire tool for quick and accurate assessments',
          year: '2024',
          platform: 'Android, iOS',
          client: 'Infonet Global Tech',
          language: 'Dart, Flutter',
          logo: 'assets/images/vts/logo.jpg',
          imageList: vtsImage,
          description: descriptionGTS
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
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
              Icon(
                Icons.circle,
                color: greyTextColor,
                size: 16,
              ),
              SizedBox(width: 5),
              Text(
                'Projects',
                style: TextStyle(color: mainTextColor, fontSize: defaultFontSizeMed),
              ),
            ],
          ),
          SizedBox(height: screenHeight / 27),
          const Text(
            "Got a minute? Here are a few things I’ve built that I’m pretty proud of. Dive in and explore!",
            style: TextStyle(fontSize: kDefaultFontSize, color: mainTextColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: screenWidth,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listProject.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = listProject[index];
                  return Column(
                    children: [
                      MouseRegion(
                        onEnter: (_) => setState(() => data.isHover = true),
                        onExit: (_) => setState(() => data.isHover = false),
                        child: GestureDetector(
                          onTap: () {
                            widget.onSave(data);
                          },
                          child: AnimatedContainer(
                            width: screenWidth,
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: data.isHover
                                  ? [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 0,
                                        offset: const Offset(0, 0),
                                      )
                                    ]
                                  : [],
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: screenHeight / 25,
                                  backgroundColor: mainTextColor,
                                  backgroundImage: AssetImage(data.logo),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title,
                                        style: const TextStyle(color: mainTextColor, fontSize: defaultFontSize, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data.subtitle,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: mainTextColor,
                                          fontSize: defaultFontSizeSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: mainTextColor,
                                  size: screenHeight / 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  List<String> afcImage = [
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
}
