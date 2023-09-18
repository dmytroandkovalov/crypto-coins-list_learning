import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:flutter_projects/repositories/crypto_coins/models/models.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        throw Exception();
        final coinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CryptoListLoadingFailure(exception: e));
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
