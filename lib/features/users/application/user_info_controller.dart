import 'package:admin_dashboard/common/application/api/api.dart';
import 'package:admin_dashboard/common/application/api/urls.dart';
import 'package:admin_dashboard/common/widgets/error_message.dart';
import 'package:admin_dashboard/features/users/domain/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_info_controller.g.dart';

@riverpod
class UserInfoController extends _$UserInfoController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<bool> save(
    BuildContext context,
    UserInfo user,
  ) async {
    final dio = ref.watch(dioProvider);
    final dioController = DioController(dio: dio);
    state = const AsyncLoading();
    try {
      final res = await dioController.put(
        ApiUrls.userInfo(user.id),
        data: {
          "name": user.name,
          "is_active": user.isActive,
          "email": user.email,
        },
      );
      if (res is! ApiResponseSuccess) throw Exception(res.message);
      return true;
    } catch (e) {
      ref.read(errorTypeProvider.notifier).state = 'warning';
      ref.read(errorProvider.notifier).state = Exception(e);
      return false;
    }
  }

  Future<bool> addUser(
    BuildContext context,
    WidgetRef ref,
    Map<String, dynamic> user,
  ) async {
    final dio = ref.watch(dioProvider);
    final dioController = DioController(dio: dio);
    state = const AsyncLoading();
    try {
      final res = await dioController.post(
        ApiUrls.users,
        data: user,
      );
      if (res is! ApiResponseSuccess) throw Exception(res.message);
      state = const AsyncData(null);
      return true;
    } catch (e) {
      ref.read(errorTypeProvider.notifier).state = 'warning';
      ref.read(errorProvider.notifier).state = Exception(e);
      state = const AsyncData(null);
      return false;
    }
  }
}
