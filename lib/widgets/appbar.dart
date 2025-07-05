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
      backgroundColor: Colors.grey[400],
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        '${DateFormat('EEEE, d MMMM yyyy', 'es_PE').format(DateTime.now())}',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isExpanded ? screenWidth * 0.5 : 40.0,
            height: 40.0,
            child: SearchBar(
              hintText: 'Buscar Producto',
              hintStyle: WidgetStateProperty.all(
                const TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
              ),
              shadowColor: WidgetStateProperty.all(Colors.grey[800]),
              backgroundColor: WidgetStateProperty.all(
                isExpanded
                    ? const Color(0xffE9D7C0)
                    : const Color.fromARGB(162, 233, 215, 192),
              ),
              elevation: WidgetStateProperty.all(0.7),
              leading: const Icon(Icons.search, color: Colors.white),
              onTap: () {
                setState(() {
                  isExpanded = true;
                });
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
                setState(() {
                  isExpanded = false;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
