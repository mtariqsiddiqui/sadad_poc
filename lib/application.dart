import 'package:reflectable/reflectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sadad_poc/src/common/None.dart';
import 'package:sadad_poc/src/common/error_screen.dart';
import 'package:sadad_poc/src/core/authorization/application/authorization_service.dart';
import 'package:sadad_poc/src/core/river_flow.dart';
import 'package:sadad_poc/src/features/accounts/presentation/query_account.dart';
import 'package:sadad_poc/src/features/accounts/presentation/rejected_account.dart';
import 'package:sadad_poc/src/features/bills/presentation/query_bill.dart';
import 'package:sadad_poc/src/features/bills/presentation/rejected_bill.dart';
import 'package:sadad_poc/src/features/home/presentation/home_page.dart';
import 'package:sadad_poc/src/features/authentication/presentation/login_page.dart';
import 'package:sadad_poc/src/core/authorization/domain/page.dart' as app_pages;
import '../main.reflectable.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: _routerConfig(ref),
      title: 'SADAD Portal',
      debugShowCheckedModeBanner: true,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      // home: const HomePage(title: 'SADAD Home Page'),
      // home: const AuthenticationController(),
    );
  }
}

class AuthenticationController extends ConsumerWidget {
  const AuthenticationController({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);
    return authState.when(
        data: (data) {
          if (data != null) return HomePage();
          return LoginInScreen();
        },
        loading: () => const CircularProgressIndicator(),
        error: (e, trace) => ErrorScreen(e, trace));
  }
}

/// The route configuration.
GoRouter _routerConfig(WidgetRef ref) {

  List<RouteBase> _allRoutes = [
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const AuthenticationController();
        }),
    // GoRoute(
    //   path: '/query-account',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const QueryAccount();
    //   },
    // ),
    // GoRoute(
    //   path: '/rejected-account',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const RejectedAccount();
    //   },
    // ),
    // GoRoute(
    //   path: '/query-bill',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const QueryBill();
    //   },
    // ),
    // GoRoute(
    //   path: '/rejected-bill',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const RejectedBill();
    //   },
    // ),
  ];

  ref.watch(pagesTileModelStreamProvider).when(
      data: (data) {
        for (final p in data) {
          p as app_pages.Page;

          ClassMirror classMirror;
          // var instance = classMirror.newInstance("", []);
          print("The Applicaiton name is ${p.pageApplication}");
          switch (p.pageApplication) {
            case 'QueryAccount':
              print("The Applicaiton name is - QueryAccount - ${p.pageApplication}");
              classMirror = reflector.reflect(p.pageApplication as Type) as ClassMirror;
            case 'QueryBill':
              print("The Applicaiton name is - QueryBill - ${p.pageApplication}");
              classMirror = reflector.reflect(p.pageApplication as Type) as ClassMirror;
            case 'RejectedAccount':
              print("The Applicaiton name is - RejectedAccount - ${p.pageApplication}");
              classMirror = reflector.reflect(p.pageApplication as Type) as ClassMirror;
            case 'RejectedBill':
              print("The Applicaiton name is - RejectedBill - ${p.pageApplication}");
              classMirror = reflector.reflect(p.pageApplication as Type) as ClassMirror;
            case 'None':
              print("The Applicaiton name is - QueryAccount - ${p.pageApplication}");
              classMirror = reflector.reflect(None) as ClassMirror;
              print("I WAS HERE in NONE");
            default:
              print("The Applicaiton name is - default - ${p.pageApplication}");
              classMirror = reflector.reflect(p.pageApplication as Type) as ClassMirror;
          }

          _allRoutes.add(GoRoute(
            path: p.pageUrl,
            builder: (BuildContext context, GoRouterState state) {
              return (classMirror.newInstance("", [])) as Widget;
            },
          ));
        }
      },
      loading: () => const CircularProgressIndicator(),
      error: (e, trace) => ErrorScreen(e, trace));

  return GoRouter(routes: _allRoutes);
}

class Reflector extends Reflectable {
  const Reflector() : super(newInstanceCapability,
      declarationsCapability,
      invokingCapability,
      subtypeQuantifyCapability,
      typeAnnotationDeepQuantifyCapability,
      typeCapability,
      typeRelationsCapability);
}

const reflector = Reflector();

class ApplicationRouting {
  final String applicationName;
  const ApplicationRouting({this.applicationName = 'None'});
}

const appRoute = ApplicationRouting();