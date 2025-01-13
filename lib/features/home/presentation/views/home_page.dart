import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stroll_test/core/extensions/context_extensions.dart';
import 'package:stroll_test/core/extensions/widget_extensions.dart';
import 'package:stroll_test/core/gen/assets.gen.dart';
import 'package:stroll_test/features/home/data/models/home_model.dart';
import '../blocs/home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<QuestionModel> question = [
    const QuestionModel(option: "A", value: "The peace in the early mornings"),
    const QuestionModel(option: "A", value: "The magical golden hours"),
    const QuestionModel(option: "A", value: "Wind-down time after dinners"),
    const QuestionModel(option: "A", value: "The serenity past midnight"),
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
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Stroll Bonfire"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("22h 00m")],
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
              children: [
                Text(
                  "“Mine is definitely the peace in the morning.”",
                  style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.greyDecor,
                      fontStyle: FontStyle.italic),
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 70,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 70,
                      child: Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                border: Border.all(color: context.colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(data),
                          )
                        ],
                      ),
                    );
                  },
                ).withExpanded()
              ],
            ),
          ).withExpanded()
        ],
      ),
    );
  }
}
