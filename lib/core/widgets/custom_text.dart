import 'package:flutter/material.dart';
import 'package:price_predictor_app/core/utils/styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '$content Step : ',
            style: Styles.textStyle30,
          )),
    );
  }
}
