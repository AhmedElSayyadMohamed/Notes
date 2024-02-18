import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/data_layer/bloc/states.dart';
import 'package:notes/presentation_layer/shared/component/circle_color_item.dart';
import 'package:sqflite/sqflite.dart';

class app_cubit extends Cubit<app_states> {
  app_cubit() : super(intial_state());
  static app_cubit get(context) => BlocProvider.of(context);

  //////////////////////variable/////////////////

  List<Map> note = [];
  var body_controller = TextEditingController();
  var date_controller = TextEditingController();
  var time_controller = TextEditingController();
  int? index_of_choosed_color = 0;
  int choosed_color = circle_color[0];

  ////////////////////////methods///////////////////////

  void get_index({required int index}) {
    index_of_choosed_color = index;
    choosed_color = circle_color[index];
    emit(change_color_index());
  }

  //////////////////////////////// database ///////////////////
  Database? database;
  void create_database() {
    openDatabase('notes.db', version: 1, onCreate: (database, version) {
      print('database created');

      database
          .execute(
              'CREATE TABLE note (id INTEGER primary key ,body TEXT,date TEXT, time TEXT,color INTEGER,index_of_color_in_circle_color_list INTEGER ,status TEXT)')
          .then((value) {
        print('table created');
      }).catchError((error) {
        print('error when create table : ${error.toString()}');
      });
    }, onOpen: (database) {
      print('database opened');

      get_from_database(database).then((value) {
        note = value;
        emit(AppGetDataBase());
      });
    }).then((value) {
      database = value;
      emit(AppCreateDataBase());
    }).catchError((error) {
      print('error when create database : ${error.toString()}');
    });
  }

  Future insert_to_database({
    required String body,
    required String date,
    required String time,
    int? color,
    int? index_of_color_in_circle_color_list,
  }) async {
    await database!
        .rawInsert(
            'INSERT INTO note (body,date, time,color,index_of_color_in_circle_color_list,status ) VALUES ("$body","$date","$time","$color","$index_of_color_in_circle_color_list","new")')
        .then((value) {
      print('$value Successfully inserted');
      emit(AppInsertDataBase());
      get_from_database(database).then((value) {
        note = value;
        print(note);
        emit(AppGetDataBase());
      }).catchError((error) {
        print('error when get :${error.toString()}');
      });
    }).catchError((error) {
      print('error when inserted record : ${error.toString()}');
    });
  }

  Future<List<Map>> get_from_database(database) async {
    return await database!.rawQuery('SELECT* FROM note');
  }

  void update_record_database({
    required String? body,
    required String? date,
    required String? time,
    required int? color,
    required int id,
  }) {
    database!.rawUpdate(
        'UPDATE note SET body =?,date=?,time=?,color=? WHERE id =?',
        ['$body', '$date', '$time', '$color', id]).then((value) {
      emit(AppUpdateDataBase());
    }).catchError((error) {
      print('error when update :${error.toString()}');
    }).then((value) {
      get_from_database(database).then((value) {
        note = value;
        print(note);
        emit(AppGetDataBase());
      });
    });
  }

  void delete_record_from_database(int id) {
    database!.rawDelete('DELETE FROM note WHERE id =? ', [id]).then((value) {
      emit(AppDeleteFromDataBase());
      get_from_database(database).then((value) {
        note = value;
        emit(AppGetDataBase());
      });
    }).catchError((error) {
      print('error when delete record :${error.toString()}');
    });
  }
}
