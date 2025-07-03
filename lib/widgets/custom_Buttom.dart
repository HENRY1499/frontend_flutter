import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String name;
  final bool isPressed;
  final BorderRadius? radius;
  final Color color;
  final double? height;
  final Color? textColor;
  final double? fontSize;
  final VoidCallback? onTap;
  final VoidCallback? onPress;

  const CustomButton({
    super.key,
    required this.name,
    this.onTap,
    this.height,
    this.fontSize,
    required this.color,
    required this.isPressed,
    this.radius,
    this.textColor,
    this.onPress,
  });

  @override
  State<CustomButton> createState() => _CustomButton();
}

class _CustomButton extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
        width: 250,
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 0),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border:
              widget.isPressed
                  ? Border(bottom: BorderSide(width: 1, color: Colors.grey))
                  : null,
          color: widget.color,
          borderRadius: widget.radius,
        ),
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(
              color: widget.textColor,
              fontSize: widget.fontSize,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
