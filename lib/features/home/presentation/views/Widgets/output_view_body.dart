import 'package:flutter/material.dart';
import 'package:price_predictor_app/core/utils/styles.dart';
import 'package:price_predictor_app/core/widgets/custom_buttom.dart';

class OutPutViewBody extends StatelessWidget {
  const OutPutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
        'Predicition successful ✔️',
        style: Styles.textStyle20,
      ),
      SizedBox(
        height: 60,
      ),
      Text(
        'Price Range : 50 : 300 \$',
        style: Styles.textStyle20,
      ),
      SizedBox(
        height: 60,
      ),
      CustomButtom(textButtom: 'Again',),
    ],);
  }
}
