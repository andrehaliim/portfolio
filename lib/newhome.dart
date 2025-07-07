import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  bool isHoverHire = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          width: 600,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SingleChildScrollView(
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const FrontMe(),
                            SizedBox(height: screenHeight / 27),
                            MouseRegion(
                              onEnter: (_) => setState(() => isHoverHire = true),
                              onExit: (_) => setState(() => isHoverHire = false),
                              child: AnimatedContainer(
                                height: screenHeight/20,
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
                                    Icon(Icons.add_circle_outline, color: mainTextColor, size: 16,),
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
                            SizedBox(height: screenHeight / 27),
                            const AboutMe(),
                            SizedBox(height: screenHeight / 27),
                            const HireMe(),
                            SizedBox(height: screenHeight / 27),
                            const ContactInfo(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                isMobile
                    ? const NavigatorBarMobile()
                    : const NavigationBarDesktop()
              ],
            ),
          ),
        ),
      ),
      drawer: SizedBox(
        width: screenWidth/2,
        child: Drawer(
          backgroundColor: containerColor,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 32),
            children: [
              _buildDrawerItem(context, 'Home'),
              _buildDrawerItem(context, 'About'),
              _buildDrawerItem(context, 'Experience'),
              _buildDrawerItem(context, 'Projects'),
              _buildDrawerItem(context, 'Contact'),
            ],
          ),
        ),
      ),
    );
  }
}

class FrontMe extends StatefulWidget {
  const FrontMe({super.key});

  @override
  State<FrontMe> createState() => _FrontMeState();
}

class _FrontMeState extends State<FrontMe> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final screenWidth = size.width;
    final screenHeight = size.height;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF243b30),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 10,),
                  SizedBox(width: 5),
                  Text(
                    'AVAILABLE FOR WORK',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: defaultFontSize
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: screenHeight / 27),
        SizedBox(height: screenHeight / 27),
        const CircleAvatar(
          radius: 70,
          backgroundColor: mainTextColor,
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
        SizedBox(height: screenHeight / 27),
        const Text("I'm Andre Haliim", style: TextStyle(fontSize: defaultFontSize + 15, color: mainTextColor, fontWeight: FontWeight.bold),),
        const Text('Software engineer from Bandung, ID',  style: TextStyle(fontSize: defaultFontSize, color: greyTextColor)),
        const Text('Currently working at Infonet Global Tech',  style: TextStyle(fontSize: defaultFontSize, color: greyTextColor)),
      ],
    );
  }
}

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
            color: containerColor2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/profile2.jpg',
                fit: BoxFit.fill,
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
class HireMe extends StatefulWidget {
  const HireMe({super.key});

  @override
  State<HireMe> createState() => _HireMeState();
}

class _HireMeState extends State<HireMe> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  bool isloadingEmail = false;
  bool isHoverHire = false;
  @override
  Widget build(BuildContext context) {
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
                'Hire Me',
                style: TextStyle(
                    color: mainTextColor,
                    fontSize: defaultFontSizeMed
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight / 27),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Whether it’s work stuff or just a hello, feel free to reach out.", style: TextStyle(fontSize: kDefaultFontSize, color: mainTextColor),),
              SizedBox(height: 10,),
              TextField(
                controller: nameController,
                style: TextStyle(
                  color: greyTextColor
                ),
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: TextStyle(
                      color: greyTextColor
                  ),
                  filled: true,
                  fillColor: containerColor,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: emailController,
                style: TextStyle(
                    color: greyTextColor
                ),
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      color: greyTextColor
                  ),
                  filled: true,
                  fillColor: containerColor,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: subjectController,
                maxLines: 3,
                style: TextStyle(
                    color: greyTextColor
                ),
                decoration: InputDecoration(
                  hintText: 'Subject',
                  hintStyle: TextStyle(
                      color: greyTextColor
                  ),
                  filled: true,
                  fillColor: containerColor,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: messageController,
                maxLines: 8,
                style: TextStyle(
                    color: greyTextColor
                ),
                decoration: InputDecoration(
                  hintText: 'Type your message here...',
                  hintStyle: TextStyle(
                      color: greyTextColor
                  ),
                  filled: true,
                  fillColor: containerColor,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              MouseRegion(
                onEnter: (_) => setState(() => isHoverHire = true),
                onExit: (_) => setState(() => isHoverHire = false),
                child: GestureDetector(
                  onTap: () async {
                    if(nameController.text == '' && emailController.text == '' && subjectController.text == '' && messageController.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Center(child: Text('Please fill all the form!')),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      changeLoading();
                      bool send = await sendEmail();
                      changeLoading();
                      if(send){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Center(child: Text('Email Sent!')),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    }
                  },
                  child: AnimatedContainer(
                    height: screenHeight/20,
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
                    child: isloadingEmail
                        ? CircularProgressIndicator(color: mainTextColor,)
                        : Text(
                      'Submit',
                      style: TextStyle(
                        color: mainTextColor,
                        fontSize: defaultFontSize,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void changeLoading() {
    setState(() {
      isloadingEmail = !isloadingEmail;
    });
  }

  Future<bool> sendEmail() async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final body = jsonEncode({
      "service_id": "service_ve0zwa9",
      "template_id": "template_121bxgc",
      "user_id": "nq7U0FMyctqq5Bicq",
      "template_params": {
        "from_name" : nameController.text,
        "from_email": emailController.text,
        "subject": subjectController.text,
        "message": messageController.text
      }
    });

    try {
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        debugPrint('Success! Response: ${response.body}');
        nameController.clear();
        emailController.clear();
        subjectController.clear();
        messageController.clear();
        return true;
      } else {
        debugPrint('Failed with status: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      debugPrint('Error occurred: $e');
      return false;
    }
  }
}


class NavigationBarDesktop extends StatefulWidget {
  const NavigationBarDesktop({super.key});

  @override
  State<NavigationBarDesktop> createState() => _NavigationBarDesktopState();
}

class _NavigationBarDesktopState extends State<NavigationBarDesktop> {
  bool isHoverCV = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final screenWidth = size.width;
    final screenHeight = size.height;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: screenHeight / 12,
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: bgTextColor)
        ),
        child: Row(
          children: [
            const NavigationIcon(iconButton: Icons.home_outlined, iconText: 'Home',),
            const NavigationIcon(iconButton: Icons.person_outline, iconText: 'About',),
            const NavigationIcon(iconButton: Icons.work_outline, iconText: 'Experience',),
            const NavigationIcon(iconButton: Icons.build_circle_outlined, iconText: 'Project',),
            const NavigationIcon(iconButton: Icons.mail_outline, iconText: 'Contact',),
            const Spacer(),
            MouseRegion(
              onEnter: (_) => setState(() => isHoverCV = true),
              onExit: (_) => setState(() => isHoverCV = false),
              child: GestureDetector(
                onTap: _downloadPdf,
                child: AnimatedContainer(
                  height: screenHeight/20,
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: isHoverCV
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
                      Icon(Icons.download_outlined, color: mainTextColor, size: 16,),
                      SizedBox(width: 5),
                      Text(
                        'Download CV',
                        style: TextStyle(
                          color: mainTextColor,
                          fontSize: defaultFontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _downloadPdf() async {
    try {
      ByteData bytes = await rootBundle.load('assets/docs/curriculumvitae.pdf');
      Uint8List pdfBytes = bytes.buffer.asUint8List();

      final blob = html.Blob([pdfBytes]);

      final url = html.Url.createObjectUrlFromBlob(blob);

      html.AnchorElement(href: url)
        ..setAttribute("download", "Andre Curriculum Vitae.pdf")
        ..click();

      html.Url.revokeObjectUrl(url);
    } catch (e) {
      debugPrint('Error downloading PDF: $e');
    }
  }
}

class NavigatorBarMobile extends StatefulWidget {
  const NavigatorBarMobile({super.key});

  @override
  State<NavigatorBarMobile> createState() => _NavigatorBarMobileState();
}

class _NavigatorBarMobileState extends State<NavigatorBarMobile> {
  bool isHoverCV = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final screenWidth = size.width;
    final screenHeight = size.height;
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: screenHeight / 12,
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: bgTextColor)
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu, color: mainTextColor),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            const Spacer(),
            const Spacer(),
            MouseRegion(
              onEnter: (_) => setState(() => isHoverCV = true),
              onExit: (_) => setState(() => isHoverCV = false),
              child: AnimatedContainer(
                height: screenHeight/20,
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: isHoverCV
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
                    Icon(Icons.download_outlined, color: mainTextColor, size: 16,),
                    SizedBox(width: 5),
                    Text(
                      'Download CV',
                      style: TextStyle(
                        color: mainTextColor,
                        fontSize: defaultFontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget _buildDrawerItem(BuildContext context, String title) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 18),
    ),
    onTap: () {
      Navigator.of(context).pop(); // Trigger scroll
    },
  );
}

class NavigationIcon extends StatefulWidget {
  final IconData iconButton;
  final String iconText;
  const NavigationIcon({super.key, required this.iconButton, required this.iconText});

  @override
  _NavigationIconState createState() => _NavigationIconState();
}

class _NavigationIconState extends State<NavigationIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      margin: const EdgeInsets.only(top: 10),
      message: widget.iconText,
      decoration: BoxDecoration(
        color: bgTextColor,
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(color: Colors.white),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: _isHovered ? bgTextColor : containerColor,
              shape: BoxShape.circle
          ),
          alignment: Alignment.center,
          child: Icon(
            widget.iconButton,
            color: _isHovered ? mainTextColor : bgTextColor,
            size: 32,
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  bool isHoverCopyEmail = false;
  bool isHoverCopyPhone = false;

  @override
  Widget build(BuildContext context) {
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
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: const Row(
                  children: [
                    Icon(Icons.circle, color: greyTextColor, size: 10,),
                    SizedBox(width: 5),
                    Text(
                      'Follow Me',
                      style: TextStyle(
                          color: mainTextColor,
                          fontSize: defaultFontSize
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const SocialMedia(iconButton: FontAwesomeIcons.linkedin, tapUrl: 'https://www.linkedin.com/in/andrehaliim',),
              const SocialMedia(iconButton: FontAwesomeIcons.github, tapUrl: 'https://github.com/andrehaliim',),
              const SocialMedia(iconButton: FontAwesomeIcons.instagram, tapUrl: 'https://www.instagram.com/andrehaliim',),
              const SocialMedia(iconButton: FontAwesomeIcons.spotify, tapUrl: 'https://open.spotify.com/user/andrehaliim',),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Row(
              children: [
                Icon(Icons.email_outlined, color: greyTextColor, size: 16,),
                SizedBox(width: 10),
                SelectableText(
                  'andrehaliimkurniawan@gmail.com',
                  style: TextStyle(
                      color: mainTextColor,
                      fontSize: defaultFontSize
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Row(
              children: [
                Icon(Icons.phone_outlined, color: greyTextColor, size: 16,),
                SizedBox(width: 10),
                SelectableText(
                  '+62 81222936333',
                  style: TextStyle(
                      color: mainTextColor,
                      fontSize: defaultFontSize
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SocialMedia extends StatefulWidget {
  final IconData iconButton;
  final String tapUrl;
  const SocialMedia({super.key, required this.iconButton, required this.tapUrl});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: (){
          html.window.open(widget.tapUrl, '_blank');
        },
        child: AnimatedContainer(
          margin: const EdgeInsets.only(left: 5, right: 5),
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: _isHovered ? bgTextColor : containerColor,
              shape: BoxShape.circle
          ),
          alignment: Alignment.center,
          child: Icon(
            widget.iconButton,
            color: _isHovered ? mainTextColor : bgTextColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}



