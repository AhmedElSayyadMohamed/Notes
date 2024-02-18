import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/data_layer/bloc/cubit.dart';
import 'circle_color_item.dart';

Widget build_banda_item({required BuildContext context}) {
  var cubit = app_cubit.get(context);
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
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

  return SafeArea(
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
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                print(cubit.index_of_choosed_color);

                                if (cubit.body_controller.text.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snakBar);
                                } else {
                                  cubit.insert_to_database(
                                    body: cubit.body_controller.text,
                                    date: cubit.date_controller.text.isEmpty
                                        ? cubit.date_controller.text =
                                            DateFormat.yMMMd()
                                                .format(DateTime.now())
                                        : cubit.date_controller.text,
                                    time: cubit.time_controller.text.isEmpty
                                        ? cubit.time_controller.text =
                                            TimeOfDay.now()
                                                .format(context)
                                                .toString()
                                        : cubit.time_controller.text,
                                    color: cubit.choosed_color,
                                    index_of_color_in_circle_color_list:
                                        cubit.index_of_choosed_color,
                                  );
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text(
                                'SAVE',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(50)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[700],
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(
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
                                  borderRadius: BorderRadius.circular(50)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
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
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: cubit.body_controller,
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
                                  lastDate: DateTime.parse('2025-02-09'),
                                ).then((value) {
                                  cubit.date_controller.text =
                                      DateFormat.yMMMd().format(value!);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[400],
                              ),
                              child: cubit.date_controller.text.isEmpty
                                  ? Row(children: const [
                                      Icon(Icons.calendar_today_outlined),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('set date'),
                                    ])
                                  : Row(children: [
                                      const Icon(Icons.calendar_today_outlined),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text("${cubit.date_controller.text}"),
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
                                  cubit.time_controller.text =
                                      value!.format(context).toString();
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[400],
                              ),
                              child: cubit.time_controller.text.isEmpty
                                  ? Row(children: const [
                                      Icon(Icons.watch_later_outlined),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('set time'),
                                    ])
                                  : Row(children: [
                                      const Icon(Icons.watch_later_outlined),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text('${cubit.time_controller.text}'),
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
  );
}
