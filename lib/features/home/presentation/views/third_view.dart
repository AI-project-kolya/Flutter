import 'package:flutter/material.dart';
import 'package:price_predictor_app/features/home/presentation/views/Widgets/third_view_body.dart';

class ThirdView extends StatelessWidget {
  const ThirdView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ThirdViewBody(),
      ),
    );
  }
}
