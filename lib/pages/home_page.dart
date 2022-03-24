import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/business_logic/notes_cubit.dart';
import 'package:notes/business_logic/state.dart';
import 'package:notes/pages/note_page.dart';

class HomePage extends StatelessWidget {
  final NotesCubit notesCubit;
  final String title;

  const HomePage({Key? key, required this.title, required this.notesCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<NotesCubit, NotesState>(
        // bloc: notesCubit,
        bloc: notesCubit,
        builder: (context, state) => ListView.builder(
          itemCount: state.notes.length,
          itemBuilder: (context, index) {
            var note = state.notes[index];

            return ListTile(
              title: Text(note.title),
              subtitle: Text(note.body),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToNotePage(context),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }

  _goToNotePage(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NotePage(notesCubit: notesCubit),
        ),
      );
}