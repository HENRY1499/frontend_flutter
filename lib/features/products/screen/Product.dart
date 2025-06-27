import 'package:flutter/material.dart';
import 'package:prueba_tecnica/data/repositories/RepositoryProduct.dart';
import 'package:prueba_tecnica/data/services/ProductServices.dart';
import 'package:prueba_tecnica/features/products/controller/ProductController.dart';
import 'package:prueba_tecnica/features/products/widgets/product_grid.dart';
import 'package:prueba_tecnica/features/products/widgets/appbar.dart';

class Product extends StatelessWidget {
  final controller = ProductController(RepositoryProduct(ProductServices()));

  Product({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: controller.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return ProductGrid(products: snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return Center(
              child: Text("Error al mostrar los productos ${snapshot.error}"),
            );
          }
        },
      ),
    );
  }
}

// class _ProductState extends State<Product> {
//   bool isExpanded = false;
//   int selectedIndex = 0;
//   final List<String> categories = [
//     "Calzado",
//     "Ropa",
//     "Accesorios",
//     "Tecnología",
//     "Hogar",
//     "Deportes",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       
//       body: SizedBox(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           spacing: 8.0,
//           children: [
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(categories.length, (index) {
//                   return CustomButton(
//                     name: categories[index],
//                     height: 40,
//                     color: Colors.white,
//                     textColor: Colors.black,
//                     isPressed: selectedIndex == index,
//                     onTap: () {
//                       setState(() {
//                         selectedIndex =
//                             index; // Actualiza el índice del botón activo
//                       });
//                     },
//                   );
//                 }),
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               spacing: 8.0,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Calzado", style: TextStyle(fontSize: 18)),
//                       CustomButton(
//                         name: "Ver más",
//                         color: Colors.blueAccent,
//                         radius: BorderRadius.all(Radius.circular(100)),
//                         textColor: Colors.white,
//                         isPressed: false,
//                         height: 25,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(0),
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 4.0,
//                       vertical: 2.0,
//                     ),
//                     child: SizedBox(
//                       width: 500,
//                       height: 300,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           TargetProduct(),
//                           // CustomTargetProduct(
//                           //   price: 10.00,
//                           //   name: "Galletas",
//                           //   details: "Galleta de sabor fresa",
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _TitleCard extends StatefulWidget {
//   final String title;
//   const _TitleCard({super.key, required this.title});

//   @override
//   State<_TitleCard> createState() => __TitleCardState();
// }

// class __TitleCardState extends State<_TitleCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           widget.title,
//           style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w200),
//         ),
//         CustomButton(
//           name: "Ver más",
//           height: 20,
//           onTap: () {},
//           textColor: Colors.white,
//           radius: BorderRadius.all(Radius.circular(100)),
//           color: Colors.blue,
//           fontSize: 12.0,
//           isPressed: false,
//         ),
//       ],
//     );
//   }
// }
