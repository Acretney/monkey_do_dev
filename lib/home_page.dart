import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:website/constants.dart';
import 'package:website/top_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();

  // GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          width: 1140,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                const TopSection(),
                MyWorkSection(scrollController: scrollController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyWorkSection extends StatelessWidget {
  MyWorkSection({
    super.key,
    required this.scrollController,
  });

  final pageController = PageController();
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Text(
          'Projects',
          style: kHeadlineText,
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
          height: 1200,
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  Text(
                    'Buck The Critics',
                    style: GoogleFonts.poppins(
                        color: Colors.grey.shade800,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'A social app for sharing movie reviews',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                  const SizedBox(height: 24),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 440),
                    child: Column(
                      children: [
                        Text(
                          'Honestly who cares what the critics think nowadays?',
                          style: kBodyText,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'A film may well be lauded for its deft handling of the exploration of self, but does that mean you’re going to like it? Almost certainly not!',
                          style: kBodyText,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'You’ve no doubt had chats with your friends over which of the endless sea of content is worth watching. You probably trust some friends more than others. But what if you could quantify their recommendations into dirty, filthy numbers?',
                          style: kBodyText,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                  Stack(),
                  BuckTheCriticsShowcase(scrollController: scrollController),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

enum BuckTheCriticsSlide {
  initial,
  addReview,
  calculatedScore,
  viewFriends,
  browse
}

class BuckTheCriticsShowcase extends StatefulWidget {
  const BuckTheCriticsShowcase({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<BuckTheCriticsShowcase> createState() => _BuckTheCriticsShowcaseState();
}

class _BuckTheCriticsShowcaseState extends State<BuckTheCriticsShowcase> {
  int currentSlideIndex = 0;
  var slide = BuckTheCriticsSlide.initial;

  void nextSlide() {
    if (currentSlideIndex == 4) {
      currentSlideIndex = 0;
    } else {
      currentSlideIndex++;
    }
    setState(() {
      slide = BuckTheCriticsSlide.values[currentSlideIndex];
      print('CURRENT SLIDE: $slide');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              'images/ShowcaseBackground.png',
            ),
            SizedBox(
              width: 280,
              child: Image.asset(
                'images/my_work/buck_the_critics/MovieScreen.png',
              )
                  .animate(
                    adapter: ScrollAdapter(widget.scrollController,
                        begin: 200, animated: true),
                  )
                  .slideY(
                    begin: 0.5,
                    duration: 200.ms,
                    curve: Curves.easeIn,
                  )
                  .animate(target: slide != BuckTheCriticsSlide.initial ? 1 : 0)
                  .slideX(end: -2),
            ),
            Positioned(
              left: 280,
              top: 40,
              child: SizedBox(
                width: 280,
                child: Image.asset(
                  'images/my_work/buck_the_critics/QuickReviewScreen.png',
                )
                    .animate(
                        adapter: ScrollAdapter(widget.scrollController,
                            begin: 200, animated: true))
                    .slideY(
                      delay: 100.ms,
                      begin: 0.5,
                      duration: 200.ms,
                      curve: Curves.easeIn,
                    )
                    .animate(
                        target: slide != BuckTheCriticsSlide.initial ? 1 : 0)
                    .slideY(end: -2),
              ),
            ),
            Positioned(
              left: 560,
              top: 80,
              child: SizedBox(
                width: 280,
                child: Image.asset(
                  'images/my_work/buck_the_critics/EagleViewScreen.png',
                )
                    .animate(
                        adapter: ScrollAdapter(widget.scrollController,
                            begin: 200, animated: true))
                    .slideY(
                      delay: 200.ms,
                      begin: 0.5,
                      duration: 200.ms,
                      curve: Curves.easeIn,
                    )
                    .animate(
                        target: slide != BuckTheCriticsSlide.initial ? 1 : 0)
                    .slideY(end: 2),
              ),
            ),
            Positioned(
              left: 840,
              top: 120,
              child: SizedBox(
                width: 280,
                child: Image.asset(
                  'images/my_work/buck_the_critics/ManageFriendsScreen.png',
                )
                    .animate(
                        adapter: ScrollAdapter(widget.scrollController,
                            begin: 200, animated: true))
                    .slideY(
                      delay: 300.ms,
                      begin: 0.5,
                      duration: 200.ms,
                      curve: Curves.easeIn,
                    )
                    .animate(
                        target: slide != BuckTheCriticsSlide.initial ? 1 : 0)
                    .slideX(end: 2),
              ),
            ),
          ],
        ),
        ElevatedButton(
            onPressed: () {
              nextSlide();
            },
            child: Text('PROCEED'))
      ],
    );
  }
}
