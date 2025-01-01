import 'dart:io';

import 'package:daily_quotes/bloc/quote_state.dart';
import 'package:daily_quotes/router/stack_router.dart';
import 'package:daily_quotes/wiki_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    }

    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: StackRouter().config(),
      //Using multiple Builders we have to nest them into each other
      builder: (BuildContext context, Widget? child) {
        return BlocProvider(
          create: (_) => QuoteCubit(WikiManager()),
          child: child!,
        );
      },
    );
  }
}
