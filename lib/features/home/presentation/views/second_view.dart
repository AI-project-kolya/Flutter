import 'package:flutter/material.dart';
import 'package:price_predictor_app/features/home/presentation/views/Widgets/second_view_body.dart';

class SecondView extends StatelessWidget {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SecondViewBody(),
      ),
    );
  }
}
