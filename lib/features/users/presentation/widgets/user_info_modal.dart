// ignore_for_file: use_build_context_synchronously

import 'package:admin_dashboard/features/users/application/providers.dart';
import 'package:admin_dashboard/features/users/application/user_info_controller.dart';
import 'package:admin_dashboard/features/users/domain/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserInfoModal extends HookConsumerWidget {
  final UserInfo user;
  static Future<bool> show(BuildContext context, UserInfo user) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => UserInfoModal(
            user: user,
          ),
        ) ??
        false;
  }

  const UserInfoModal({required this.user, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();
    final isActiveController = useState(user.isActive);
    return AlertDialog(
      insetPadding: MediaQuery.orientationOf(context) == Orientation.portrait
          ? const EdgeInsets.symmetric(horizontal: 5.0, vertical: 24.0)
          : const EdgeInsets.all(5),
      title: Text(
        'Edit User',
        style: GoogleFonts.montserrat(color: Colors.black),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      actionsPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      content: SingleChildScrollView(
        child: FormBuilder(
          key: formKey,
          onChanged: () {
            formKey.currentState!.save();
            debugPrint(formKey.currentState!.value.toString());
          },
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FormBuilderTextField(
                  name: 'username',
                  initialValue: user.name,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter name...',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                FormBuilderTextField(
                  name: 'email',
                  initialValue: user.email,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter email...',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                _StatusSelection(isActiveController: isActiveController),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            ref.invalidate(userListProvider);
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
          ),
        ),
        TextButton(
          onPressed: () async {
            if (formKey.currentState!.saveAndValidate()) {
              print(formKey.currentState?.value['username']);
              final newUser = user.copyWith(
                name: formKey.currentState?.value['username'],
                email: formKey.currentState?.value['email'],
                isActive: isActiveController.value,
              );
              final res = await ref
                  .read(userInfoControllerProvider.notifier)
                  .save(context, newUser);
              if (!res) return;

              ref.invalidate(userListProvider);
              Navigator.of(context).pop(true);
            }
          },
          child: const Text(
            'Save',
          ),
        ),
      ],
    );
  }
}

class _StatusSelection extends HookConsumerWidget {
  final ValueNotifier<bool> isActiveController;
  const _StatusSelection({required this.isActiveController});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Is Active:',
          style: TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 117, 117, 117),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                backgroundColor: isActiveController.value
                    ? MaterialStateProperty.all(
                        Colors.green,
                      )
                    : MaterialStateProperty.all(
                        Colors.white,
                      ),
                padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
              ),
              onPressed: () async {
                isActiveController.value = true;
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  'Yes',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color:
                        isActiveController.value ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                backgroundColor: !isActiveController.value
                    ? MaterialStateProperty.all(
                        Colors.red,
                      )
                    : MaterialStateProperty.all(
                        Colors.white,
                      ),
                padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
              ),
              onPressed: () async {
                isActiveController.value = false;
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  'No',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color:
                        !isActiveController.value ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
