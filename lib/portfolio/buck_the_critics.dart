import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:website/constants.dart';
import 'package:website/widgets/header_with_text.dart';

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

  void previousSlide() {
    if (currentSlide == 0) {
      currentSlide = 6;
    } else {
      currentSlide--;
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
          'A social app for sharing movie reviews',
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
                'Search yon MOVIE',
                style: kShowcaseBodyText,
              )
                  .animate(
                      target: slide == BuckTheCriticsSlide.addReviews ? 1 : 0)
                  .fadeIn(delay: 200.ms)
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
                      delay: 200.ms,
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
                'Give it a RATING',
                style: kShowcaseBodyText,
              )
                  .animate(
                      target: slide == BuckTheCriticsSlide.addReviews ? 1 : 0)
                  .fadeIn(delay: 200.ms)
                  .animate(onPlay: (controller) => controller.repeat())
                  .shake(hz: 1, duration: 2000.ms, rotation: 0.02),
            ),
            Positioned(
              left: 608,
              top: 262,
              child: Text(
                'Feeling\nopinionated?\nWrite a REVIEW',
                textAlign: TextAlign.center,
                style: kShowcaseBodyText,
              )
                  .animate(
                      target: slide == BuckTheCriticsSlide.addReviews ? 1 : 0)
                  .fadeIn(delay: 200.ms)
                  .animate(onPlay: (controller) => controller.repeat())
                  .shakeX(hz: 1, duration: 2000.ms, amount: 1),
            ),
            Positioned(
              left: 548,
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
                  .fadeIn(delay: 200.ms),
            ),

            Positioned(
              right: 80,
              top: 60,
              child: Text(
                'Or smash out some\nQUICKIES',
                style: kShowcaseBodyText,
                textAlign: TextAlign.center,
              )
                  .animate(
                      target: slide == BuckTheCriticsSlide.addReviews ? 1 : 0)
                  .fadeIn(delay: 200.ms)
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
                      delay: 200.ms,
                      duration: 200.ms,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            // * SLIDE 3
            slide == BuckTheCriticsSlide.calculatedScores
                ? Positioned(
                    left: 40,
                    top: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Meanwhile...', style: kShowcaseBodyText)
                            .animate(
                                target: slide ==
                                        BuckTheCriticsSlide.calculatedScores
                                    ? 1
                                    : 0)
                            .fadeIn(delay: 500.ms)
                            .animate(
                                onPlay: (controller) =>
                                    controller.loop(count: 2))
                            .shakeX(hz: 1, duration: 2000.ms),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 260,
                          child: AnimatedTextKit(
                            pause: 700.ms,
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TyperAnimatedText('', speed: 0.ms),
                              TyperAnimatedText(
                                  'Your friends reviews will be served to your library',
                                  textStyle: kShowcaseBodyText,
                                  speed: 20.ms)
                            ],
                          )
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.calculatedScores
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 500.ms),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 240,
                          child: Text(
                            'the...',
                            style: kShowcaseBodyText,
                          )
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.calculatedScores
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 2000.ms),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 240,
                          child: Text(
                            'supra-funky',
                            style: kShowcaseBodyText.copyWith(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.calculatedScores
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 2500.ms)
                              .shakeX(hz: 5, duration: 2500.ms, amount: 2),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 240,
                          child: Text('BUCK-O-MATIC™',
                                  style: kShowcaseDisplayText.copyWith(
                                      fontSize: 24))
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.calculatedScores
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 3500.ms)
                              .shakeY(hz: 5, duration: 1500.ms, amount: 2),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: 240,
                          child: Text('ANALYZER 3000',
                                  style: kShowcaseDisplayText.copyWith(
                                      fontSize: 30))
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.calculatedScores
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 4500.ms)
                              .scaleXY(begin: 1, end: 1.2)
                              .shake()
                              .then()
                              .scaleXY(begin: 1, end: ((1 / 120) * 100)),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 240,
                          child: Text(
                            '...will go to work and calculated a rating',
                            style: kShowcaseBodyText,
                          )
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.calculatedScores
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 5000.ms),
                        ),
                        Row(
                          children: [
                            Text(
                              'BESPOKE ',
                              style: kShowcaseBodyText,
                            )
                                .animate(
                                    target: slide ==
                                            BuckTheCriticsSlide.calculatedScores
                                        ? 1
                                        : 0)
                                .fadeIn(delay: 5300.ms, duration: 1.ms),
                            Text(
                              'TO ',
                              style: kShowcaseBodyText.copyWith(fontSize: 26),
                            )
                                .animate(
                                    target: slide ==
                                            BuckTheCriticsSlide.calculatedScores
                                        ? 1
                                        : 0)
                                .fadeIn(delay: 4700.ms, duration: 1.ms),
                            Text(
                              'YOU',
                              style: kShowcaseBodyText.copyWith(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            )
                                .animate(
                                    target: slide ==
                                            BuckTheCriticsSlide.calculatedScores
                                        ? 1
                                        : 0)
                                .fadeIn(delay: 5200.ms, duration: 1.ms)
                                .shake(duration: 200.ms),
                          ],
                        )
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
                      delay: 5500.ms,
                      duration: 200.ms,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            const Positioned(
              left: 560,
              top: 40,
              child: HeaderWithText(
                  header: 'GOOD',
                  body: 'BUCK-O-MATIC™ score based on genre review history',
                  bodyWidth: 400),
            )
                .animate(
                    target:
                        slide == BuckTheCriticsSlide.calculatedScores ? 1 : 0)
                .fadeIn(delay: 5700.ms),
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
                      delay: 5700.ms,
                      duration: 200.ms,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            const Positioned(
              left: 720,
              top: 192,
              child: HeaderWithText(
                  header: 'BETTER',
                  body: 'BUCK-O-MATIC™ score based on director review history',
                  bodyWidth: 320),
            )
                .animate(
                    target:
                        slide == BuckTheCriticsSlide.calculatedScores ? 1 : 0)
                .fadeIn(delay: 5900.ms),
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
                      delay: 5900.ms,
                      duration: 200.ms,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            Positioned(
              left: 780,
              top: 362,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderWithText(
                      header: 'BEST',
                      body:
                          'BUCK-O-MATIC™ congratulates you for having more than one friend!',
                      bodyWidth: 320),
                  const SizedBox(height: 8),
                  Text('Fancy calculation mode...', style: kShowcaseBodyText),
                  const SizedBox(height: 8),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                        'WEIGHTINGS ',
                        style: kShowcaseBodyText.copyWith(
                            fontWeight: FontWeight.bold),
                      )
                          .animate(
                              target:
                                  slide == BuckTheCriticsSlide.calculatedScores
                                      ? 1
                                      : 0)
                          .fadeIn(delay: 6500.ms, duration: 1.ms),
                      Positioned(
                        left: 132,
                        child: Text(
                          'AVERAGES ',
                          style: kShowcaseBodyText.copyWith(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        )
                            .animate(
                                target: slide ==
                                        BuckTheCriticsSlide.calculatedScores
                                    ? 1
                                    : 0)
                            .fadeIn(delay: 7000.ms, duration: 1.ms),
                      ),
                      // .fadeOut(delay: 7499.ms, duration: 1.ms),
                      Positioned(
                        top: 18,
                        child: Text(
                          'MAGIC',
                          style: kShowcaseBodyText.copyWith(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        )
                            .animate(
                                target: slide ==
                                        BuckTheCriticsSlide.calculatedScores
                                    ? 1
                                    : 0)
                            .fadeIn(delay: 7500.ms, duration: 1.ms)
                            .shake(duration: 200.ms),
                      ),
                    ],
                  ),
                ],
              ),
            )
                .animate(
                    target:
                        slide == BuckTheCriticsSlide.calculatedScores ? 1 : 0)
                .fadeIn(delay: 6100.ms),
            // * SLIDE 4
            Positioned(
              left: 40,
              top: 80,
              child: SizedBox(
                width: 228,
                child: Text(
                  'BUCK-O-MATIC™ calculates a ‘trust’ score for each of your friends based on a super-advanced algorithm',
                  style: kShowcaseBodyText,
                  textAlign: TextAlign.center,
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.trustedFriends ? 1 : 0)
                    .fadeIn(delay: 500.ms),
              ),
            ),
            Positioned(
              left: 40,
              top: 300,
              child: SizedBox(
                width: 228,
                child: Text(
                  'A HISTORY OF SIMILAR RATINGS',
                  style: kShowcaseDisplayText.copyWith(fontSize: 22, height: 1),
                  textAlign: TextAlign.center,
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.trustedFriends ? 1 : 0)
                    .fadeIn(delay: 1500.ms)
                    .animate(onPlay: (controller) => controller.loop(count: 2))
                    .shakeY(hz: 1, duration: 2000.ms),
              ),
            ),
            Positioned(
              left: 40,
              top: 360,
              child: SizedBox(
                width: 228,
                child: Text(
                  'means',
                  style: kShowcaseBodyText,
                  textAlign: TextAlign.center,
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.trustedFriends ? 1 : 0)
                    .fadeIn(delay: 2500.ms),
              ),
            ),
            Positioned(
              left: 40,
              top: 408,
              child: SizedBox(
                width: 228,
                child: Text(
                  'HIGHER\nTRUST',
                  style: kShowcaseDisplayText.copyWith(
                      fontWeight: FontWeight.w900, fontSize: 30),
                  textAlign: TextAlign.center,
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.trustedFriends ? 1 : 0)
                    .fadeIn(delay: 3500.ms)
                    .scaleXY(begin: 0, end: 1.2)
                    .shake()
                    .then()
                    .scaleXY(begin: 1.2, end: 1),
              ),
            ),
            slide == BuckTheCriticsSlide.trustedFriends
                ? Positioned(
                    top: 40,
                    left: 300,
                    child: SizedBox(
                      width: 240,
                      child: Image.asset(
                        'images/my_work/buck_the_critics/sl4_friend.png',
                      )
                          .animate(
                              target:
                                  slide == BuckTheCriticsSlide.trustedFriends
                                      ? 1
                                      : 0)
                          .slideY(
                              delay: 200.ms,
                              begin: -1.1,
                              curve: Curves.easeInQuad,
                              duration: 3500.ms)
                          .shake(rotation: 0.02),
                    ),
                  )
                : const SizedBox.shrink(),
            slide == BuckTheCriticsSlide.trustedFriends
                ? Positioned(
                    left: 640,
                    top: 100,
                    child: SizedBox(
                      width: 280,
                      child: Text(
                        'Friends with higher trust add more weighting to calculated scores!',
                        style: kShowcaseBodyText,
                        textAlign: TextAlign.center,
                      )
                          .animate(
                              target:
                                  slide == BuckTheCriticsSlide.trustedFriends
                                      ? 1
                                      : 0)
                          .fadeIn(delay: 4500.ms)
                          .fadeOut(delay: 7500.ms),
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
                                delay: 4500.ms,
                                begin: 0,
                                end: 1.2,
                                duration: 100.ms)
                            .then()
                            .scaleXY(begin: 1, end: 0.8)
                            .fadeOut(delay: 7500.ms)

                        // .fadeOut(delay: 3800.ms),
                        ),
                  )
                : const SizedBox.shrink(),
            slide == BuckTheCriticsSlide.trustedFriends
                ? Positioned(
                    left: 600,
                    top: 368,
                    child: Row(
                      children: [
                        Text(
                          'Low\nWeighting',
                          style: kShowcaseBodyText,
                          textAlign: TextAlign.center,
                        )
                            .animate(
                                target:
                                    slide == BuckTheCriticsSlide.trustedFriends
                                        ? 1
                                        : 0)
                            .fadeIn(delay: 5000.ms)
                            .fadeOut(delay: 7500.ms),
                        const SizedBox(width: 20),
                        Text(
                          'Medium\nWeighting',
                          style: kShowcaseBodyText.copyWith(fontSize: 22),
                          textAlign: TextAlign.center,
                        )
                            .animate(
                                target:
                                    slide == BuckTheCriticsSlide.trustedFriends
                                        ? 1
                                        : 0)
                            .fadeIn(delay: 5500.ms)
                            .fadeOut(delay: 7500.ms),
                        const SizedBox(width: 20),
                        Text(
                          'Many\nWeighting!!',
                          style: kShowcaseBodyText.copyWith(fontSize: 26),
                          textAlign: TextAlign.center,
                        )
                            .animate(
                                target:
                                    slide == BuckTheCriticsSlide.trustedFriends
                                        ? 1
                                        : 0)
                            .fadeIn(delay: 6000.ms)
                            .fadeOut(delay: 7500.ms),
                      ],
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
                      delay: 7800.ms,
                      begin: 1.5,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            slide == BuckTheCriticsSlide.trustedFriends
                ? Positioned(
                    left: 840,
                    top: 200,
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          Text(
                            'Tired of judging movies?',
                            style: kShowcaseBodyText,
                            textAlign: TextAlign.center,
                          )
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.trustedFriends
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 8200.ms),
                          const SizedBox(height: 40),
                          Text(
                            'JUDGE\nYOUR\nFRIENDS',
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w900, fontSize: 26),
                            textAlign: TextAlign.center,
                          )
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.trustedFriends
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 8400.ms)
                              .scaleXY(end: 1.5)
                              .shake()
                              .shimmer(delay: 9400.ms),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
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
            slide == BuckTheCriticsSlide.browseArchive1
                ? Positioned(
                    left: 360,
                    top: 48,
                    child: SizedBox(
                      width: 220,
                      child: Column(
                        children: [
                          Text(
                            'Featured movies and top picks! See what your friends think is hot right now!',
                            style: kShowcaseBodyText,
                          )
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.browseArchive1
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 200.ms),
                          const SizedBox(height: 32),
                          Text(
                            "See their recent activity! What have they been watching?",
                            style: kShowcaseBodyText,
                          )
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.browseArchive1
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 300.ms),
                          const SizedBox(height: 32),
                          Text(
                            "Any gems?... Or maybe trash to be avoided?",
                            style: kShowcaseBodyText,
                          )
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.browseArchive1
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 400.ms),
                          const SizedBox(height: 20),
                          Text(
                            "Think of the time you'll save...",
                            style: kShowcaseBodyText,
                          )
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.browseArchive1
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 500.ms),
                          const SizedBox(height: 4),
                          Text(
                            "  You could take up...",
                            style: kShowcaseBodyText,
                          )
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.browseArchive1
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 600.ms),
                          const SizedBox(height: 4),
                          Text(
                            "    CROQUET!!!",
                            style: kShowcaseDisplayText.copyWith(fontSize: 26),
                          )
                              .animate(
                                  target: slide ==
                                          BuckTheCriticsSlide.browseArchive1
                                      ? 1
                                      : 0)
                              .fadeIn(delay: 700.ms)
                              .scaleXY(begin: 1, end: 1.2)
                              .shake()
                              .then()
                              .scaleXY(begin: 1.2, end: 1),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Positioned(
              top: -240,
              right: 160,
              child: SizedBox(
                width: 300,
                child: Image.asset(
                  'images/my_work/buck_the_critics/sl5_movie_timeline.png',
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.browseArchive1 ? 1 : 0)
                    .slideY(
                      delay: 200.ms,
                      begin: -1.5,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
            Positioned(
              top: 460,
              right: 160,
              child: SizedBox(
                width: 300,
                child: Text(
                  "Curious about a specific movie? See the full review history!!!",
                  style: kShowcaseBodyText,
                  textAlign: TextAlign.center,
                )
                    .animate(
                        target:
                            slide == BuckTheCriticsSlide.browseArchive1 ? 1 : 0)
                    .fadeIn(delay: 300.ms)
                    .animate(onPlay: (controller) => controller.repeat())
                    .shakeX(hz: 1, duration: 2000.ms),
              ),
            ),

            // * Slide 6
            Positioned(
              left: 260,
              top: 24,
              child: Text(
                "Stuck for inspiration? Browse your catalog for something to watch!",
                style: kShowcaseBodyText,
                textAlign: TextAlign.center,
              )
                  .animate(
                      target:
                          slide == BuckTheCriticsSlide.browseArchive2 ? 1 : 0)
                  .fadeIn(delay: 200.ms),
            ),
            Positioned(
              top: 80,
              left: 160,
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
                    .scaleXY(end: 0.85)
                    .animate(onPlay: (controller) => controller.repeat())
                    .shakeY(hz: 1, duration: 2000.ms),
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
                    .scaleXY(end: 0.85)
                    .animate(onPlay: (controller) => controller.repeat())
                    .shake(hz: 2, duration: 2000.ms, rotation: 0.02),
              ),
            ),
            Positioned(
              top: 80,
              left: 700,
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
                    .scaleXY(end: 0.85)
                    .animate(onPlay: (controller) => controller.repeat())
                    .shakeX(hz: 1, duration: 2000.ms),
              ),
            ),
            Positioned(
              left: 400,
              bottom: 20,
              child: Row(
                children: [
                  Text(
                    "...you",
                    style: kShowcaseBodyText,
                    textAlign: TextAlign.center,
                  )
                      .animate(
                          target: slide == BuckTheCriticsSlide.browseArchive2
                              ? 1
                              : 0)
                      .fadeIn(delay: 1000.ms, duration: 1.ms),
                  Text(
                    " can",
                    style: kShowcaseBodyText,
                    textAlign: TextAlign.center,
                  )
                      .animate(
                          target: slide == BuckTheCriticsSlide.browseArchive2
                              ? 1
                              : 0)
                      .fadeIn(delay: 1200.ms, duration: 1.ms),
                  Text(
                    " even",
                    style: kShowcaseBodyText,
                    textAlign: TextAlign.center,
                  )
                      .animate(
                          target: slide == BuckTheCriticsSlide.browseArchive2
                              ? 1
                              : 0)
                      .fadeIn(delay: 1400.ms, duration: 1.ms),
                  Text(
                    " FILTER IT",
                    style: kShowcaseBodyText.copyWith(
                        fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                      .animate(
                          target: slide == BuckTheCriticsSlide.browseArchive2
                              ? 1
                              : 0)
                      .fadeIn(delay: 1800.ms, duration: 1.ms)
                      .shake(duration: 200.ms),
                  Text(
                    " and",
                    style: kShowcaseBodyText,
                    textAlign: TextAlign.center,
                  )
                      .animate(
                          target: slide == BuckTheCriticsSlide.browseArchive2
                              ? 1
                              : 0)
                      .fadeIn(delay: 2200.ms, duration: 1.ms),
                  Text(
                    " STUFF",
                    style: kShowcaseBodyText.copyWith(
                        fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                      .animate(
                          target: slide == BuckTheCriticsSlide.browseArchive2
                              ? 1
                              : 0)
                      .fadeIn(delay: 2400.ms, duration: 1.ms),
                ],
              ),
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
                              begin: 0,
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
                        "SERIOUSLY,\nBRACE YOURSELF",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                previousSlide();
              },
              child: const Text('BACK'),
            ),
            ElevatedButton(
              onPressed: () {
                nextSlide();
              },
              child: const Text('FORWARD'),
            ),
          ],
        )
      ],
    );
  }
}
