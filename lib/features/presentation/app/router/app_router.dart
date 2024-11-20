class PathBuilder {
  buildRoute(String route) {
    add([String val = '/']) {
      if (val == '/') {
        return () => '/';
      }

      return ([String? arg]) {
        if (arg != null) {
          return add('$val/$arg');
        } else {
          return '/$val';
        }
      };
    }

    return add(route);
  }
}

class AppRoutes extends PathBuilder{
  static final AppRoutes _singleton = AppRoutes._instance();

  factory AppRoutes() {
    return _singleton;
  }

  AppRoutes._instance();

// TODO: доделать генератор маршрутов
  // static generateRouteSchema(
  //     String initialRoute, Function(PathBuilder) callbak) {
  //   callbak(_singleton.pathBuilder);
  // }
}

final ar = AppRoutes();
