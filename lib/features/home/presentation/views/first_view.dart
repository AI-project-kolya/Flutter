import 'package:flutter/material.dart';
import 'package:price_predictor_app/features/home/presentation/views/Widgets/first_view_body.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: FirstViewBody(),
      ),
    );
  }
}
