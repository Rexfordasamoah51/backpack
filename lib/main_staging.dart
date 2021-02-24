// Copyright (c) 2021, BackPack
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:backpack/app/app.dart';
import 'package:backpack/app/app_bloc_observer.dart';

import 'src/backend/repository/authentication_repository.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(App(
      authRepository: AuthenticationRepository(),
    )),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
