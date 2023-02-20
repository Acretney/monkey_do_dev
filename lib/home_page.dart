import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:website/bottom_section.dart';
import 'package:website/constants.dart';
import 'package:website/portfolio/buck_the_critics.dart';
import 'package:website/projects_section.dart';
import 'package:website/top_section.dart';
import 'package:website/widgets/header_with_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();

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
                TopSection(),
                ProjectsSection(),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: -400,
                      width: 400,
                      child: SizedBox(
                        width: 400,
                        child: Opacity(
                          opacity: 0.4,
                          child: Image.asset(
                            'images/giant_striding.png',
                            fit: BoxFit.cover,
                          )
                              .animate(
                                  adapter: ScrollAdapter(scrollController,
                                      begin: 600))
                              .scaleXY(begin: 1, end: 1.4)
                              .saturate(begin: -1, end: 2)
                              .blur(begin: const Offset(5, 5), end: Offset.zero)
                              .slideX(begin: -0.2),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 240,
                      right: 200,
                      child: SizedBox(
                        width: 140,
                        child: Opacity(
                            opacity: 0.4,
                            child: Image.asset(
                              'images/Phoenix.png',
                              fit: BoxFit.cover,
                            )
                                .animate(
                                    adapter: ScrollAdapter(scrollController,
                                        begin: 600))
                                .fadeIn()
                                .scaleXY(begin: 1, end: 1.4)
                                .saturate(begin: -1, end: 2)
                                .slideX(begin: 2)
                                .slideY(begin: 2)),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 600,
                        child: Column(
                          children: [
                            Text(
                              'my STORy',
                              style: kHeadlineText.copyWith(fontSize: 32),
                            ),
                            const SizedBox(height: 80),
                            Text(
                                'My background if you can brace yourself for it was as a project manager and business change suit…',
                                style: kBodyText.copyWith(height: 1.8)),
                            const SizedBox(height: 20),
                            Text(
                                'Whether it be managing IT projects, setting up PMO’s, designing BI dashboards or getting stuck into IT service and solution design… I probably did it.',
                                style: kBodyText.copyWith(height: 1.8)),
                            const SizedBox(height: 20),
                            RichText(
                              text: TextSpan(
                                style: kBodyText,
                                children: [
                                  const TextSpan(
                                      text:
                                          'One day, feeling a bit hemmed in on the payroll, I decided to unfold my wings like some kind of '),
                                  TextSpan(
                                      text: 'MAJESTIC HAWK ',
                                      style: kBodyText.copyWith(
                                          fontWeight: FontWeight.bold)),
                                  const TextSpan(text: 'from legend')
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                                'Secreted beneath my flaming wings, was the considerable body of IT and project management knowledge and experience I would offer the world on a consultancy basis. Why not? I had a blog and that’s definitely consultish!',
                                style: kBodyText.copyWith(height: 1.8)),
                            const SizedBox(height: 20),
                            Text(
                                '5 minutes after handing in my resignation, Covid hit… Nobody was looking for consultants… Something I had the pleasure of reflecting on whilst I failed to qualify for that sweet furlough money.',
                                style: kBodyText.copyWith(height: 1.8)),
                            const SizedBox(height: 20),
                            Text(
                                'The rest is history… Never one to be brow beaten, I pulled up my gentleman’s pantaloons, locked myself in my cave and ‘did a learning’. For as Confucius once said, ’Do a learn, and you’ll never yearn to earn’ (disclaimer: he literally never said that)',
                                style: kBodyText.copyWith(height: 1.8)),
                            const SizedBox(height: 20),
                            RichText(
                              text: TextSpan(
                                style: kBodyText,
                                children: [
                                  const TextSpan(
                                      text:
                                          'Today I already have a couple apps under my belt and I’m striding inexorably like a '),
                                  TextSpan(
                                      text: 'TITAN OF OLYMPUS ',
                                      style: kBodyText.copyWith(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const TextSpan(
                                      text:
                                          'towards achieving my ultimate goal!')
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                                'And what is that goal? To discover the software equivalent of the universal equation. The JavaScript equivalent of E = Mc2. To create the god app, that is all things, to all people, all in a single line of perfect golden code.',
                                style: kBodyText.copyWith(height: 1.8)),
                            const SizedBox(height: 20),
                            Text(
                                'Until that day comes, I’m open to contract works so do drop me a message if you have a project to discuss, and feel free to check out my apps which I think are pretty cool even if I do say so myself.',
                                style: kBodyText.copyWith(height: 1.8)),
                            const SizedBox(height: 140),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 200,
                        width: 1200,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                              Colors.white,
                              Colors.white.withOpacity(0),
                            ])),
                      ),
                    )
                  ],
                ),
                const BottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
