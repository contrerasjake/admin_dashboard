import 'package:admin_dashboard/common/application/api/api.dart';
import 'package:admin_dashboard/common/application/api/urls.dart';
import 'package:admin_dashboard/common/widgets/error_message.dart';
import 'package:admin_dashboard/features/users/domain/user_info_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

final dataQueryProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final selectedIdProvider = StateProvider.autoDispose<int?>(
  (ref) => null,
);

//full list
@riverpod
class UserList extends _$UserList {
  @override
  FutureOr<List<UserInfo>> build() async {
    final dio = ref.watch(dioProvider);
    final dioController = DioController(dio: dio);
    final res = await dioController.get(
      ApiUrls.users,
    );
    if (res is! ApiResponseSuccess) {
      ref.read(errorProvider.notifier).state =
          Exception('Error:\n${res.message}');
      return [];
    }
    List<UserInfo> users = [];
    for (var data in res.data) {
      final user = UserInfo.fromJson(data);
      users.add(user);
    }
    return users;
  }
}

//filtered list
@riverpod
class FilteredUserList extends _$FilteredUserList {
  @override
  FutureOr<List<UserInfo>> build() async {
    final fullListProv =
        ref.watch(userListProvider.select((value) => value.value));
    if (fullListProv == null) return [];

    final query = ref.watch(dataQueryProvider);
    return fullListProv.where(
      (element) {
        final q = query.toUpperCase().trim();
        return (element.name.toUpperCase().contains(q) ||
            element.username.toUpperCase().contains(q) ||
            element.email.toUpperCase().contains(q));
      },
    ).toList();
  }
}
