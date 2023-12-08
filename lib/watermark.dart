import 'package:flutter/material.dart';
import 'main.dart';

class Watermark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 20,
      child: Text(
        'DEVELOPED BY PRATIK NARESHKUMAR DAGA | 9172661505',
        style: TextStyle(
          fontSize: 9,
          color: Colors.grey.withOpacity(0.5), // Adjust the opacity and color as needed
        ),
      ),
    );
  }
}
