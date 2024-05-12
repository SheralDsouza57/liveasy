import 'package:flutter/material.dart';
import 'package:liveasy/Colors/appcolors.dart';

class CustomRadioButton extends StatelessWidget {
  final int value;
  final ValueChanged<int?> onChanged;
  final int groupValue;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Container(
        width: 24, // Customize size as needed
        height: 24, // Customize size as needed
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.black,
            width: 1,
          ),
        ),
        child: value == groupValue
            ? Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.royalBlue,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.white,
                    width: 2.5,
                  ),
                ),
              ) // Icon for selected state
            : null,
      ),
    );
  }
}
