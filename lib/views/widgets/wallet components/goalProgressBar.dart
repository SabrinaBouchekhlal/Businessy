import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math';

class GoalProgressBar extends StatefulWidget {
  int progressPercentage; // Make this mutable
  final bool isHome; // New parameter to control button visibility

  GoalProgressBar(
      {super.key,
      required this.progressPercentage,
      this.isHome = false}); // Default to false if not provided

  @override
  State<GoalProgressBar> createState() => _GoalProgressBarState();
}

class _GoalProgressBarState extends State<GoalProgressBar> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int progress = widget.progressPercentage;
    String sentence = getProgressMessage(progress);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircularStepProgressIndicator(
            height: 120,
            width: 120,
            totalSteps: 12,
            currentStep: calculateProgressSteps(progress),
            stepSize: 10,
            selectedColor: brighterGreen,
            unselectedColor: const Color(0xFFBCCCBF),
            child: Center(
              child: Text(
                '$progress%',
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              sentence,
              style: ProgressBarTypography.subtitle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          // Conditionally show the button based on isHome
          if (!widget.isHome)
            ElevatedButton(
              onPressed: () => _showInputDialog(context),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: mainGreen,
                foregroundColor: Colors.white,
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              child: const Text(
                "Reset a new goal",
                style: TextStyle(fontFamily: 'Urbanist', fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  int calculateProgressSteps(int percentage) {
    if (percentage >= 90 && percentage < 100)
      return 11;
    else
      return ((percentage / 100) * 12).round();
  }

  // Function to return dynamic message based on progress percentage
  String getProgressMessage(int progress) {
    if (progress == 100) {
      return "Congratulations! You've reached your goal!";
    } else if (progress >= 75) {
      return "You're almost there!";
    } else if (progress >= 50) {
      return "Keep it up, you're halfway there!";
    } else if (progress >= 25) {
      return "Great start, keep going!";
    } else {
      return "Let's get started!";
    }
  }

  // Function to show a dialog and take input
  void _showInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 10,
          backgroundColor: whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // Make sure the column takes up only as much space as needed
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Set Financial Goal',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Urbanist',
                          color: mainGreen),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Space between input fields
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Enter your target amount:",
                            style: ProgressBarTypography.subtitle
                                .copyWith(fontSize: 16)),
                        const SizedBox(height: 12),
                        // Space between label and input field
                        TextField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            hintText: "Target amount",
                            hintStyle: TextStyle(
                              fontFamily: 'Urbanist',
                              color: inputPlaceholder,
                              fontSize: 14.0,
                            ),
                            suffixText: 'DA',
                            suffixStyle: const TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w600),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: inputBorder),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: brighterGreen),
                            ),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _controller.clear();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.grey,
                                textStyle: const TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Cancel'),
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              onPressed: () {
                                int newGoal =
                                    int.tryParse(_controller.text) ?? 0;
                                if (newGoal >= 0 && newGoal <= 100) {
                                  setState(() {
                                    widget.progressPercentage = 0;

                                  });
                                }
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: brighterGreen,
                                foregroundColor: whiteColor,
                                textStyle: const TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Set Goal'),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
