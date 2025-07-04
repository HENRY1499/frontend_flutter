import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:prueba_tecnica/features/products/widgets/filter_products.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';
import 'package:prueba_tecnica/widgets/custom_Buttom.dart';
import 'package:another_flushbar/flushbar.dart';

class ProductForm extends ConsumerStatefulWidget {
  const ProductForm({super.key});
  @override
  ConsumerState<ProductForm> createState() => _ProductForm();
}

class _ProductForm extends ConsumerState<ProductForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productName);
    final localcontext = context;

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
                    initialValue: '',
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
                    initialValue: '',
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
              initialValue: '',
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
                  if (!mounted) return;
                  Flushbar(
                    title: "ERROR",
                    showProgressIndicator: true,
                    shouldIconPulse: true,
                    message: "PRODUCTO ESTA VACIO!!!",
                    duration: const Duration(seconds: 10),
                    backgroundColor: Colors.red,
                  ).show(localcontext);
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
                  print('Enviar$formatData');
                  final controller = ref.read(salesProvider);

                  try {
                    await controller.postDetails(formatData);
                    if (!mounted) return;
                    Flushbar(
                      title: "Éxito",
                      message: "VENTA REGISTRADA!!!",
                      duration: const Duration(seconds: 6),
                      backgroundColor: Colors.green,
                    ).show(localcontext);
                    _formKey.currentState?.reset();
                    ref.read(productName.notifier).state = '';
                  } catch (e) {
                    final errorMessage = e.toString().replaceFirst(
                      RegExp(r'Exception: Exception:'),
                      '',
                    );
                    if (!mounted) return;
                    Flushbar(
                      title: "Error",
                      icon: Icon(Icons.error),
                      shouldIconPulse: true,
                      message: errorMessage,
                      flushbarPosition: FlushbarPosition.TOP,
                      duration: const Duration(seconds: 10),
                      backgroundColor: Colors.redAccent,
                    ).show(localcontext);
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
