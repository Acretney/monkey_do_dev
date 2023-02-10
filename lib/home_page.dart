import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:website/constants.dart';
import 'package:website/top_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          width: 1140,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TopSection(),
                MyWorkSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyWorkSection extends StatefulWidget {
  MyWorkSection({
    super.key,
  });

  @override
  State<MyWorkSection> createState() => _MyWorkSectionState();
}

class _MyWorkSectionState extends State<MyWorkSection> {
  int currentPage = 0;
  final pageController = PageController(initialPage: 0);

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
              BackTheCriticsShowcasePage(),
            ],
          ),
        )
      ],
    );
  }
}

enum BuckTheCriticsSlide {
  initial,
  addReviews,
  calculatedScores,
  trustedFriends,
  browseArchive1,
  browseArchive2,
  bonusFeature,
}

class BackTheCriticsShowcasePage extends StatefulWidget {
  const BackTheCriticsShowcasePage({super.key});

  @override
  State<BackTheCriticsShowcasePage> createState() =>
      _BackTheCriticsShowcasePageState();
}

class _BackTheCriticsShowcasePageState
    extends State<BackTheCriticsShowcasePage> {
  int currentSlide = 0;
  var slide = BuckTheCriticsSlide.initial;

  void nextSlide() {
    if (currentSlide == 6) {
      currentSlide = 0;
    } else {
      currentSlide++;
    }
    setState(() {
      slide = BuckTheCriticsSlide.values[currentSlide];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Buck the Critics',
          style: GoogleFonts.poppins(
            color: Colors.grey.shade800,
            fontSize: 120,
            fontWeight: FontWeight.w700,
            height: 1.1,
          ),
        ),
        Text(
          'A social app for sharing movie reviews\nDispense with the cooler chat. Trust the numbers',
          style: GoogleFonts.poppins(fontSize: 20, height: 0.8),
        ),
        const SizedBox(height: 24),
        Stack(
          children: [
            Container(
              width: 1140,
              height: 620,
              decoration: const BoxDecoration(color: Colors.amber),
            ),
            // * SLIDE 1
            SizedBox(
              width: 280,
              child: Image.asset(
                'images/my_work/buck_the_critics/sl1_movie.png',
              )
                  .animate()
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
                  'images/my_work/buck_the_critics/sl1-2_quick_review.png',
                )
                    .animate()
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
                  'images/my_work/buck_the_critics/sl1-6_eagle_view.png',
                )
                    .animate()
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
                  'images/my_work/buck_the_critics/sl1_manage_friends.png',
                )
                    .animate()
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
            // * SLIDE 2
            Positioned(
              left: 60,
              bottom: -120,
              child: SizedBox(
                  width: 280,
                  child: Image.asset(
                    'images/my_work/buck_the_critics/sl2_search.png',
                  )
                      .animate(
                          target:
                              slide == BuckTheCriticsSlide.addReviews ? 1 : 0)
                      .slideY(
                        delay: 200.ms,
                        begin: 1,
                        duration: 200.ms,
                        curve: Curves.easeIn,
                      )),
            ),
            Positioned(
              left: 100,
              top: 200,
              child: Text(
                'Search yon movie!',
                style: kBodyText.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              )
                  .animate(
                      target: slide == BuckTheCriticsSlide.addReviews ? 1 : 0)
                  .fadeIn(delay: 400.ms)
                  .animate(onPlay: (controller) => controller.repeat())
                  .shakeY(hz: 1, duration: 2000.ms, amount: 2),
            ),
            Positioned(
              left: 340,
              top: 0,
              child: SizedBox(
                width: 280,
                child: Image.asset(
                  'images/my_work/buck_the_critics/sl2_long_review.png',
                )
                    .animate(
                        target: slide == BuckTheCriticsSlide.addReviews ? 1 : 0)
                    .slideY(
                      delay: 600.ms,
                      begin: -1,
                      duration: 200.ms,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            Positioned(
              left: 400,
              bottom: 88,
              child: Text(
                'Give it a rating',
                style: kBodyText.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              )
                  .animate(
                      target: slide == BuckTheCriticsSlide.addReviews ? 1 : 0)
                  .fadeIn(delay: 700.ms)
                  .animate(onPlay: (controller) => controller.repeat())
                  .shake(hz: 1, duration: 2000.ms, rotation: 0.02),
            ),

            Positioned(
              left: 620,
              top: 262,
              child: Text(
                'Feeling\nopinionated?\nWrite a review!',
                style: kBodyText.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              )
                  .animate(
                      target: slide == BuckTheCriticsSlide.addReviews ? 1 : 0)
                  .fadeIn(delay: 800.ms)
                  .animate(onPlay: (controller) => controller.repeat())
                  .shakeX(hz: 1, duration: 2000.ms),
            ),
            Positioned(
              left: 552,
              top: 240,
              child: Transform.scale(
                scaleX: -1,
                child: Lottie.asset(
                  'animations/black_animated_arrow.json',
                  width: 88,
                ),
              )
                  .animate(
                      target: slide == BuckTheCriticsSlide.addReviews ? 1 : 0)
                  .fadeIn(delay: 800.ms),
            ),

            Positioned(
              right: 80,
              top: 60,
              child: Text(
                'Or smash out some\nquickies!',
                style: kBodyText.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              )
                  .animate(
                      target: slide == BuckTheCriticsSlide.addReviews ? 1 : 0)
                  .fadeIn(delay: 1100.ms)
                  .animate(onPlay: (controller) => controller.repeat())
                  .shake(hz: 1, duration: 2000.ms, rotation: 0.02),
            ),
            Positioned(
              right: 40,
              bottom: 0,
              child: SizedBox(
                width: 280,
                child: Image.asset(
                  'images/my_work/buck_the_critics/sl1-2_quick_review.png',
                )
                    .animate(
                        target: slide == BuckTheCriticsSlide.addReviews ? 1 : 0)
                    .slideX(
                      begin: 1.2,
                      delay: 1000.ms,
                      duration: 200.ms,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            // * SLIDE 3
            slide == BuckTheCriticsSlide.calculatedScores
                ? Positioned(
                    left: 40,
                    top: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Meanwhile...',
                          style: kBodyText.copyWith(fontSize: 20),
                        )
                            .animate(
                                target: slide ==
                                        BuckTheCriticsSlide.calculatedScores
                                    ? 1
                                    : 0)
                            .fadeIn(delay: 400.ms),
                        const SizedBox(height: 60),
                        SizedBox(
                          width: 220,
                          child: Text(
                            'Your friends reviews will be served to your library!',
                            style: kBodyText.copyWith(fontSize: 20),
                          )
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.calculatedScores
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 600.ms),
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 240,
                          child: Text(
                            'The supra-funky\nbuck-o-matic analyser 3000 will do its work and provide you a calculated rating.',
                            style: kBodyText.copyWith(fontSize: 20),
                          )
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.calculatedScores
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 800.ms),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            Positioned(
              top: 40,
              left: 260,
              child: SizedBox(
                width: 280,
                child: Image.asset(
                  'images/my_work/buck_the_critics/sl3_good_rating.png',
                )
                    .animate(
                        target: slide == BuckTheCriticsSlide.calculatedScores
                            ? 1
                            : 0)
                    .slideX(
                      begin: -3,
                      delay: 100.ms,
                      duration: 200.ms,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            const Positioned(
              left: 560,
              top: 40,
              child: HeaderWithText(
                  header: 'Good',
                  body:
                      'Buck-O-Matic noticed you and your friend have rated movies of the same genres in the past',
                  bodyWidth: 320),
            )
                .animate(
                    target:
                        slide == BuckTheCriticsSlide.calculatedScores ? 1 : 0)
                .fadeIn(delay: 1000.ms),
            Positioned(
              top: 190,
              left: 380,
              child: SizedBox(
                width: 320,
                child: Image.asset(
                  'images/my_work/buck_the_critics/sl3_better_rating.png',
                )
                    .animate(
                        target: slide == BuckTheCriticsSlide.calculatedScores
                            ? 1
                            : 0)
                    .slideX(
                      begin: -3,
                      delay: 200.ms,
                      duration: 200.ms,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            const Positioned(
              left: 720,
              top: 192,
              child: HeaderWithText(
                  header: 'Better!',
                  body:
                      'Buck-O-Matic noticed you’ve both rated movies with the same director in the past. ',
                  bodyWidth: 320),
            )
                .animate(
                    target:
                        slide == BuckTheCriticsSlide.calculatedScores ? 1 : 0)
                .fadeIn(delay: 1200.ms),
            Positioned(
              top: 360,
              left: 340,
              child: SizedBox(
                width: 420,
                child: Image.asset(
                  'images/my_work/buck_the_critics/sl3_best_rating.png',
                )
                    .animate(
                        target: slide == BuckTheCriticsSlide.calculatedScores
                            ? 1
                            : 0)
                    .slideX(
                      begin: -3,
                      delay: 300.ms,
                      duration: 200.ms,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            const Positioned(
              left: 780,
              top: 362,
              child: HeaderWithText(
                  header: 'Best!!',
                  body:
                      'Congratulations, you have more than one friend!\nNow we can do a super accurate calculation with maths stuff like averages and weightings',
                  bodyWidth: 280),
            )
                .animate(
                    target:
                        slide == BuckTheCriticsSlide.calculatedScores ? 1 : 0)
                .fadeIn(delay: 1400.ms),
            // * SLIDE 4
            Positioned(
              left: 40,
              top: 80,
              child: SizedBox(
                width: 200,
                child: Text(
                  'Buck-o-matic calculates a ‘trust’ score for each of your friends based on a super-advanced algorithm',
                  style: kBodyText.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.trustedFriends ? 1 : 0)
                    .fadeIn(delay: 400.ms),
              ),
            ),
            Positioned(
              left: 40,
              top: 340,
              child: SizedBox(
                width: 200,
                child: Text(
                  'A HISTORY OF SIMILAR RATINGS',
                  style: kBodyText.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 22, height: 1),
                  textAlign: TextAlign.center,
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.trustedFriends ? 1 : 0)
                    .fadeIn(delay: 600.ms),
              ),
            ),
            Positioned(
              left: 40,
              top: 400,
              child: SizedBox(
                width: 200,
                child: Text(
                  'MEANS',
                  style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.trustedFriends ? 1 : 0)
                    .fadeIn(delay: 700.ms),
              ),
            ),
            Positioned(
              left: 40,
              top: 460,
              child: SizedBox(
                width: 200,
                child: Text(
                  'HIGHER TRUST',
                  style: kBodyText.copyWith(
                      fontWeight: FontWeight.w800, fontSize: 32, height: 1),
                  textAlign: TextAlign.center,
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.trustedFriends ? 1 : 0)
                    .fadeIn(delay: 800.ms)
                    .scaleXY(begin: 0, end: 1.2)
                    .shake()
                    .then()
                    .scaleXY(begin: 1.2, end: 1),
              ),
            ),
            Positioned(
              top: 40,
              left: 300,
              child: SizedBox(
                width: 240,
                child: Image.asset(
                  'images/my_work/buck_the_critics/sl4_friend.png',
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.trustedFriends ? 1 : 0)
                    .slideY(
                      delay: 200.ms,
                      begin: -1.5,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            slide == BuckTheCriticsSlide.trustedFriends
                ? Positioned(
                    left: 640,
                    top: 100,
                    child: SizedBox(
                      width: 280,
                      child: Text(
                        'Friends with higher trust add more weighting to calculated scores!',
                        style: kBodyText.copyWith(fontSize: 20),
                        textAlign: TextAlign.center,
                      )
                          .animate(
                              target:
                                  slide == BuckTheCriticsSlide.trustedFriends
                                      ? 1
                                      : 0)
                          .fadeIn(delay: 1200.ms)
                          .fadeOut(delay: 3800.ms),
                    ),
                  )
                : const SizedBox.shrink(),
            slide == BuckTheCriticsSlide.trustedFriends
                ? Positioned(
                    top: 200,
                    left: 640,
                    child: SizedBox(
                        width: 280,
                        child: Image.asset(
                          'images/my_work/buck_the_critics/sl4_calculated_result.png',
                        )
                            .animate(
                                target:
                                    slide == BuckTheCriticsSlide.trustedFriends
                                        ? 1
                                        : 0)
                            .scaleXY(
                                delay: 1100.ms,
                                begin: 0,
                                end: 1.2,
                                duration: 100.ms)
                            .then()
                            .scaleXY(begin: 1, end: 0.8)
                            .fadeOut(delay: 3800.ms)

                        // .fadeOut(delay: 3800.ms),
                        ),
                  )
                : const SizedBox.shrink(),
            slide == BuckTheCriticsSlide.trustedFriends
                ? Positioned(
                    left: 512,
                    top: 368,
                    child: SizedBox(
                      width: 280,
                      child: Text(
                        'Low\nWeighting',
                        style: kBodyText,
                        textAlign: TextAlign.center,
                      )
                          .animate(
                              target:
                                  slide == BuckTheCriticsSlide.trustedFriends
                                      ? 1
                                      : 0)
                          .fadeIn(delay: 1300.ms)
                          .fadeOut(delay: 3800.ms),
                    ),
                  )
                : const SizedBox.shrink(),
            slide == BuckTheCriticsSlide.trustedFriends
                ? Positioned(
                    left: 620,
                    top: 368,
                    child: SizedBox(
                      width: 280,
                      child: Text(
                        'Medium\nWeighting',
                        style: kBodyText.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      )
                          .animate(
                              target:
                                  slide == BuckTheCriticsSlide.trustedFriends
                                      ? 1
                                      : 0)
                          .fadeIn(delay: 1500.ms)
                          .fadeOut(delay: 3700.ms),
                    ),
                  )
                : const SizedBox.shrink(),
            slide == BuckTheCriticsSlide.trustedFriends
                ? Positioned(
                    left: 740,
                    top: 368,
                    child: SizedBox(
                      width: 280,
                      child: Text(
                        'Many\nWeighting!!',
                        style: kBodyText.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      )
                          .animate(
                              target:
                                  slide == BuckTheCriticsSlide.trustedFriends
                                      ? 1
                                      : 0)
                          .fadeIn(delay: 1600.ms)
                          .fadeOut(delay: 3600.ms),
                    ),
                  )
                : const SizedBox.shrink(),
            Positioned(
              top: 40,
              left: 580,
              child: SizedBox(
                width: 240,
                child: Image.asset(
                  'images/my_work/buck_the_critics/sl4_friends_list.png',
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.trustedFriends ? 1 : 0)
                    .slideY(
                      delay: 4000.ms,
                      begin: 1.5,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            Positioned(
              left: 840,
              top: 200,
              child: SizedBox(
                  width: 200,
                  child: Column(
                    children: [
                      Text(
                        'Tired of judging movies? Judge your friends!',
                        style: kBodyText.copyWith(fontSize: 20),
                        textAlign: TextAlign.center,
                      )
                          .animate(
                              target:
                                  slide == BuckTheCriticsSlide.trustedFriends
                                      ? 1
                                      : 0)
                          .fadeIn(delay: 4400.ms),
                      const SizedBox(height: 40),
                      Text(
                        'JUDGE YOUR FRIENDS',
                        style: kBodyText.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.2),
                        textAlign: TextAlign.center,
                      )
                          .animate(
                              target:
                                  slide == BuckTheCriticsSlide.trustedFriends
                                      ? 1
                                      : 0)
                          .fadeIn(delay: 4800.ms)
                          .scaleXY(end: 1.5)
                          .shake()
                          .shimmer(delay: 5200.ms),
                    ],
                  )),
            ),
            // * SLIDE 5
            Positioned(
              top: 40,
              left: 80,
              child: SizedBox(
                width: 240,
                child: Image.asset(
                  'images/my_work/buck_the_critics/sl5_home_screen.png',
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.browseArchive1 ? 1 : 0)
                    .slideX(
                      delay: 100.ms,
                      begin: -1.5,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            Positioned(
              left: 360,
              top: 172,
              child: SizedBox(
                  width: 180,
                  child: Text(
                    'Featured movies and top picks! See what your friends think is hot right now!',
                    style: kBodyText,
                  )
                      .animate(
                          target: slide == BuckTheCriticsSlide.browseArchive1
                              ? 1
                              : 0)
                      .fadeIn(delay: 300.ms)),
            ),
            Positioned(
              left: 380,
              top: 300,
              child: SizedBox(
                  width: 200,
                  child: Text(
                    "See their recent activity! What have they been watching?",
                    style: kBodyText,
                  )
                      .animate(
                          target: slide == BuckTheCriticsSlide.browseArchive1
                              ? 1
                              : 0)
                      .fadeIn(delay: 400.ms)),
            ),
            Positioned(
              left: 400,
              top: 400,
              child: SizedBox(
                  width: 200,
                  child: Text(
                    "Any gems?... Or is this time saved watching total trash",
                    style: kBodyText,
                  )
                      .animate(
                          target: slide == BuckTheCriticsSlide.browseArchive1
                              ? 1
                              : 0)
                      .fadeIn(delay: 500.ms)),
            ),
            Positioned(
              top: -248,
              right: 120,
              child: SizedBox(
                width: 300,
                child: Image.asset(
                  'images/my_work/buck_the_critics/sl5_movie_timeline.png',
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.browseArchive1 ? 1 : 0)
                    .slideY(
                      delay: 300.ms,
                      begin: -1.5,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            Positioned(
              right: 180,
              top: 460,
              child: SizedBox(
                  width: 200,
                  child: Text(
                    "Curious about a specific movie? See the full review history!!!",
                    style: kBodyText,
                    textAlign: TextAlign.center,
                  )
                      .animate(
                          target: slide == BuckTheCriticsSlide.browseArchive1
                              ? 1
                              : 0)
                      .fadeIn(delay: 500.ms)),
            ),
            // * Slide 6
            Positioned(
              left: 260,
              top: 24,
              child: Text(
                "Stuck for inspiration? Browse your catalog for something to watch!",
                style: kBodyText.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              )
                  .animate(
                      target:
                          slide == BuckTheCriticsSlide.browseArchive2 ? 1 : 0)
                  .fadeIn(delay: 200.ms),
            ),
            Positioned(
              top: 80,
              left: 200,
              child: SizedBox(
                width: 260,
                child: Image.asset(
                  'images/my_work/buck_the_critics/sl1-6_eagle_view.png',
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.browseArchive2 ? 1 : 0)
                    .scaleXY(
                      delay: 100.ms,
                      begin: 0,
                      end: 1.2,
                      curve: Curves.easeInOut,
                    )
                    .then()
                    .scaleXY(end: 0.85),
              ),
            ),
            Positioned(
              top: 52,
              left: 420,
              child: SizedBox(
                width: 280,
                child: Image.asset(
                  'images/my_work/buck_the_critics/sl1-6_eagle_view.png',
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.browseArchive2 ? 1 : 0)
                    .scaleXY(
                      delay: 300.ms,
                      begin: 0,
                      end: 1.2,
                      curve: Curves.easeInOut,
                    )
                    .then()
                    .scaleXY(end: 0.85),
              ),
            ),
            Positioned(
              top: 80,
              left: 660,
              child: SizedBox(
                width: 260,
                child: Image.asset(
                  'images/my_work/buck_the_critics/sl1-6_eagle_view.png',
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.browseArchive2 ? 1 : 0)
                    .scaleXY(
                      delay: 200.ms,
                      begin: 0,
                      end: 1.2,
                      curve: Curves.easeInOut,
                    )
                    .then()
                    .scaleXY(end: 0.85),
              ),
            ),
            Positioned(
              left: 400,
              bottom: 20,
              child: Text(
                "...you can even filter it and stuff!",
                style: kBodyText.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              )
                  .animate(
                      target:
                          slide == BuckTheCriticsSlide.browseArchive2 ? 1 : 0)
                  .fadeIn(delay: 2000.ms),
            ),
            // * SLIDE 7

            slide == BuckTheCriticsSlide.bonusFeature
                ? Positioned(
                    height: 620,
                    width: 1140,
                    child: Center(
                      child: Text(
                        "SPECIAL\nBONUS FEATURE",
                        style: kBodyText.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1),
                        textAlign: TextAlign.center,
                      )
                          .animate(
                              target: slide == BuckTheCriticsSlide.bonusFeature
                                  ? 1
                                  : 0)
                          .fadeIn()
                          .scaleXY(
                              begin: 1,
                              end: 10,
                              duration: 2500.ms,
                              curve: Curves.easeInExpo)
                          .shakeX(hz: 50, amount: 2)
                          .fadeOut(),
                    ),
                  )
                : const SizedBox.shrink(),
            slide == BuckTheCriticsSlide.bonusFeature
                ? Positioned(
                    height: 620,
                    width: 1140,
                    child: Center(
                      child: Text(
                        "AND THIS IS\nMIND BLOWING",
                        style: kBodyText.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1),
                        textAlign: TextAlign.center,
                      )
                          .animate(
                              target: slide == BuckTheCriticsSlide.bonusFeature
                                  ? 1
                                  : 0)
                          .fadeIn()
                          .scaleXY(
                              delay: 2500.ms,
                              begin: 0,
                              end: 10,
                              duration: 2500.ms,
                              curve: Curves.easeInExpo)
                          .shakeY(hz: 50, amount: 2)
                          .fadeOut(),
                    ),
                  )
                : const SizedBox.shrink(),
            slide == BuckTheCriticsSlide.bonusFeature
                ? Positioned(
                    height: 620,
                    width: 1140,
                    child: Center(
                      child: Text(
                        "SERIOUSLY, BRACE YOURSELF",
                        style: kBodyText.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )
                          .animate(
                              target: slide == BuckTheCriticsSlide.bonusFeature
                                  ? 1
                                  : 0)
                          .fadeIn()
                          .scaleXY(
                              delay: 5000.ms,
                              begin: 0,
                              end: 10,
                              duration: 1500.ms,
                              curve: Curves.easeInExpo)
                          .shakeX(hz: 50, amount: 2)
                          .fadeOut(),
                    ),
                  )
                : const SizedBox.shrink(),
            slide == BuckTheCriticsSlide.bonusFeature
                ? Positioned(
                    height: 620,
                    width: 1140,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "IT WORKS WITH",
                          style: kBodyText.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1),
                          textAlign: TextAlign.center,
                        )
                            .animate(
                                target:
                                    slide == BuckTheCriticsSlide.bonusFeature
                                        ? 1
                                        : 0)
                            .slideX(delay: 7800.ms, end: -6),
                        const SizedBox(height: 8),
                        Text(
                          "TV SERIES TOO!!!",
                          style: kBodyText.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1),
                          textAlign: TextAlign.center,
                        )
                            .animate(
                                target:
                                    slide == BuckTheCriticsSlide.bonusFeature
                                        ? 1
                                        : 0)
                            .slideX(delay: 7800.ms, end: 6),
                      ],
                    )
                            .animate(
                                target:
                                    slide == BuckTheCriticsSlide.bonusFeature
                                        ? 1
                                        : 0)
                            .fadeIn()
                            .scaleXY(
                                delay: 6500.ms,
                                begin: 0,
                                end: 4,
                                duration: 500.ms,
                                curve: Curves.easeInExpo)
                            .shake(delay: 6800.ms)),
                  )
                : const SizedBox.shrink(),
            Positioned(
              top: -120,
              left: -80,
              child: SizedBox(
                width: 540,
                child: Image.asset(
                  'images/my_work/buck_the_critics/sl1_movie.png',
                  fit: BoxFit.cover,
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.bonusFeature ? 1 : 0)
                    .fadeIn(delay: 8000.ms, duration: 1.ms),
              ),
            ),
            Positioned(
              left: 440,
              top: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BUCK",
                    style: GoogleFonts.poppins(
                      fontSize: 120,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate(
                          target:
                              slide == BuckTheCriticsSlide.bonusFeature ? 1 : 0)
                      .fadeIn(delay: 8000.ms, duration: 1.ms),
                  const SizedBox(height: 8),
                  Text(
                    "THE",
                    style: GoogleFonts.poppins(
                      fontSize: 120,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate(
                          target:
                              slide == BuckTheCriticsSlide.bonusFeature ? 1 : 0)
                      .fadeIn(delay: 9000.ms, duration: 1.ms),
                  const SizedBox(height: 8),
                  Text(
                    "CRITICS",
                    style: GoogleFonts.poppins(
                      fontSize: 120,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate(
                          target:
                              slide == BuckTheCriticsSlide.bonusFeature ? 1 : 0)
                      .fadeIn(delay: 10000.ms, duration: 1.ms),
                  Text(
                    "Available soon on Android and IOS stores",
                    style: kBodyText,
                    textAlign: TextAlign.center,
                  )
                      .animate(
                          target:
                              slide == BuckTheCriticsSlide.bonusFeature ? 1 : 0)
                      .fadeIn(delay: 11000.ms),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            nextSlide();
          },
          child: const Text('PROCEED'),
        )
      ],
    );
  }
}

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
        Text(
          header,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: bodyWidth,
          child: Text(
            body,
            style: kBodyText.copyWith(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

class AppDescriptionSection extends StatelessWidget {
  const AppDescriptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

// class BuckTheCriticsShowcase extends StatefulWidget {
//   const BuckTheCriticsShowcase({
//     super.key,
//   });

//   @override
//   State<BuckTheCriticsShowcase> createState() => _BuckTheCriticsShowcaseState();
// }

// class _BuckTheCriticsShowcaseState extends State<BuckTheCriticsShowcase> {
// int currentSlideIndex = 0;
// var slide = BuckTheCriticsSlide.initial;

// void nextSlide() {
//   if (currentSlideIndex == 4) {
//     currentSlideIndex = 0;
//   } else {
//     currentSlideIndex++;
//   }
//   setState(() {
//     slide = BuckTheCriticsSlide.values[currentSlideIndex];
//     print('CURRENT SLIDE: $slide');
//   });
// }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
// Stack(
//   children: [
//     SizedBox(
//       width: 280,
//       child: Image.asset(
//         'images/my_work/buck_the_critics/MovieScreen.png',
//       )
//           .animate(
//             adapter: ScrollAdapter(widget.scrollController,
//                 begin: 200, animated: true),
//           )
//           .slideY(
//             begin: 0.5,
//             duration: 200.ms,
//             curve: Curves.easeIn,
//           )
//           .animate(target: slide != BuckTheCriticsSlide.initial ? 1 : 0)
//           .slideX(end: -2),
//     ),
//     Positioned(
//       left: 280,
//       top: 40,
//       child: SizedBox(
//         width: 280,
//         child: Image.asset(
//           'images/my_work/buck_the_critics/QuickReviewScreen.png',
//         )
//             .animate(
//                 adapter: ScrollAdapter(widget.scrollController,
//                     begin: 200, animated: true))
//             .slideY(
//               delay: 100.ms,
//               begin: 0.5,
//               duration: 200.ms,
//               curve: Curves.easeIn,
//             )
//             .animate(
//                 target: slide != BuckTheCriticsSlide.initial ? 1 : 0)
//             .slideY(end: -2),
//       ),
//     ),
//     Positioned(
//       left: 560,
//       top: 80,
//       child: SizedBox(
//         width: 280,
//         child: Image.asset(
//           'images/my_work/buck_the_critics/EagleViewScreen.png',
//         )
//             .animate(
//                 adapter: ScrollAdapter(widget.scrollController,
//                     begin: 200, animated: true))
//             .slideY(
//               delay: 200.ms,
//               begin: 0.5,
//               duration: 200.ms,
//               curve: Curves.easeIn,
//             )
//             .animate(
//                 target: slide != BuckTheCriticsSlide.initial ? 1 : 0)
//             .slideY(end: 2),
//       ),
//     ),
//     Positioned(
//       left: 840,
//       top: 120,
//       child: SizedBox(
//         width: 280,
//         child: Image.asset(
//           'images/my_work/buck_the_critics/ManageFriendsScreen.png',
//         )
//             .animate(
//                 adapter: ScrollAdapter(widget.scrollController,
//                     begin: 200, animated: true))
//             .slideY(
//               delay: 300.ms,
//               begin: 0.5,
//               duration: 200.ms,
//               curve: Curves.easeIn,
//             )
//             .animate(
//                 target: slide != BuckTheCriticsSlide.initial ? 1 : 0)
//             .slideX(end: 2),
//       ),
//     ),
//   ],
// ),
//         ElevatedButton(
//             onPressed: () {
//               nextSlide();
//             },
//             child: Text('PROCEED'))
//       ],
//     );
//   }
// }
