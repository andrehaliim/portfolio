import 'package:flutter/material.dart';
import 'package:portfolio/navbar.dart';

class HomePageUI extends StatefulWidget {
  const HomePageUI({super.key});

  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Scaffold(
      appBar: NavBar(),
      backgroundColor: Colors.black,
      body:  Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome to my Portfolio!', style: TextStyle(fontSize: kDefaultFontSize, color: Colors.white),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Andre ', style: TextStyle(fontSize: kDefaultFontSize + 5, fontWeight: FontWeight.bold, color: Colors.white),),
                    Text('Haliim', style: TextStyle(fontSize: kDefaultFontSize + 5, color: Colors.white),)
                  ],
                ),
                Text('Im an Software Engineer', style: TextStyle(fontSize: kDefaultFontSize + 5, fontWeight: FontWeight.bold, color: Colors.white),)
              ],
            ),
            SizedBox(width: 20,),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.grey,
                    BlendMode.saturation,
                  ),
                  child: Image.asset(
                      'assets/images/photo.jpeg',
                  )),
            )
          ],
        ),
      ),
    );
  }
}
