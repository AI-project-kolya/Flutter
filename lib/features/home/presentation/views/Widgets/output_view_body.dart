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
    return BlocBuilder<GetPriceCubit, GetPriceState>(
      builder: (context, state) {
        if (state is GetPriceFailure) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                style: Styles.textStyle16,
              ),
              const SizedBox(
                height: 60,
              ),
              CustomButtom(
                textButtom: 'Again',
                onTap: () {
                  GoRouter.of(context)
                      .pushReplacement(AppRouter.kHomeViewViewPath);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtom(
                textButtom: 'Refresh',
                onTap: () {
                  BlocProvider.of<GetPriceCubit>(context).getPrice();
                },
              ),
            ],
          );
        } else if (state is GetPriceSucess) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Predicition successfully ✔️',
                style: Styles.textStyle20,
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                state.priceModel.priceRange,
                style: Styles.textStyle20,
              ),
              const SizedBox(
                height: 60,
              ),
              CustomButtom(
                textButtom: 'Again',
                onTap: () {
                  GoRouter.of(context)
                      .pushReplacement(AppRouter.kHomeViewViewPath);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtom(
                textButtom: 'Refresh',
                onTap: () {
                  BlocProvider.of<GetPriceCubit>(context).getPrice();
                },
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
