import 'package:dartz/dartz.dart';
import 'package:notes_firebase_ddd_course/domain/auth/auth_failure.dart';
import 'package:notes_firebase_ddd_course/domain/auth/user.dart';

import 'value_objects.dart';

//we are tring to resolve IAuthFacade type from get_it service locator but this type is not registered anywhere, so we want to register it, but we cannot straight out register it because this is only an interface. somehow we need to assciate interface of IAuthFacade with its concrete implemention. so that whenever we request iauthfacade we should know that what we want is the implemention of this interface
abstract class IAuthFacade {
  // Future<Option<Person>> getSignedInUser();
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
