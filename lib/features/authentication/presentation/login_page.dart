import 'package:admin_dashboard/common/widgets/error_message.dart';
import 'package:admin_dashboard/features/authentication/presentation/widgets/signin_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginPage extends StatefulHookConsumerWidget {
  static const id = '/auth/signin';
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.watch(errorTypeProvider);
    ref.listen<Exception?>(errorProvider, (previous, next) {
      if (next != null) {
        showCustomSnackbar(
          context,
          ref,
          next.toString().replaceAll('Exception: ', ''),
          SnackBarPosition.bottom,
        );
      }
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SDS Login',
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SignInForm(_formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
