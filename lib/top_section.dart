import 'package:flutter/material.dart';
import 'package:website/constants.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('images/TopSectionGraphic.png'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'PROJECTS',
                      style: kAppBarHeaderText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'MY STORY',
                      style: kAppBarHeaderText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('CONTACT', style: kAppBarHeaderText),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text("I'm Alex. I will turn your app\nidea into reality",
                  style: kHeadlineTextWhite),
              const SizedBox(height: 28),
              SizedBox(
                width: 480,
                child: Text(
                    'For a couple years now I have been knee deep in the software engineering equivalent of hydraulic fluid, smashing blocks of code with my (similarly metaphorical) spanner into configurations that make cool things happen on mobile and the web.',
                    style: kBodyTextWhite),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: 400,
                child: Text(
                    'When people ask me what I do, I say, I imagine cool stuff then make that stuff happen by solving puzzles all day! And I think I’ve turned out to be pretty good at it!',
                    style: kBodyTextWhite),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: 320,
                child: Text(
                    'What I’m bad at is anything relating to marketing… which is why this web copy is so bad.',
                    style: kBodyTextWhite),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
