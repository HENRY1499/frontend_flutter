import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String name;
  final bool isPressed;
  final BorderRadius? radius;
  final Color color;
  final int height;
  final Color? textColor;
  final double? fontSize;
  final VoidCallback? onTap;

  const CustomButton({
    super.key,
    required this.name,
    this.onTap,
    this.fontSize,
    required this.color,
    required this.isPressed,
    this.radius,
    this.textColor,
    required this.height,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
        width: 100,
        height: widget.height.toDouble(),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
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
            ),
          ),
        ),
      ),
    );
  }
}
