
import 'package:e_commerce_project/presentation/main/main_view.dart';
import 'package:e_commerce_project/presentation/order_confirmation/order_confirmation_view.dart';
import 'package:e_commerce_project/presentation/order_list/order_list_view.dart';
import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alışverişim',
      theme: AppColorTheme.lightTheme,
      home: OrderListView(),
    );
  }
}
