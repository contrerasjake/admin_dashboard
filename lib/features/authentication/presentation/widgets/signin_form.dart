import 'package:admin_dashboard/common/widgets/dynamic_button.dart';
import 'package:admin_dashboard/features/authentication/application/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'forget_password_modal.dart';

final _showPassProvider = StateProvider.autoDispose((ref) => true);

class SignInForm extends HookConsumerWidget {
  final GlobalKey<FormBuilderState> formKey;
  const SignInForm(this.formKey, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilder(
      key: formKey,
      onChanged: () {
        formKey.currentState!.save();
        debugPrint(formKey.currentState!.value.toString());
      },
      child: Column(
        children: [
          FormBuilderTextField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            name: 'username',
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              labelText: 'Username',
              floatingLabelStyle: GoogleFonts.montserrat(color: Colors.blue),
              hintStyle: GoogleFonts.montserrat(),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 0.0),
              ),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer(
            builder: (context, ref, child) {
              final showPass = ref.watch(_showPassProvider);
              return FormBuilderTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                name: 'password',
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  labelText: 'Password',
                  floatingLabelStyle:
                      GoogleFonts.montserrat(color: Colors.blue),
                  hintStyle: GoogleFonts.montserrat(),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 0.0),
                  ),
                  focusColor: Colors.blue,
                  suffixIcon: IconButton(
                    onPressed: () {
                      ref.read(_showPassProvider.notifier).state =
                          !ref.read(_showPassProvider.notifier).state;
                    },
                    icon: Icon(
                      showPass ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                obscureText: showPass,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              ForgetPassModal.show(context);
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer(
            builder: (context, ref, child) {
              final prov = ref.watch(authControllerProvider);
              Widget child = prov.when(
                data: (data) => Text(
                  'Login',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                  ),
                ),
                error: (error, stackTrace) => Text(
                  'Login',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                  ),
                ),
                loading: () => const CircularProgressIndicator(),
              );
              return DynamicButton(
                text: '',
                function1: child is CircularProgressIndicator
                    ? null
                    : () async {
                        if (formKey.currentState!.saveAndValidate()) {
                          final provider =
                              ref.read(authControllerProvider.notifier);
                          await provider.signin(
                            context,
                            formKey.currentState?.value['username'],
                            formKey.currentState?.value['password'],
                          );
                        }
                      },
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }
}
