import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/crypto_coins_list_app.dart';
import 'package:flutter_projects/repositories/crypto_coins/crypto_coins.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CryptoCoinsRepository(dio: Dio())
  );

  runApp(const CryptoCoinsListApp());
}
