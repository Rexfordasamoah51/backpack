import 'package:backpack/src/model/appstartup/bloc/authentication_bloc.dart';
import 'package:backpack/src/model/repository/user_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  AuthenticationBloc authenticationBloc;
  MockUserRepository userRepository;

  ///[setup] function is called before any other function
  setUp(() async {
    userRepository = MockUserRepository();
    authenticationBloc = AuthenticationBloc(userRepository: userRepository);
  });

  ///[tearDown] is called when ever every function has been process
  tearDown(() {
    authenticationBloc?.close();
  });

  blocTest<AuthenticationBloc, AuthenticationState>('Initial State',
      build: () => authenticationBloc, expect: <dynamic>[]);

  blocTest<AuthenticationBloc, AuthenticationState>('Login State',
      build: () => authenticationBloc,
      // ignore: missing_required_param
      act: (bloc) => bloc.add(LoggedIn()),
      expect: <AuthenticationState>[
        AuthenticationLoading(),
        AuthenticationAuthenticated()
      ]);

  blocTest<AuthenticationBloc, AuthenticationState>('Register State',
      build: () => authenticationBloc,
      act: (bloc) => bloc.add(RegisterAccount()),
      expect: <AuthenticationState>[
        AuthenticationLoading(),
        AuthenticationAuthenticated()
      ]);

  blocTest<AuthenticationBloc, AuthenticationState>('Logout State',
      expect: <AuthenticationState>[
        AuthenticationLoading(),
        AuthenticationUnauthenticated()
      ],
      build: () => authenticationBloc,
      act: (bloc) => bloc.add(LoggedOut()));
}
