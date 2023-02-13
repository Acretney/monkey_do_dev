import 'package:flutter/material.dart';
import 'package:website/constants.dart';

class HeaderWithText extends StatelessWidget {
  const HeaderWithText(
      {super.key,
      required this.header,
      required this.body,
      required this.bodyWidth});

  final String header;
  final String body;
  final double bodyWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              header,
              style: kBodyText.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: bodyWidth,
          child: Text(
            body,
            style: kShowcaseBodyText,
          ),
        ),
      ],
    );
  }
}
