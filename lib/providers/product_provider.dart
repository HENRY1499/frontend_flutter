import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider = StateProvider<String>((ref) => '');
final total = StateProvider<double>((ref) => 0.00);
