import 'package:flutter/material.dart';
import 'package:website/constants.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('images/BottomNoGradient.png'),
        Positioned(
          bottom: 12,
          right: 20,
          child: Text(
            'PRIVACY POLICY',
            style: kAppBarHeaderText,
          ),
        )
      ],
    );
  }
}
