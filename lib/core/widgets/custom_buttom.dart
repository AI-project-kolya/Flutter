import 'package:flutter/material.dart';
import 'package:price_predictor_app/core/utils/styles.dart';

class CustomButtom extends StatelessWidget {
  final String textButtom;
  final VoidCallback? onTap;
  const CustomButtom({this.onTap, required this.textButtom, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width* 0.2
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              textButtom,
              style: Styles.textStyle20.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
