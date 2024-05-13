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
    try {
      Response respons = await dio
          .post('https://mragaey.com/marwa/api/predict_price_range', data: {
        'blue': blue,
        'battery_power': batteryPower,
        'clock_speed': clockSpeed,
        'dual_sim': dulSim,
        'four_g': fourG,
        'init_memory': initMemory,
        'mobile_wt': mobileWt,
        'n_cores': nCores,
        'pc': pc,
        'px_height': pxHeight,
        'px_width': pxWidth,
        'ram': ram,
        'sc_h': scH,
        'sc_w': scW,
        'three_g': threeG,
        'touch_screen': touchScreen,
        'wifi': wifi,
      });
      emit(GetPriceSucess(priceModel: PriceModel.fromJson(respons.data)));
    } on DioException {
      emit(GetPriceFailure(errorMessage: 'oops there is an error'));
    } catch (e) {
      emit(GetPriceFailure(errorMessage: e.toString()));
    }
  }
}
