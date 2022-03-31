// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// EnumExtGenerator
// **************************************************************************

extension HttpResponseExt on HttpResponse {
  dynamic get value {
    switch (this) {
      case HttpResponse.ok:
        return 200;
      case HttpResponse.notFound:
        return 404;
      case HttpResponse.internalServerError:
        return 500;
    }
  }

  /// ```dart
  /// enum HttpResponse { ok, notFound, internalServerError }
  ///
  /// final response = HttpResponse.internalServerError;
  /// print(response.titleCase); // Internal Server Error
  /// ```
  String get title {
    switch (this) {
      case HttpResponse.ok:
        return "Ok";
      case HttpResponse.notFound:
        return "Not Found";
      case HttpResponse.internalServerError:
        return "Internal Server Error";
    }
  }

  /// Use `when()` method when you want to perform some action based on the enum
  ///
  /// ```dart
  /// response.when(
  ///   ok: (e) {
  ///     // Do some actions only if the response is HttpResponse.ok
  ///   },
  ///   notFound: (e) {
  ///     // Do some actions only if the response is HttpResponse.notFound
  ///   },
  ///   internalServerError: (e) {
  ///     // Do some actions only if the response is HttpResponse.internalServerError
  ///   },
  /// );
  /// ```
  void when({
    required void Function(HttpResponse e) ok,
    required void Function(HttpResponse e) notFound,
    required void Function(HttpResponse e) internalServerError,
  }) {
    switch (this) {
      case HttpResponse.ok:
        return ok(this);
      case HttpResponse.notFound:
        return notFound(this);
      case HttpResponse.internalServerError:
        return internalServerError(this);
    }
  }

  /// Use `mayBeWhen()` method when you want to perform
  /// some action on a specific enum, if the value is not desired value,
  /// `orElse` bloc will be executed,
  ///
  /// ```dart
  /// response.mayBeWhen(
  ///   ok: (e) {
  ///     // Do some actions only if the response is HttpResponse.ok
  ///   },
  ///   orElse: (e) {
  ///     // Do some action if response is everything else but Response.ok
  ///   },
  /// );
  /// ```
  void mayBeWhen<T>({
    void Function(HttpResponse e)? ok,
    void Function(HttpResponse e)? notFound,
    void Function(HttpResponse e)? internalServerError,
    required void Function(HttpResponse e) orElse,
  }) {
    switch (this) {
      case HttpResponse.ok:
        return ok == null ? orElse(this) : ok(this);
      case HttpResponse.notFound:
        return notFound == null ? orElse(this) : notFound(this);
      case HttpResponse.internalServerError:
        return internalServerError == null ? orElse(this) : internalServerError(this);
    }
  }

  /// Use `onlyWhen()` method when you want to perform
  /// some action on some specific enum and avoid the others,
  ///
  /// ```dart
  /// response.onlyWhen(
  ///   ok: (e) {
  ///     // Do some actions only if the response is HttpResponse.ok
  ///   },
  /// );
  /// ```
  void onlyWhen<T>({
    void Function(HttpResponse e)? ok,
    void Function(HttpResponse e)? notFound,
    void Function(HttpResponse e)? internalServerError,
  }) {
    switch (this) {
      case HttpResponse.ok:
        return ok?.call(this);
      case HttpResponse.notFound:
        return notFound?.call(this);
      case HttpResponse.internalServerError:
        return internalServerError?.call(this);
    }
  }

  /// Use `map()` method when you want to return a value based on specific enum
  ///
  /// ```dart
  /// final message = response.map(
  ///   ok: (e) {
  ///     return "Success!";
  ///   },
  ///   notFound: (e) {
  ///     return "(404) Not Found!";
  ///   },
  ///   internalServerError: (e) {
  ///     return "Something went wrong!";
  ///   },
  /// );
  /// ```
  T map<T>({
    required T Function(HttpResponse e) ok,
    required T Function(HttpResponse e) notFound,
    required T Function(HttpResponse e) internalServerError,
  }) {
    switch (this) {
      case HttpResponse.ok:
        return ok(this);
      case HttpResponse.notFound:
        return notFound(this);
      case HttpResponse.internalServerError:
        return internalServerError(this);
    }
  }

  /// It is similar to `map()` method but this time you will return value without function callback.
  ///
  /// ```dart
  /// final message = response.mapSimply(
  ///   ok: "Success!",
  ///   notFound: "(404) Not Found!",
  ///   internalServerError: "Something went wrong!",
  /// );
  /// ```
  T mapSimply<T>({
    required T ok,
    required T notFound,
    required T internalServerError,
  }) {
    switch (this) {
      case HttpResponse.ok:
        return ok;
      case HttpResponse.notFound:
        return notFound;
      case HttpResponse.internalServerError:
        return internalServerError;
    }
  }

  /// Use `mayBeMap()` method when you want to return a value based on specific enum, other (`orElse`) for rest.
  ///
  /// ```dart
  /// final message = response.mayBeMap(
  ///   ok: (e) {
  ///     return "Success!";
  ///   },
  ///   orElse: (e) {
  ///     return "Failure!";
  ///   },
  /// );
  /// ```
  T mayBeMap<T>({
    T Function(HttpResponse e)? ok,
    T Function(HttpResponse e)? notFound,
    T Function(HttpResponse e)? internalServerError,
    required T Function(HttpResponse e) orElse,
  }) {
    switch (this) {
      case HttpResponse.ok:
        return ok == null ? orElse(this) : ok(this);
      case HttpResponse.notFound:
        return notFound == null ? orElse(this) : notFound(this);
      case HttpResponse.internalServerError:
        return internalServerError == null ? orElse(this) : internalServerError(this);
    }
  }
}
