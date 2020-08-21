import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_v2/portfolio/portfolio_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sean O'Brien",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline2: GoogleFonts.oswald(
              color: Colors.white, fontWeight: FontWeight.w300),
          headline4: GoogleFonts.oswald(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.w300),
        ),
      ),
      home: PortfolioView(),
    );
  }
}
