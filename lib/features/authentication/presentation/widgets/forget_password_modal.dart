// ignore_for_file: use_build_context_synchronously

import 'package:admin_dashboard/common/widgets/error_message.dart';
import 'package:admin_dashboard/features/authentication/application/auth_controller.dart';
import 'package:admin_dashboard/features/users/application/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);

class ForgetPassModal extends HookConsumerWidget {
  static Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => const ForgetPassModal(),
        ) ??
        false;
  }

  const ForgetPassModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();
    return AlertDialog(
      insetPadding: MediaQuery.orientationOf(context) == Orientation.portrait
          ? const EdgeInsets.symmetric(horizontal: 5.0, vertical: 24.0)
          : const EdgeInsets.all(5),
      title: Text(
        'Forget Password',
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
                  name: 'email',
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
              ],
            ),
          ),
        ),
      ),
      actions: [
        Consumer(
          builder: (context, ref, child) {
            final isLoading = ref.watch(isLoadingProvider);
            return TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                      ref.invalidate(userListProvider);
                      Navigator.of(context).pop();
                    },
              child: const Text(
                'Cancel',
              ),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final isLoading = ref.watch(isLoadingProvider);
            return TextButton(
              onPressed: isLoading
                  ? null
                  : () async {
                      if (formKey.currentState!.saveAndValidate()) {
                        ref.read(isLoadingProvider.notifier).state = true;
                        final res = await ref
                            .read(authControllerProvider.notifier)
                            .forgetPassword(
                              context,
                              formKey.currentState?.value['email'],
                            );
                        ref.read(isLoadingProvider.notifier).state = false;
                        if (!res) return;
                        ref.read(errorTypeProvider.notifier).state = 'success';
                        ref.read(errorProvider.notifier).state = Exception(
                            'Request success:\nForget password request sent.');
                        Navigator.of(context).pop(true);
                      }
                    },
              child: const Text(
                'Send',
              ),
            );
          },
        ),
      ],
    );
  }
}
