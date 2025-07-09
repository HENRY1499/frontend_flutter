import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AppbarCustom extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const AppbarCustom({super.key});

  @override
  ConsumerState<AppbarCustom> createState() => _AppbarCustomState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarCustomState extends ConsumerState<AppbarCustom> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Color(0xFF40C4FF),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: FittedBox(
        child: Text(
          '${DateFormat('EEEE, d MMMM yyyy', 'es_PE').format(DateTime.now())}',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      // actions: [
      //   Padding(
      //     padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
      //     child: AnimatedContainer(
      //       duration: const Duration(milliseconds: 300),
      //       width: isExpanded ? screenWidth * 0.5 : 40.0,
      //       height: 40.0,
      //       child: SearchBar(
      //         hintText: 'Buscar Producto',
      //         hintStyle: WidgetStateProperty.all(
      //           const TextStyle(
      //             color: Color(0xFF40C4FF),
      //             fontStyle: FontStyle.italic,
      //             fontSize: 16,
      //           ),
      //         ),
      //         shadowColor: WidgetStateProperty.all(Colors.white),
      //         backgroundColor: WidgetStateProperty.all(Colors.white),
      //         elevation: WidgetStateProperty.all(0.8),
      //         leading: Icon(Icons.search, color: Color(0xFF40C4FF)),
      //         onTap: () {
      //           setState(() {
      //             isExpanded = true;
      //           });
      //         },
      //         onTapOutside: (event) {
      //           FocusScope.of(context).unfocus();
      //           setState(() {
      //             isExpanded = false;
      //           });
      //         },
      //       ),
      //     ),
      //   ),
      // ],
    );
  }
}
