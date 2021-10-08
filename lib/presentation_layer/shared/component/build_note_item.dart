import 'package:flutter/material.dart';
import 'package:notes/data_layer/bloc/cubit.dart';
import 'package:notes/presentation_layer/modules/edit_note.dart';

import 'alert_to_delete_record.dart';

Widget build_note_item(BuildContext context, int index) {
  var cubit = app_cubit.get(context);
  return GestureDetector(
    onTap: () {
      print(cubit.note[index]['id']);
      print(cubit.note[index]['body']);
      print(cubit.note[index]['color']);
      print(cubit.note[index]['date']);
      print(cubit.note[index]['time']);
      print(cubit.note[index]['index_of_color_in_circle_color_list']);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => edit_note(
                  body: cubit.note[index]['body'],
                  color: cubit.note[index]['color'],
                  date: cubit.note[index]['date'],
                  time: cubit.note[index]['time'],
                  index_of_color_in_color_list: cubit.note[index]
                      ['index_of_color_in_circle_color_list'],
                  index: index,
                  id: cubit.note[index]['id'],
                )),
      );
    },
    onLongPress: () {
      showAlertDialog(context, index);
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(cubit.note[index]['color']),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 7),
        child: Column(
          children: [
            Expanded(
                child: Text(
              "${cubit.note[index]['body']}",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${cubit.note[index]['date']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${cubit.note[index]['time']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
