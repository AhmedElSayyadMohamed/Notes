import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/data_layer/bloc/cubit.dart';
import 'package:notes/data_layer/bloc/states.dart';
import 'package:notes/presentation_layer/shared/component/circle_color_item.dart';

class edit_note extends StatelessWidget {
  String body;
  String date;
  String time;
  int color;
  int index_of_color_in_color_list;
  int index;
  int id;

  edit_note({
    required this.body,
    required this.color,
    required this.date,
    required this.time,
    required this.index_of_color_in_color_list,
    required this.index,
    required this.id,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<app_cubit, app_states>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = app_cubit.get(context);
        final snakBar = SnackBar(
          content: SizedBox(
            child: Container(
              child: const Center(
                child: Text(
                  "Body can\'t be empty",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              height: 25.0,
            ),
          ),
          duration: const Duration(seconds: 3),
          backgroundColor: Color(cubit.choosed_color),
        );
        var body_controller = TextEditingController();
        var date_controller = TextEditingController();
        var time_controller = TextEditingController();
        body_controller.text = body;
        date_controller.text = date;
        time_controller.text = time;
        index_of_color_in_color_list = cubit.choosed_color;
        // String? dateChangingValue;
        // String? bodyChangingValue;
        // String? timeChangingValue;
        var width = MediaQuery.of(context).size.width;
        var height = MediaQuery.of(context).size.height;

        return Scaffold(
          backgroundColor: Colors.grey[900],
          body: SafeArea(
            child: Center(
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: width * 2 / 3,
                        height: height * .5 / 7.5,
                        child: Card(
                          color: Colors.grey[400],
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: listview_of_circle_color(context),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 1.8 / 2,
                        height: height * 1 / 4.5,
                        child: Card(
                          color: Colors.grey[400],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30.0,
                              vertical: 5,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.grey,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.grey,
                                      ),
                                      onPressed: () {
                                        if (body_controller.text.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snakBar);
                                        } else {
                                          cubit.update_record_database(
                                            body: body_controller.text,
                                            date: date_controller.text,
                                            time: time_controller.text,
                                            color: index_of_color_in_color_list,
                                            id: id,
                                          );
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text(
                                        'Edit',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: Color(cubit.choosed_color),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[700],
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: Color(cubit.choosed_color),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: height * 0.8 / 2,
                        child: Card(
                          color: Color(cubit.choosed_color),
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 10),
                                  child: TextField(
                                    controller: body_controller,
                                    onEditingComplete: () {
                                      body_controller.text = body;
                                    },
                                    onChanged: (value) {
                                      body = value;
                                    },
                                    maxLines: null,
                                    decoration: const InputDecoration(
                                      hintText: 'Write your note here .....',
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse('2025-02-09'),
                                        ).then((value) {
                                          date_controller.text =
                                              DateFormat.yMMMd().format(value!);
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.grey[400],
                                      ),
                                      child: date_controller.text.isEmpty
                                          ? Row(children: const [
                                              Icon(Icons
                                                  .calendar_today_outlined),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('set date'),
                                            ])
                                          : Row(children: [
                                              const Icon(Icons
                                                  .calendar_today_outlined),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("${date_controller.text}"),
                                            ]),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) {
                                          time_controller.text =
                                              value!.format(context).toString();
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.grey[400],
                                      ),
                                      child: time_controller.text.isEmpty
                                          ? Row(children: const [
                                              Icon(Icons.watch_later_outlined),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('set time'),
                                            ])
                                          : Row(children: [
                                              const Icon(
                                                  Icons.watch_later_outlined),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text('${time_controller.text}'),
                                            ]),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
/*build_banda_item(
            context: context,
            index: index,
            body: body_after_edit,
            time: time,
            date: date,
            index_of_color_in_color_list: index_of_color_in_color_list,
            color: color,
            id: id,
          ),*/
