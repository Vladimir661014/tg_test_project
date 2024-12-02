class PathKeys {
  final root = 'root';
  final chat = 'chat';
  final settings = 'settings';
  final profile = 'profile';
  final editProfile = 'editProfile';
  final editName = 'editName';
  final myProfile = 'myProfile';
  final generalSettings = 'generalSettings';
  final notificationSettings = 'notificationSettings';
  final privacySettings = 'privacySettings';
  final storageSettings = 'storageSettings';
  final sessionsSettings = 'sessionsSettings';
  final appearanceSettings = 'appearanceSettings';
  final languageSettings = 'languageSettings';
  final stickersSettings = 'stickersSettings';
  final foldersSettings = 'foldersSettings';

  final chatId = 'chatId';
}

class PathNode {
  final String pathKey;
  final String? name;
  final String? parentRoutes;

  PathNode({required this.pathKey, this.name, this.parentRoutes});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'pathKey': pathKey,
    };

    if (name != null) {
      json['name'] = name;
    }

    if (parentRoutes != null) {
      json['parentRoutes'] = parentRoutes;
    }

    return json;
  }
}

class RouteMap {
  final String name;
  final String location;

  RouteMap({required this.name, required this.location});

  Map<String, String> toJson() {
    return {
      'name': name,
      'location': location,
    };
  }
}

mixin PathBuilderMixin {
  PathNode addPath(
      {required String pathKey, String? name, String? parentRoutes}) {
    return PathNode(pathKey: pathKey, name: name, parentRoutes: parentRoutes);
  }

  String _transformKeyToPath(String key) {
    return '/${key.replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (Match m) => '${m[1]}_${m[2]}').toLowerCase()}';
  }

  _buildPathMap(Set<PathNode> schema) {
    Map<String, RouteMap> data = {};

    for (var el in schema) {
      final json = el.toJson();
      final pathKey = json['pathKey'];

      final isOnlyHasKey =
          !json.containsKey('name') && !json.containsKey('parentRoutes');
      final isHasName =
          json.containsKey('name') && !json.containsKey('parentRoutes');
      final isHasParent =
          !json.containsKey('name') && json.containsKey('parentRoutes');

      if (isOnlyHasKey) {
        final pk = _transformKeyToPath(pathKey);
        data[pathKey] = RouteMap(name: pk, location: pk);
      } else if (isHasName) {
        data[pathKey] = RouteMap(name: json['name'], location: json['name']);
      } else if (isHasParent) {
        final String parents =
            json.containsKey('parentRoutes') ? '/${json['parentRoutes']}' : '';
        final targetRoute = _transformKeyToPath(pathKey);
        data[pathKey] =
            RouteMap(name: targetRoute, location: '$parents$targetRoute');
      } else {
        final String parents =
            json.containsKey('parentRoutes') ? '/${json['parentRoutes']}' : '';
        final targetRoute = _transformKeyToPath(pathKey);
        data[pathKey] =
            RouteMap(name: json['name'], location: '$parents$targetRoute');
      }
    }
    return data;
  }
}

class AppRouter extends PathKeys with PathBuilderMixin {
  static final AppRouter _singleton = AppRouter._instance();

  final Map<String, RouteMap> _routes = {};

  factory AppRouter() {
    return _singleton;
  }

  AppRouter._instance();

  routeName(String pathKey) {
    if (!_routes.containsKey(pathKey)) {
      return '';
    }
    return _routes[pathKey]!.toJson()['name'];
  }

  routeLocation(String pathKey, [Map<String, dynamic>? params]) {
    if (!_routes.containsKey(pathKey)) {
      return '';
    }

    var location = _routes[pathKey]!.toJson()['location'];

    if (params != null) {
      for (var el in params.keys) {
        location = location?.replaceAll(el, params[el].toString());
      }
      return location;
    }
    return location;
  }


  static generateRoutes(Function(AppRouter) callbak) {
    Set<PathNode> schema = callbak(_singleton);
    Map<String, RouteMap> routeMap = _singleton._buildPathMap(schema);
    _singleton._routes.addEntries(routeMap.entries);
  }
}

final ar = AppRouter();
