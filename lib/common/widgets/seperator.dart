import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final double height;
  final String text;
  const Separator({Key? key, required this.height, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            if (text.isNotEmpty) ...[
              Text(
                text,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
              ),
              const SizedBox(width: 10)
            ],
            Expanded(
              child: Container(
                color: Colors.grey.withOpacity(0.3),
                height: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: height),
      ],
    );
  }
}
