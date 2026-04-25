import 'package:flutter/material.dart';

class AppColors {

  static Color pageBg(BuildContext context) {
    return _isDark(context)
        ? const Color(0xFF121212)
        : const Color(0xFFF6F7FB); // soft grey bg
  }

  static Color card(BuildContext context) {
    return _isDark(context)
        ? const Color(0xFF1E1E1E)
        : Colors.white;
  }

  static Color primary(BuildContext context) {
    return _isDark(context)
          ?Colors.black54
          :Colors.green.shade500
            ;
  }

  static Color kmColor(BuildContext context) {
    return _isDark(context)
          ?Colors.white
          :Colors.green.shade500
            ;
  }

  static Color textPrimary(BuildContext context) {
    return _isDark(context) ? Colors.white : Colors.black87;
  }

  static Color textSecondary(BuildContext context) {
    return _isDark(context)
        ? Colors.grey[400]!
        : Colors.grey[600]!;
  }
  static Color shadow(BuildContext context) {
    return _isDark(context)
        ? Colors.white.withOpacity(0.20)
        : Colors.black.withOpacity(0.20);
  }

  static Color imageTextShadow(BuildContext context) {
    return _isDark(context)
        ? Colors.white.withOpacity(0.5)
        : Colors.black.withOpacity(0.5);
  }

  static Color imageText(BuildContext context) {
    return _isDark(context)
        ? Colors.white
        : Colors.white;
  }

  static Color background(BuildContext context) {
    return _isDark(context) ? Colors.black : Colors.green;
  }



  static bool _isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}