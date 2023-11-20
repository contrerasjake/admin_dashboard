// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiResponse {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)
        success,
    required TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)
        warning,
    required TResult Function(
            String message, Object error, StackTrace? stackTrace)
        unexpectedError,
    required TResult Function(
            String message, Object error, StackTrace? stackTrace)
        timeoutExceeded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        success,
    TResult? Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        warning,
    TResult? Function(String message, Object error, StackTrace? stackTrace)?
        unexpectedError,
    TResult? Function(String message, Object error, StackTrace? stackTrace)?
        timeoutExceeded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        success,
    TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        warning,
    TResult Function(String message, Object error, StackTrace? stackTrace)?
        unexpectedError,
    TResult Function(String message, Object error, StackTrace? stackTrace)?
        timeoutExceeded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResponseSuccess value) success,
    required TResult Function(ApiResponseWarning value) warning,
    required TResult Function(ApiResponseUnexpectedError value) unexpectedError,
    required TResult Function(ApiResponseTimeout value) timeoutExceeded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiResponseSuccess value)? success,
    TResult? Function(ApiResponseWarning value)? warning,
    TResult? Function(ApiResponseUnexpectedError value)? unexpectedError,
    TResult? Function(ApiResponseTimeout value)? timeoutExceeded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseWarning value)? warning,
    TResult Function(ApiResponseUnexpectedError value)? unexpectedError,
    TResult Function(ApiResponseTimeout value)? timeoutExceeded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiResponseCopyWith<ApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<$Res> {
  factory $ApiResponseCopyWith(
          ApiResponse value, $Res Function(ApiResponse) then) =
      _$ApiResponseCopyWithImpl<$Res, ApiResponse>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<$Res, $Val extends ApiResponse>
    implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message!
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiResponseSuccessImplCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$ApiResponseSuccessImplCopyWith(_$ApiResponseSuccessImpl value,
          $Res Function(_$ApiResponseSuccessImpl) then) =
      __$$ApiResponseSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic>? request, dynamic data, String? message});
}

/// @nodoc
class __$$ApiResponseSuccessImplCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res, _$ApiResponseSuccessImpl>
    implements _$$ApiResponseSuccessImplCopyWith<$Res> {
  __$$ApiResponseSuccessImplCopyWithImpl(_$ApiResponseSuccessImpl _value,
      $Res Function(_$ApiResponseSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ApiResponseSuccessImpl(
      request: freezed == request
          ? _value._request
          : request // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiResponseSuccessImpl extends ApiResponseSuccess {
  const _$ApiResponseSuccessImpl(
      {final Map<String, dynamic>? request, this.data, this.message})
      : _request = request,
        super._();

  final Map<String, dynamic>? _request;
  @override
  Map<String, dynamic>? get request {
    final value = _request;
    if (value == null) return null;
    if (_request is EqualUnmodifiableMapView) return _request;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final dynamic data;
  @override
  final String? message;

  @override
  String toString() {
    return 'ApiResponse.success(request: $request, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseSuccessImpl &&
            const DeepCollectionEquality().equals(other._request, _request) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_request),
      const DeepCollectionEquality().hash(data),
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseSuccessImplCopyWith<_$ApiResponseSuccessImpl> get copyWith =>
      __$$ApiResponseSuccessImplCopyWithImpl<_$ApiResponseSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)
        success,
    required TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)
        warning,
    required TResult Function(
            String message, Object error, StackTrace? stackTrace)
        unexpectedError,
    required TResult Function(
            String message, Object error, StackTrace? stackTrace)
        timeoutExceeded,
  }) {
    return success(request, data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        success,
    TResult? Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        warning,
    TResult? Function(String message, Object error, StackTrace? stackTrace)?
        unexpectedError,
    TResult? Function(String message, Object error, StackTrace? stackTrace)?
        timeoutExceeded,
  }) {
    return success?.call(request, data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        success,
    TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        warning,
    TResult Function(String message, Object error, StackTrace? stackTrace)?
        unexpectedError,
    TResult Function(String message, Object error, StackTrace? stackTrace)?
        timeoutExceeded,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(request, data, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResponseSuccess value) success,
    required TResult Function(ApiResponseWarning value) warning,
    required TResult Function(ApiResponseUnexpectedError value) unexpectedError,
    required TResult Function(ApiResponseTimeout value) timeoutExceeded,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiResponseSuccess value)? success,
    TResult? Function(ApiResponseWarning value)? warning,
    TResult? Function(ApiResponseUnexpectedError value)? unexpectedError,
    TResult? Function(ApiResponseTimeout value)? timeoutExceeded,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseWarning value)? warning,
    TResult Function(ApiResponseUnexpectedError value)? unexpectedError,
    TResult Function(ApiResponseTimeout value)? timeoutExceeded,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ApiResponseSuccess extends ApiResponse {
  const factory ApiResponseSuccess(
      {final Map<String, dynamic>? request,
      final dynamic data,
      final String? message}) = _$ApiResponseSuccessImpl;
  const ApiResponseSuccess._() : super._();

  Map<String, dynamic>? get request;
  dynamic get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ApiResponseSuccessImplCopyWith<_$ApiResponseSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiResponseWarningImplCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$ApiResponseWarningImplCopyWith(_$ApiResponseWarningImpl value,
          $Res Function(_$ApiResponseWarningImpl) then) =
      __$$ApiResponseWarningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic>? request, dynamic data, String? message});
}

/// @nodoc
class __$$ApiResponseWarningImplCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res, _$ApiResponseWarningImpl>
    implements _$$ApiResponseWarningImplCopyWith<$Res> {
  __$$ApiResponseWarningImplCopyWithImpl(_$ApiResponseWarningImpl _value,
      $Res Function(_$ApiResponseWarningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ApiResponseWarningImpl(
      request: freezed == request
          ? _value._request
          : request // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiResponseWarningImpl extends ApiResponseWarning {
  const _$ApiResponseWarningImpl(
      {final Map<String, dynamic>? request, this.data, this.message})
      : _request = request,
        super._();

  final Map<String, dynamic>? _request;
  @override
  Map<String, dynamic>? get request {
    final value = _request;
    if (value == null) return null;
    if (_request is EqualUnmodifiableMapView) return _request;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final dynamic data;
  @override
  final String? message;

  @override
  String toString() {
    return 'ApiResponse.warning(request: $request, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseWarningImpl &&
            const DeepCollectionEquality().equals(other._request, _request) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_request),
      const DeepCollectionEquality().hash(data),
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseWarningImplCopyWith<_$ApiResponseWarningImpl> get copyWith =>
      __$$ApiResponseWarningImplCopyWithImpl<_$ApiResponseWarningImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)
        success,
    required TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)
        warning,
    required TResult Function(
            String message, Object error, StackTrace? stackTrace)
        unexpectedError,
    required TResult Function(
            String message, Object error, StackTrace? stackTrace)
        timeoutExceeded,
  }) {
    return warning(request, data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        success,
    TResult? Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        warning,
    TResult? Function(String message, Object error, StackTrace? stackTrace)?
        unexpectedError,
    TResult? Function(String message, Object error, StackTrace? stackTrace)?
        timeoutExceeded,
  }) {
    return warning?.call(request, data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        success,
    TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        warning,
    TResult Function(String message, Object error, StackTrace? stackTrace)?
        unexpectedError,
    TResult Function(String message, Object error, StackTrace? stackTrace)?
        timeoutExceeded,
    required TResult orElse(),
  }) {
    if (warning != null) {
      return warning(request, data, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResponseSuccess value) success,
    required TResult Function(ApiResponseWarning value) warning,
    required TResult Function(ApiResponseUnexpectedError value) unexpectedError,
    required TResult Function(ApiResponseTimeout value) timeoutExceeded,
  }) {
    return warning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiResponseSuccess value)? success,
    TResult? Function(ApiResponseWarning value)? warning,
    TResult? Function(ApiResponseUnexpectedError value)? unexpectedError,
    TResult? Function(ApiResponseTimeout value)? timeoutExceeded,
  }) {
    return warning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseWarning value)? warning,
    TResult Function(ApiResponseUnexpectedError value)? unexpectedError,
    TResult Function(ApiResponseTimeout value)? timeoutExceeded,
    required TResult orElse(),
  }) {
    if (warning != null) {
      return warning(this);
    }
    return orElse();
  }
}

abstract class ApiResponseWarning extends ApiResponse {
  const factory ApiResponseWarning(
      {final Map<String, dynamic>? request,
      final dynamic data,
      final String? message}) = _$ApiResponseWarningImpl;
  const ApiResponseWarning._() : super._();

  Map<String, dynamic>? get request;
  dynamic get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ApiResponseWarningImplCopyWith<_$ApiResponseWarningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiResponseUnexpectedErrorImplCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$ApiResponseUnexpectedErrorImplCopyWith(
          _$ApiResponseUnexpectedErrorImpl value,
          $Res Function(_$ApiResponseUnexpectedErrorImpl) then) =
      __$$ApiResponseUnexpectedErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Object error, StackTrace? stackTrace});
}

/// @nodoc
class __$$ApiResponseUnexpectedErrorImplCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res, _$ApiResponseUnexpectedErrorImpl>
    implements _$$ApiResponseUnexpectedErrorImplCopyWith<$Res> {
  __$$ApiResponseUnexpectedErrorImplCopyWithImpl(
      _$ApiResponseUnexpectedErrorImpl _value,
      $Res Function(_$ApiResponseUnexpectedErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? error = null,
    Object? stackTrace = freezed,
  }) {
    return _then(_$ApiResponseUnexpectedErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == error ? _value.error : error,
      freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$ApiResponseUnexpectedErrorImpl extends ApiResponseUnexpectedError {
  const _$ApiResponseUnexpectedErrorImpl(this.message, this.error,
      [this.stackTrace])
      : super._();

  @override
  final String message;
  @override
  final Object error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'ApiResponse.unexpectedError(message: $message, error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseUnexpectedErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(error), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseUnexpectedErrorImplCopyWith<_$ApiResponseUnexpectedErrorImpl>
      get copyWith => __$$ApiResponseUnexpectedErrorImplCopyWithImpl<
          _$ApiResponseUnexpectedErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)
        success,
    required TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)
        warning,
    required TResult Function(
            String message, Object error, StackTrace? stackTrace)
        unexpectedError,
    required TResult Function(
            String message, Object error, StackTrace? stackTrace)
        timeoutExceeded,
  }) {
    return unexpectedError(message, error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        success,
    TResult? Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        warning,
    TResult? Function(String message, Object error, StackTrace? stackTrace)?
        unexpectedError,
    TResult? Function(String message, Object error, StackTrace? stackTrace)?
        timeoutExceeded,
  }) {
    return unexpectedError?.call(message, error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        success,
    TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        warning,
    TResult Function(String message, Object error, StackTrace? stackTrace)?
        unexpectedError,
    TResult Function(String message, Object error, StackTrace? stackTrace)?
        timeoutExceeded,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(message, error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResponseSuccess value) success,
    required TResult Function(ApiResponseWarning value) warning,
    required TResult Function(ApiResponseUnexpectedError value) unexpectedError,
    required TResult Function(ApiResponseTimeout value) timeoutExceeded,
  }) {
    return unexpectedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiResponseSuccess value)? success,
    TResult? Function(ApiResponseWarning value)? warning,
    TResult? Function(ApiResponseUnexpectedError value)? unexpectedError,
    TResult? Function(ApiResponseTimeout value)? timeoutExceeded,
  }) {
    return unexpectedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseWarning value)? warning,
    TResult Function(ApiResponseUnexpectedError value)? unexpectedError,
    TResult Function(ApiResponseTimeout value)? timeoutExceeded,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(this);
    }
    return orElse();
  }
}

abstract class ApiResponseUnexpectedError extends ApiResponse {
  const factory ApiResponseUnexpectedError(
      final String message, final Object error,
      [final StackTrace? stackTrace]) = _$ApiResponseUnexpectedErrorImpl;
  const ApiResponseUnexpectedError._() : super._();

  @override
  String get message;
  Object get error;
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$ApiResponseUnexpectedErrorImplCopyWith<_$ApiResponseUnexpectedErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiResponseTimeoutImplCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$ApiResponseTimeoutImplCopyWith(_$ApiResponseTimeoutImpl value,
          $Res Function(_$ApiResponseTimeoutImpl) then) =
      __$$ApiResponseTimeoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Object error, StackTrace? stackTrace});
}

/// @nodoc
class __$$ApiResponseTimeoutImplCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res, _$ApiResponseTimeoutImpl>
    implements _$$ApiResponseTimeoutImplCopyWith<$Res> {
  __$$ApiResponseTimeoutImplCopyWithImpl(_$ApiResponseTimeoutImpl _value,
      $Res Function(_$ApiResponseTimeoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? error = null,
    Object? stackTrace = freezed,
  }) {
    return _then(_$ApiResponseTimeoutImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == error ? _value.error : error,
      freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$ApiResponseTimeoutImpl extends ApiResponseTimeout {
  const _$ApiResponseTimeoutImpl(this.message, this.error, [this.stackTrace])
      : super._();

  @override
  final String message;
  @override
  final Object error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'ApiResponse.timeoutExceeded(message: $message, error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseTimeoutImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(error), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseTimeoutImplCopyWith<_$ApiResponseTimeoutImpl> get copyWith =>
      __$$ApiResponseTimeoutImplCopyWithImpl<_$ApiResponseTimeoutImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)
        success,
    required TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)
        warning,
    required TResult Function(
            String message, Object error, StackTrace? stackTrace)
        unexpectedError,
    required TResult Function(
            String message, Object error, StackTrace? stackTrace)
        timeoutExceeded,
  }) {
    return timeoutExceeded(message, error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        success,
    TResult? Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        warning,
    TResult? Function(String message, Object error, StackTrace? stackTrace)?
        unexpectedError,
    TResult? Function(String message, Object error, StackTrace? stackTrace)?
        timeoutExceeded,
  }) {
    return timeoutExceeded?.call(message, error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        success,
    TResult Function(
            Map<String, dynamic>? request, dynamic data, String? message)?
        warning,
    TResult Function(String message, Object error, StackTrace? stackTrace)?
        unexpectedError,
    TResult Function(String message, Object error, StackTrace? stackTrace)?
        timeoutExceeded,
    required TResult orElse(),
  }) {
    if (timeoutExceeded != null) {
      return timeoutExceeded(message, error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResponseSuccess value) success,
    required TResult Function(ApiResponseWarning value) warning,
    required TResult Function(ApiResponseUnexpectedError value) unexpectedError,
    required TResult Function(ApiResponseTimeout value) timeoutExceeded,
  }) {
    return timeoutExceeded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiResponseSuccess value)? success,
    TResult? Function(ApiResponseWarning value)? warning,
    TResult? Function(ApiResponseUnexpectedError value)? unexpectedError,
    TResult? Function(ApiResponseTimeout value)? timeoutExceeded,
  }) {
    return timeoutExceeded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResponseSuccess value)? success,
    TResult Function(ApiResponseWarning value)? warning,
    TResult Function(ApiResponseUnexpectedError value)? unexpectedError,
    TResult Function(ApiResponseTimeout value)? timeoutExceeded,
    required TResult orElse(),
  }) {
    if (timeoutExceeded != null) {
      return timeoutExceeded(this);
    }
    return orElse();
  }
}

abstract class ApiResponseTimeout extends ApiResponse {
  const factory ApiResponseTimeout(final String message, final Object error,
      [final StackTrace? stackTrace]) = _$ApiResponseTimeoutImpl;
  const ApiResponseTimeout._() : super._();

  @override
  String get message;
  Object get error;
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$ApiResponseTimeoutImplCopyWith<_$ApiResponseTimeoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
