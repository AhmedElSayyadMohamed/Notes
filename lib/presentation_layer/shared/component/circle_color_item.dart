import 'package:flutter/material.dart';
import 'package:notes/data_layer/bloc/cubit.dart';

List<int> circle_color = [
  0xffffab91,
  0xffffcc80,
  0xffe6ee9b,
  0xff80deea,
  0xffcf93d9,
  0xff80cbc4,
  0xfff48fb1,
];

Widget build_circle_color({
  required int index,
  required BuildContext context,
}) {
  var cubit = app_cubit.get(context);
  return GestureDetector(
    onTap: () {
      print(index);
      cubit.get_index(index: index);
    },
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color(circle_color[index]),
      ),
      child: cubit.index_of_choosed_color != index
          ? Icon(
              Icons.circle,
              size: 15,
              color: Color(circle_color[index]),
            )
          : const Icon(
              Icons.circle,
              size: 15,
              color: Colors.white,
            ),
    ),
  );
}

Widget listview_of_circle_color(BuildContext context) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) =>
        build_circle_color(index: index, context: context),
    separatorBuilder: (context, index) => SizedBox(width: 5),
    itemCount: 7,
  );
}
