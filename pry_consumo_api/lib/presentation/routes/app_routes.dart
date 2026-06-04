import "package:flutter/material.dart";
import "../../presentation/views/home_page.dart";
import "../../presentation/views/detail_page.dart";
class AppRoutes {
  static Map<String, WidgetBuilder> get routes {
    return {
      "/": (context) => HomePage(),
      "/detalle": (context) => DetallePage(),
    };
  }
}
