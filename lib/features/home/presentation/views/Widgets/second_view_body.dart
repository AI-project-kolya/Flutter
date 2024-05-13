import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:price_predictor_app/core/utils/app_router.dart';
import 'package:price_predictor_app/core/utils/styles.dart';
import 'package:price_predictor_app/core/widgets/custo_text_field.dart';
import 'package:price_predictor_app/core/widgets/custom_buttom.dart';
import 'package:price_predictor_app/core/widgets/custom_text.dart';
import 'package:price_predictor_app/features/home/presentation/view_models/cubit/get_price_cubit.dart';

class SecondViewBody extends StatefulWidget {
  const SecondViewBody({super.key});

  @override
  State<SecondViewBody> createState() => _SecondViewBodyState();
}

class _SecondViewBodyState extends State<SecondViewBody> {
  String? groupValue1 = 'YesOrNo';
  String? groupValue2 = 'YesOrNo';
  GlobalKey<FormState> mykey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: mykey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const CustomText(
              content: 'Second',
            ),
            CustomTextField(
              labelText: 'Internal Memory',
              min: 2.0,
              max: 65.0,
              onChanged: (val) {
                BlocProvider.of<GetPriceCubit>(context).initMemory = val.toString();
              },
              keyboardType: TextInputType.number,
            ),
            CustomTextField(
              max: 200.0,
              min: 80.0,
              onChanged: (val) {
                BlocProvider.of<GetPriceCubit>(context).mobileWt = val.toString();
              },
              labelText: 'Weight of mobile phone',
              keyboardType: TextInputType.number,
            ),
            CustomTextField(
              min: 1.0,
              max: 8.0,
              onChanged: (val) {
                BlocProvider.of<GetPriceCubit>(context).nCores = val.toString();
              },
              labelText: 'Number of cores of processor',
              keyboardType: TextInputType.number,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Has 4G or not',
                  style: Styles.textStyle16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                        value: '1',
                        groupValue: groupValue1,
                        onChanged: (val) {
                          setState(() {
                            groupValue1 = val;
                            BlocProvider.of<GetPriceCubit>(context).fourG = val.toString();
                          });
                        }),
                    const Text('Yes'),
                    const SizedBox(
                      width: 30,
                    ),
                    Radio(
                        value: '0',
                        groupValue: groupValue1,
                        onChanged: (val) {
                          setState(() {
                            groupValue1 = val;
                            BlocProvider.of<GetPriceCubit>(context).fourG = val.toString();
                          });
                        }),
                    const Text('No'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtom(
              textButtom: 'Next',
              onTap: () {
                if (mykey.currentState!.validate()) {
                  GoRouter.of(context)
                      .pushReplacement(AppRouter.kThirdViewViewPath);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
