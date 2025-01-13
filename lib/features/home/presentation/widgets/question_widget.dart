import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:stroll_test/core/extensions/context_extensions.dart';
import 'package:stroll_test/features/home/data/models/home_model.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.questionModel,
    required this.selected,
  });

  final QuestionModel questionModel;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: const Color(0xFF232A2E),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: selected ? context.primaryColor : Color(0xFF232A2E))),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: selected ? context.primaryColor : context.colors.white,
              ),
              color: selected ? context.primaryColor : null,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                questionModel.option,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: AutoSizeText(
              questionModel.value,
              maxLines: 2,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
