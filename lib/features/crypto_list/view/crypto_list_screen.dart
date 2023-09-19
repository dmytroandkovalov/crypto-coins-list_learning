import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:flutter_projects/features/crypto_list/widgets/widgets.dart';
import 'package:flutter_projects/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_projects/theme/theme.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final CryptoListBloc _cryptoListBlock = CryptoListBloc(
      GetIt.I<AbstractCoinsRepository>()
  );

  @override
  void initState() {
    _cryptoListBlock.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryproCurrenciesList'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _cryptoListBlock.add(LoadCryptoList(completer: completer));

          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBlock,
          builder: (context, state) {
            if(state is CryptoListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.coinsList.length,
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemBuilder: (context, index) {
                  final CryptoCoin coin = state.coinsList[index];

                  return  CryptoCoinTile(cryptoCoin: coin);
                },
              );
            }
            if (state is CryptoListLoadingFailure) {
              return Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Something went wrong',
                    style: TextStyle (
                        color: Colors.white
                    ),
                  ),
                  Text(
                      'Try again later',
                      style: darkTheme.textTheme.labelSmall?.copyWith(fontSize: 16)
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      _cryptoListBlock.add(LoadCryptoList());
                    },
                    child: const Text('Try again'),
                  )
                ],
              ));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
