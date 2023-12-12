import 'package:flutter/material.dart';
import 'main.dart';

class Watermark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      right: 12,
      child: Text(
        '                      DEVELOPED BY: \n                     PRATIK N. DAGA \n                        9172661505',
        style: TextStyle(
          fontSize: 9,
          color: Colors.grey.withOpacity(0.9), // Adjust the opacity and color as needed
        ),
      ),
    );
  }
}
