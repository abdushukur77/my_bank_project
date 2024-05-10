import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bank_project/blocs/bottom_bloc/bottom_bloc.dart';
import 'package:my_bank_project/blocs/bottom_bloc/bottom_event.dart';
import 'package:my_bank_project/blocs/user_profile/user_profile_bloc.dart';
import 'package:my_bank_project/data/repositories/user_profile_repository.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/cards_bloc/user_cards_bloc.dart';
import '../blocs/cards_bloc/user_cards_event.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/cards_repository.dart';
import '../screen/routes.dart';
import '../services/local_notification_service.dart';

class App extends StatelessWidget {
  App({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    LocalNotificationService.localNotificationService.init(navigatorKey);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository()),
        RepositoryProvider(
          create: (_) => UserProfileRepository(),
        ),
        RepositoryProvider(create: (_) => CardsRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AuthBloc(authRepository: context.read<AuthRepository>())
                    ..add(CheckAuthenticationEvent())),
          BlocProvider(
              create: (context) =>
                  UserProfileBloc(context.read<UserProfileRepository>())),
          BlocProvider(
              create: (context) =>
                  BottomBloc()..add(ChangeIndexEvent(index: 0))),
          BlocProvider(
            create: (context) =>
                CardsBloc(cardRepository: context.read<CardsRepository>())
                  ..add(GetCardsDatabaseEvent()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteNames.splashScreen,
          navigatorKey: navigatorKey,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}
