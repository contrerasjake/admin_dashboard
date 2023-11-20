import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RefreshButton extends HookConsumerWidget {
  final void Function()? onPressed;
  const RefreshButton({
    this.onPressed,
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.all(Colors.grey),
          padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
        ),
        onPressed: onPressed,
        child: SizedBox(
          width: 120,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.refresh,
                  color: Colors.black,
                ),
                Text(
                  'REFRESH',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
