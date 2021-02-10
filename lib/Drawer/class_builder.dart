
import 'package:ford_mobil/Drawer/SavSteppers.dart';
import 'package:ford_mobil/Drawer/settings.dart';
import 'package:ford_mobil/Drawer/stats.dart';
import 'package:ford_mobil/UI/Screen/ReclamationSuggestion.dart';
import 'package:ford_mobil/UI/Screen/ReservezUnEssaiState.dart';
import 'package:ford_mobil/UI/Screen/home.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<ReservezUnEssai>(() => ReservezUnEssai());
    register<ReclamationSuggestion>(() => ReclamationSuggestion());
    register<Stats>(() => Stats());
    register<SavSteppers>(() => SavSteppers());
    register<Settings>(() => Settings());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
