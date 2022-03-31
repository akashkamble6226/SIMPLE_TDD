https://arctouch.com/blog/flutter-test-driven-development/

A unit test of a single function, method, or class.
A widget test for a single widget.
An integration test for a complete app or a large part of an app.

Ideally, an app should have enough unit tests to cover the business logic, 
widget tests to cover how UI reacts to business logic state changes, 
and integration tests to cover higher-level use cases.

* Our app user requirements are:

1) Users can see a list of the notes.
2) Users can create a note.
3) Users can edit a note.
4) Users can delete a note.

* tester.pumpWidget -> Calls runApp with the given widget.(same like the runApp while running the app)
* tester.pump -> pump will ask this tester instance to paint a new frame
* tester.pumpAndSettle -> this will call pump over and over again until the animation is completed
* expect(find.text('Enter your text here...'), findsOneWidget); -> here tester is expecting one widget which has this text
* tester.enterText(find.byKey(const ValueKey('title')), 'hi'); -> one widget has key named title in that widget write the text as 'hi'
* await tester.tap(find.byType(TextButton)); -> finding the TextButton type button and then tapping on it
*
 