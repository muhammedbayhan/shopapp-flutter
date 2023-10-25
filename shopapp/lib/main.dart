import 'package:flutter/material.dart';
import 'package:shopapp/constants/app_colors.dart';
import 'package:shopapp/views/home_view.dart';
import 'package:shopapp/views/product_detail.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.lexend().fontFamily,
        appBarTheme: AppBarTheme(color: AppColors.scaffoldColor, elevation: 0,
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.textColor,fontWeight: FontWeight.bold,),
        iconTheme: IconThemeData(color: AppColors.iconsColor)
        ),
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const HomeView(),
    );
  }
}
