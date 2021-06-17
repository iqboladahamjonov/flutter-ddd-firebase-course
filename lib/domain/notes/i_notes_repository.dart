import 'package:kt_dart/kt.dart';
import 'package:notes_firebase_ddd_course/domain/notes/note.dart';

import 'package:notes_firebase_ddd_course/domain/notes/note_failure.dart';
import 'package:dartz/dartz.dart';

abstract class INoteRepository {
  //watch notes
  //watch uncompleted notes
  //CUD
  //CRUD - Read is separated into two parts - watch notes and watch uncompleted notes
  //create does not have any return type, that's why when it creates it returns Unit which mean nothing, However, it surely can return failure type
  Stream<Either<NoteFailure, KtList<Note>>> watchAll();
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();
  Future<Either<NoteFailure, Unit>> create(Note note);
  Future<Either<NoteFailure, Unit>> update(Note note);
  Future<Either<NoteFailure, Unit>> delete(Note note);
}
