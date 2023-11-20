import 'package:admin_dashboard/features/authentication/presentation/login_page.dart';
import 'package:admin_dashboard/features/users/presentation/users_page.dart';
import 'package:admin_dashboard/features/users/presentation/widgets/add_user_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ThemeData theme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: Colors.orange,
  appBarTheme: AppBarTheme(
    color: Colors.orange,
    titleTextStyle: GoogleFonts.montserrat(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.montserrat(),
    displayMedium: GoogleFonts.montserrat(),
    displaySmall: GoogleFonts.montserrat(),
    headlineLarge: GoogleFonts.montserrat(),
    headlineMedium: GoogleFonts.montserrat(),
    headlineSmall: GoogleFonts.montserrat(),
    labelLarge: GoogleFonts.montserrat(),
    labelMedium: GoogleFonts.montserrat(),
    labelSmall: GoogleFonts.montserrat(),
    bodyLarge: GoogleFonts.montserrat(),
    bodyMedium: GoogleFonts.montserrat(),
    bodySmall: GoogleFonts.montserrat(),
  ),
);

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: LoginPage.id,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: LoginPage.id,
      pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
      redirect: (context, state) async {
        final pref = await SharedPreferences.getInstance();
        final userJson = pref.getString("user");
        if (userJson != null) {
          return UsersPage.id;
        }
        return null;
      },
    ),
    GoRoute(
      path: UsersPage.id,
      pageBuilder: (context, state) => const MaterialPage(child: UsersPage()),
      redirect: (context, state) async {
        final pref = await SharedPreferences.getInstance();
        final userJson = pref.getString("user");
        if (userJson != null) {
          return null;
        }
        return LoginPage.id;
      },
      routes: [
        GoRoute(
          path: AddUserPage.id,
          pageBuilder: (context, state) =>
              const MaterialPage(child: AddUserPage()),
        ),
      ],
    ),
  ],
);
