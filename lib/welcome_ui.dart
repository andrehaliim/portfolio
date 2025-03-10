import 'dart:typed_data';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeUI extends StatelessWidget {
  const WelcomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/profile.png',
                width: screenWidth * 0.3,
                height: screenWidth * 0.3,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hello! It's Me", style: TextStyle(fontSize: screenWidth * 0.02, color: Colors.white),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Andre ', style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold, color: Colors.white),),
                    Text('Haliim', style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("And i'm a ", style: TextStyle(fontSize: screenWidth * 0.02, color: Colors.white),),
                    Text('Software Engineer', style: TextStyle(fontSize: screenWidth * 0.02, color: Colors.blue[400], fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02,),
                TextButton(
                    onPressed: _downloadPdf,
                    style: ButtonStyle(
                        shape: WidgetStateProperty.resolveWith((state) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: Colors.white))),
                        padding: WidgetStateProperty.resolveWith((state) => EdgeInsets.all(10))
                    ),
                    child: Text(
                      'Download CV',
                      style: TextStyle(fontSize: screenWidth * 0.015, color: Colors.white),
                    )),
              ],
            ),
          ),
        ],
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
