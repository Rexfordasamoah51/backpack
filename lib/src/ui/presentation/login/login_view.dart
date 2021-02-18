import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';

import '../../../backend/authentication/authentication_bloc.dart';
import '../../../backend/login/login_cubit.dart';
import '../../../backend/repository/authentication_repository.dart';
import '../../global/router/router.gr.dart';
import '../../global/widget/botton_flat.dart';
import '../../global/widget/leading.dart';
import '../../theme/ui_color/uicolors.dart';
import 'components/login_action.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocProvider(
            create: (context) => LoginCubit(
                context.read<AuthenticationRepository>(),
                context.read<AuthenticationBloc>()),
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Column(
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
                children: const [
                  LoginEmailForm(),
                  Gap(40),
                  LoginPasswordForm(),
                ],
              ),
            ),
          ),
          const ForgetPasswordSection(),
          const Gap(100),
          const LoginFormButton(),
        ],
      ),
    );
  }
}

class LoginFormButton extends StatelessWidget {
  const LoginFormButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ButtonFlat(
          tap: state.status.isValidated
              ? (startLoading, stopLoading, btnState) async {
                  FocusScope.of(context).unfocus();
                  startLoading();
                  await context.read<LoginCubit>().loginWithEmail();
                  stopLoading();
                }
              : null,
          text: 'Log In',
          backgroundColor: UiColors.uiBlue,
          textColor: UiColors.greyLighter,
        );
      },
    );
  }
}

class ForgetPasswordSection extends StatelessWidget {
  const ForgetPasswordSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, Routes.recoverAccountView),
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
    );
  }
}

class LoginPasswordForm extends StatelessWidget {
  const LoginPasswordForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          key: const Key('LoginForm_Password_key'),
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          obscureText: true,
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18),
          decoration: InputDecoration(
              errorText: state.password.invalid ? 'password is invlid' : null,
              suffixIcon: const Icon(CupertinoIcons.eye_fill),
              hintText: 'Paasword'),
        );
      },
    );
  }
}

class LoginEmailForm extends StatelessWidget {
  const LoginEmailForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return TextFormField(
          key: const Key('LoginForm_email_field'),
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18),
          decoration: const InputDecoration(hintText: 'Email'),
        );
      },
    );
  }
}
