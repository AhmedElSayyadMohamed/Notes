import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/data_layer/bloc/cubit.dart';
import 'package:notes/data_layer/bloc/states.dart';
import 'package:notes/presentation_layer/modules/add_notes.dart';
import 'package:notes/presentation_layer/shared/component/build_note_item.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class home_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<app_cubit, app_states>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = app_cubit.get(context);
        return Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            backgroundColor: Colors.grey[900],
            elevation: 0,
            title: const Text(
              'Notes',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey[800],
            elevation: 50,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Add_notes()));
              cubit.body_controller.clear();
              cubit.time_controller.clear();
              cubit.date_controller.clear();
              cubit.get_index(index: 0);
            },
            child: const Icon(Icons.add),
          ),
          body: cubit.note.length > 0
              ? StaggeredGridView.countBuilder(
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 4,
                  itemCount: cubit.note.length,
                  itemBuilder: (BuildContext context, int index) =>
                      build_note_item(context, index),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, 3),
                )
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      'Add note by pressing on add Button',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
        );
      },
    );
  }
}

/*GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: cubit.note.length,
                  itemBuilder: (context, index) =>
                      build_note_item(context, index),
                )*/
/*
 StaggeredGridView.countBuilder(
           crossAxisCount: 4,
               itemCount: bloc.notes.length,
                itemBuilder: (context, index) {
                return InkWell(
                    onLongPress: () {
                     _showDialog(index);
                               },
                      child: GridViewItem(
                      note: bloc.notes[index],
      ),             );           },
           staggeredTileBuilder: (int index) =>
           StaggeredTile.count(2,2),
                         mainAxisSpacing: 4.0,
                              crossAxisSpacing: 4.0,
                                    );*/
