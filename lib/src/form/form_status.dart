import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_status.freezed.dart';

/// {@template form_status}
///
/// A [FormStatus] is union class for handling form status.
///
/// {@endtemplate}

@Freezed(map: FreezedMapOptions.none, genericArgumentFactories: true)
sealed class FormStatus<T> with _$FormStatus<T> {
  const FormStatus._();

  /// initial state
  const factory FormStatus.initial() = _Initial<T>;

  /// loading state
  const factory FormStatus.loading() = _Loading<T>;

  /// error state
  const factory FormStatus.error({required String message}) = _Error<T>;

  /// success state
  const factory FormStatus.success({String? message, T? data}) = _Success<T>;

  /// getters
  /// check is loading
  bool get isLoading => this is _Loading;

  /// check is error
  bool get isError => this is _Error;

  /// check is success
  bool get isSuccess => this is _Success;
}
