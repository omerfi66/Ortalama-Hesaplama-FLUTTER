import 'package:flutter/material.dart';
import 'package:ortalaman_kac/widget/ortalma_hesaple_page.dart';

import 'constants/app_constants.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dinamik Ortalama Hesapla",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Sabitler.anaRenk,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:OrtalamaHesaplaPage(),
    );
  }
}
