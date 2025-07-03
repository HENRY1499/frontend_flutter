import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:prueba_tecnica/data/repositories/RepositorySales.dart';
import 'package:prueba_tecnica/data/services/SalesServices.dart';
import 'package:prueba_tecnica/features/products/widgets/filter_products.dart';
import 'package:prueba_tecnica/features/sales/controllers/SalesController.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';
import 'package:prueba_tecnica/widgets/custom_Buttom.dart';

class ProductForm extends ConsumerStatefulWidget {
  final BuildContext context;
  const ProductForm({super.key, required this.context});
  @override
  ConsumerState<ProductForm> createState() => _ProductForm();
}

class _ProductForm extends ConsumerState<ProductForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productName);
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¿Que vas a Vender?',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.w900,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 14),
            Row(children: [Expanded(child: FilterProducts())]),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'quantity',
                    decoration: InputDecoration(
                      labelText: 'Cantidad',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                      ),
                      hintText: 'Ej: 5',
                      hintStyle: TextStyle(
                        color: Colors.grey[350],
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Expanded(
                  child: FormBuilderTextField(
                    name: 'sales_price',
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                      ),
                      labelText: 'Precio',
                      hintText: 'Ej:1.00',
                      hintStyle: TextStyle(
                        color: Colors.grey[350],
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),

            FormBuilderDropdown(
              name: 'pay_method',
              decoration: InputDecoration(
                labelText: 'Método de Pago',
                labelStyle: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
              ),
              items:
                  ['yape', 'efectivo']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
            ),

            FormBuilderDateTimePicker(
              name: 'createdat',
              enabled: false,
              initialValue: DateTime.now(),
              decoration: InputDecoration(
                labelText: 'Fecha',
                labelStyle: TextStyle(fontFamily: 'Montserrat', fontSize: 14),
              ),
              inputType: InputType.date,
              format: DateFormat('dd/MM/yyyy'),
            ),
            const SizedBox(height: 20),
            CustomButton(
              name: 'Guardar',
              radius: BorderRadius.all(Radius.circular(100)),
              textColor: Colors.white,
              color: Colors.green[600]!,
              isPressed: false,
              onTap: () async {
                if (product.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Selecciona un producto antes de enviar'),
                    ),
                  );
                  return;
                }
                if (_formKey.currentState?.saveAndValidate() ?? false) {
                  final values = _formKey.currentState!.value;
                  //formatea datos para enviar al back
                  final formatData = {
                    "id_product": int.parse(product),
                    "quantity": int.parse(values['quantity']),
                    "sales_price": double.parse(values['sales_price']),
                    "pay_method": values['pay_method'],
                    "createdat": DateFormat(
                      'dd/MM/yyyy',
                    ).format(values['createdat']),
                  };
                  final controller = ref.read(salesProvider);
                  try {
                    await controller.postDetails(formatData);
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('VENTA REGISTRADA!!!')),
                    );
                    _formKey.currentState?.reset();
                  } catch (e) {
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error al enviar ❌')),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
