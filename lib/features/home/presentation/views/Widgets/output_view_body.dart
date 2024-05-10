import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:price_predictor_app/core/utils/app_router.dart';
import 'package:price_predictor_app/core/utils/styles.dart';
import 'package:price_predictor_app/core/widgets/custom_buttom.dart';

class OutPutViewBody extends StatelessWidget {
  const OutPutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Predicition successful ✔️',
          style: Styles.textStyle20,
        ),
        const SizedBox(
          height: 60,
        ),
        const Text(
          'Price Range : 50 : 300 \$',
          style: Styles.textStyle20,
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
