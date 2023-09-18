import 'package:flutter/material.dart';
import 'package:flutter_projects/features/crypto_coin/dto/crypto_coin_screen_route_arguments.dart';
import 'package:flutter_projects/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    Key? key,
    required this.cryptoCoin,
  }): super(key: key);

  final CryptoCoin cryptoCoin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
        leading: Image.network(cryptoCoin.imageUrl),
        title: Text(
          cryptoCoin.name,
          style: theme.textTheme.bodyMedium,
        ),
        subtitle: Text('${cryptoCoin.priceInUSD} \$', style: theme.textTheme.labelSmall),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.pushNamed(context, '/coin',
              arguments: CryptoCoinScreenRouteArguments(cryptoCoin.name));
        });
  }
}
