import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notes/business_logic/notes_cubit.dart';
import 'package:notes/pages/home_page.dart';
import 'package:notes/pages/note_page.dart';

void main() {
  group('Home Page', () {
    _pumpTestWidget(WidgetTester tester, NotesCubit cubit) => tester.pumpWidget(
          MaterialApp(
            home: HomePage(
              title: 'Home',
              notesCubit: cubit,
            ),
          ),
        );

    // initial test
    testWidgets('empty test', (WidgetTester tester) async {
      await _pumpTestWidget(tester, NotesCubit());
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('update list when new note is added',
        (WidgetTester tester) async {
      var notesCubit = NotesCubit();
      // below line assigned task to the tester with one object
      await _pumpTestWidget(tester, notesCubit);
      // below 4 lined test data is created
      var expectedTitle = 'note title';
      var expectedBody = 'notes body';
      notesCubit.createNote(expectedTitle, expectedBody);
      notesCubit.createNote('another title', 'another body');
      // below line fetched the widged
      await tester.pump();
      // finally checking the result

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(2));

      expect(find.text(expectedTitle), findsOneWidget);
      expect(find.text(expectedBody), findsOneWidget);
    });

    testWidgets('update list when a note is deleted',
        (WidgetTester tester) async {
      var notesCubit = NotesCubit();
      await _pumpTestWidget(tester, notesCubit);
      var expectedTitle = 'notes tile';
      var expectedBody = 'notes body';

      notesCubit.createNote(expectedTitle, expectedBody);
      notesCubit.createNote('another title', 'another body');

      await tester.pump();

      notesCubit.deleteNote(1);
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
      expect(find.text(expectedTitle), findsNothing);
    });

    testWidgets('navigate to new page', (WidgetTester tester) async{

      var notesCubit = NotesCubit();
      await _pumpTestWidget(tester, notesCubit);
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.byType(NotePage), findsOneWidget);

    });
  });
}
