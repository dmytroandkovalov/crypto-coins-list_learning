import 'package:flutter/material.dart';
import 'package:flutter_projects/features/crypto_coin/dto/crypto_coin_screen_route_arguments.dart';

class CryptoCoinsScreen extends StatefulWidget {
  const CryptoCoinsScreen({super.key});

  @override
  State<CryptoCoinsScreen> createState() => _CryptoCoinsScreenState();
}

class _CryptoCoinsScreenState extends State<CryptoCoinsScreen> {
  CryptoCoinScreenRouteArguments? routeArguments;

  @override
  void didChangeDependencies() {
    routeArguments = ModalRoute.of(context)?.settings.arguments as CryptoCoinScreenRouteArguments;
    assert(
      routeArguments != null,
      "You must provide CryptoCoinScreenRouteArguments args"
    );

    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    routeArguments = ModalRoute.of(context)?.settings.arguments as CryptoCoinScreenRouteArguments;

    return Scaffold(
      appBar: AppBar(title: Text(routeArguments?.coinName ?? '...')),
    );
  }
}