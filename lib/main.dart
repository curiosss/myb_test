import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router.dart';
import 'core/themes.dart';

import 'features/auth/bloc/auth/auth_bloc.dart';
import 'features/auth/bloc/timer/timer_bloc.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/menu/bloc/menu_bloc.dart';
import 'features/mydb/bloc/mydb_bloc.dart';
import 'features/check/bloc/check_bloc.dart';
import 'features/help/bloc/help_bloc.dart';
import 'features/settings/bloc/settings_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => TimerBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => MenuBloc()),
        BlocProvider(create: (context) => MydbBloc()),
        BlocProvider(create: (context) => CheckBloc()),
        BlocProvider(create: (context) => HelpBloc()),
        BlocProvider(create: (context) => SettingsBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        routerConfig: routerConfig,
        locale: const Locale('ru', 'Ru'),
        scrollBehavior: const ScrollBehaviorModified(),
      ),
    );
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

// cd Desktop/work/myb_test
// flutter build apk --split-per-abi