import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:price_predictor_app/core/utils/app_router.dart';
import 'package:price_predictor_app/core/utils/styles.dart';
import 'package:price_predictor_app/core/widgets/custo_text_field.dart';
import 'package:price_predictor_app/core/widgets/custom_buttom.dart';
import 'package:price_predictor_app/core/widgets/custom_text.dart';
import 'package:price_predictor_app/features/home/presentation/view_models/cubit/get_price_cubit.dart';

class ThirdViewBody extends StatefulWidget {
  const ThirdViewBody({super.key});

  @override
  State<ThirdViewBody> createState() => _ThirdViewBodyState();
}

class _ThirdViewBodyState extends State<ThirdViewBody> {
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
              content: 'Third',
            ),
            CustomTextField(
              max: 20.0,
              min: 0.0,
              onChanged: (val) {
                BlocProvider.of<GetPriceCubit>(context).pc = val.toString();
              },
              labelText: 'Primary Camera mega pixels',
              keyboardType: TextInputType.number,
            ),
            CustomTextField(
              min: 0.0,
              max: 1960.0,
              onChanged: (val) {
                BlocProvider.of<GetPriceCubit>(context).pxHeight = val.toString();
              },
              labelText: 'Pixel Resolution Height',
              keyboardType: TextInputType.number,
            ),
            CustomTextField(
              min: 500.0,
              max: 2000.0,
              onChanged: (val) {
                BlocProvider.of<GetPriceCubit>(context).pxWidth = val.toString();
              },
              labelText: 'Pixel Resolution Width',
              keyboardType: TextInputType.number,
            ),
            CustomTextField(
              min: 256.0,
              max: 4000.0,
              onChanged: (val) {
                BlocProvider.of<GetPriceCubit>(context).ram = val.toString();
              },
              labelText: 'Random Access Memory',
              keyboardType: TextInputType.number,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Has 3G or not',
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
                            BlocProvider.of<GetPriceCubit>(context).threeG =
                                val.toString();
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
                            BlocProvider.of<GetPriceCubit>(context).threeG =
                                val.toString();
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
                      .pushReplacement(AppRouter.kFourthViewViewPath);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
