import 'package:admin_dashboard/common/widgets/error_message.dart';
import 'package:admin_dashboard/features/authentication/application/auth_controller.dart';
import 'package:admin_dashboard/features/users/presentation/widgets/add_user_page.dart';
import 'package:admin_dashboard/features/users/presentation/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'widgets/search_bar.dart';

class UsersPage extends HookConsumerWidget {
  static const id = '/users';
  const UsersPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(errorTypeProvider);
    ref.listen<Exception?>(errorProvider, (previous, next) {
      if (next != null) {
        showCustomSnackbar(
          context,
          ref,
          next.toString().replaceAll('Exception: ', ''),
          SnackBarPosition.top,
        );
      }
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'User List',
            style: GoogleFonts.montserrat(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.all(10),
              child: IconButton(
                onPressed: () async => await ref
                    .read(authControllerProvider.notifier)
                    .logout(context),
                icon: const Icon(
                  Icons.exit_to_app,
                  size: 25,
                ),
              ),
            )
          ],
        ),
        body: const Column(children: [
          UserSearchBar(),
          Expanded(child: UserList()),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          onPressed: () {
            context.go(
              '${GoRouterState.of(context).matchedLocation}/${AddUserPage.id}',
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
