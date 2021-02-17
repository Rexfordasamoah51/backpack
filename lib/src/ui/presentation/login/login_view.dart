import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../model/appstartup/bloc/authentication_bloc.dart';
import '../../../model/login/bloc/login_bloc.dart';
import '../../../model/repository/user_repository.dart';
import '../../global/model/validator.dart';
import '../../global/router/router.gr.dart';
import '../../global/widget/botton_flat.dart';
import '../../global/widget/leading.dart';
import '../../theme/ui_color/uicolors.dart';
import 'components/login_action.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginBloc _loginBloc;
  // ignore: close_sinks
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
      userRepository: UserRepository(),
      authenticationBloc: _authenticationBloc,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: LoginForm(
            authenticationBloc: _authenticationBloc,
            loginBloc: _loginBloc,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AuthenticationBloc>(
        '_authenticationBloc', _authenticationBloc));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
    this.loginBloc,
    this.authenticationBloc,
  }) : super(key: key);

  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;
  @override
  _LoginFormState createState() => _LoginFormState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<LoginBloc>('loginBloc', loginBloc));
    // ignore: cascade_invocations
    properties.add(DiagnosticsProperty<AuthenticationBloc>(
        'authenticationBloc', authenticationBloc));
  }
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc get _loginBloc => widget.loginBloc;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      cubit: _loginBloc,
      builder: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
        return Column(
          children: [
            const Gap(10),
            Leading(
              text: 'sign up',
              endText: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/register-view', (route) => false),
            ),
            const Gap(50),
            Form(
              key: LoginAction.loginFormKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (EmailValidator.validate(value) == false) {
                          return 'Invalid  Email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        LoginAction.credentials.userEmail = value;
                      },
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 18),
                      decoration: const InputDecoration(hintText: 'Email'),
                    ),
                    const Gap(40),
                    TextFormField(
                      validator: (value) {
                        if (value.length < 6) {
                          return 'Check your passowrd again';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        LoginAction.credentials.userPassword = value;
                      },
                      obscureText: true,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 18),
                      decoration: const InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.eye_fill),
                          hintText: 'Paasword'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.recoverAccountView),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Forget Paasword',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 18, color: UiColors.uiBlue),
                  ),
                ),
              ),
            ),
            const Gap(100),
            ButtonFlat(
              tap: (startLoading, stopLoading, btnState) {
                if (LoginAction.loginFormKey.currentState.validate()) {
                  LoginAction.loginFormKey.currentState.save();
                  FocusScope.of(context).dispose();
                  _loginBloc.add(LoginButtonPressed(
                      userEmail: LoginAction.credentials.userEmail,
                      userPassword: LoginAction.credentials.userPassword));
                  if (state is LoginLoading) {
                    startLoading();
                  }
                  // Navigator.pushNamed(context, '/home');
                  debugPrint('${LoginAction.credentials.userEmail} ');
                }
              },
              text: 'Log In',
              backgroundColor: UiColors.uiBlue,
              textColor: UiColors.greyLighter,
            ),
          ],
        );
      },
    );
  }
}
