import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/data_layer/bloc/cubit.dart';
import 'package:notes/data_layer/bloc/states.dart';
import 'package:notes/presentation_layer/shared/component/build_banda_item.dart';
import 'package:notes/presentation_layer/shared/component/circle_color_item.dart';

class Add_notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<app_cubit, app_states>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = app_cubit.get(context);
        return Scaffold(
          backgroundColor: Colors.grey[900],
          body: build_banda_item(context: context),
        );
      },
    );
  }
}
