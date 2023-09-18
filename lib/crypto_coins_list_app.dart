import 'package:flutter/material.dart';
import 'package:flutter_projects/router/router.dart';
import 'package:flutter_projects/theme/theme.dart';

class CryptoCoinsListApp extends StatelessWidget {
  const CryptoCoinsListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currencies List',
      theme: darkTheme,
      routes: routers,
    );
  }
}
