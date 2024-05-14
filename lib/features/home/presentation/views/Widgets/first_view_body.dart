import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:price_predictor_app/core/utils/app_router.dart';
import 'package:price_predictor_app/core/utils/styles.dart';
import 'package:price_predictor_app/core/widgets/custo_text_field.dart';
import 'package:price_predictor_app/core/widgets/custom_buttom.dart';
import 'package:price_predictor_app/core/widgets/custom_text.dart';
import 'package:price_predictor_app/features/home/presentation/view_models/cubit/get_price_cubit.dart';

class FirstViewBody extends StatefulWidget {
  const FirstViewBody({super.key});

  @override
  State<FirstViewBody> createState() => _FirstViewBodyState();
}

class _FirstViewBodyState extends State<FirstViewBody> {
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
              content: 'First',
            ),
            CustomTextField(
              min: 500.0,
              max: 2000.0,
              labelText: 'Battery Power',
              keyboardType: TextInputType.number,
              onChanged: (value) {
                BlocProvider.of<GetPriceCubit>(context).batteryPower = value.toString();
              },
            ),
            CustomTextField(
              min: 0.5,
              max: 3.0,
              onChanged: (value) {
                BlocProvider.of<GetPriceCubit>(context).clockSpeed = value.toString();
              },
              labelText: 'Clock Speed',
              keyboardType: TextInputType.number,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Has bluetooth or not',
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
                            BlocProvider.of<GetPriceCubit>(context).blue = val.toString();
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
                            BlocProvider.of<GetPriceCubit>(context).blue = val.toString();
                          });
                        }),
                    const Text('No'),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Has dual sim support or not',
                  style: Styles.textStyle16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                        value: '1',
                        groupValue: groupValue2,
                        onChanged: (val) {
                          setState(() {
                            groupValue2 = val;
                            BlocProvider.of<GetPriceCubit>(context).dulSim = val.toString();
                          });
                        }),
                    const Text('Yes'),
                    const SizedBox(
                      width: 30,
                    ),
                    Radio(
                        value: '0',
                        groupValue: groupValue2,
                        onChanged: (val) {
                          setState(() {
                            groupValue2 = val;
                            BlocProvider.of<GetPriceCubit>(context).blue = val.toString();
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
                      .push(AppRouter.kSecondViewViewPath);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
