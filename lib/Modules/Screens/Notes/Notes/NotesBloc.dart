import 'dart:async';

import 'package:notes_rea/Modules/Screens/Notes/Models/Notes.dart';
import 'package:notes_rea/Modules/Service/ApiResponse.dart';
import '../../../Service/ApiBase.dart';

class NotesBloc {

final controller = StreamController<ApiResponse>();

fetchNotes() async{
  ApiResponse response = ApiResponse.loading("Loading");
  controller.sink.add(response);
  response = await ServiceManager('todos').get('');
  List<Notes> notes = List<Notes>();
  final tempNotes = response.data;
  tempNotes.map((obj) => notes.add(Notes.fromJson(obj))).toList();
  response.data = notes;
  controller.sink.add(response);
}

postNotes(email, password)async{
  ApiResponse response = ApiResponse.loading("Loading");
  controller.sink.add(response);
  response = await ServiceManager('todos').post({"email":email, "password":password});
  controller.sink.add(response);
}

}