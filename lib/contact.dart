import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    final isMobile = screenWidth < 600;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: containerColor2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          !isMobile
              ? Row(
                  children: [
                    SizedBox(height: screenHeight / 27),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: greyTextColor,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Find Me',
                            style: TextStyle(color: mainTextColor, fontSize: defaultFontSizeMed),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight / 27),
                    const Spacer(),
                    const SocialMedia(
                      iconButton: FontAwesomeIcons.whatsapp,
                      tapUrl: 'https://wa.me/6281222936333?text=Hi%20Andre%2C%20I%20came%20across%20your%20portfolio%20website%20and%20would%20like%20to%20work%20with%20you.',
                      isMobile: false,
                    ),
                    const SocialMedia(
                      iconButton: FontAwesomeIcons.linkedin,
                      tapUrl: 'https://www.linkedin.com/in/andrehaliim',
                      isMobile: false,
                    ),
                    const SocialMedia(
                      iconButton: FontAwesomeIcons.github,
                      tapUrl: 'https://github.com/andrehaliim',
                      isMobile: false,
                    ),
                    const SocialMedia(
                      iconButton: FontAwesomeIcons.instagram,
                      tapUrl: 'https://www.instagram.com/andrehaliim',
                      isMobile: false,
                    ),
                    const SocialMedia(
                      iconButton: FontAwesomeIcons.spotify,
                      tapUrl: 'https://open.spotify.com/user/andrehaliim',
                      isMobile: false,
                    ),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(height: screenHeight / 27),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: greyTextColor,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Find Me',
                            style: TextStyle(color: mainTextColor, fontSize: defaultFontSizeMed),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight / 27),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialMedia(
                          iconButton: FontAwesomeIcons.whatsapp,
                          tapUrl: 'https://wa.me/6281222936333?text=Hi%20Andre%2C%20I%20came%20across%20your%20portfolio%20website%20and%20would%20like%20to%20work%20with%20you.',
                          isMobile: true,
                        ),
                        SocialMedia(
                          iconButton: FontAwesomeIcons.linkedin,
                          tapUrl: 'https://www.linkedin.com/in/andrehaliim',
                          isMobile: true,
                        ),
                        SocialMedia(
                          iconButton: FontAwesomeIcons.github,
                          tapUrl: 'https://github.com/andrehaliim',
                          isMobile: true,
                        ),
                        SocialMedia(
                          iconButton: FontAwesomeIcons.instagram,
                          tapUrl: 'https://www.instagram.com/andrehaliim',
                          isMobile: true,
                        ),
                        SocialMedia(
                          iconButton: FontAwesomeIcons.spotify,
                          tapUrl: 'https://open.spotify.com/user/andrehaliim',
                          isMobile: true,
                        ),
                      ],
                    ),
                  ],
                ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Icon(
                  Icons.email_outlined,
                  color: greyTextColor,
                  size: 16,
                ),
                const SizedBox(width: 10),
                SelectableText(
                  'andrehaliimkurniawan@gmail.com',
                  style: TextStyle(color: mainTextColor, fontSize: !isMobile ? defaultFontSize : defaultFontSizeSmall),
                ),
                if (isMobile) const Spacer(),
                if (isMobile)
                  GestureDetector(
                      onTap: () {
                        Clipboard.setData(const ClipboardData(text: 'andrehaliimkurniawan@gmail.com'));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Copied to clipboard!"), backgroundColor: containerColor2, duration: Duration(seconds: 2),),
                        );
                      },
                      child: const Icon(
                        Icons.copy,
                        size: defaultFontSize,
                        color: mainTextColor,
                      ))
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
  final bool isMobile;
  const SocialMedia({super.key, required this.iconButton, required this.tapUrl, required this.isMobile});

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
        onTap: () {
          html.window.open(widget.tapUrl, '_blank');
        },
        child: AnimatedContainer(
          margin: const EdgeInsets.only(left: 5, right: 5),
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: _isHovered ? bgTextColor : containerColor, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Icon(
            widget.iconButton,
            color: _isHovered ? mainTextColor : bgTextColor,
            size: widget.isMobile ? 30 : 20,
          ),
        ),
      ),
    );
  }
}
