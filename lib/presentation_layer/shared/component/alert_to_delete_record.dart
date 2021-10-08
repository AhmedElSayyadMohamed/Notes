import 'package:flutter/material.dart';
import 'package:notes/data_layer/bloc/cubit.dart';

void showAlertDialog(BuildContext context, int index) {
  var cubit = app_cubit.get(context);

  //set up the button
  Widget delete_Button = TextButton(
    onPressed: () {
      cubit.delete_record_from_database(cubit.note[index]['id']);
      Navigator.pop(context);
    },
    child: const Text(
      'Delete',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );

  Widget cancel_Button = TextButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: const Text(
      'Cancle',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );

  // set up the alertDialog
  AlertDialog alert = AlertDialog(
    content: const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Are you sure you want to delete this note ? ',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
    actions: [
      cancel_Button,
      delete_Button,
    ],
  );

  //show dialog
  showDialog(
    // barrierDismissible: false,
    context: context,
    builder: (context) {
      return alert;
    },
  );
}

/*Container(
      height: MediaQuery.of(context).size.height * .6 / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 2.0,
              vertical: 5,
            ),
            child: Row(
              children: [
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7.0, vertical: 3),
                      child: Icon(
                        Icons.emoji_emotions_outlined,
                        size: 30,
                        color: cubit.choosed_color,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(end: 35, bottom: 20),
                      child: CircleAvatar(
                        radius: 9,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          size: 18,
                          color: cubit.choosed_color,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      child: TextField(
                        controller: cubit.alert_dialog_controller,
                        decoration: InputDecoration(
                          hintText: 'Enter list title ',
                          hintMaxLines: 1,
                          //filled: true,
                          //fillColor: Colors.teal,
                          //hoverColor: Colors.teal,
                        ),
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 2.0,
              vertical: 10,
            ),
            child: Container(
              width: 60,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: cubit.choosed_color,
              ),
              child: Center(
                child: Text('Color',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: 33,
                child: listview_of_circle_color(context),
              ),
            ),
          ),
        ],
      ),
    ),*/
