import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_predictor_app/features/home/data/models/price_model.dart';

part 'get_price_state.dart';

class GetPriceCubit extends Cubit<GetPriceState> {
  GetPriceCubit(this.dio) : super(GetPriceInitial());
  final Dio dio;
  String? blue, batteryPower, clockSpeed, dulSim;
  String? fourG, initMemory, mobileWt, nCores;
  String? pc, pxHeight, pxWidth, ram, scW;
  String? scH, threeG, touchScreen, wifi;
  Future<void> getPrice() async {
    emit(GetPriceLoading());
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({
      "battery_power": num.parse(batteryPower!),
      "blue": blue == '1' ? true : false,
      "clock_speed": num.parse(clockSpeed!),
      "dual_sim": dulSim == '1' ? true : false,
      "four_g": fourG == '1' ? true : false,
      "int_memory": num.parse(initMemory!),
      "mobile_wt": num.parse(mobileWt!),
      "n_cores": num.parse(nCores!),
      "pc": num.parse(pc!),
      "px_height": num.parse(pxHeight!),
      "px_width": num.parse(pxWidth!),
      "ram": num.parse(ram!),
      "sc_h": num.parse(scH!),
      "sc_w": num.parse(scW!),
      "three_g": threeG == '1' ? true : false,
      "touch_screen": touchScreen == '1' ? true : false,
      "wifi": wifi == '1' ? true : false
    });
    var dio = Dio();
    var response = await dio.request(
      'https://mragaey.com/marwa/api/predict_price_range',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      emit(GetPriceSucess(priceModel: PriceModel.fromJson(response.data)));
    } else {
      emit(GetPriceFailure(errorMessage: "oops there is an error"));
    }
  }
}
