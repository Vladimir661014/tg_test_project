import 'package:flutter_modular/flutter_modular.dart';
import 'package:tg_test_project/app/router/app_router.dart';
import 'package:tg_test_project/features/chats/presentation/screens/chat_story.dart';
import 'package:tg_test_project/features/home/presentation/wrappers/home_wrapper.dart';
import 'package:tg_test_project/features/settings/presentation/screens/appearance.dart';
import 'package:tg_test_project/features/settings/presentation/screens/data_storage.dart';
import 'package:tg_test_project/features/settings/presentation/screens/edit_name.dart';
import 'package:tg_test_project/features/settings/presentation/screens/edit_profile.dart';
import 'package:tg_test_project/features/settings/presentation/screens/folders.dart';
import 'package:tg_test_project/features/settings/presentation/screens/general.dart';
import 'package:tg_test_project/features/settings/presentation/screens/language.dart';
import 'package:tg_test_project/features/settings/presentation/screens/my_profile.dart';
import 'package:tg_test_project/features/settings/presentation/screens/notifications.dart';
import 'package:tg_test_project/features/settings/presentation/screens/privacy_security.dart';
import 'package:tg_test_project/features/settings/presentation/screens/sessions.dart';
import 'package:tg_test_project/features/settings/presentation/screens/stickers.dart';
import 'package:tg_test_project/features/settings/presentation/widgets/wrappers/profile_wrapper.dart';
import 'package:tg_test_project/features/settings/presentation/widgets/wrappers/settings_wrapper.dart';


class MainModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    AppRouter.generateRoutes((ar) {
      final settings = ar.settings;
      final settingsProfile = '$settings/${ar.profile}';

      return {
        ar.addPath(pathKey: ar.root, name: '/'),
        ar.addPath(pathKey: ar.chat, name: '/${ar.chat}/:${ar.chatId}'),
        ar.addPath(pathKey: ar.settings),
        ar.addPath(pathKey: ar.myProfile, parentRoutes: settings),
        ar.addPath(pathKey: ar.generalSettings, parentRoutes: settings),
        ar.addPath(pathKey: ar.notificationSettings, parentRoutes: settings),
        ar.addPath(pathKey: ar.privacySettings, parentRoutes: settings),
        ar.addPath(pathKey: ar.storageSettings, parentRoutes: settings),
        ar.addPath(pathKey: ar.sessionsSettings, parentRoutes: settings),
        ar.addPath(pathKey: ar.appearanceSettings, parentRoutes: settings),
        ar.addPath(pathKey: ar.languageSettings, parentRoutes: settings),
        ar.addPath(pathKey: ar.stickersSettings, parentRoutes: settings),
        ar.addPath(pathKey: ar.foldersSettings, parentRoutes: settings),
        ar.addPath(pathKey: ar.profile),
        ar.addPath(pathKey: ar.editProfile, parentRoutes: settingsProfile),
        ar.addPath(pathKey: ar.editName, parentRoutes: settingsProfile),
      };
    });

    r.child(ar.routeName(ar.root),
        child: (context) => const HomeWrapper(),
        children: [
          ChildRoute(ar.routeName(ar.chat),
              child: (context) => ChatStory(id: r.args.params[ar.chatId]),
              transition: TransitionType.noTransition),
          ChildRoute(ar.routeName(ar.settings),
              child: (context) => const SettingsWrapper(),
              transition: TransitionType.noTransition,
              children: [
                ChildRoute(ar.routeName(ar.profile),
                    child: (context) => const ProfileWrapper(),
                    children: [
                      ChildRoute(ar.routeName(ar.editProfile),
                          child: (context) => const EditProfile()),
                      ChildRoute(ar.routeName(ar.editName),
                          child: (context) => const EditName())
                    ]),
                ChildRoute(ar.routeName(ar.myProfile),
                    child: (context) => const MyProfile()),
                ChildRoute(ar.routeName(ar.generalSettings),
                    child: (context) => const GeneralSettings()),
                ChildRoute(ar.routeName(ar.notificationSettings),
                    child: (context) => const NotificationsSettings()),
                ChildRoute(ar.routeName(ar.privacySettings),
                    child: (context) => const PrivacyAndCecurity()),
                ChildRoute(ar.routeName(ar.storageSettings),
                    child: (context) => const DataStorage()),
                ChildRoute(ar.routeName(ar.sessionsSettings),
                    child: (context) => const SessionsSettings()),
                ChildRoute(ar.routeName(ar.appearanceSettings),
                    child: (context) => const AppearanceSettings()),
                ChildRoute(ar.routeName(ar.languageSettings),
                    child: (context) => const LanguageSettings()),
                ChildRoute(ar.routeName(ar.stickersSettings),
                    child: (context) => const StickersSettings()),
                ChildRoute(ar.routeName(ar.foldersSettings),
                    child: (context) => const FoldersSettings()),
              ])
        ]);
  }
}
