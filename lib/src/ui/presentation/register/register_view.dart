import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';

import '../../../backend/authentication/authentication_bloc.dart';
import '../../../backend/register/register_cubit.dart';
import '../../../backend/repository/authentication_repository.dart';
import '../../global/widget/botton_flat.dart';
import '../../global/widget/leading.dart';
import '../../theme/ui_color/uicolors.dart';
import 'components/register_action.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const Gap(10),
              Leading(
                text: 'Login',
                endText: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/login-view', (route) => false),
              ),
              const Gap(50),
              BlocProvider(
                create: (context) => RegisterCubit(
                    context.read<AuthenticationRepository>(),
                    context.read<AuthenticationBloc>()),
                child: const RegisterForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Authentication Failure')),
              );
          }
        },
        child: Form(
          key: RegisterAction.registerFormKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: const [
                NameInput(),
                Gap(40),
                EmailInput(),
                Gap(40),
                PasswordInput(),
                Gap(40),
                ConfirmInput(),
                Gap(100),
                RegistrationButton()
              ],
            ),
          ),
        ));
  }
}

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ButtonFlat(
          tap: state.status.isValidated
              ? (startLoading, stopLoading, btnState) {
                  // ignore: unnecessary_statements
                  context.read<RegisterCubit>().logInWithCredentials();
                  startLoading();
                }
              : null,
          text: 'Sign up',
          backgroundColor: UiColors.uiBlue,
          textColor: UiColors.greyLighter,
        );
      },
    );
  }
}

class ConfirmInput extends StatelessWidget {
  const ConfirmInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return TextFormField(
          key: const Key('RegisterForm_confirmInput_textField'),
          keyboardType: TextInputType.visiblePassword,
          onChanged: (confirmpassword) => context
              .read<RegisterCubit>()
              .confirmPasswordChanged(confirmpassword),
          obscureText: true,
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18),
          decoration: InputDecoration(
              errorText: state.confirmedPassword.invalid
                  ? 'password are not equal'
                  : null,
              suffixIcon: const Icon(CupertinoIcons.eye_fill),
              hintText: 'Confirm Paasword'),
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          key: const Key('RegisterForm_passwordInput_textField'),
          keyboardType: TextInputType.visiblePassword,
          onChanged: (password) =>
              context.read<RegisterCubit>().passwordChanged(password),
          obscureText: true,
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18),
          decoration: InputDecoration(
              errorText: state.password.invalid ? 'invalid password' : null,
              suffixIcon: const Icon(CupertinoIcons.eye_fill),
              hintText: 'Paasword'),
        );
      },
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key('RegisterForm_emailInput_textField'),
          keyboardType: TextInputType.emailAddress,
          onChanged: (email) =>
              context.read<RegisterCubit>().emailChanged(email),
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18),
          decoration: InputDecoration(
              errorText: state.email.invalid ? 'invalid email' : null,
              hintText: 'Email'),
        );
      },
    );
  }
}

class NameInput extends StatelessWidget {
  const NameInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.userName != current.userName,
      builder: (context, state) {
        return BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return TextFormField(
              key: const Key('RegisterForm_nameInput_textField'),
              keyboardType: TextInputType.name,
              onChanged: (name) =>
                  context.read<RegisterCubit>().userNameChanged(name),
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Name',
                errorText: state.userName.invalid ? 'invalid username' : null,
              ),
            );
          },
        );
      },
    );
  }
}

// ignore: unused_element
void _onWidgetDidBuild(Function callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}
