part of 'get_price_cubit.dart';

sealed class GetPriceState {}

final class GetPriceInitial extends GetPriceState {}

final class GetPriceLoading extends GetPriceState {}

final class GetPriceFailure extends GetPriceState {
  final String errorMessage;

  GetPriceFailure({required this.errorMessage});
}

final class GetPriceSucess extends GetPriceState {
  final PriceModel priceModel;

  GetPriceSucess({required this.priceModel});
}
