import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final int currentStep;
  final int completedSteps;

  ProgressIndicatorWidget({required this.currentStep, required this.completedSteps});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        bool isCompleted = index < completedSteps;
        bool isCurrent = index == currentStep - 1;
        return Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: isCompleted || isCurrent ? Color(0xFF6A1B9A) : Colors.grey.shade300,
              child: isCompleted
                  ? Icon(Icons.check, color: Colors.white, size: 18)
                  : Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            if (index < 4)
              Container(
                height: 2,
                width: 30,
                color: isCompleted ? Color(0xFF6A1B9A) : Colors.grey.shade300,
              ),
          ],
        );
      }),
    );
  }
}
