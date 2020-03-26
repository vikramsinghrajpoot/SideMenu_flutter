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
    list = _fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.neeAppBar ? AppBar() : null,
        body: StreamBuilder<ApiStatus>(
            stream: _bloc.controller.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final note = (snapshot.data as List<Notes>)[index];
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
                  itemCount: (snapshot.data as List<Notes>).length,
                );
              } else if (snapshot.hasError) {
                return Container(
                  child: Text("Error"),
                );
              } else {
                return Loader();
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

  Future<ApiResponse> _fetchNotes() async {
     _bloc.fetchNotes(); 
  }
}
