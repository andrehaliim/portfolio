import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/constants.dart';

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
              const Text("Whether it’s work stuff or just a hello, feel free to reach out.", style: TextStyle(fontSize: kDefaultFontSize, color: mainTextColor),),
              const SizedBox(height: 10,),
              TextField(
                controller: nameController,
                style: const TextStyle(
                    color: greyTextColor
                ),
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: const TextStyle(
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
              const SizedBox(height: 10,),
              TextField(
                controller: emailController,
                style: const TextStyle(
                    color: greyTextColor
                ),
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: const TextStyle(
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
              const SizedBox(height: 10,),
              TextField(
                controller: subjectController,
                maxLines: 3,
                style: const TextStyle(
                    color: greyTextColor
                ),
                decoration: InputDecoration(
                  hintText: 'Subject',
                  hintStyle: const TextStyle(
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
              const SizedBox(height: 10,),
              TextField(
                controller: messageController,
                maxLines: 8,
                style: const TextStyle(
                    color: greyTextColor
                ),
                decoration: InputDecoration(
                  hintText: 'Type your message here...',
                  hintStyle: const TextStyle(
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
              const SizedBox(height: 10,),
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
                        ? const CircularProgressIndicator(color: mainTextColor,)
                        : const Text(
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