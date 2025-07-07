import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String name;
  final double? px;
  final double? py;
  final double? width;
  final bool isPressed;
  final BorderRadius? radius;
  final Color color;
  final IconData? icon;
  final double? height;
  final Color? textColor;
  final double? fontSize;
  final VoidCallback? onTap;
  final VoidCallback? onPress;

  const CustomButton({
    super.key,
    this.width,
    required this.name,
    this.onTap,
    this.height,
    this.fontSize,
    required this.color,
    required this.isPressed,
    this.radius,
    this.textColor,
    this.onPress,
    this.px,
    this.icon,
    this.py,
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
        width: widget.width,
        padding: EdgeInsets.symmetric(
          vertical: widget.py ?? 4.0,
          horizontal: widget.px ?? 4.0,
        ),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border:
              widget.isPressed
                  ? Border(bottom: BorderSide(width: 1, color: Colors.grey))
                  : null,
          color: widget.color,
          borderRadius: widget.radius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4.0,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                color: widget.textColor,
                fontSize: widget.fontSize,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            if (widget.icon != null)
              Icon(widget.icon, size: 18, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
