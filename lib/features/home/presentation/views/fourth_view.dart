import 'package:flutter/material.dart';
import 'package:price_predictor_app/features/home/presentation/views/Widgets/fourth_view_body.dart';

class FourthView extends StatelessWidget {
  const FourthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: FourthViewBody(),
      ),
    );
  }
}
