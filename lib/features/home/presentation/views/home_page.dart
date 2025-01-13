import 'dart:ffi';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:overflow_text_animated/overflow_text_animated.dart';
import 'package:stroll_test/core/extensions/context_extensions.dart';
import 'package:stroll_test/core/extensions/list_extensions.dart';
import 'package:stroll_test/core/extensions/widget_extensions.dart';
import 'package:stroll_test/core/gen/assets.gen.dart';
import 'package:stroll_test/features/home/data/models/home_model.dart';
import 'package:stroll_test/features/home/presentation/widgets/question_widget.dart';
import 'package:stroll_test/features/home/presentation/widgets/ring_widget.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import '../blocs/home_bloc.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<QuestionModel> question = [
    const QuestionModel(option: "A", value: "The peace in the early mornings"),
    const QuestionModel(option: "B", value: "The magical golden hours"),
    const QuestionModel(option: "C", value: "Wind-down time after dinners"),
    const QuestionModel(option: "D", value: "The serenity past midnight"),
  ];
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              child: Stack(
            children: [
              Positioned.fill(
                child: Assets.application.assets.images.backgroundVideo
                    .image(fit: BoxFit.cover),
              ),
              Positioned(
                top: 100,
                child: SizedBox(
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Gap(20),
                          OverflowTextAnimated(
                            text: "Stroll Bonfire",
                            style: context.textTheme.displayLarge?.copyWith(
                              color: context.secondaryColor,
                              fontSize: 34,
                              fontWeight: FontWeight.w800,
                              shadows: [
                                Shadow(
                                  color: Colors.black
                                      .withOpacity(0.3), // Shadow color
                                  offset: const Offset(2, 2),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            curve: Curves.fastEaseInToSlowEaseOut,
                            animation: OverFlowTextAnimations.scrollOpposite,
                            animateDuration: const Duration(milliseconds: 1500),
                            delay: const Duration(milliseconds: 500),
                          ),
                          const Gap(10),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // Shadow color
                                    offset: const Offset(2, 2),
                                    blurRadius: 10,
                                  )
                                ]),
                                child: Assets
                                    .application.assets.images.arrowDown
                                    .svg(width: 10, height: 10),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.3), // Shadow color
                                    offset: const Offset(2, 2),
                                    blurRadius: 10,
                                  )
                                ]),
                                child: Assets.application.assets.images.timer
                                    .svg(),
                              ),
                              Text(
                                " 22h 00m",
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: context.colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black
                                          .withOpacity(0.2), // Shadow color
                                      offset: const Offset(2, 2),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // Shadow color
                                    offset: const Offset(2, 2),
                                    blurRadius: 10,
                                  )
                                ]),
                                child: Assets.application.assets.images.person
                                    .svg(),
                              ),
                              Text(
                                " 103",
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: context.colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black
                                          .withOpacity(0.3), // Shadow color
                                      offset: const Offset(2, 2),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  height: 100,
                  width: context.screenWidth,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          context.colors.black.withOpacity(.4),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.1, 0.8]),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                    height: 150,
                    width: context.screenWidth,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [context.colors.black, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.5, 1]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 100,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Row(
                                  children: [
                                    badges.Badge(
                                      position: badges.BadgePosition.topEnd(
                                          top: 0, end: -87),
                                      showBadge: true,
                                      ignorePointer: false,
                                      onTap: () {},
                                      badgeStyle: badges.BadgeStyle(
                                        shape: badges.BadgeShape.instagram,
                                        badgeColor: Colors.transparent,
                                        padding: const EdgeInsets.all(5),
                                        borderRadius: BorderRadius.circular(0),
                                        elevation: 0,
                                      ),
                                      badgeAnimation:
                                          badges.BadgeAnimation.slide(
                                              animationDuration: Duration.zero),
                                      badgeContent: Container(
                                        width: 100,
                                        height: 30,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        decoration: BoxDecoration(
                                            color: context.colors.black
                                                .withOpacity(.4),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(30),
                                              bottomRight: Radius.circular(10),
                                            )),
                                        child: Row(
                                          children: [
                                            Gap(10),
                                            AutoSizeText(
                                              "Angelina, 28",
                                              style: context
                                                  .textTheme.bodyMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          context.colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      child: Container(
                                        child: CircleAvatar(
                                          backgroundColor: context.colors.black
                                              .withOpacity(.4),
                                          radius: 40,
                                          child: Assets
                                              .application.assets.images.image
                                              .image(
                                            height: 60,
                                            width: 60,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ).withPadding(
                                    const EdgeInsets.symmetric(horizontal: 20)),
                              ),
                              Positioned.fill(
                                  child: Container(
                                margin: EdgeInsets.only(left: 110, top: 30),
                                width: context.screenWidth,
                                child: Row(
                                  children: [
                                    AutoSizeText(
                                      "What is your favorite time\nof the day?",
                                      maxLines: 2,
                                      minFontSize: 20,
                                      style: TextStyle(
                                        color: context.colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          )).withExpanded(flex: 2),
          Container(
            color: context.colors.black,
            width: context.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextAnimator(
                  "“Mine is definitely the peace in the morning.”",
                  style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.greyDecor,
                      fontStyle: FontStyle.italic),
                  atRestEffect: WidgetRestingEffects.wave(
                      effectStrength: 0.4), // Subtle resting effect
                  // incomingEffect: WidgetTransitionEffects..incomingFadeIn(), // Smooth fade-in effect
                  // textAlign: TextAlign.center,
                  // outgoingEffect: WidgetTransitionEffects.outgoingFadeOut(),
                  // Adding shimmer-like effects
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 57,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  padding:
                      EdgeInsets.zero, // Removes extra padding around the grid
                  itemCount: 4,
                  shrinkWrap:
                      true, // Ensures GridView takes up only needed space
                  physics:
                      const NeverScrollableScrollPhysics(), // Prevent scrolling
                  itemBuilder: (context, index) {
                    QuestionModel questionModel = question[index];
                    return QuestionWidget(
                      questionModel: questionModel,
                      selected: currentIndex == index,
                    ).withOnTap(() {
                      setState(() {
                        currentIndex = index;
                      });
                    });
                  },
                ).withPadding(EdgeInsets.symmetric(horizontal: 20)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pick your option,",
                          style: context.textTheme.bodyMedium
                              ?.copyWith(color: context.colors.white),
                          // Subtle resting effect
                          // incomingEffect: WidgetTransitionEffects..incomingFadeIn(), // Smooth fade-in effect
                          // textAlign: TextAlign.center,
                          // outgoingEffect: WidgetTransitionEffects.outgoingFadeOut(),
                          // Adding shimmer-like effects
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'See who has a similar ',
                              style: context.textTheme.bodyMedium!
                                  .copyWith(color: context.colors.white),
                            ),
                            DefaultTextStyle(
                              style: context.textTheme.bodyMedium!
                                  .copyWith(color: context.colors.white),
                              child: AnimatedTextKit(
                                totalRepeatCount: 4,
                                pause: Duration(seconds: 5),
                                animatedTexts: [
                                  TypewriterAnimatedText('mind.'),
                                  TypewriterAnimatedText('heart.'),
                                  TypewriterAnimatedText('spark.'),
                                  TypewriterAnimatedText('love language.'),
                                  TypewriterAnimatedText('rhythm.'),
                                ],
                                onTap: () {
                                  print("Tap Event");
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    trailing: SizedBox(
                      width: 110,
                      child: Row(
                        children: [
                          RingWidget(
                            color: context.primaryColor,
                            radius: 50,
                            child: WidgetAnimator(
                                atRestEffect: WidgetRestingEffects.bounce(
                                    duration: const Duration(seconds: 1),
                                    numberOfPlays: 2,
                                    // delay: Duration(seconds: 5),
                                    effectStrength: 0.5),
                                child:
                                    Assets.application.assets.images.mic.svg()),
                          ),
                          const Gap(10),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: context.primaryColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: context.colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(10),
              ].addSpacer(const Gap(10)),
            ),
          )
        ],
      ),
    );
  }
}
