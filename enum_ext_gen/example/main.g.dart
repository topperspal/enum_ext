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
