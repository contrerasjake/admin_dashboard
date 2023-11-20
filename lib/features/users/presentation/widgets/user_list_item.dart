import 'package:admin_dashboard/common/application/api/api.dart';
import 'package:admin_dashboard/common/application/api/urls.dart';
import 'package:admin_dashboard/common/widgets/error_message.dart';
import 'package:admin_dashboard/features/users/application/providers.dart';
import 'package:admin_dashboard/features/users/domain/user_info_model.dart';
import 'package:admin_dashboard/features/users/presentation/widgets/user_info_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserTile extends HookConsumerWidget {
  final UserInfo user;
  const UserTile(this.user, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(dataQueryProvider).toUpperCase();
    final nameWidget = buildText(
      user.name,
      query,
      GoogleFonts.montserrat(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
    final emailWidget = buildText(
      user.email,
      query,
      GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 14,
      ),
    );
    final usernameWidget = buildText(
      user.username,
      query,
      GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 14,
      ),
    );
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    user.name.trim() == ''
                        ? Text(
                            '- - -',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          )
                        : nameWidget,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'username: ',
                          style: GoogleFonts.montserrat(
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: usernameWidget,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'email: ',
                          style: GoogleFonts.montserrat(
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 5),
                        user.email.trim() == ''
                            ? Text(
                                '- - -',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              )
                            : Expanded(child: emailWidget),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'is Active: ',
                          style: GoogleFonts.montserrat(
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            user.isActive ? 'Yes' : 'No',
                            style: GoogleFonts.montserrat(
                              color: user.isActive ? Colors.green : Colors.red,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 52, 164, 255),
                  ),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
                ),
                onPressed: () async {
                  final dio = ref.watch(dioProvider);
                  final dioController = DioController(dio: dio);
                  UserInfo updatedUserInfo = user;
                  try {
                    final res = await dioController.get(
                      ApiUrls.userInfo(user.id),
                    );
                    if (res is! ApiResponseSuccess) {
                      throw Exception(res.message);
                    }
                    updatedUserInfo = UserInfo.fromJson(res.data);
                  } catch (e) {
                    ref.read(errorTypeProvider.notifier).state = 'warning';
                    ref.read(errorProvider.notifier).state = Exception(e);
                    return;
                  }
                  // ignore: use_build_context_synchronously
                  UserInfoModal.show(context, updatedUserInfo);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    'EDIT',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildText(String value, String query, TextStyle baseStyle) {
    final desc = value.trim();
    final pos = desc.toUpperCase().indexOf(query);
    if (pos == -1) return Text(value, style: baseStyle);
    String? start = (pos == 0 ? null : desc.substring(0, pos));
    String middle = desc.substring(pos, pos + query.length);
    String? end = (middle.length == desc.length
        ? null
        : desc.substring(pos + query.length, desc.length));
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: baseStyle,
        children: [
          if (start != null) TextSpan(text: start),
          TextSpan(
            text: middle,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, color: Colors.red),
          ),
          if (end != null) TextSpan(text: end),
        ],
      ),
    );
  }
}
