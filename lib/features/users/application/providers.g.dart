// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userListHash() => r'c3a423275a2a4b9766019348e4d2bb835a8eecbc';

/// See also [UserList].
@ProviderFor(UserList)
final userListProvider =
    AutoDisposeAsyncNotifierProvider<UserList, List<UserInfo>>.internal(
  UserList.new,
  name: r'userListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserList = AutoDisposeAsyncNotifier<List<UserInfo>>;
String _$filteredUserListHash() => r'160cd30a1dfd60164a27fabccb71658f094cc79d';

/// See also [FilteredUserList].
@ProviderFor(FilteredUserList)
final filteredUserListProvider =
    AutoDisposeAsyncNotifierProvider<FilteredUserList, List<UserInfo>>.internal(
  FilteredUserList.new,
  name: r'filteredUserListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredUserListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FilteredUserList = AutoDisposeAsyncNotifier<List<UserInfo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
