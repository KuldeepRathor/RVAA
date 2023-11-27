// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  String activityName;
  Icon activityIcon;
  VoidCallback? onPressed;
  ActivityWidget({
    Key? key,
    required this.activityName,
    required this.activityIcon,
    this.onPressed,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: size.width,
          height: size.height * 0.06,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                activityIcon,
                SizedBox(width: size.width * 0.02),
                Text(
                  activityName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
