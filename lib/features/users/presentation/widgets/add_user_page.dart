import 'package:admin_dashboard/common/widgets/dynamic_button.dart';
import 'package:admin_dashboard/common/widgets/error_message.dart';
import 'package:admin_dashboard/common/widgets/seperator.dart';
import 'package:admin_dashboard/features/users/application/providers.dart';
import 'package:admin_dashboard/features/users/application/user_info_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final showPassProvider = StateProvider.autoDispose((ref) => true);
final passwordProvider = StateProvider.autoDispose((ref) => '');

class AddUserPage extends HookConsumerWidget {
  static const id = 'add';
  const AddUserPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(errorTypeProvider);
    // ref.listen<Exception?>(errorProvider, (previous, next) {
    //   if (next != null) {
    //     showCustomSnackbar(
    //       context,
    //       ref,
    //       next.toString().replaceAll('Exception: ', ''),
    //       SnackBarPosition.top,
    //     );
    //   }
    // });
    final formKey = GlobalKey<FormBuilderState>();
    final focus = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add User',
          style: GoogleFonts.montserrat(),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: FormBuilder(
            key: formKey,
            onChanged: () {
              formKey.currentState!.save();
              debugPrint(formKey.currentState!.value.toString());
            },
            child: Column(
              children: [
                const Separator(height: 1, text: 'Login Information'),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  name: 'username',
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter username...',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(100),
                  ]),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final showPass = ref.watch(showPassProvider);
                    final password = ref.watch(passwordProvider);
                    return FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      name: 'password',
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter username...',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            ref.read(showPassProvider.notifier).state =
                                !ref.read(showPassProvider.notifier).state;
                          },
                          icon: Icon(showPass
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      initialValue: password,
                      obscureText: showPass,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxLength(100),
                      ]),
                      textInputAction: TextInputAction.next,
                      onSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focus);
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Separator(height: 1, text: 'User Information'),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  focusNode: focus,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  name: 'name',
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter name...',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(250),
                  ]),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  name: 'email',
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter email...',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(250),
                    (val) {
                      if (EmailValidator.validate(val!)) {
                        return null;
                      }
                      return 'Please provide a valid email.';
                    },
                  ]),
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final prov = ref.watch(userInfoControllerProvider);
                    return DynamicButton(
                      text: 'Save',
                      function1: prov is AsyncLoading
                          ? null
                          : () async {
                              if (formKey.currentState!.saveAndValidate()) {
                                final user = {
                                  "username":
                                      formKey.currentState?.value['username'],
                                  "password":
                                      formKey.currentState?.value['password'],
                                  "name": formKey.currentState?.value['name'],
                                  "email": formKey.currentState?.value['email'],
                                };
                                final provider = ref
                                    .read(userInfoControllerProvider.notifier);
                                final res = await provider.addUser(
                                  context,
                                  ref,
                                  user,
                                );
                                if (!res) return;
                                ref.invalidate(userListProvider);
                                ref.read(errorTypeProvider.notifier).state =
                                    'success';
                                ref.read(errorProvider.notifier).state = Exception(
                                    'Request Success:\nUser Successfully Added.');
                                // ignore: use_build_context_synchronously
                                context.pop();
                              }
                            },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
