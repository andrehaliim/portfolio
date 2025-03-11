import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactUI extends StatefulWidget {
  const ContactUI({super.key});

  @override
  State<ContactUI> createState() => _ContactUIState();
}

class _ContactUIState extends State<ContactUI> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  bool isloadingEmail = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.black,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Text(
            'Get in Touch',
            style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.01),
          ),
          Text(
            'Contact Me',
            style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.025, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          Container(
            width: screenWidth / 1.75,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Your Name',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      TextField(
                        controller: subjectController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Subject',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: messageController,
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: 'Type your message here...',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          Container(
            width: screenWidth / 10,
            height: screenHeight / 15,
            child: TextButton(
                onPressed: () async{
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
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: isloadingEmail ? CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4,
                ) : Text(
                  'SEND',
                  style: TextStyle(fontSize: screenWidth * 0.02, color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: screenHeight * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _infoItem(Icons.home_outlined, '20 Elang 1st Bandung, Indonesia 40184', screenWidth),
              SizedBox(width: screenWidth * 0.03),
              _infoItem(Icons.email_outlined, 'andrehaliimkurniawan@gmail.com', screenWidth),
              SizedBox(width: screenWidth * 0.03),
              _infoItem(Icons.phone_outlined, '+62 81222936333', screenWidth),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  html.window.open('https://www.linkedin.com/in/andrehaliim', '_blank');
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(25),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: Icon(
                  FontAwesomeIcons.linkedin,
                  color: Colors.white,
                  size: screenWidth * 0.03,
                ),
              ),
              SizedBox(width: screenWidth * 0.015),
              ElevatedButton(
                onPressed: () {
                  html.window.open('https://github.com/andrehaliim', '_blank');
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(25),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: Icon(
                  FontAwesomeIcons.github,
                  color: Colors.white,
                  size: screenWidth * 0.03,
                ),
              ),
              SizedBox(width: screenWidth * 0.015),
              ElevatedButton(
                onPressed: () {
                  html.window.open('https://www.instagram.com/andrehaliim', '_blank');
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(25),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                  size: screenWidth * 0.03,
                ),
              ),
              SizedBox(width: screenWidth * 0.015),
              ElevatedButton(
                onPressed: () {
                  html.window.open('https://open.spotify.com/user/andrehaliim', '_blank');
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(25),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: Icon(
                  FontAwesomeIcons.spotify,
                  color: Colors.white,
                  size: screenWidth * 0.03,
                ),
              ),
            ],
          ),
        ]));
  }

  void changeLoading() {
    setState(() {
      isloadingEmail = !isloadingEmail;
    });
  }

  Widget _infoItem(IconData icon, String text, double screenWidth) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: screenWidth * 0.025),
        SizedBox(width: screenWidth * 0.005),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.01,
          ),
        ),
      ],
    );
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

