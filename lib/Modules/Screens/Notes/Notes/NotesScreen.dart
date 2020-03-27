import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notes_rea/Modules/CommonWidgets/Loader.dart';
import 'package:notes_rea/Modules/Screens/Notes/Models/Notes.dart';
import 'package:notes_rea/Modules/Screens/Notes/Notes/NotesBloc.dart';
import 'package:notes_rea/Modules/Service/ApiResponse.dart';
import '../../../Service/ApiBase.dart';

class NotesScreen extends StatefulWidget {
  bool neeAppBar = false;
  NotesScreen({this.neeAppBar});
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  Future<ApiResponse> list;
  final _bloc = NotesBloc();

  @override
  void initState() {
    _bloc.fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.neeAppBar ? AppBar() : null,
        body: StreamBuilder<ApiResponse>(
            stream: _bloc.controller.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting || snapshot.data.data == null) {
                return Loader();
              } else if (snapshot.data.status == ApiStatus.Error) {
                return Center(child: Container(child: Text('Error shown'),),);
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final note = (snapshot.data.data as List<Notes>)[index];
                    return GestureDetector(
                      onTap: () => _selectedItem(note),
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Title:  ${note.title}'),
                              Text('Userid:  ${note.userId}'),
                              Text('Id:  ${note.id}'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: (snapshot.data.data as List<Notes>).length,
                );
              }
            }));
  }

  _selectedItem(Notes data) {
    print(data.title);
    _showAlert(data.title, data.id);
  }

  _showAlert(title, id) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('$title'),
              content: Text('here we go! $id'),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
}
