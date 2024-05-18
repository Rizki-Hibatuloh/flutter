import 'package:flutter/material.dart';
import 'package:signup_login/style.dart';

class CustomButoon extends StatelessWidget {
  const CustomButoon({super.key, required this.label, this.onPressed});

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryButtonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              label,
              style: TextStyles.title
                  .copyWith(fontSize: 20.0, color: Colors.white),
            ),
          )),
    );
  }
}
