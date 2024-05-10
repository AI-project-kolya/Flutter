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
            'Enter $content features : ',
            style: Styles.textStyle30.copyWith(
              fontSize: 24
            ),
          )),
    );
  }
}
