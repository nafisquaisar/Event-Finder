import 'package:event_finder_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const Button({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary(context),
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}