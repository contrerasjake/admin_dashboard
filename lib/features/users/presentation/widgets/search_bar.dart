import 'package:admin_dashboard/features/users/application/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserSearchBar extends HookConsumerWidget {
  const UserSearchBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qryController =
        useTextEditingController(text: ref.read(dataQueryProvider));
    ref.watch(dataQueryProvider);
    return TextField(
      controller: qryController,
      onChanged: (value) {
        final q = value.toUpperCase().trim();
        ref.read(dataQueryProvider.notifier).state = q;
      },
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        suffixIcon: ref.watch(dataQueryProvider) == ''
            ? null
            : IconButton(
                onPressed: () {
                  qryController.text = '';
                  ref.watch(dataQueryProvider.notifier).state = '';
                },
                icon: const Icon(Icons.clear),
              ),
        hintText: 'Search here...',
        counterText: '',
        isDense: false,
        prefixIcon: const Icon(Icons.search),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1)),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}
