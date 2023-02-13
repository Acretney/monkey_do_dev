import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:website/constants.dart';
import 'package:website/portfolio/buck_the_critics.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({
    super.key,
  });

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  int currentPage = 0;
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Text(
          'PrOjeCTS',
          style: kHeadlineText.copyWith(fontSize: 32),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: const WormEffect(activeDotColor: Colors.purple),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 900,
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              BackTheCriticsShowcasePage(),
            ],
          ),
        )
      ],
    );
  }
}
