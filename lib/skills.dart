import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  List<String> skillImages = [
    'assets/images/skills/flutter.png',
    'assets/images/skills/javascript.png',
    'assets/images/skills/kotlin.png',
    'assets/images/skills/swift.png',
    'assets/images/skills/vuejs.png',
    'assets/images/skills/nodejs.png',
    'assets/images/skills/php.png',
    'assets/images/skills/mysql.png',
    'assets/images/skills/figma.png',
    'assets/images/skills/office.png',
  ];

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
              Icon(
                Icons.circle,
                color: greyTextColor,
                size: 16,
              ),
              SizedBox(width: 5),
              Text(
                'Skills',
                style: TextStyle(color: mainTextColor, fontSize: defaultFontSizeMed),
              ),
            ],
          ),
          SizedBox(height: screenHeight / 27),
          const Text(
            "As a software engineer, I enjoy working across the stack."
                " Below are some of the tools and skills I use to build functional and polished apps.",
            style: TextStyle(fontSize: kDefaultFontSize, color: mainTextColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(skillImages.length, (index) {
                final imagePath = skillImages[index];
                final skillName = imagePath
                    .split('/')
                    .last
                    .split('.')
                    .first;

                return _SkillItem(imagePath: imagePath, skillName: skillName);
              }),
            ),

          )
        ],
      ),
    );
  }
}

class _SkillItem extends StatefulWidget {
  final String imagePath;
  final String skillName;

  const _SkillItem({
    required this.imagePath,
    required this.skillName,
  });

  @override
  State<_SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<_SkillItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            widget.imagePath,
            fit: BoxFit.contain,
            height: 50,
          ),
          if (isHovered)
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: backgroundColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.skillName.toUpperCase(),
                style: const TextStyle(
                  color: mainTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: kDefaultFontSize
                ),
              ),
            ),
        ],
      ),
    );
  }
}

