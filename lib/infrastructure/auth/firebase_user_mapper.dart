import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:notes_firebase_ddd_course/domain/auth/user.dart';
import 'package:notes_firebase_ddd_course/domain/core/value_objects.dart';

extension FirebaseUserDomainX on firebase.User {
  Person toDomain() {
    return Person(id: UniqueId.fromUniqueString(uid));
  }
}
