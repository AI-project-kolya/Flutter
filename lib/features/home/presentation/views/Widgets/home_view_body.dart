import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:price_predictor_app/core/utils/app_router.dart';
import 'package:price_predictor_app/core/utils/asset.dart';
import 'package:price_predictor_app/core/utils/styles.dart';
import 'package:price_predictor_app/core/widgets/custom_buttom.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Image.asset(AssetData.kHomeImagePath,fit: BoxFit.fill,)),
        const SizedBox(
          height: 24,
        ),
        const Text(
          'Wan to know average ',
          style: Styles.textStyle20,

        ),
        const Text(
          'price of your phone?',
          style: Styles.textStyle20,

        ),
        const SizedBox(
          height: 24,
        ),
         CustomButtom(textButtom: 'Let\'s start',onTap: (){
          GoRouter.of(context).pushReplacement(AppRouter.kFirstViewViewPath);
        },),
      ],
    );
  }
}
