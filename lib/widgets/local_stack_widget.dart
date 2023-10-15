import 'package:flutter/material.dart';

class LocalStack extends StatelessWidget {
  final String imgUrl;
  final String centerText;

  const LocalStack({
    super.key,
    required this.imgUrl,
    required this.centerText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Stack(
        children: <Widget>[
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.purple, // 테두리 색상
                width: 3.0, // 테두리 두께
              ),
            ),
            child: ClipOval(
              child: Image.network(imgUrl),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Text(
                centerText,
                style: const TextStyle(
                  color: Colors.white, // 텍스트 색상
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
