import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes_firebase_ddd_course/application/notes/note_watcher/note_watcher_bloc.dart';

class UncompletedSwitch extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final toggleState = useState(false);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: InkResponse(
          onTap: () {
            toggleState.value = !toggleState.value;
            // print(toggleState.value);
            BlocProvider.of<NoteWatcherBloc>(context);
            context.read<NoteWatcherBloc>().add(toggleState.value
                ? const NoteWatcherEvent.watchUncompletedStarted()
                : const NoteWatcherEvent.watchAllStarted());
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: toggleState.value
                // ignore: prefer_const_constructors
                ? Icon(
                    Icons.check_box_outline_blank,
                    key: const Key('outline'),
                  )
                // ignore: prefer_const_constructors
                : Icon(
                    Icons.indeterminate_check_box,
                    key: const Key('indeterminate'),
                  ),
          ),
        )
        // Icon(
        //   toggleState.value
        //       ? Icons.check_box_outline_blank
        //       : Icons.indeterminate_check_box,
        // ),

        );
  }
}
