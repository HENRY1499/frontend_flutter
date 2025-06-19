import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String name;
  final String description;
  final int number;
  final Color color;
  final IconData icon;
  final Widget image;

  const CustomCard({
    required this.name,
    required this.description,
    required this.number,
    required this.color,
    required this.icon,
    required this.image,
    super.key,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 300,
        height: 100,
        child: Card(
          color: widget.color,
          elevation: 10,
          shadowColor: Colors.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Number: ${widget.number}',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(widget.image.toString()),
                  // child: Icon(widget.icon, size: 30, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
