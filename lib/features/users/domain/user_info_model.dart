import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const UserInfo._();
  const factory UserInfo({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'Username') required String username,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Email') required String email,
    @JsonKey(name: 'IsActive') required bool isActive,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'ModifiedDate') DateTime? modifiedDate,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
