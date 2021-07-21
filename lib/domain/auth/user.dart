//we are going to create firebase independent user type as entity
//the difference between entity and value object is entity can be comprised of multiple value objects, entity are not going to be validated by themselves, instead value objects which are held inside of them validates them
//this entity contains - Unique ID - it can also be assigned to Firestore, SQLite, Hive objects... UniqueID is not bound to any infrastructure

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_firebase_ddd_course/domain/core/value_objects.dart';

part 'user.freezed.dart';

//we create UniqueID value object which will be used for both users and notes later
// @freezed
// abstract class Person with _$Person {
//   const factory Person({required UniqueId id}) = _Person;
// }
@freezed
abstract class User with _$User {
  const factory User({required UniqueId id}) = _User;
}
//method for converting infrastructure firebase user to our nicely separed domain reprasentation of user, this conversion method shoudl be present in our infrastructe type