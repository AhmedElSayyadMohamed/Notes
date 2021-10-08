import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/data_layer/bloc/cubit.dart';
import 'package:notes/presentation_layer/modules/add_notes.dart';
import 'package:notes/presentation_layer/modules/home_screen.dart';

import 'data_layer/bloc/states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => app_cubit()..create_database(),
      child: BlocConsumer<app_cubit, app_states>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            home: home_screen(),
          );
        },
      ),
    );
  }
}
