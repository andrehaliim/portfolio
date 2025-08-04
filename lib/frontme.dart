import 'package:flutter/material.dart';
import 'constants.dart';

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
        CircleAvatar(
          radius: screenHeight/8,
          backgroundImage: const AssetImage('assets/images/profile3.png'),
        ),
        SizedBox(height: screenHeight / 27),
        const Text("I'm Andre Haliim", style: TextStyle(fontSize: defaultFontSize + 15, color: mainTextColor, fontWeight: FontWeight.bold),),
        const Text('Software engineer from Bandung, ID',  style: TextStyle(fontSize: defaultFontSize, color: greyTextColor)),
        const Text('Currently working at Infonet Global Tech',  style: TextStyle(fontSize: defaultFontSize, color: greyTextColor)),
      ],
    );
  }
}