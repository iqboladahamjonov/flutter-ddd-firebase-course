import 'package:flutter/material.dart';
import 'package:notes_firebase_ddd_course/domain/notes/note.dart';

class ErrorNoteCard extends StatelessWidget {
  final Note note;
  const ErrorNoteCard({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).errorColor,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            const Text(
              'Invalid Note, please contact support',
              style: TextStyle(fontSize: 16, color: Colors.white),
              // style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
            const SizedBox(
              height: 2,
            ),
            const Text(
              'Details for nerds: ',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            Text(
              note.failureOption.fold(() => '', (f) => f.toString()),
              style: const TextStyle(fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
