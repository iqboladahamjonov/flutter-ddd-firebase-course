import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_firebase_ddd_course/domain/auth/i_auth_facade.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

//injectable makes sure that we can inject for one AuthBloc, Or find it with GetIt. and also makes sure the constructor is being passed proper instances, i.e: _authFacade
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //AuthBloc should communicate with Firebase Auth Facade facade, as we are inside the application layer, we are not going to communicate with infrastructure directy, instead we are going to communicate through abstract IAuthFacade, not directy with
  final IAuthFacade _authFacade;
  AuthBloc(this._authFacade) : super(const _Initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(authCheckRequested: (e) async* {
      final userOption = await _authFacade.getSignedInUser();
      yield userOption.fold(() => const AuthState.unauthenticated(),
          (_) => const AuthState.authenticated());
    }, signedOut: (e) async* {
      await _authFacade.signOut();
      yield const AuthState.unauthenticated();
    });
  }
}
