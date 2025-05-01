import 'package:dio/dio.dart';
import 'package:fam/presentation/screens/HomeScreen.dart';
import 'package:fam/presentation/screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/repository/home_feed_repo_impl.dart';
import 'data/viewmodel/HomeFeedViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeFeedViewModel(HomeFeedRepositoryImpl(Dio())),
      child: MaterialApp(
        title: 'Fam Pay',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
