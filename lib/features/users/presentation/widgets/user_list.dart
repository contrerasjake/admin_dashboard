import 'package:admin_dashboard/common/widgets/refresh_button.dart';
import 'package:admin_dashboard/features/users/application/providers.dart';
import 'package:admin_dashboard/features/users/presentation/widgets/user_list_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserList extends HookConsumerWidget {
  const UserList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(userListProvider);
    return prov.when(
      data: (data) {
        if (data.isEmpty) {
          return RefreshButton(
            onPressed: () => ref.invalidate(userListProvider),
          );
        }
        final filteredData = ref.watch(
            filteredUserListProvider.select((value) => value.value ?? []));
        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(userListProvider);
          },
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: filteredData.length,
            itemBuilder: (context, index) => UserTile(filteredData[index]),
            separatorBuilder: (context, index) => const Divider(height: 1),
          ),
        );
      },
      error: (error, stackTrace) => RefreshButton(
        onPressed: () => ref.invalidate(userListProvider),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
