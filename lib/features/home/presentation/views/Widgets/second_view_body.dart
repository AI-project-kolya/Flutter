import 'package:flutter/material.dart';
import 'package:price_predictor_app/core/utils/styles.dart';
import 'package:price_predictor_app/core/widgets/custo_text_field.dart';
import 'package:price_predictor_app/core/widgets/custom_buttom.dart';
import 'package:price_predictor_app/core/widgets/custom_text.dart';

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
            const CustomTextField(
              labelText: 'Internal Memory',
              keyboardType: TextInputType.number,
            ),
            const CustomTextField(
              labelText: 'Mobile Depth in cm',
              keyboardType: TextInputType.number,
            ),
            const CustomTextField(
              labelText: 'Weight of mobile phone',
              keyboardType: TextInputType.number,
            ),
            const CustomTextField(
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
                        value: 'Yes',
                        groupValue: groupValue1,
                        onChanged: (val) {
                          setState(() {
                            groupValue1 = val;
                          });
                        }),
                    const Text('Yes'),
                    const SizedBox(
                      width: 30,
                    ),
                    Radio(
                        value: 'No',
                        groupValue: groupValue1,
                        onChanged: (val) {
                          setState(() {
                            groupValue1 = val;
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
                if (mykey.currentState!.validate()) {}
              },
            )
          ],
        ),
      ),
    );
  }
}
