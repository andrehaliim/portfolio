import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/newAbout.dart';
import 'package:portfolio/newContact.dart';
import 'package:portfolio/newHire.dart';
import 'package:portfolio/newMe.dart';
import 'package:portfolio/newNavigation.dart';
import 'package:portfolio/newProjects.dart';
import 'package:portfolio/project_detail.dart';
import 'package:portfolio/selectedProject.dart';

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  bool isHoverHire = false;
  SelectedProject? project;
  final ScrollController _scrollController = ScrollController();

  final frontKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final hireMeKey = GlobalKey();
  final contactKey = GlobalKey();

  void navigationTap(int key) {
    setState(() {
      project = null;
    });

    switch (key) {
      case 0:
        return scrollToTop();
      case 1:
        return onTapNavigation(aboutKey);
      case 2:
        return onTapNavigation(projectsKey);
      case 3:
        return onTapNavigation(hireMeKey);
      default:
        return onTapNavigation(contactKey);
    }
  }

  void onTapNavigation(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }


  Widget _buildDrawerItem(BuildContext context, String title, int tap) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: () {
        navigationTap(tap);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 600,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                project == null
                    ? Container(
                      margin: EdgeInsets.only(top : screenHeight/12),
                      child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration:
                                  BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(8), border: Border.all(color: bgTextColor)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const FrontMe(),//class1
                                  SizedBox(height: screenHeight / 27),
                                  MouseRegion(
                                    onEnter: (_) => setState(() => isHoverHire = true),
                                    onExit: (_) => setState(() => isHoverHire = false),
                                    child: AnimatedContainer(
                                      height: screenHeight / 20,
                                      duration: const Duration(milliseconds: 200),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: buttonColor,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: isHoverHire
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
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_circle_outline,
                                            color: mainTextColor,
                                            size: 16,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'Hire Me',
                                            style: TextStyle(
                                              color: mainTextColor,
                                              fontSize: defaultFontSize,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(key: aboutKey, child: SizedBox(height: screenHeight / 27),),//class2
                                  const AboutMe(),//class2
                                  Container(key: projectsKey, child: SizedBox(height: screenHeight / 27),),//class2
                                  Projects(onSave: selectProject),//class3
                                  Container(key: hireMeKey, child: SizedBox(height: screenHeight / 27),),//class2
                                  const HireMe(),//class4
                                  SizedBox(height: screenHeight / 27),
                                  const ContactInfo(),
                                ],
                              ),
                            ),
                          ],
                        )),
                    )
                    : ProjectDetail(selectedProject: project!),
                isMobile ? const NavigatorBarMobile() : NavigationBarDesktop(onTap: navigationTap)
              ],
            ),
          ),
        ),
      ),
      drawer: SizedBox(
        width: screenWidth / 2,
        child: Drawer(
          backgroundColor: containerColor,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 32),
            children: [
              _buildDrawerItem(context, 'Home', 0),
              _buildDrawerItem(context, 'About', 1),
              //_buildDrawerItem(context, 'Experience'),
              _buildDrawerItem(context, 'Projects', 2),
              _buildDrawerItem(context, 'Contact', 3),
            ],
          ),
        ),
      ),
    );
  }

  void selectProject(SelectedProject projects) {
    setState(() {
      project = projects;
    });
  }
}
