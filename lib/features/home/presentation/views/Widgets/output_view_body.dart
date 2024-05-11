import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:price_predictor_app/core/utils/app_router.dart';
import 'package:price_predictor_app/core/utils/styles.dart';
import 'package:price_predictor_app/core/widgets/custom_buttom.dart';
import 'package:price_predictor_app/features/home/presentation/view_models/cubit/get_price_cubit.dart';

class OutPutViewBody extends StatelessWidget {
  const OutPutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<GetPriceCubit, GetPriceState>(
          builder: (context, state) {
            if (state is GetPriceFailure) {
              return Column(
                children: [
                  const Text(
                    'Predicition unsuccessfully ❌',
                    style: Styles.textStyle20,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    'error message : ${state.errorMessage}',
                    style: Styles.textStyle20,
                  ),
                ],
              );
            } else if (state is GetPriceSucess) {
              return Column(
                children: [
                  const Text(
                    'Predicition unsuccessfully ✔️',
                    style: Styles.textStyle20,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    'price range: ${state.priceModel.priceRange}',
                    style: Styles.textStyle20,
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        const SizedBox(
          height: 60,
        ),
        CustomButtom(
          textButtom: 'Again',
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRouter.kHomeViewViewPath);
          },
        ),
      ],
    );
  }
}
