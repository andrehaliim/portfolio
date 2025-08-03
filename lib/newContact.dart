import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants.dart';
import 'dart:html' as html;

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
    //final size = MediaQuery.of(context).size;
    //final screenWidth = size.width;
    //final screenHeight = size.height;

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
                    Icon(Icons.circle, color: greyTextColor, size: 16,),
                    SizedBox(width: 5),
                    Text(
                      'Follow Me',
                      style: TextStyle(
                          color: mainTextColor,
                          fontSize: defaultFontSizeMed
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