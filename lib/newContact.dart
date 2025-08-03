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
                            'Follow Me',
                            style: TextStyle(color: mainTextColor, fontSize: defaultFontSizeMed),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight / 27),
                    const Spacer(),
                    const SocialMedia(
                      iconButton: FontAwesomeIcons.linkedin,
                      tapUrl: 'https://www.linkedin.com/in/andrehaliim',
                    ),
                    const SocialMedia(
                      iconButton: FontAwesomeIcons.github,
                      tapUrl: 'https://github.com/andrehaliim',
                    ),
                    const SocialMedia(
                      iconButton: FontAwesomeIcons.instagram,
                      tapUrl: 'https://www.instagram.com/andrehaliim',
                    ),
                    const SocialMedia(
                      iconButton: FontAwesomeIcons.spotify,
                      tapUrl: 'https://open.spotify.com/user/andrehaliim',
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
                            'Follow Me',
                            style: TextStyle(color: mainTextColor, fontSize: defaultFontSizeMed),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight / 27),
                    const Row(
                      children: [
                        SocialMedia(
                          iconButton: FontAwesomeIcons.linkedin,
                          tapUrl: 'https://www.linkedin.com/in/andrehaliim',
                        ),
                        SocialMedia(
                          iconButton: FontAwesomeIcons.github,
                          tapUrl: 'https://github.com/andrehaliim',
                        ),
                        SocialMedia(
                          iconButton: FontAwesomeIcons.instagram,
                          tapUrl: 'https://www.instagram.com/andrehaliim',
                        ),
                        SocialMedia(
                          iconButton: FontAwesomeIcons.spotify,
                          tapUrl: 'https://open.spotify.com/user/andrehaliim',
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
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Icon(
                  Icons.phone_outlined,
                  color: greyTextColor,
                  size: 16,
                ),
                const SizedBox(width: 10),
                SelectableText(
                  '+62 81222936333',
                  style: TextStyle(color: mainTextColor, fontSize: !isMobile ? defaultFontSize : defaultFontSizeSmall),
                ),
                if (isMobile) const Spacer(),
                if (isMobile)
                  GestureDetector(
                      onTap: () {
                        Clipboard.setData(const ClipboardData(text: '6281222936333'));
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
            size: 20,
          ),
        ),
      ),
    );
  }
}
