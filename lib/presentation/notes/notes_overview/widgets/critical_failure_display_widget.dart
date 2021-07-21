import 'package:flutter/material.dart';
import 'package:notes_firebase_ddd_course/domain/notes/note_failure.dart';

class CriticalFailureDisplay extends StatelessWidget {
  final NoteFailure failure;

  const CriticalFailureDisplay({Key? key, required this.failure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // ignore: avoid_redundant_argument_values
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '😭 Big Failure',
            style: TextStyle(fontSize: 50),
          ),
          Text(
            failure.maybeMap(
              insufficientPermission: (_) => 'Insufficient Permissions',
              orElse: () => 'Unexpected Error. \nPlease contact support.',
            ),
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              // print('Sending Email');
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.mail),
                SizedBox(
                  width: 4,
                ),
                Text('I NEED HELP!'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
