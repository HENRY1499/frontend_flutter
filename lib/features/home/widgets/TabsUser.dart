import 'package:flutter/material.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterProduct extends ConsumerStatefulWidget {
  const FilterProduct({super.key});

  @override
  ConsumerState<FilterProduct> createState() => _FilterProduct();
}

class _FilterProduct extends ConsumerState<FilterProduct> {
  @override
  void initState() {
    super.initState();
  }

  int selectedIndex = 0;
  bool colorIcon = false;

  final List<String> svgIcons = [
    'assets/icon/Vector0.svg',
    'assets/icon/Vector1.svg',
    'assets/icon/Vector2.svg',
    'assets/icon/Vector3.svg',
    'assets/icon/Vector4.svg',
    'assets/icon/Vector5.svg',
  ];
  @override
  Widget build(BuildContext context) {
    final usersID = ref.read(buttonID.notifier);
    return Container(
      width: 200,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            blurRadius: 4,
            spreadRadius: 4,
            offset: Offset(1, 0),
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double itemWidth = (constraints.maxWidth) / svgIcons.length;
          return Stack(
            children: [
              AnimatedAlign(
                alignment: Alignment(
                  -1 + (2 / (svgIcons.length - 1)) * selectedIndex,
                  0,
                ),
                duration: const Duration(milliseconds: 350),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  width: itemWidth,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              // Botones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    svgIcons.asMap().entries.map((entry) {
                      int index = entry.key;
                      String icon = entry.value;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            usersID.state = index;
                          });
                        },
                        child: SizedBox(
                          width: itemWidth,
                          height: 30,
                          child: Center(
                            child: SvgPicture.asset(
                              icon,
                              colorFilter: ColorFilter.mode(
                                selectedIndex != index
                                    ? Colors.grey[300]!
                                    : Colors.white,
                                BlendMode.srcIn,
                              ),
                              width: 18,
                              height: 18,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ],
          );
        },
      ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     SvgPicture.asset(
      //       'assets/icon/Vector1.svg',
      //       width: 14,
      //       height: 14,
      //     ),
      //     SvgPicture.asset(
      //       'assets/icon/Vector2.svg',
      //       width: 14,
      //       height: 14,
      //     ),
      //     SvgPicture.asset(
      //       'assets/icon/Vector3.svg',
      //       width: 14,
      //       height: 14,
      //     ),
      //   ],
      // ),
    );
  }
}
