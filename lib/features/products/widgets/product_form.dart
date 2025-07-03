import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:intl/intl.dart';
import 'package:prueba_tecnica/features/products/widgets/filter_products.dart';

class ProductForm extends ConsumerStatefulWidget {
  const ProductForm({super.key});
  @override
  ConsumerState<ProductForm> createState() => _ProductForm();
}

class _ProductForm extends ConsumerState<ProductForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
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
                      hintText: 'Ej: 5',
                      hintStyle: TextStyle(color: Colors.red),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Expanded(
                  child: FormBuilderTextField(
                    name: 'sales_price',
                    decoration: InputDecoration(labelText: 'Precio'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),

            FormBuilderDropdown(
              name: 'pay_method',
              decoration: InputDecoration(labelText: 'Método de Pago'),
              items:
                  ['yape', 'efectivo']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
            ),

            FormBuilderDateTimePicker(
              name: 'createdat',
              enabled: false,
              initialValue: DateTime.now(),
              decoration: InputDecoration(labelText: 'Fecha'),
              inputType: InputType.date,
              format: DateFormat('dd/MM/yyyy'),
            ),
          ],
        ),
      ),
    );
  }
}
