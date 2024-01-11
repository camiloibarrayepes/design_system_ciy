import 'package:design_sys_ciy/Tokens/Colors.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary }

class Button extends StatelessWidget {
  final String text;
  final ButtonType type;
  final double width, height;
  final double elevation;
  final double borderRadius;
  final IconData icon;
  final bool isLoading;

  Button({
    @required this.text,
    this.type = ButtonType.primary,
    this.width = double.infinity,
    this.height = 40,
    this.elevation,
    this.borderRadius = 4,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Color textColor;

    switch (type) {
      case ButtonType.secondary:
        color = Colors.white;
        textColor = ColorTokens.screen_print_cyan_5;
        break;
      default:
        color = Colors.screen_print_cyan_5;
        textColor = Colors.white;
        break;
    }

    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        child: buttonContent(textColor),
        elevation: elevation,
        disabledColor: Colors.grey,
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
    );
  }

  Widget buttonContent(Color textColor) {
    if (isLoading) return CircularProgressIndicator(color: ColorTokens.screen_print_green_5);

    Widget textWidget = Text(
      text,
      style: TextStyle(color: textColor, fontSize: 16),
    );

    if (icon == null) return textWidget;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(width: 8),
        textWidget,
      ],
    );
  }
}
