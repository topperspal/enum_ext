// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// EnumExtGenerator
// **************************************************************************

extension GenderExt on Gender {
  dynamic get value {
    switch (this) {
      case Gender.male:
        return "m";
      case Gender.female:
        return "f";
      case Gender.other:
        return "o";
    }
  }

  void when({
    required void Function(Gender e) male,
    required void Function(Gender e) female,
    required void Function(Gender e) other,
  }) {
    switch (this) {
      case Gender.male:
        return male(this);
      case Gender.female:
        return female(this);
      case Gender.other:
        return other(this);
    }
  }

  void mayBeWhen<T>({
    void Function(Gender e)? male,
    void Function(Gender e)? female,
    void Function(Gender e)? other,
    required void Function(Gender e) orElse,
  }) {
    switch (this) {
      case Gender.male:
        return male == null ? orElse(this) : male(this);
      case Gender.female:
        return female == null ? orElse(this) : female(this);
      case Gender.other:
        return other == null ? orElse(this) : other(this);
    }
  }

  void onlyWhen<T>({
    void Function(Gender e)? male,
    void Function(Gender e)? female,
    void Function(Gender e)? other,
  }) {
    switch (this) {
      case Gender.male:
        return male?.call(this);
      case Gender.female:
        return female?.call(this);
      case Gender.other:
        return other?.call(this);
    }
  }

  T map<T>({
    required T Function(Gender e) male,
    required T Function(Gender e) female,
    required T Function(Gender e) other,
  }) {
    switch (this) {
      case Gender.male:
        return male(this);
      case Gender.female:
        return female(this);
      case Gender.other:
        return other(this);
    }
  }

  T mapSimply<T>({
    required T male,
    required T female,
    required T other,
  }) {
    switch (this) {
      case Gender.male:
        return male;
      case Gender.female:
        return female;
      case Gender.other:
        return other;
    }
  }

  T mayBeMap<T>({
    T Function(Gender e)? male,
    T Function(Gender e)? female,
    T Function(Gender e)? other,
    required T Function(Gender e) orElse,
  }) {
    switch (this) {
      case Gender.male:
        return male == null ? orElse(this) : male(this);
      case Gender.female:
        return female == null ? orElse(this) : female(this);
      case Gender.other:
        return other == null ? orElse(this) : other(this);
    }
  }
}
