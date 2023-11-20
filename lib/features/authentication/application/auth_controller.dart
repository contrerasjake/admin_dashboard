// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:admin_dashboard/common/application/api/api.dart';
import 'package:admin_dashboard/common/application/api/urls.dart';
import 'package:admin_dashboard/common/widgets/error_message.dart';
import 'package:admin_dashboard/features/authentication/presentation/login_page.dart';
import 'package:admin_dashboard/features/users/presentation/users_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<void> signin(
    BuildContext context,
    String username,
    String password,
  ) async {
    final dio = ref.watch(dioProvider);
    final dioController = DioController(dio: dio);
    state = const AsyncLoading();
    try {
      final res = await dioController.post(
        ApiUrls.signin,
        data: {
          "username": username,
          "password": password,
        },
      );
      if (res is! ApiResponseSuccess) throw Exception(res.message);
      final user = {
        "username": username,
        "token": res.data,
      };
      final pref = await SharedPreferences.getInstance();
      pref.setString("user", jsonEncode(user));
      state = const AsyncValue.data(null);
      context.go(UsersPage.id);
    } catch (e) {
      state = const AsyncValue.data(null);
      ref.read(errorTypeProvider.notifier).state = 'warning';
      ref.read(errorProvider.notifier).state = Exception(e);
    }
  }

  Future<void> logout(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.remove("user");
    state = const AsyncData(null);
    context.go(LoginPage.id);
  }

  Future<bool> forgetPassword(BuildContext context, String email) async {
    final dio = ref.watch(dioProvider);
    final dioController = DioController(dio: dio);
    try {
      final res = await dioController.post(
        ApiUrls.forgetPass,
        data: {
          "email": email,
        },
      );
      if (res is! ApiResponseSuccess) throw Exception(res.message);
      ref.read(errorTypeProvider.notifier).state = 'success';
      ref.read(errorProvider.notifier).state =
          Exception('Request success:\nForget password request sent.');
      return true;
    } catch (e) {
      ref.read(errorTypeProvider.notifier).state = 'warning';
      ref.read(errorProvider.notifier).state = Exception(e);
      return false;
    }
  }
}
