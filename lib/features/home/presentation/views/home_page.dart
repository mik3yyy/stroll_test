import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:overflow_text_animated/overflow_text_animated.dart';
import 'package:stroll_test/core/extensions/context_extensions.dart';
import 'package:stroll_test/core/extensions/list_extensions.dart';
import 'package:stroll_test/core/extensions/widget_extensions.dart';
import 'package:stroll_test/core/gen/assets.gen.dart';
import 'package:stroll_test/features/home/data/models/home_model.dart';
import 'package:stroll_test/features/home/presentation/widgets/ring_widget.dart';
import '../blocs/home_bloc.dart';

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
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Assets.application.assets.images.timer.svg(),
                              Text(
                                " 22h 00m",
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(color: context.colors.white),
                              ),
                            ],
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              Assets.application.assets.images.person.svg(),
                              Text(
                                " 103",
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(color: context.colors.white),
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
                bottom: 0,
                child: Container(
                  height: 100,
                  width: context.screenWidth,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [context.colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.5, 0.9]),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Assets.application.assets.images.image.image(
                            height: 60,
                            width: 60,
                          ),
                        ],
                      ),
                      const Gap(10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(10),
                          AutoSizeText(
                            "Angelina, 28",
                            style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.colors.white),
                          ),
                          Row(
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
                          ).withExpanded(),
                        ],
                      )
                    ],
                  ).withMargin(const EdgeInsets.symmetric(horizontal: 30)),
                ),
              )
            ],
          )).withExpanded(flex: 2),
          Container(
            color: context.colors.black,
            width: context.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "“Mine is definitely the peace in the morning.”",
                  style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.greyDecor,
                      fontStyle: FontStyle.italic),
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 70,
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
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF232A2E),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              border: Border.all(color: context.colors.white),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                questionModel.option,
                                style: context.textTheme.bodySmall
                                    ?.copyWith(color: context.colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: AutoSizeText(
                              questionModel.value,
                              maxLines: 2,
                              style: context.textTheme.bodyMedium
                                  ?.copyWith(color: context.colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
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
                          "Pick your option,\nSee who has a similar mind.",
                          style: context.textTheme.bodyMedium
                              ?.copyWith(color: context.colors.white),
                        ),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 110,
                      child: Row(
                        children: [
                          RingWidget(
                            color: context.primaryColor,
                            radius: 50,
                            child: Assets.application.assets.images.mic.svg(),
                          ),
                          Gap(10),
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
                Gap(10),
              ].addSpacer(const Gap(10)),
            ),
          )
        ],
      ),
    );
  }
}
