import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_predictor_app/core/utils/app_router.dart';
import 'package:price_predictor_app/features/home/presentation/view_models/cubit/get_price_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPriceCubit(Dio()),
      child: MaterialApp.router(
        routerConfig: AppRouter.goRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
